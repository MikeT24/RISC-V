package risc_v_mike_pkg;

parameter ADDRESS_32_W = 32;
parameter DATA_32_W = ADDRESS_32_W;
parameter INSTR_32_W  = 32;
parameter REG_ADDR_W = 5;
parameter INSTR_OPCODE_W = 7;
parameter FUNCT3_W = 3;
parameter FUNCT7_W = 7
parameter U_IMM_W = 20;

typedef logic [REG_ADDR_W - 1:0] t_register_addr; 
typedef logic [INSTR_OPCODE_W - 1:0] t_instr_opcode;

typedef struct packed {
    logic [6:0] funct7;
    logic [2:0] funct3;
    logic [6:0] opcode;
} t_current_operation;


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
parameter INST_FUNCT7_LSB       = INST_RS2_MSB + 1;                     //25
parameter INST_FUNCT7_MSB       = INST_RS1_FUNCT7_LSB + FUNCT7_W - 1;   //31
    

                      //funct7	    funct3  opcode
parameter OP_ADD  	= {7'b0000000,	3'b000, 7'b0110011}; 
parameter OP_SUB  	= {7'b0010000,	3'b000, 7'b0110011}; 
parameter OP_SLL  	= {7'b0000000,	3'b001, 7'b0110011}; 
parameter OP_SLT  	= {7'b0000000,	3'b010, 7'b0110011}; 
parameter OP_SLTU 	= {7'b0000000,	3'b011, 7'b0110011}; 
parameter OP_XOR  	= {7'b0000000,	3'b100, 7'b0110011}; 
parameter OP_SRL  	= {7'b0000000,	3'b101, 7'b0110011}; 
parameter OP_SRA  	= {7'b0010000,	3'b101, 7'b0110011}; 
parameter OP_OR   	= {7'b0000000,	3'b110, 7'b0110011}; 
parameter OP_AND  	= {7'b0000000,	3'b111, 7'b0110011}; 
parameter OP_ADDI 	= {3'b000,      7'b0010011};
parameter OP_SLLI 	= {7'b0000000,	3'b001,	7'b0010011};
parameter OP_SLTI 	= {7'b0000000,	3'b010,	7'b0010011};
parameter OP_SLTIU 	= {3'b011,      7'b0010011};
parameter OP_XORI 	= {3'b100,      7'b0010011};
parameter OP_SRLI 	= {3'b101,      7'b0010011};
parameter OP_SRAI 	= {7'b0010000,	3'b101,	7'b0010011};
parameter OP_ORI  	= {3'b110,      7'b0010011};
parameter OP_ANDI 	= {3'b111,      7'b0010011};
parameter OP_LB   	= {3'b000,      7'b0000011};
parameter OP_LH   	= {3'b001,      7'b0000011};
parameter OP_LW   	= {3'b010,      7'b0000011};
parameter OP_LBU  	= {3'b100,      7'b0000011};
parameter OP_LHU  	= {3'b101,      7'b0000011};
parameter OP_SB   	= {3'b000,      7'b0100011};
parameter OP_SH   	= {3'b001,      7'b0100011};
parameter OP_SW   	= {3'b010,      7'b0100011};
parameter OP_BEQ  	= {3'b000,      7'b1100011};
parameter OP_BNE  	= {3'b001,      7'b1100011};
parameter OP_BLT  	= {3'b100,      7'b1100011};
parameter OP_BGE  	= {3'b101,      7'b1100011};
parameter OP_BLTU 	= {3'b110,      7'b1100011};
parameter OP_BGEU 	= {3'b111,      7'b1100011};
parameter OP_JAL  	= {7'b1101111};
parameter OP_JALR 	= {3'b000,      7'b1100111};













endpackage



