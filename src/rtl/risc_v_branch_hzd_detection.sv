import risc_v_mike_pkg::*;
`include "risc_v_mike_header.svh"



module risc_v_branch_hzd_detection(
    input logic clk,
    input logic rst,
    input t_instr_nmemonic intr_nmen_d,
    input t_instr_nmemonic intr_nmen_e,
    input t_instr_nmemonic intr_nmen_m,
    input t_instr_nmemonic intr_nmen_w,
    input t_instr_opcode intr_opcode_d, 
    input t_instr_opcode intr_opcode_e,
    input t_instr_opcode intr_opcode_m,
    input t_instr_opcode intr_opcode_w,
    input logic [1:0] pc_src_out, 
    input logic branch_taken,
    output logic data_hzd_nuke_e,
    output logic data_hzd_nuke_m
);




endmodule