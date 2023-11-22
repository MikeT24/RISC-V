import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_top (
    input logic clk,
    input logic rst
);

    logic [INSTR_32_W - 1:0] instruction;
    t_register_addr rs1;
    t_register_addr rs2;
    t_register_addr rsd;
    logic [FUNCT3_W - 1:0] funct3;
    logic [FUNCT7_W - 1:0] funct7;
    logic pc_src;
    logic result_src;
    logic mem_write;
    logic reg_write;
    logic alu_src;
    logic [2:0] imm_src;
    logic [DATA_32_W - 1:0] alu_src_a;
    logic [DATA_32_W - 1:0] alu_src_b;
    logic [2:0] alu_ctrl;
    logic alu_signed;
    logic  [DATA_32_W - 1:0] alu_result;
    logic  alu_zero;
    logic  alu_slt;

    logic [DATA_32_W - 1:0] reg_file_rd_data_2;
    logic [DATA_32_W - 1:0] data_mem_rd_data;
    logic [DATA_32_W - 1:0] reg_file_wr_data;
    logic [DATA_32_W - 1:0] imm_ext;

    t_pc_addr pc_plus4;
    t_pc_addr pc_branch; 
    t_pc_addr pc_addr;
    t_pc_addr pc_addr_nxt;

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
    .alu_src(alu_src),
    .alu_ctrl(alu_ctrl),
    .alu_signed(alu_signed),
    .imm_src(imm_src)
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
assign alu_src_b = (alu_src) ? imm_ext : reg_file_rd_data_2;

risc_v_mike_reg_file i_risc_v_mike_reg_file(
    .clk(clk),
    .rst(rst),
    .reg_file_rd_addr_1(rs1),    // rs1,
    .reg_file_rd_addr_2(rs2),    // rs2,
    .reg_file_wr_addr(rsd),      // rsd,
    .reg_file_write(reg_write),                  //reg_write,
    .reg_file_wr_data(reg_file_wr_data),
    .reg_file_rd_data_1(alu_src_a),
    .reg_file_rd_data_2(reg_file_rd_data_2)
);

//RESULT SRC MUX: CHOOSE BETWEEN DATA MEMORY OUTPUT OR ALU RESULT
assign reg_file_wr_data = (result_src)? data_mem_rd_data : alu_result;

risc_v_mike_data_memory i_risc_v_mike_data_memory (
    .clk(clk),
    .rst(rst),
    .data_mem_addr(alu_result),
    .data_mem_write(mem_write),
    .data_mem_wr_data(reg_file_rd_data_2),
    .data_mem_rd_data(data_mem_rd_data)
);


risc_v_mike_sign_extend i_risc_v_mike_sign_extend (
    .imm_src(imm_src),
    .instruction(instruction),
    .imm_ext(imm_ext)
);

assign pc_plus4 = pc_addr + 32'h4;
assign pc_branch = pc_addr + imm_ext;


risc_v_mike_instruction_memory #(
    .DATA_MEM_DEPTH(PC_CNT_ADDR_WIDTH)
) i_risc_v_mike_instruction_memory (
    .clk(clk),
    .rst(rst),
    .data_mem_addr(pc_addr),
    .data_mem_rd_data(instruction)
);

 `MIKE_FF_RST(pc_addr, pc_addr_nxt, clk, rst)

assign pc_addr_nxt = (pc_src)? pc_branch : pc_plus4;



endmodule
