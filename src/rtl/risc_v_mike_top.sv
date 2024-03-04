import risc_v_mike_pkg::*;


`include "risc_v_mike_header.svh"

module risc_v_mike_top (
`ifdef GPIO_ENABLED
    input logic [GPIO_BYTE - 1:0] gpio_port_in,
    output logic [GPIO_BYTE - 1:0] gpio_port_out,
`endif    
    input logic clk,
    input logic rst
);

    logic [INSTR_32_W - 1:0] instruction;
    t_instr_register rs1;
    t_instr_register rs2;
    t_instr_register rsd;
    logic [FUNCT3_W - 1:0] funct3;
    logic [FUNCT7_W - 1:0] funct7;
    logic pc_src;
    logic result_src;
    logic mem_write;
    logic reg_write;
    logic alu_src_sel_b;
    logic alu_src_sel_a;
    logic [2:0] imm_src;
    logic [DATA_32_W - 1:0] alu_src_a;
    logic [DATA_32_W - 1:0] alu_src_b;
    t_alu_opcode alu_ctrl;
    logic alu_signed;
    logic  [DATA_32_W - 1:0] alu_result;
    logic  alu_zero;
    logic  alu_slt;

    logic [DATA_32_W - 1:0] reg_file_rd_data_1;
    logic [DATA_32_W - 1:0] reg_file_rd_data_2;
    logic [DATA_32_W - 1:0] data_mem_rd_data;
    logic [DATA_32_W - 1:0] data_mem_bus_rd_data;
    logic [DATA_32_W - 1:0] data_mmio_rd_data;
    logic [DATA_32_W - 1:0] reg_file_wr_data;
    logic [DATA_32_W - 1:0] imm_ext;


    t_pc_addr pc_plus4;
    t_pc_addr pc_branch; 
    t_pc_addr pc_addr;
    t_pc_addr pc_addr_nxt;

    t_instr_nmemonic intr_nmen;

    assign rst_test = ~rst;

risc_v_mike_ctrl i_risc_v_mike_ctrl(
    .alu_zero(alu_zero),
    .alu_slt(alu_slt),
    .instruction(instruction),
    .rs1(rs1),
    .rs2(rs2),
    .rsd(rsd),
    .funct3(funct3),
    .funct7(funct7),
    .pc_src(pc_src),
    .result_src(result_src),
    .mem_write(mem_write),
    .reg_write(reg_write),
    .alu_src_sel_a(alu_src_sel_a),
    .alu_src_sel_b(alu_src_sel_b),
    .alu_ctrl(alu_ctrl),
    .alu_signed(alu_signed),
    .imm_src(imm_src),
    .intr_nmen(intr_nmen)
);


risc_v_mike_alu i_risc_v_mike_alu(
    .alu_src_a(alu_src_a),
    .alu_src_b(alu_src_b),
    .alu_ctrl(alu_ctrl),
    .alu_signed(alu_signed),
    .alu_result(alu_result),
    .alu_zero(alu_zero),
    .alu_slt(alu_slt)
);

//ALU SRC MUX: CHOOSE BETWEEN SIGN EXTEND AND REG_FILE READ PORT 2
//TODO: imm_ext module and connection
assign alu_src_a = (alu_src_sel_a) ? pc_addr : reg_file_rd_data_1;
assign alu_src_b = (alu_src_sel_b) ? imm_ext : reg_file_rd_data_2;

risc_v_mike_reg_file #(
    .REG_FILE_DEPTH(32)
) i_risc_v_mike_reg_file(
    .clk(clk),
    .rst(~rst),
    .reg_file_rd_addr_1(rs1),    // rs1,
    .reg_file_rd_addr_2(rs2),    // rs2,
    .reg_file_wr_addr(rsd),      // rsd,
    .reg_file_write(reg_write),                  //reg_write,
    .reg_file_wr_data(reg_file_wr_data),
    .reg_file_rd_data_1(reg_file_rd_data_1),
    .reg_file_rd_data_2(reg_file_rd_data_2)
);

risc_v_mike_sign_extend i_risc_v_mike_sign_extend (
    .imm_src(imm_src),
    .instruction(instruction),
    .imm_ext(imm_ext)
);

//RESULT SRC MUX: CHOOSE BETWEEN DATA MEMORY OUTPUT OR ALU RESULT
assign reg_file_wr_data = (result_src)? data_mem_bus_rd_data : alu_result;


logic [ADDRESS_32_W-1:0] data_text_wr_addr;
logic [3:0] data_memory_addr_sel_vec;
logic data_text_wr_addr_val;
logic data_text_rd_addr_val;



logic data_stack_wr_addr_val;
logic data_mem_wr_addr_val;
logic data_mmio_wr_addr_val;

logic data_stack_rd_addr_val;
logic data_mem_rd_addr_val;
logic data_mmio_rd_addr_val;

logic [ADDRESS_32_W-1:0] data_stack_wr_addr;
logic [ADDRESS_32_W-1:0] data_mem_wr_addr;
logic [ADDRESS_32_W-1:0] data_mmio_wr_addr;
logic [ADDRESS_32_W-1:0] data_mem_addr;
logic data_mem_write;


risc_v_mem_ctrl i_risc_v_mem_ctrl (
    `ifdef MEM_BUS_INSTRUCTIONS
        .data_text_wr_addr_val(data_text_wr_addr_val),
        .data_text_wr_addr(data_text_wr_addr),
        .data_text_rd_addr_val(data_text_rd_addr_val),
        .data_text_rd_addr(),
    `endif
    .sva_clk(clk),
    .mem_bus_rd_addr(alu_result),
    .mem_bus_wr_addr(alu_result),
    .mem_bus_write(mem_write),
    .mem_bus_read(1'b1), // Always read enabled
    .mem_bus_wr_addr_error(),
    .mem_bus_rd_addr_error(),
    .data_stack_wr_addr_val(data_stack_wr_addr_val),
    .data_mem_wr_addr_val(data_mem_wr_addr_val),
    .data_mmio_wr_addr_val(data_mmio_wr_addr_val),
    .data_stack_wr_addr(data_stack_wr_addr),
    .data_mem_wr_addr(data_mem_wr_addr),
    .data_mmio_wr_addr(data_mmio_wr_addr),
    // READ enables will not be used at the moment
    .data_stack_rd_addr_val(data_stack_rd_addr_val),
    .data_mem_rd_addr_val(data_mem_rd_addr_val),
    .data_mmio_rd_addr_val(data_mmio_rd_addr_val),
    .data_stack_rd_addr(),
    .data_mem_rd_addr(),
    .data_mmio_rd_addr()
);

`ifndef MEM_BUS_INSTRUCTIONS 
    assign data_text_wr_addr_val = 1'b0;
    assign data_text_rd_addr_val = 1'b0;
