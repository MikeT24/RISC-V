package risc_v_mike_pkg;
`include "risc_v_mike_header.svh"

parameter ADDRESS_32_W = 32;
parameter DATA_32_W = ADDRESS_32_W;
parameter INSTR_32_W  = 32;
parameter REG_ADDR_W = 5;
parameter INSTR_OPCODE_W = 7;
parameter FUNCT3_W = 3;
parameter FUNCT7_W = 7;
parameter U_IMM_W = 25;
parameter PC_CNT_ADDR_WIDTH = `INST_MEM_DEPTH ;
parameter PC_CNT_ADDR_SIZE = $clog2(PC_CNT_ADDR_WIDTH);
parameter GPIO_BYTE = 8;

// .text    --> 0x00400000
// .data    --> 0x10010000
// .stack   --> 0x7fffeffc
// .MMIO    --> 0xffff0000

parameter STACK_UPPER   = 32'h7fffeffc;
parameter TEXT_LOWER    = 32'h00400000;
parameter DATA_LOWER    = 32'h10010000;
// THIS PRACTICE DOES NOT COMPLY WITH OFFICIAL MMIO MAPPING
// THIS IS OVERLAPPED
parameter MMIO_LOWER    = 32'h10010024;


typedef logic [REG_ADDR_W - 1:0] t_register_addr; 
//typedef logic [INSTR_OPCODE_W - 1:0] t_instr_opcode;
typedef logic [ADDRESS_32_W - 1:0] t_pc_addr;
//typedef logic [] t_mnemonic;

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
parameter INST_RS2_LSB          = INST_RS1_MSB + 1;                     //20
parameter INST_RS2_MSB          = INST_RS2_LSB + REG_ADDR_W - 1;        //24
parameter INST_FUNCT7_LSB       = INST_RS2_MSB + 1;                     //25
parameter INST_FUNCT7_MSB       = INST_FUNCT7_LSB + FUNCT7_W - 1;            //31
    

//                       //funct7	    funct3  opcode
// parameter OP_ADD  	= {7'b0000000,	3'b000, 7'b0110011}; 
// parameter OP_SUB  	= {7'b0010000,	3'b000, 7'b0110011}; 
// parameter OP_SLL  	= {7'b0000000,	3'b001, 7'b0110011}; 
// parameter OP_SLT  	= {7'b0000000,	3'b010, 7'b0110011}; 
// parameter OP_SLTU 	= {7'b0000000,	3'b011, 7'b0110011}; 
// parameter OP_XOR  	= {7'b0000000,	3'b100, 7'b0110011}; 
// parameter OP_SRL  	= {7'b0000000,	3'b101, 7'b0110011}; 
// parameter OP_SRA  	= {7'b0010000,	3'b101, 7'b0110011}; 
// parameter OP_OR   	= {7'b0000000,	3'b110, 7'b0110011}; 
// parameter OP_AND  	= {7'b0000000,	3'b111, 7'b0110011}; 
// parameter OP_ADDI 	= {3'b000,      7'b0010011};
// parameter OP_SLLI 	= {7'b0000000,	3'b001,	7'b0010011};
// parameter OP_SLTI 	= {7'b0000000,	3'b010,	7'b0010011};
// parameter OP_SLTIU 	= {3'b011,      7'b0010011};
// parameter OP_XORI 	= {3'b100,      7'b0010011};
// parameter OP_SRLI 	= {3'b101,      7'b0010011};
// parameter OP_SRAI 	= {7'b0010000,	3'b101,	7'b0010011};
// parameter OP_ORI  	= {3'b110,      7'b0010011};
// parameter OP_ANDI 	= {3'b111,      7'b0010011};
// parameter OP_LB   	= {3'b000,      7'b0000011};
// parameter OP_LH   	= {3'b001,      7'b0000011};
// parameter OP_LW   	= {3'b010,      7'b0000011};
// parameter OP_LBU  	= {3'b100,      7'b0000011};
// parameter OP_LHU  	= {3'b101,      7'b0000011};
// parameter OP_SB   	= {3'b000,      7'b0100011};
// parameter OP_SH   	= {3'b001,      7'b0100011};
// parameter OP_SW   	= {3'b010,      7'b0100011};
// parameter OP_BEQ  	= {3'b000,      7'b1100011};
// parameter OP_BNE  	= {3'b001,      7'b1100011};
// parameter OP_BLT  	= {3'b100,      7'b1100011};
// parameter OP_BGE  	= {3'b101,      7'b1100011};
// parameter OP_BLTU 	= {3'b110,      7'b1100011};
// parameter OP_BGEU 	= {3'b111,      7'b1100011};
// parameter OP_JAL  	= {7'b1101111};
// parameter OP_JALR 	= {3'b000,      7'b1100111};


