import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_ctrl (
    input logic alu_zero,
    input logic alu_slt,
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
    output logic alu_signed,
    output logic [1:0] imm_src,
);

t_instr_opcode opcode;

assign opcode   = instruction[INST_OPCODE_MSB:0];
assign rsd      = instruction[INST_RD_MSB:INST_RD_LSB];
assign rs1      = instruction[INST_RS1_MSB:INST_RS1_LSB];
assign rs2      = instruction[INST_RS2_MSB:INST_RS2_LSB];
assign funct3   = instruction[INST_FUNCT3_MSB:INST_FUNCT3_LSB];
assign funct7   = instruction[INST_FUNCT7_MSB:INST_FUNCT7_LSB];



logic [16:0] current_operation;
t_current_operation current_operation2;
assign current_operation = {funct7, funct3 ,opcode};
assign current_operation2 = current_operation;


// always_comb begin 
//     case (opcode)
//         OP_R_ARITH :    current_operation = {opcode,funct3,funct7};
//         OP_I_ARITH :    current_operation = {opcode,funct3,funct7}; // funct7 == imm[11:5] in I-type 
//         OP_LD_I :       current_operation = {opcode,funct3};
//         OP_ST_S :       current_operation = {opcode,funct3};
//         OP_BRANCH_B :   current_operation = {opcode,funct3};
//         OP_JAL :        current_operation = {opcode};
//         OP_JALR :       current_operation = {opcode,funct3};
//     endcase
// end 



// TODO: Still need to add signed bit going to the ALU
// TODO: Need also to add the word/half/byte restrictions for load and store 

// AR: Assert to prevent signed with ADD, SUB, OR, AND, XOR, SHIFTS

always_comb begin 
    alu_signed = 1'b0; // if this is 1 then ALU will make an unsigned operation
    case (current_operation) 
        OP_ADD  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b0;
        end            
        OP_SUB  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h1;
            imm_src     = 2'b0;
        end            
        OP_SLL  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h2;
            imm_src     = 2'b0;
        end            
        OP_SLT  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h3;
            imm_src     = 2'b0;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_SLTU : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h3;
            imm_src     = 2'b0;
        end            
        OP_XOR  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h5;
            imm_src     = 2'b0;
        end            
        OP_SRL  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h6;
            imm_src     = 2'b0;
        end            
        OP_SRA  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h7;
            imm_src     = 2'b0;
        end            
        OP_OR   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h8;
            imm_src     = 2'b0;
        end            
        OP_AND  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h9;
            imm_src     = 2'b0;
        end            
        OP_ADDI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b0;
        end            
        OP_SLLI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h2;
            imm_src     = 2'b0;
        end            
        OP_SLTI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h3;
            imm_src     = 2'b0;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_SLTI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h3;
            imm_src     = 2'b0;
        end            
        OP_XORI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h5;
            imm_src     = 2'b0;
        end            
        OP_SRLI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h6;
            imm_src     = 2'b0;
        end            
        OP_SRAI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h7;
            imm_src     = 2'b0;
        end            
        OP_ORI  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h8;
            imm_src     = 2'b0;
        end            
        OP_ANDI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h9;
            imm_src     = 2'b0;
        end            
        OP_LB   : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_LH   : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_LW   : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_LBU  : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
        end            
        OP_LHU  : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
        end            
        OP_SB   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0; //DONT CARE 
            mem_write   = 1'b1;
            reg_write   = 1'b0;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
        end            
        OP_SH   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0; //DONT CARE 
            mem_write   = 1'b1;
            reg_write   = 1'b0;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
        end            
        OP_SW   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0; //DONT CARE 
            mem_write   = 1'b1;
            reg_write   = 1'b0;
            alu_src     = 1'b1;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b1;
        end            
        OP_BEQ  : begin
            pc_src      = (alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h1;
            imm_src     = 2'h2;
        end            
        OP_BNE  : begin
            pc_src      = (alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h1;
            imm_src     = 2'h2;
        end            
        OP_BLT  : begin
            pc_src      = (alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h3;
            imm_src     = 2'h2;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_BGE  : begin
            pc_src      = (!alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h3;
            imm_src     = 2'h2;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_BLTU : begin
            pc_src      = (alu_slt);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h3;
            imm_src     = 2'h2;
        end            
        OP_BGEU : begin
            pc_src      = (!alu_slt);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h3;
            imm_src     = 2'h2;
        end            
        //TODO: ENABLE JUMPS
        OP_JAL  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b0;
        end            
        OP_JALR : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b0;
            alu_src     = 1'b0;
            alu_ctrl    = 3'h0;
            imm_src     = 2'b0;
        end            
    endcase
end




endmodule