`endif

    // DATA READ ENABLED IS TIED TO 1'B1
    // data_***_rd_addr_val is the same as  data_***_wr_addr_val without the wr enable bit
assign data_memory_addr_sel_vec = {data_mmio_rd_addr_val, data_text_rd_addr_val, data_stack_rd_addr_val, data_mem_rd_addr_val};


assign data_mem_write = (data_text_wr_addr_val | data_stack_wr_addr_val | data_mem_wr_addr_val);
assign data_mem_read = (data_text_rd_addr_val | data_stack_rd_addr_val | data_mem_rd_addr_val);



// data_memory_addr_sel_vec[0] = MEMORY ACCESS
// data_memory_addr_sel_vec[1] = STACK ACCESS
// data_memory_addr_sel_vec[2] = TEXT ACCESS (INSTRUCTIONS)
// data_memory_addr_sel_vec[3] = MMIO (GPIO)

always_comb begin 
    // MUX FOR ADDRESS INPUT TO THE MEM_ADDR.
    // DATA ENTERS ALL THE MEMORIES.
    case (data_memory_addr_sel_vec)
        1: data_mem_addr = data_mem_wr_addr;
        2: data_mem_addr = data_stack_wr_addr;
        `ifdef MEM_BUS_INSTRUCTIONS
            4: data_mem_addr = data_text_wr_addr;
        `endif
        `ifdef GPIO_ENABLED
            8: data_mem_addr = data_mmio_wr_addr;
        `endif        
        default : data_mem_addr = 32'b0;
    endcase

    // ADDRESS INPUTS IN ALL MEMORIES.
    // DATA IS ASSIGNED JUST TO THE VALID ADDRESS.
    if (data_mem_read) begin 
        data_mem_bus_rd_data = data_mem_rd_data;
    end
    else if (data_mmio_rd_addr_val) begin
        data_mem_bus_rd_data = data_mmio_rd_data;
    end
    else begin 
        data_mem_bus_rd_data = 32'b0;
    end

end



risc_v_mike_data_memory #(
    .DATA_MEM_DEPTH(`DATA_MEM_DEPTH)
) i_risc_v_mike_data_memory (
    .clk(clk),
    .rst(~rst),
    .data_mem_addr(data_mem_addr),
    .data_mem_write(data_mem_write),
    .data_mem_wr_data(reg_file_rd_data_2),
    .data_mem_rd_data(data_mem_rd_data)
);

`ifdef GPIO_ENABLED
    risc_v_mike_gpio_module i_risc_v_mike_gpio_module(
        .clk(clk),
        .rst(rst),
        .data_mmio_addr(data_mem_addr),
        .data_mmio_wr_addr_val(data_mmio_wr_addr_val),
        .gpio_port_in(gpio_port_in),
        .gpio_port_out(gpio_port_out),
        .data_mmio_wr_data(reg_file_rd_data_2),
        .data_mmio_rd_data(data_mmio_rd_data)
    );
`endif  


// Program counter additions
// First is normal addition
assign pc_plus4 = pc_addr + 32'h4;
// Second is branch selection
assign pc_branch = pc_addr + imm_ext;
// Selection of the next count
assign pc_addr_nxt = (pc_src)? pc_branch : pc_plus4;
// PC Flip flop
 `MIKE_FF_INIT_NRST(pc_addr, pc_addr_nxt, 32'h00400000, clk, rst) // PC COUNTER INIT it starts on 32'h00400000 - 4 for the initial propagation

risc_v_mike_instruction_memory #(
    .DATA_MEM_DEPTH(PC_CNT_ADDR_WIDTH)
) i_risc_v_mike_instruction_memory (
    .clk(clk),
    .rst(~rst),
    .data_mem_addr(pc_addr),
    .data_mem_rd_data(instruction)
);




endmodule
