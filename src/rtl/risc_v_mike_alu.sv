import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_alu (
    input logic [DATA_32_W - 1:0] alu_src_a,
    input logic [DATA_32_W - 1:0] alu_src_b,
    input t_alu_opcode alu_ctrl,
    input logic alu_signed,
    output logic [DATA_32_W - 1:0] alu_result,
    output logic alu_zero,
    output logic alu_slt
);


logic mul_opcode_valid;
logic div_opcode_valid;
t_data alu_div_result;
t_data alu_rem_result;
t_data64 alu_mult_result64;
t_data64 alu_multu_result64;


assign mul_opcode_valid =   (alu_ctrl == ALU_MUL) |
                            (alu_ctrl == ALU_MULH) |
                            (alu_ctrl == ALU_MULSU) |
                            (alu_ctrl == ALU_MULHU);

assign div_opcode_valid =   (alu_ctrl == ALU_DIV) |
                            (alu_ctrl == ALU_DIVU) |
                            (alu_ctrl == ALU_REM) |
                            (alu_ctrl == ALU_REMU);

always_comb begin
    case (alu_ctrl)
        ALU_ADD :   alu_result = alu_src_a + alu_src_b;
        ALU_SUB :   alu_result = alu_src_a - alu_src_b;
        ALU_SLL :   alu_result = alu_src_a << alu_src_b;
        ALU_SLT           : begin         // This contains a conditional for checking if the op will be signed
            if (alu_signed) begin
                if ($signed(alu_src_a) < $signed(alu_src_b)) begin
                    alu_result  = 'h1;
                end
                else begin
                    alu_result  = 'h0;
                end
            end
            else begin 
                if (alu_src_a < alu_src_b) begin
                    alu_result  = 'h1;
                end
                else begin
                    alu_result  = 'h0;
                end                
            end
        end
        ALU_XOR :   alu_result = alu_src_a ^ alu_src_b;
        ALU_SRL :   alu_result = alu_src_a  >> alu_src_b;
        ALU_SRA :   alu_result = alu_src_a  >>> alu_src_b;
        ALU_OR  :   alu_result = alu_src_a | alu_src_b;
        ALU_AND :   alu_result = alu_src_a & alu_src_b;
        ALU_MUL :   alu_result   = alu_mult_result64[31:0];
        ALU_MULH :  alu_result   = alu_mult_result64[63:32];
        ALU_MULSU : alu_result   = alu_multu_result64[63:32];
        ALU_MULHU : alu_result   = alu_multu_result64[63:32];
        ALU_DIV :   alu_result   = alu_div_result;
        ALU_DIVU :  alu_result   = alu_div_result;
        ALU_REM :   alu_result   = alu_rem_result;
        ALU_REMU :  alu_result   = alu_rem_result;        
        default :   alu_result = 'hDEADBEEF;
    endcase
end

always_comb begin
    if (alu_signed) alu_slt = ($signed(alu_src_a) < $signed(alu_src_b)) ? 1'b1 : 1'b0;
    else            alu_slt = (alu_src_a < alu_src_b)? 1'b1 : 1'b0;
end

assign alu_zero = ~(|alu_result);


assign alu_mult_result64    = alu_src_a * alu_src_b;
assign alu_multu_result64   = alu_src_a * alu_src_b;
assign alu_div_result = alu_src_a / alu_src_b;
assign alu_rem_result = alu_src_a % alu_src_b;



endmodule
