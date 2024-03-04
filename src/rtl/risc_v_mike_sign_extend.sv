import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_sign_extend (
    input logic [2:0] imm_src,
    input logic [INSTR_32_W - 1:0] instruction,
    output logic [DATA_32_W - 1:0] imm_ext
);


always_comb begin 
    case (imm_src)
        0: imm_ext = {{20{instruction[31]}}, instruction[31:20]}; 
        1: imm_ext = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
        2: imm_ext = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0 }; 
        3: imm_ext = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0 };
        4: imm_ext = {instruction[31:12],{12{1'b0}}}; // U-type instruction
        default: imm_ext = 'hDEADBEEF;
    endcase
end
endmodule
