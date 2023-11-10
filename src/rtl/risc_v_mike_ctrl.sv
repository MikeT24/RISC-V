import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_ctrl (
    input logic clk,
    input logic rst,
    input logic alu_zero,
    input logic [INSTR_32_W - 1:0] instruction,
    output t_register_addr rs1,
    output t_register_addr rs2,
    output t_register_addr rsd,
    output logic [FUNCT3_W - 1:0] funct3,
    output logic [FUNCT7_W - 1:0] funct7,
    output logic [U_IMM_W - 1:0] u_type_immediate,
    output logic pc_src,
    output logic result_src,
    output logic mem_write,
    output logic reg_write,
    output logic alu_src,
    output logic [2:0] alu_ctrl,
    output logic [1:0] imm_src
);

t_instr_opcode opcode;

assign opcode   = instruction[INST_OPCODE_MSB:0];
assign rsd      = instruction[INST_RD_MSB:INST_RD_LSB];
assign rs1      = instruction[INST_RS1_MSB:INST_RS1_LSB];
assign rs2      = instruction[INST_RS2_MSB:INST_RS2_LSB];
assign funct3   = instruction[INST_FUNCT3_MSB:INST_FUNCT3_LSB];
assign funct7   = instruction[INST_FUNCT7_MSB:INST_FUNCT7_LSB];


always_comb begin 
    case (opcode)
        'b0110111 : //u-type
        'b1101111 : //j-type
        'b1100111 : //i-type
        'b1100011 : //b-type (conditionals)
        'b0000011 : //i-type (memory operations)
        'b0100011 : //s-type 
    endcase

end 

endmodule
