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

    logic [INSTR_32_W - 1:0] instruction_f;
    logic [INSTR_32_W - 1:0] instruction_d;
    logic [INSTR_32_W - 1:0] data_text_rd_data_m;
    t_instr_register rs1_d;
    t_instr_register rs2_d;
    t_instr_register rs1_e;
    t_instr_register rs2_e;
    t_instr_register rs1_m;
    t_instr_register rs2_m;
    t_instr_register rs1_w;
    t_instr_register rs2_w;
    t_instr_register rsd_d;    
    t_instr_register rsd_e;
    t_instr_register rsd_m;
    t_instr_register rsd_w;

    logic [FUNCT3_W - 1:0] funct3_d;
    logic [FUNCT7_W - 1:0] funct7_d;
    logic [1:0] pc_src_d;
    logic [1:0] result_src_d;
    logic mem_write_d;
    logic reg_write_d;
    logic [1:0] alu_src_sel_b_d;
    logic [1:0] alu_src_sel_a_d;
    logic [2:0] imm_src_d;
    t_alu_opcode alu_ctrl_d;
    logic alu_signed_d;

    logic [FUNCT3_W - 1:0] funct3_e;
    logic [FUNCT7_W - 1:0] funct7_e;
    logic [1:0] pc_src_e;
    logic [1:0] result_src_e;
    logic mem_write_e;
    logic reg_write_e;
    logic [1:0] alu_src_sel_b_e;
    logic [1:0] alu_src_sel_a_e;
    logic [2:0] imm_src_e;
    logic [DATA_32_W - 1:0] alu_src_a_e;
    logic [DATA_32_W - 1:0] alu_src_b_e;
    t_alu_opcode alu_ctrl_e;
    logic alu_signed_e;

    logic [FUNCT3_W - 1:0] funct3_m;
    logic [FUNCT7_W - 1:0] funct7_m;
    logic [1:0] pc_src_m;
    logic [1:0] result_src_m;
    logic mem_write_m;
    logic reg_write_m;
    logic [2:0] imm_src_m;
    t_alu_opcode alu_ctrl_m;
    logic alu_signed_m;


    logic reg_write_w;

    logic  [DATA_32_W - 1:0] alu_result_e;
    logic  [DATA_32_W - 1:0] alu_result_m;
    logic  [DATA_32_W - 1:0] alu_result_w;

    logic  [DATA_32_W - 1:0] mem_bus_address_input_m;

    logic  alu_zero_e;
    logic  alu_slt_e;

    logic [DATA_32_W - 1:0] reg_file_rd_data_1_d;
    logic [DATA_32_W - 1:0] reg_file_rd_data_2_d;

    logic [DATA_32_W - 1:0] reg_file_rd_data_1_e;
    logic [DATA_32_W - 1:0] reg_file_rd_data_2_e;

    logic [DATA_32_W - 1:0] reg_file_rd_data_2_m;


    logic [DATA_32_W - 1:0] data_mem_rd_data_m;
    logic [DATA_32_W - 1:0] data_mem_rd_data_w;
    logic [DATA_32_W - 1:0] data_mem_bus_rd_data_m;
    logic [DATA_32_W - 1:0] data_mmio_rd_data_m;
    logic [DATA_32_W - 1:0] reg_file_wr_data_w;

    logic [DATA_32_W - 1:0] data_mem_bus_rd_data_w;

    logic [DATA_32_W - 1:0] imm_ext_d;
    logic [DATA_32_W - 1:0] imm_ext_e;

    logic mem_write_w;
    logic [1:0] result_src_w;

    t_pc_addr pc_plus4_f;
    t_pc_addr pc_plus4_d;
    t_pc_addr pc_plus4_e;
    t_pc_addr pc_plus4_m;
    t_pc_addr pc_plus4_w;

    t_pc_addr pc_branch_e;

    t_pc_addr pc_addr_nxt_f;
    t_pc_addr pc_addr_nxt_d;
    t_pc_addr pc_addr_nxt_e;

    t_pc_addr pc_addr_f;
    t_pc_addr pc_addr_d;
    t_pc_addr pc_addr_e;
    t_pc_addr pc_addr_m;
    t_pc_addr pc_addr_w;

    t_instr_nmemonic intr_nmen_d;
    t_instr_nmemonic intr_nmen_e;
    t_instr_nmemonic intr_nmen_m;
    t_instr_nmemonic intr_nmen_w;

    logic data_hzd_nuke_e;
    logic data_hzd_nuke_m;
    logic data_hzd_nuke_w;
    logic data_hzd_nuke_w_plus1;
    logic data_hzd_nuke_w_plus2;

    logic [ADDRESS_32_W-1:0] mem_bus_address_input;

    logic rst_internal_f;
    logic rst_internal_d;
    logic rst_internal_e;
    logic rst_internal_m;
    logic rst_internal_w;

    assign rst_internal_f = rst_internal;

    `MIKE_FF_NRST(rst_internal_d, rst_internal_f, clk, rst_internal) 
    `MIKE_FF_NRST(rst_internal_e, rst_internal_d, clk, rst_internal) 
    `MIKE_FF_NRST(rst_internal_m, rst_internal_e, clk, rst_internal) 
    `MIKE_FF_NRST(rst_internal_w, rst_internal_m, clk, rst_internal) 


    t_instr_opcode intr_opcode_d;
    t_instr_opcode intr_opcode_e;
    t_instr_opcode intr_opcode_m;
    t_instr_opcode intr_opcode_w;





