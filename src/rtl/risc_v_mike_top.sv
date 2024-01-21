import risc_v_mike_pkg::*;
//IFDEF HERE
import UART_MIKE_pkg::*;
//ENDIF

`include "risc_v_mike_header.svh"

module risc_v_mike_top (
    input logic clk,
    input logic rst,
    input logic  rx,
    output logic  tx,
    output logic seg_a,
    output logic seg_b,
    output logic seg_c,
    output logic seg_d,
    output logic seg_e,
    output logic seg_f,
    output logic seg_g,
    output logic rst_test
);

    logic [INSTR_32_W - 1:0] instruction;
    t_register_addr rs1;
    t_register_addr rs2;
    t_register_addr rsd;
    logic [FUNCT3_W - 1:0] funct3;
    logic [FUNCT7_W - 1:0] funct7;
    logic pc_src;
    logic result_src;
    logic mem_write;
    logic reg_write;
    logic alu_src;
    logic [2:0] imm_src;
    logic [DATA_32_W - 1:0] alu_src_a;
    logic [DATA_32_W - 1:0] alu_src_b;
    t_alu_opcode alu_ctrl;
    logic alu_signed;
    logic  [DATA_32_W - 1:0] alu_result;
    logic  alu_zero;
    logic  alu_slt;

    logic [DATA_32_W - 1:0] reg_file_rd_data_2;
    logic [DATA_32_W - 1:0] data_mem_rd_data;
    logic [DATA_32_W - 1:0] reg_file_wr_data;
    logic [DATA_32_W - 1:0] imm_ext;

    t_pc_addr pc_plus4;
    t_pc_addr pc_branch; 
    t_pc_addr pc_addr;
    t_pc_addr pc_addr_nxt;

    t_instr_nmemonic intr_nmen;

    assign rst_test = ~rst;
risc_v_mike_ctrl i_risc_v_mike_ctrl(
    .alu_zero(alu_zero),
    .alu_slt(alu_slt),
    .instruction(instruction),
    .rs1(rs1),
    .rs2(rs2),
    .rsd(rsd),
    .funct3(funct3),
    .funct7(funct7),
    .pc_src(pc_src),
    .result_src(result_src),
    .mem_write(mem_write),
    .reg_write(reg_write),
    .alu_src(alu_src),
    .alu_ctrl(alu_ctrl),
    .alu_signed(alu_signed),
    .imm_src(imm_src),
    .intr_nmen(intr_nmen)
);


risc_v_mike_alu i_risc_v_mike_alu(
    .alu_src_a(alu_src_a),
    .alu_src_b(alu_src_b),
    .alu_ctrl(alu_ctrl),
    .alu_signed(alu_signed),
    .alu_result(alu_result),
    .alu_zero(alu_zero),
    .alu_slt(alu_slt)
);

//ALU SRC MUX: CHOOSE BETWEEN SIGN EXTEND AND REG_FILE READ PORT 2
//TODO: imm_ext module and connection
assign alu_src_b = (alu_src) ? imm_ext : reg_file_rd_data_2;

risc_v_mike_reg_file #(
    .REG_FILE_DEPTH(32)
) i_risc_v_mike_reg_file(
    .clk(clk),
    .rst(~rst),
    .reg_file_rd_addr_1(rs1),    // rs1,
    .reg_file_rd_addr_2(rs2),    // rs2,
    .reg_file_wr_addr(rsd),      // rsd,
    .reg_file_write(reg_write),                  //reg_write,
    .reg_file_wr_data(reg_file_wr_data),
    .reg_file_rd_data_1(alu_src_a),
    .reg_file_rd_data_2(reg_file_rd_data_2)
);

//RESULT SRC MUX: CHOOSE BETWEEN DATA MEMORY OUTPUT OR ALU RESULT
assign reg_file_wr_data = (result_src)? data_mem_rd_data : alu_result;

//IFDEF HERE
logic [DATA_32_W-1:0] gpio_out0;
logic [DATA_32_W-1:0] gpio_out1;
logic [DATA_32_W-1:0] gpio_in0;
logic [DATA_32_W-1:0] gpio_in1;
//ENDIF



risc_v_mike_data_memory #(
    .DATA_MEM_DEPTH(64)
) i_risc_v_mike_data_memory (
    .clk(clk),
    .rst(~rst),
    .data_mem_addr(alu_result),
    .data_mem_write(mem_write),
    .data_mem_wr_data(reg_file_rd_data_2),
    .data_mem_rd_data(data_mem_rd_data),
    // FOR UART GPIO WILL IMPLEMENT A DIRECT MAPPED MEMORY
    // IFDEF ADDED HERE IN THE FUTURE
    .gpio_out0(gpio_out0),
    .gpio_out1(gpio_out1),
    .gpio_in0(gpio_in0),
    .gpio_in1(gpio_in1)
);




risc_v_mike_sign_extend i_risc_v_mike_sign_extend (
    .imm_src(imm_src),
    .instruction(instruction),
    .imm_ext(imm_ext)
);

// Program counter additions
// First is normal addition
assign pc_plus4 = pc_addr + 32'h4;
// Second is branch selection
assign pc_branch = pc_addr + imm_ext;
// Selection of the next count
assign pc_addr_nxt = (pc_src)? pc_branch : pc_plus4;
// PC Flip flop
 `MIKE_FF_RST(pc_addr, pc_addr_nxt, clk, ~rst)

risc_v_mike_instruction_memory #(
    .DATA_MEM_DEPTH(PC_CNT_ADDR_WIDTH)
) i_risc_v_mike_instruction_memory (
    .clk(clk),
    .rst(~rst),
    .data_mem_addr(pc_addr),
    .data_mem_rd_data(instruction)
);





logic  [UART_DATA_WIDTH-1:0] tx_data;
logic  tx_send;
logic  rx_flag_clr;
logic  parity_error;
logic  rx_flag;
logic  [UART_DATA_WIDTH-1:0] rx_data;
logic   tx_flag;
logic   tx_flag_clr;

assign tx_data = gpio_out0[7:0];
assign tx_send = gpio_out1[0];
assign rx_flag_clr = gpio_out1[1];
assign tx_flag_clr = gpio_out1[2]; //4

//assign parity_error = gpio_out1[1];

assign gpio_in0[7:0] = rx_data;
assign gpio_in0[31:8] = 'b0;
assign gpio_in1[0]  = rx_flag;
assign gpio_in1[1]  = tx_flag;
assign gpio_in1[31:2] = 'b0;


UART_MIKE i_UART_MIKE (
    .clk(clk),
    .n_rst(rst),
    .tx_data(tx_data),
    .tx_send(tx_send),
    .rx(rx),
    .rx_flag_clr(rx_flag_clr),
    .tx(tx),
    .parity_error(parity_error),
    .rx_flag(rx_flag),
    .rx_data(rx_data),
    .seg_a(seg_a),
    .seg_b(seg_b),
    .seg_c(seg_c),
    .seg_d(seg_d),
    .seg_e(seg_e),
    .seg_f(seg_f),
    .seg_g(seg_g),
    .tx_flag(tx_flag),
    .tx_flag_clr(tx_flag_clr)
);


endmodule
