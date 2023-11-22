import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_alu (
    input logic [DATA_32_W - 1:0] alu_src_a,
    input logic [DATA_32_W - 1:0] alu_src_b,
    input logic [2:0] alu_ctrl,
    input logic alu_signed,
    output logic [DATA_32_W - 1:0] alu_result,
    output logic alu_zero,
    output logic alu_slt
);

localparam ALU_ADD                      = 0;
localparam ALU_SUB                      = 1;
localparam ALU_SHIFT_LEFT               = 2;
localparam ALU_SET_LESS_THAN            = 3;
// OPCODE FOR 4 IS AVAILABLE 
localparam ALU_XOR                      = 5;
localparam ALU_SHIFT_RIGHT_LOGIC        = 6;
localparam ALU_SHIFT_RIGHT_ARITHMETIC   = 7;
localparam ALU_OR                       = 8;
localparam ALU_AND                      = 9;

always_comb begin
    case (alu_ctrl)
        ALU_ADD                     : begin
            alu_result = alu_src_a + alu_src_b;
        end
        ALU_SUB                     : begin
            alu_result = alu_src_a - alu_src_b;
        end
        ALU_SHIFT_LEFT              : begin
            alu_result = alu_src_a << alu_src_b;
        end
        ALU_SET_LESS_THAN           : begin         // This contains a conditional for checking if the op will be signed
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
        ALU_XOR                     : begin
            alu_result = alu_src_a ^ alu_src_b;
        end
        ALU_SHIFT_RIGHT_LOGIC       : begin
            alu_result = alu_src_a  >> alu_src_b;
        end
        ALU_SHIFT_RIGHT_ARITHMETIC  : begin
            alu_result = alu_src_a  >>> alu_src_b;
        end
        ALU_OR                      : begin
            alu_result = alu_src_a | alu_src_b;
        end
        ALU_AND                     : begin
            alu_result = alu_src_a & alu_src_b;
        end 
        default                     : begin
            alu_result = 'hDEADBEEF;
        end
    endcase
end

always_comb begin
    if (alu_signed) alu_slt = ($signed(alu_src_a) < $signed(alu_src_b)) ? 1'b1 : 1'b0;
    else            alu_slt = (alu_src_a < alu_src_b)? 1'b1 : 1'b0;
end

assign zero = |(alu_result);


endmodule