risc_v_mike_clk_divider i_risc_v_mike_clk_divider(
    .rst_in(rst),
    .clk_in(clk_in),
    .clk(clk),
    .rst_out(rst_internal)
);

risc_v_mike_ctrl i_risc_v_mike_ctrl(
    .clk(clk),
    .alu_zero(alu_zero_e),
    .alu_slt(alu_slt_e),
    .instruction(instruction_d),
    .rs1(rs1_d),
    .rs2(rs2_d),
    .rsd(rsd_d),
    .funct3(funct3_d),
    .funct7(funct7_d),
    .pc_src_out(pc_src_e),
    .result_src(result_src_d),
    .mem_write(mem_write_d),
    .reg_write(reg_write_d),
    .alu_src_sel_a(alu_src_sel_a_d),
    .alu_src_sel_b(alu_src_sel_b_d),
    .alu_ctrl(alu_ctrl_d),
    .alu_signed(alu_signed_d),
    .imm_src(imm_src_d),
    .intr_nmen_d(intr_nmen_d),
    .intr_nmen_e(intr_nmen_e),
    .intr_nmen_m(intr_nmen_m),
    .intr_nmen_w(intr_nmen_w),
    .intr_opcode_d(intr_opcode_d),
    .intr_opcode_e(intr_opcode_e),
    .intr_opcode_m(intr_opcode_m),
    .intr_opcode_w(intr_opcode_w),
    .data_hzd_nuke_e(data_hzd_nuke_e),
    .data_hzd_nuke_m(data_hzd_nuke_m),
    .data_hzd_nuke_w(data_hzd_nuke_w),
    .data_hzd_nuke_w_plus1(data_hzd_nuke_w_plus1),
    .data_hzd_nuke_w_plus2(data_hzd_nuke_w_plus2)

);

`MIKE_FF_NRST(alu_src_sel_a_e, alu_src_sel_a_d, clk, rst_internal) 
`MIKE_FF_NRST(alu_src_sel_b_e, alu_src_sel_b_d, clk, rst_internal) 

