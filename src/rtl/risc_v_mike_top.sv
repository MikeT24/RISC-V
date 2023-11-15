import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_top ();

    logic [INSTR_32_W - 1:0] instruction;
    t_register_addr rs1;
    t_register_addr rs2;
    t_register_addr rsd;
    logic [FUNCT3_W - 1:0] funct3;
    logic [FUNCT7_W - 1:0] funct7;
    logic [U_IMM_W - 1:0] u_type_immediate;
    logic pc_src;
    logic result_src;
    logic mem_write;
    logic reg_write;
    logic alu_src;
    logic [1:0] imm_src;
    logic [DATA_32_W - 1:0] alu_src_a;
    logic [DATA_32_W - 1:0] alu_src_b;
    logic [2:0] alu_ctrl;
    logic alu_signed;
    logic  [DATA_32_W - 1:0] alu_result;
    logic  alu_zero;
    logic  alu_slt;




risc_v_mike_ctrl i_risc_v_mike_ctrl(
    .alu_zero(alu_zero)
    .alu_slt(alu_slt)
    .instruction(instruction)
    .rs1(rs1)
    .rs2(rs2)
    .rsd(rsd)
    .funct3(funct3)
    .funct7(funct7)
    .u_type_immediate(u_type_immediate)
    .pc_src(pc_src)
    .result_src(result_src)
    .mem_write(mem_write)
    .reg_write(reg_write)
    .alu_src(alu_src)
    .alu_ctrl(alu_ctrl)
    .alu_signed(alu_signed)
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



endmodule
