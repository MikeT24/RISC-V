package risc_v_mike_pkg;

parameter ADDRESS_32_W = 32;
parameter INSTR_32_W  = 32;
parameter REG_ADDR_W = 5;
parameter INSTR_OPCODE_W = 7;
parameter FUNCT3_W = 3;
parameter FUNCT7_W = 7
parameter U_IMM_W = 20;

typedef logic [REG_ADDR_W - 1:0] t_register_addr; 
typedef logic [INSTR_OPCODE_W - 1:0] t_instr_opcode;


// Instruction types 
parameter INST_OPCODE_MSB       = 6;
parameter INST_RD_LSB           = INST_OPCODE_MSB + 1;                  //7
parameter INST_RD_MSB           = INST_RD_LSB + REG_ADDR_W - 1;         //11
parameter INST_FUNCT3_LSB       = INST_RD_MSB + 1;                      //12
parameter INST_FUNCT3_MSB       = INST_FUNCT3_LSB + FUNCT3_W - 1;       //14                        
parameter INST_RS1_LSB          = INST_FUNCT3_MSB + 1;                  //15
parameter INST_RS1_MSB          = INST_RS1_LSB + REG_ADDR_W - 1;        //19
parameter INST_RS2_LSB          = INST_RS1_MSB + 1                      //20
parameter INST_RS2_MSB          = INST_RS2_LSB + REG_ADDR_W - 1;        //24
parameter INST_FUNCT7_LSB   = INST_RS2_MSB + 1;                     //25
parameter INST_FUNCT7_MSB   = INST_RS1_FUNCT7_LSB + FUNCT7_W - 1;   //31
    


parameter OP_ALU_R      = 'b0110011;
parameter OP_ALU_I      = 'b0010011;
parameter OP_LD_I       = 'b0000011;
parameter OP_ST_S       = 'b0100011;
parameter OP_BRANCH_B   = 'b1100011;
parameter OP_JAL        = 'b1101111;
parameter OP_JALR       = 'b1100111;
parameter OP_UI_U       = 'b0110111;
parameter OP_ECALL      = 'b1110011;
parameter OP_EBREAK     = 'b1110011;



endpackage
