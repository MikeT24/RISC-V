import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_ctrl (
    input logic alu_zero,
    input logic alu_slt,
    input logic [INSTR_32_W - 1:0] instruction,
    output t_instr_register rs1,
    output t_instr_register rs2,
    output t_instr_register rsd,
    output logic [FUNCT3_W - 1:0] funct3,
    output logic [FUNCT7_W - 1:0] funct7,
    output logic pc_src,
    output logic result_src,
    output logic mem_write,
    output logic reg_write,
    output logic alu_src_sel_a,
    output logic alu_src_sel_b,
    output t_alu_opcode alu_ctrl,
    output logic alu_signed,
    output logic [2:0] imm_src,
    output t_instr_nmemonic intr_nmen

);

t_instr_opcode opcode;

assign opcode   = t_instr_opcode'(instruction[INST_OPCODE_MSB:0]);
assign rsd      = t_instr_register'(instruction[INST_RD_MSB:INST_RD_LSB]);
assign rs1      = t_instr_register'(instruction[INST_RS1_MSB:INST_RS1_LSB]);
assign rs2      = t_instr_register'(instruction[INST_RS2_MSB:INST_RS2_LSB]);
assign funct3   = instruction[INST_FUNCT3_MSB:INST_FUNCT3_LSB];
assign funct7   = instruction[INST_FUNCT7_MSB:INST_FUNCT7_LSB];



// logic [16:0] current_operation;
// t_current_operation current_operation2;
// assign current_operation = {funct7, funct3 ,opcode};
// assign current_operation2 = current_operation;

// TODO: Still need to add signed bit going to the ALU
// TODO: Need also to add the word/half/byte restrictions for load and store 

// AR: Assert to prevent signed with ADD, SUB, OR, AND, XOR, SHIFTS


// DECODER FOR THE INSTRUCTION NMEMONICS
always_comb
    case (opcode)
        R_TYPE: begin
            case (funct3) 
                'h0: intr_nmen = (funct7[5] == 'b0) ? OP_ADD : (funct7[5] == 'b1) ? OP_SUB : OP_NA;
                'h1: intr_nmen = OP_SLL;
                'h2: intr_nmen = OP_SLT;
                'h3: intr_nmen = OP_SLTU;
                'h4: intr_nmen = OP_XOR;
                'h5: intr_nmen = (funct7[5] == 'b0) ? OP_SRL : (funct7[5] == 'b1) ? OP_SRA : OP_NA;
                'h6: intr_nmen = OP_OR;
                'h7: intr_nmen = OP_AND;
                default : intr_nmen = OP_NA;
            endcase
        end
        I_TYPE : begin
            case (funct3) 
                'h0: intr_nmen = OP_ADDI;
                'h1: intr_nmen = OP_SLLI;
                'h2: intr_nmen = OP_SLTI;
                'h3: intr_nmen = OP_SLTIU;
                'h4: intr_nmen = OP_XORI;
                'h5: intr_nmen = (funct7[5] == 'b0) ? OP_SRLI : (funct7[5] == 'b1) ? OP_SRAI : OP_NA;
                'h6: intr_nmen = OP_ORI;
                'h7: intr_nmen = OP_ANDI;
                default : intr_nmen = OP_NA;
            endcase
        
        end
        I_LOAD_TYPE: begin
            case (funct3)
                'h0: intr_nmen =  OP_LB;
                'h1: intr_nmen =  OP_LH;
                'h2: intr_nmen =  OP_LW;
                'h4: intr_nmen =  OP_LBU;
                'h5: intr_nmen =  OP_LHU;
                default : intr_nmen =  OP_NA;
            endcase        
        end
        I_JALR_TYPE: begin
            intr_nmen =  OP_JALR;        
        end
        I_ENV_TYPE: begin
            intr_nmen =  (funct7[0] == '1) ? OP_EBREAK : OP_ECALL;

        end
        S_TYPE: begin
            case (funct3)
                'h0: intr_nmen =  OP_SB;
                'h1: intr_nmen =  OP_SH;
                'h2: intr_nmen =  OP_SW;
                default : intr_nmen =  OP_NA;
            endcase
        end
        B_TYPE: begin
            case (funct3)
                'h0: intr_nmen =  OP_BEQ;
                'h1: intr_nmen =  OP_BNE;
                'h4: intr_nmen =  OP_BLT;
                'h5: intr_nmen =  OP_BGE;
                'h6: intr_nmen =  OP_BLTU;
                'h7: intr_nmen =  OP_BGEU;
                default : intr_nmen =  OP_NA;
            endcase
        end
        U_LUI_TYPE: begin
            intr_nmen =  OP_LUI;
        end
        U_AUI_TYPE: begin
            intr_nmen =  OP_AUIPC;
        end
        J_TYPE: begin
            intr_nmen =  OP_JAL;
        end
        default: begin
            intr_nmen = OP_NA;
        end
    endcase

    



always_comb begin 
    case (intr_nmen) 
        OP_ADD  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation

        end            
        OP_SUB  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SUB;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SLL  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SLL;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SLT  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'b0;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_SLTU : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_XOR  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_XOR;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SRL  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SRL;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SRA  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SRA;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_OR   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_OR;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_AND  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_AND;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_ADDI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SLLI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_SLL;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SLTI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'b0;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_SLTI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_XORI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_XOR;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SRLI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_SRL;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SRAI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_SRA;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_ORI  : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_OR;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_ANDI : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_AND;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_LB   : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b0;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_LH   : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // THIS IS A SIGNED UOP
        end            
        OP_LW   : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b0;
            alu_signed  = 1'b0; // THIS IS A SIGNED UOP
        end            
        OP_LBU  : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b1;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_LHU  : begin
            pc_src      = 1'b0;
            result_src  = 1'b1;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b1;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SB   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0; //DONT CARE 
            mem_write   = 1'b1;
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b1;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SH   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0; //DONT CARE 
            mem_write   = 1'b1;
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b1;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_SW   : begin
            pc_src      = 1'b0;
            result_src  = 1'b0; //DONT CARE 
            mem_write   = 1'b1;
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'b1;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_BEQ  : begin
            pc_src      = (alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SUB;
            imm_src     = 3'h2;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_BNE  : begin
            pc_src      = !(alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SUB;
            imm_src     = 3'h2;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_BLT  : begin
            pc_src      = (alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'h2;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_BGE  : begin
            pc_src      = (!alu_zero);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'h2;
            alu_signed  = 1'b1; // THIS IS A SIGNED UOP
        end            
        OP_BLTU : begin
            pc_src      = (alu_slt);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'h2;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_BGEU : begin
            pc_src      = (!alu_slt);   // External signal comming from ALU 
            result_src  = 1'b0;          // Don't care 
            mem_write   = 1'b0;          
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_SLT;
            imm_src     = 3'h2;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        //TODO: ENABLE JUMPS
        OP_JAL  : begin
            pc_src      = 1'b1;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'h3;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_JALR : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'h3;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end            
        OP_LUI : begin 
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'h4; // U-TYPE
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end
        OP_AUIPC : begin     
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b1;
            alu_src_sel_a = 1'b1;
            alu_src_sel_b = 1'b1;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'h4; // U-TYPE
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end        
        default : begin
            pc_src      = 1'b0;
            result_src  = 1'b0;
            mem_write   = 1'b0;
            reg_write   = 1'b0;
            alu_src_sel_a = 1'b0;
            alu_src_sel_b = 1'b0;
            alu_ctrl    = ALU_ADD;
            imm_src     = 3'h0;
            alu_signed  = 1'b0; // if this is 1 then ALU will make an unsigned operation
        end
    endcase
end




endmodule