`MIKE_FF_NRST(mem_write_e, mem_write_d, clk, rst_internal) 
`MIKE_FF_NRST(mem_write_m, mem_write_e, clk, rst_internal) 
`MIKE_FF_NRST(mem_write_w, mem_write_m, clk, rst_internal) 

`MIKE_FF_NRST(result_src_e, result_src_d, clk, rst_internal) 
`MIKE_FF_NRST(result_src_m, result_src_e, clk, rst_internal) 
`MIKE_FF_NRST(result_src_w, result_src_m, clk, rst_internal) 

//`MIKE_FF_NRST(pc_src_e, pc_src_d, clk, rst_internal) 

`MIKE_FF_NRST(reg_write_e, reg_write_d, clk, rst_internal) 
`MIKE_FF_NRST(reg_write_m, reg_write_e, clk, rst_internal) 
`MIKE_FF_NRST(reg_write_w, reg_write_m, clk, rst_internal) 

`MIKE_FF(alu_ctrl_e, alu_ctrl_d, clk);
`MIKE_FF(alu_ctrl_m, alu_ctrl_e, clk);

`MIKE_FF_NRST(alu_result_m, alu_result_e, clk, rst_internal) 
`MIKE_FF_NRST(alu_result_w, alu_result_m, clk, rst_internal) 

logic [DATA_32_W - 1:0] reg_file_2_alu_1_e;
logic [DATA_32_W - 1:0] reg_file_2_alu_2_e;
logic [DATA_32_W - 1:0] reg_file_2_alu_2_m;

risc_v_data_fwd i_risc_v_data_fwd(
    .clk(clk),
    .rst(rst_internal),
    .rs1_e(rs1_e),
    .rs2_e(rs2_e),
    .rsd_e(rsd_e),
    .rsd_m(rsd_m),
    .rsd_w(rsd_w),
    .reg_file_rd_data_1_e(reg_file_rd_data_1_e),
    .reg_file_rd_data_2_e(reg_file_rd_data_2_e),
    .reg_file_2_alu_1_e(reg_file_2_alu_1_e),
    .reg_file_2_alu_2_e(reg_file_2_alu_2_e),
    .reg_file_2_alu_2_m(reg_file_2_alu_2_m),
    .alu_result_m(alu_result_m),
    .alu_result_w(alu_result_w),
    .data_mem_rd_data_m(data_mem_rd_data_m),
    .data_mem_rd_data_w(data_mem_rd_data_w),
    .intr_opcode_d(intr_opcode_d),
    .intr_opcode_e(intr_opcode_e),
    .intr_opcode_m(intr_opcode_m),
    .intr_opcode_w(intr_opcode_w),
    .reg_write_e(reg_write_e),
    .reg_write_m(reg_write_m),
    .reg_write_w(reg_write_w)
);


//ALU SRC MUX: CHOOSE BETWEEN SIGN EXTEND AND REG_FILE READ PORT 2
//TODO: imm_ext module and connection
// MUX Src_A
always_comb begin 
    case (alu_src_sel_a_e)
        0 : alu_src_a_e = pc_addr_e;
        1 : alu_src_a_e = reg_file_2_alu_1_e;
        2 : alu_src_a_e = pc_addr_e;
        3 : alu_src_a_e = 32'h0;
        default : alu_src_a_e = 32'hFFFFFFFF;
    endcase
end

// MUX Src_B
always_comb begin 
    case (alu_src_sel_b_e)
        0 : alu_src_b_e = reg_file_2_alu_2_e;
        1 : alu_src_b_e = 32'h4;
        2 : alu_src_b_e = imm_ext_e;
        default : alu_src_b_e = 32'hFFFFFFFF;
    endcase
end

risc_v_mike_alu i_risc_v_mike_alu(
    .alu_src_a(alu_src_a_e),
    .alu_src_b(alu_src_b_e),
    .alu_ctrl(alu_ctrl_e),
    .alu_signed(alu_signed_e),
    .alu_result(alu_result_e),
    .alu_zero(alu_zero_e),
    .alu_slt(alu_slt_e)
);


logic reg_write_hzd_free_w;
// If there is a data hazard detected, reg write will be aborted. 
assign reg_write_hzd_free_w = ~data_hzd_nuke_w_plus1 & ~data_hzd_nuke_w_plus2 & reg_write_w;

risc_v_mike_reg_file #(
    .REG_FILE_DEPTH(32)
) i_risc_v_mike_reg_file(
    .clk(clk),
    .rst(~rst_internal),
    .reg_file_rd_addr_1(rs1_d),    // rs1,
    .reg_file_rd_addr_2(rs2_d),    // rs2,
    .reg_file_wr_addr(rsd_w),      // rsd,
    .reg_file_write(reg_write_hzd_free_w),  //reg_write,
    .reg_file_wr_data(reg_file_wr_data_w),
    .reg_file_rd_data_1(reg_file_rd_data_1_d),
    .reg_file_rd_data_2(reg_file_rd_data_2_d)
);

risc_v_mike_sign_extend i_risc_v_mike_sign_extend (
    .imm_src(imm_src_d),
    .instruction(instruction_d),
    .imm_ext(imm_ext_d)
);


`MIKE_FF_NRST(imm_ext_e, imm_ext_d, clk, rst_internal) 