typedef enum logic [3:0] {
    ALU_ADD,    //0
    ALU_SUB,    //1
    ALU_SLL,    //2
    ALU_SLT,    //3
    ALU_RSVD_4, //
    ALU_XOR,    //5
    ALU_SRL,    //6
    ALU_SRA,    //7
    ALU_OR,     //8
    ALU_AND     //9
} t_alu_opcode;



typedef enum logic[INSTR_OPCODE_W-1:0] {
    R_TYPE      = 7'b0110011,
    I_TYPE      = 7'b0010011,
    I_LOAD_TYPE = 7'b0000011,
    I_JALR_TYPE = 7'b1100111,
    I_ENV_TYPE  = 7'b1110011,
    S_TYPE      = 7'b0100011,
    B_TYPE      = 7'b1100011,
    J_TYPE      = 7'b1101111,
    U_LUI_TYPE  = 7'b0110111, //not used
    U_AUI_TYPE  = 7'b0010111  //not used
} t_instr_opcode;

typedef enum {
    //R-TYPE
    OP_ADD, 
    OP_SUB, 
    OP_XOR, 
    OP_OR, 
    OP_AND, 
    OP_SLL, 
    OP_SRL, 
    OP_SRA, 
    OP_SLT, 
    OP_SLTU,
    //I-TYPE
    OP_ADDI, 
    OP_XORI, 
    OP_ORI, 
    OP_ANDI, 
    OP_SLLI, 
    OP_SRLI, 
    OP_SRAI, 
    OP_SLTI,
    OP_SLTIU, 
    OP_LB, 
    OP_LH, 
    OP_LW, 
    OP_LBU, 
    OP_LHU, 
    OP_JALR, 
    OP_ECALL, 
    OP_EBREAK,
    //S-TYPE
    OP_SB, 
    OP_SH, 
    OP_SW,
    //B-TYPE
    OP_BEQ, 
    OP_BNE, 
    OP_BLT, 
    OP_BGE, 
    OP_BLTU, 
    OP_BGEU,
    //J-TYPE
    OP_JAL,
    //U-TYPE
    OP_LUI, 
    OP_AUIPC,
    //INVALID
    OP_NA
} t_instr_nmemonic;

typedef enum {
    IDLE,
    FETCH,
    DECODE,
    EXECUTE,
    MEM,
    WB
} t_decode_state;

typedef enum logic[REG_ADDR_W-1:0] { 
    ZERO    = 5'd0,
    RA      = 5'd1,
    SP      = 5'd2,
    GP      = 5'd3,
    TP      = 5'd4,
    T0      = 5'd5,
    T1      = 5'd6,
    T2      = 5'd7,
    S0      = 5'd8,
    S1      = 5'd9,
    A0      = 5'd10,
    A1      = 5'd11,
    A2      = 5'd12,
    A3      = 5'd13,
    A4      = 5'd14,
    A5      = 5'd15,
    A6      = 5'd16,
    A7      = 5'd17,
    S2      = 5'd18,
    S3      = 5'd19,
    S4      = 5'd20,
    S5      = 5'd21,
    S6      = 5'd22,
    S7      = 5'd23,
    S8      = 5'd24,
    S9      = 5'd25,
    S10     = 5'd26,
    S11     = 5'd27,
    T3      = 5'd28,
    T4      = 5'd29,
    T5      = 5'd30,
    T6      = 5'd31
} t_instr_register;


parameter DATA_MAPPING_STACK_DIV = `DATA_MEM_DEPTH / 2;
parameter MEM_MAP_STACK_UPPER_LIMIT = STACK_UPPER;                                     // Stack upper limit definition
parameter MEM_MAP_STACK_LOWER_LIMIT = MEM_MAP_STACK_UPPER_LIMIT - DATA_MAPPING_STACK_DIV;       // Stack lower limit = stack upper limit, and static division we are setting
parameter MEM_MAP_DATA_LOWER_LIMIT = DATA_LOWER;
parameter MEM_MAP_DATA_UPPER_LIMIT = MEM_MAP_DATA_LOWER_LIMIT + DATA_MAPPING_STACK_DIV - 1;     
parameter MEM_MAP_TEXT_LOWER_LIMIT = TEXT_LOWER;
parameter MEM_MAP_TEXT_UPPER_LIMIT = MEM_MAP_TEXT_LOWER_LIMIT + `INST_MEM_DEPTH;
parameter MEM_MAP_MMIO_UPPER_LIMIT = MMIO_LOWER + `MMIO_MEM_SIZE;
parameter MEM_MAP_MMIO_LOWER_LIMIT = MMIO_LOWER;


endpackage



