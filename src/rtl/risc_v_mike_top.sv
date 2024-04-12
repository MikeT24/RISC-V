import risc_v_mike_pkg::*;


`include "risc_v_mike_header.svh"

module risc_v_mike_top (
`ifdef GPIO_ENABLED
    output logic tx,
    input logic rx,
    output logic seg_a,
	output logic seg_b,
	output logic seg_c,
	output logic seg_d,
	output logic seg_e,
	output logic seg_f,
	output logic seg_g,    
	output logic tx_seg_a,
	output logic tx_seg_b,
	output logic tx_seg_c,
	output logic tx_seg_d,
	output logic tx_seg_e,
	output logic tx_seg_f,
	output logic tx_seg_g,
	input logic  asci_or_hexa_tx,
	input logic  asci_or_hexa_rx, 
`endif    
    input logic clk_in,
    input logic rst
);
    
    logic clk;
    logic rst_internal;

    logic [INSTR_32_W - 1:0] instruction;
    logic [INSTR_32_W - 1:0] data_text_rd_data;
    t_instr_register rs1;
    t_instr_register rs2;
    t_instr_register rsd;
    logic [FUNCT3_W - 1:0] funct3;
    logic [FUNCT7_W - 1:0] funct7;
    logic [1:0] pc_src;
    logic [1:0] result_src;
    logic mem_write;
    logic reg_write;
    logic [1:0] alu_src_sel_b;
    logic [1:0] alu_src_sel_a;
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


    logic [ADDRESS_32_W-1:0] mem_bus_address_input;

risc_v_mike_clk_divider i_risc_v_mike_clk_divider(
    .rst_in(rst),
    .clk_in(clk_in),
    .clk(clk),
    .rst_out(rst_internal)
);
    

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
// MUX Src_A
always_comb begin 
    case (alu_src_sel_a)
        0 : alu_src_a = pc_addr;
        1 : alu_src_a = reg_file_rd_data_1;
        2 : alu_src_a = pc_addr;
        3 : alu_src_a = 32'h0;
        default : alu_src_a = 32'hFFFFFFFF;
    endcase
end

// MUX Src_B
always_comb begin 
    case (alu_src_sel_b)
        0 : alu_src_b = reg_file_rd_data_2;
        1 : alu_src_b = 32'h4;
        2 : alu_src_b = imm_ext;
        default : alu_src_b = 32'hFFFFFFFF;
    endcase
end



risc_v_mike_reg_file #(
    .REG_FILE_DEPTH(32)
) i_risc_v_mike_reg_file(
    .clk(clk),
    .rst(~rst_internal),
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

//RESULT SRC MUX: CHOOSE BETWEEN DATA MEMORY OUTPUT, ALU RESULT OR OLD PC COUNTER VALUE
// MUX reg_file_wr_data
always_comb begin 
    case (result_src)
        0 : reg_file_wr_data = alu_result;
        1 : reg_file_wr_data = data_mem_bus_rd_data;
        2 : reg_file_wr_data = pc_plus4; //Add 4 to the PC for Jumps
        default : reg_file_wr_data = 32'hFFFFFFFF;
    endcase
end


logic [ADDRESS_32_W-1:0] data_text_wr_addr;
logic [ADDRESS_32_W-1:0] data_text_rd_addr;
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

assign mem_bus_address_input = alu_result;

risc_v_mem_ctrl i_risc_v_mem_ctrl (
    `ifndef MEM_BUS_INSTRUCTIONS
        .pc_addr(pc_addr),
    `endif
    .data_text_wr_addr_val(data_text_wr_addr_val),
    .data_text_wr_addr(data_text_wr_addr),
    .data_text_rd_addr_val(data_text_rd_addr_val),
    .data_text_rd_addr(data_text_rd_addr),
    .sva_clk(clk),
    .mem_bus_rd_addr(mem_bus_address_input), // Address input
    .mem_bus_wr_addr(mem_bus_address_input), // Address input
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
    if (data_stack_rd_addr_val | data_mem_rd_addr_val) begin 
        data_mem_bus_rd_data = data_mem_rd_data;
    end
    else if (data_text_rd_addr_val) begin //TODO: PORT ME TO SINGLE CYCLE
        data_mem_bus_rd_data = data_text_rd_data; //Used in single memory access. 
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
    .rst(~rst_internal),
    .data_mem_addr(data_mem_addr),
    .data_mem_write(data_mem_write),
    .data_mem_wr_data(reg_file_rd_data_2),
    .data_mem_rd_data(data_mem_rd_data)
);

risc_v_mike_instruction_memory #(
    .DATA_MEM_DEPTH(PC_CNT_ADDR_WIDTH)
) i_risc_v_mike_instruction_memory (
    .clk(clk),
    .rst(~rst_internal),
    .data_mem_addr(data_text_rd_addr),
    .data_mem_rd_data(instruction)
);

assign data_text_rd_data = 'b0;

`ifdef GPIO_ENABLED
    UART_UNCORE i_UART_UNCORE(
        .clk(clk),
        .rst(rst_internal),
        .data_mmio_addr(data_mem_addr),
        .data_mmio_wr_addr_val(data_mmio_wr_addr_val),
        .data_mmio_wr_data(reg_file_rd_data_2),
        .data_mmio_rd_data(data_mmio_rd_data),
        .rx(rx),
        .tx(tx),
        .seg_a(seg_a),
        .seg_b(seg_b),
        .seg_c(seg_c),
        .seg_d(seg_d),
        .seg_e(seg_e),
        .seg_f(seg_f),
        .seg_g(seg_g),
        .tx_seg_a(tx_seg_a),
        .tx_seg_b(tx_seg_b),
        .tx_seg_c(tx_seg_c),
        .tx_seg_d(tx_seg_d),
        .tx_seg_e(tx_seg_e),
        .tx_seg_f(tx_seg_f),
        .tx_seg_g(tx_seg_g),
        .asci_or_hexa_tx(asci_or_hexa_tx),
        .asci_or_hexa_rx(asci_or_hexa_rx)
    );
`endif  


// Program counter additions
// First is normal addition
assign pc_plus4 = pc_addr + 32'h4;
// Second is branch selection
assign pc_branch = pc_addr + imm_ext;
// Selection of the next count

always_comb begin 
    case (pc_src)
        0: pc_addr_nxt = pc_plus4;
        1: pc_addr_nxt = pc_branch;
        2: pc_addr_nxt = alu_result;
        default: pc_addr_nxt = 32'hffffffff;
    endcase
end

// PC Flip flop
 `MIKE_FF_INIT_NRST(pc_addr, pc_addr_nxt, 32'h00400000, clk, rst_internal) // PC COUNTER INIT it starts on 32'h00400000 - 4 for the initial propagation






endmodule