`MIKE_FF(rs1_e, rs1_d, clk);
`MIKE_FF(rs2_e, rs2_d, clk);
`MIKE_FF(rs1_m, rs1_e, clk);
`MIKE_FF(rs2_m, rs2_e, clk);
`MIKE_FF(rs1_w, rs1_m, clk);
`MIKE_FF(rs2_w, rs2_m, clk);
`MIKE_FF(rsd_e, rsd_d, clk);
`MIKE_FF(rsd_m, rsd_e, clk);
`MIKE_FF(rsd_w, rsd_m, clk);


`MIKE_FF_NRST(reg_file_rd_data_1_e, reg_file_rd_data_1_d, clk, rst_internal) 
`MIKE_FF_NRST(reg_file_rd_data_2_e, reg_file_rd_data_2_d, clk, rst_internal) 
`MIKE_FF_NRST(reg_file_rd_data_2_m, reg_file_rd_data_2_e, clk, rst_internal) 




//RESULT SRC MUX: CHOOSE BETWEEN DATA MEMORY OUTPUT, ALU RESULT OR OLD PC COUNTER VALUE
// MUX reg_file_wr_data
always_comb begin 
    case (result_src_w)
        0 : reg_file_wr_data_w = alu_result_w;
        1 : reg_file_wr_data_w = data_mem_bus_rd_data_w;
        2 : reg_file_wr_data_w = pc_plus4_w; //Add 4 to the PC for Jumps
        default : reg_file_wr_data_w = 32'hFFFFFFFF;
    endcase
end

logic [ADDRESS_32_W-1:0] data_text_rd_addr_f;
logic [ADDRESS_32_W-1:0] data_text_wr_addr_m;
logic [ADDRESS_32_W-1:0] data_text_rd_addr_m;
logic [3:0] data_memory_addr_sel_vec_m;
logic data_text_wr_addr_val_m;
logic data_text_rd_addr_val_m;


logic data_stack_wr_addr_val_m;
logic data_mem_wr_addr_val_m;
logic data_mmio_wr_addr_val_m;

logic data_stack_rd_addr_val_m;
logic data_mem_rd_addr_val_m;
logic data_mmio_rd_addr_val_m;

logic [ADDRESS_32_W-1:0] data_stack_wr_addr_m;
logic [ADDRESS_32_W-1:0] data_mem_wr_addr_m;
logic [ADDRESS_32_W-1:0] data_mmio_wr_addr_m;
logic [ADDRESS_32_W-1:0] data_mem_addr_m;
logic data_mem_write_m;
logic mem_write_hzd_free_m;


//Abort mem writes when a HZD is detected
assign mem_write_hzd_free_m = mem_write_m & ~data_hzd_nuke_w & ~data_hzd_nuke_w_plus1;
assign mem_bus_address_input_m = alu_result_m;

risc_v_mem_ctrl i_risc_v_mem_ctrl (
    .rst(rst_internal_f),
    `ifndef MEM_BUS_INSTRUCTIONS // NOT COMPATIBLE WITH PIPELINE
        .pc_addr(pc_addr_f), // PC ADDRESS SELECTED
    `endif
    .data_text_wr_addr_val(),    // output to data_text
    .data_text_wr_addr(),        // output to data_text
    .data_text_rd_addr_val(),    // output to data_text
    .data_text_rd_addr(data_text_rd_addr_f),            // output to instruction memory
    .sva_clk(clk),
    .mem_bus_rd_addr(mem_bus_address_input_m), // Address input
    .mem_bus_wr_addr(mem_bus_address_input_m), // Address input
    .mem_bus_write(mem_write_hzd_free_m),
    .mem_bus_read(1'b1), // Always read enabled
    .mem_bus_wr_addr_error(),
    .mem_bus_rd_addr_error(),
    .data_stack_wr_addr_val(data_stack_wr_addr_val_m),
    .data_mem_wr_addr_val(data_mem_wr_addr_val_m),
    .data_mmio_wr_addr_val(data_mmio_wr_addr_val_m),
    .data_stack_wr_addr(data_stack_wr_addr_m),
    .data_mem_wr_addr(data_mem_wr_addr_m),
    .data_mmio_wr_addr(data_mmio_wr_addr_m),
    // READ enables will not be used at the moment
    .data_stack_rd_addr_val(data_stack_rd_addr_val_m),
    .data_mem_rd_addr_val(data_mem_rd_addr_val_m),
    .data_mmio_rd_addr_val(data_mmio_rd_addr_val_m),
    .data_stack_rd_addr(),
    .data_mem_rd_addr(),
    .data_mmio_rd_addr()
);


    // DATA READ ENABLED IS TIED TO 1'B1
    // data_***_rd_addr_val is the same as  data_***_wr_addr_val without the wr enable bit
assign data_memory_addr_sel_vec_m = {data_mmio_rd_addr_val_m, 1'b0, data_stack_rd_addr_val_m, data_mem_rd_addr_val_m};

assign data_mem_write_m = (data_stack_wr_addr_val_m | data_mem_wr_addr_val_m);
assign data_mem_read_m = (data_stack_rd_addr_val_m | data_mem_rd_addr_val_m);



// data_memory_addr_sel_vec_m[0] = MEMORY ACCESS
// data_memory_addr_sel_vec_m[1] = STACK ACCESS
// data_memory_addr_sel_vec_m[2] = TEXT ACCESS (INSTRUCTIONS)
// data_memory_addr_sel_vec_m[3] = MMIO (GPIO)

always_comb begin 
    // MUX FOR ADDRESS INPUT TO THE MEM_ADDR.
    // DATA ENTERS ALL THE MEMORIES.
    case (data_memory_addr_sel_vec_m)
        1: data_mem_addr_m = data_mem_wr_addr_m;
        2: data_mem_addr_m = data_stack_wr_addr_m;
        `ifdef GPIO_ENABLED
            8: data_mem_addr_m = data_mmio_wr_addr_m;
        `endif        
        default : data_mem_addr_m = 32'b0;
    endcase

    // ADDRESS INPUTS IN ALL MEMORIES.
    // DATA IS ASSIGNED JUST TO THE VALID ADDRESS.
    if (data_stack_rd_addr_val_m | data_mem_rd_addr_val_m) begin 
        data_mem_bus_rd_data_m = data_mem_rd_data_m;
    end
    else if (data_mmio_rd_addr_val_m) begin
        data_mem_bus_rd_data_m = data_mmio_rd_data_m;
    end
    else begin 
        data_mem_bus_rd_data_m = 32'b0;
    end
end

`MIKE_FF_NRST(data_mem_bus_rd_data_w, data_mem_bus_rd_data_m, clk, rst_internal) 


risc_v_mike_data_memory #(
    .DATA_MEM_DEPTH(`DATA_MEM_DEPTH)
) i_risc_v_mike_data_memory (
    .clk(clk),
    .rst(~rst_internal),
    .data_mem_addr(data_mem_addr_m),
    .data_mem_write(data_mem_write_m),
    .data_mem_wr_data(reg_file_2_alu_2_m),  // FWD Data
    .data_mem_rd_data(data_mem_rd_data_m)
);

`MIKE_FF_NRST(data_mem_rd_data_w, data_mem_rd_data_m, clk, rst_internal) 


risc_v_mike_instruction_memory #(
    .DATA_MEM_DEPTH(PC_CNT_ADDR_WIDTH)
) i_risc_v_mike_instruction_memory (
    .clk(clk),
    .rst(~rst_internal),
    .data_mem_addr(data_text_rd_addr_f),
    .data_mem_rd_data(instruction_f)
);

`MIKE_FF_NRST(instruction_d, instruction_f, clk, rst_internal) 

assign data_text_rd_data_m = 'b0;

`ifdef GPIO_ENABLED
    UART_UNCORE i_UART_UNCORE(
        .clk(clk),
        .rst(rst_internal),
        .data_mmio_addr(data_mem_addr_m),
        .data_mmio_wr_addr_val(data_mmio_wr_addr_val_m),
        .data_mmio_wr_data(reg_file_rd_data_2_m),
        .data_mmio_rd_data(data_mmio_rd_data_m),
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
assign pc_plus4_f = pc_addr_f + 32'h4;
// Second is branch selection
// TODO: Missing jump values
assign pc_branch_e = pc_addr_e + imm_ext_e;
// Selection of the next count

// Old code left as reference
// always_comb begin 
//     case (pc_src)
//         0: pc_addr_nxt = pc_plus4;
//         1: pc_addr_nxt = pc_branch;
//         2: pc_addr_nxt = alu_result;
//         default: pc_addr_nxt = 32'hffffffff;
//     endcase
// end

// check branch
//assign pc_addr_nxt_f = (pc_src_e) ? pc_branch_e : pc_plus4_f;


logic [1:0] pc_src_hzd_free_e;
logic pc_src_hzd_free_det;
assign pc_src_hzd_free_det = ~data_hzd_nuke_m & ~data_hzd_nuke_w;
assign pc_src_hzd_free_e = {pc_src_hzd_free_det,pc_src_hzd_free_det} & pc_src_e;

 always_comb begin 
        case (pc_src_hzd_free_e)
             0: pc_addr_nxt_f = pc_plus4_f;
             1: pc_addr_nxt_f = pc_branch_e;
             2: pc_addr_nxt_f = alu_result_e;
             default: pc_addr_nxt_f = 32'hffffffff;
        endcase
 end

`MIKE_FF_NRST(pc_plus4_d, pc_plus4_f, clk, rst_internal) 
`MIKE_FF_NRST(pc_plus4_e, pc_plus4_d, clk, rst_internal) 
`MIKE_FF_NRST(pc_plus4_m, pc_plus4_e, clk, rst_internal) 
`MIKE_FF_NRST(pc_plus4_w, pc_plus4_m, clk, rst_internal) 

`MIKE_FF_NRST(pc_addr_d, pc_addr_f, clk, rst_internal) 
`MIKE_FF_NRST(pc_addr_e, pc_addr_d, clk, rst_internal) 
`MIKE_FF_NRST(pc_addr_m, pc_addr_e, clk, rst_internal) 
`MIKE_FF_NRST(pc_addr_w, pc_addr_m, clk, rst_internal) 

// PC Flip flop
 `MIKE_FF_INIT_NRST(pc_addr_f, pc_addr_nxt_f, 32'h00400000, clk, rst_internal) // PC COUNTER INIT it starts on 32'h00400000 - 4 for the initial propagation







endmodule
