import UART_MIKE_pkg::*;
import risc_v_mike_pkg::*;


`include "../risc_v_mike_header.svh"
`include "UART_MIKE_header.svh"				
		
		
module UART_UNCORE (
    input clk,
    input rst,
    input logic [ADDRESS_32_W-1:0] data_mmio_addr,
    input logic data_mmio_wr_addr_val,
    input logic [DATA_32_W-1:0] data_mmio_wr_data,
    output logic [DATA_32_W-1:0] data_mmio_rd_data,
    input rx,
    output tx,
    output logic seg_a,
	output logic seg_b,
	output logic seg_c,
	output logic seg_d,
	output logic seg_e,
	output logic seg_f,
	output logic seg_g,
	output logic tx_seg_a,
	output logic tx_seg_b,
	output logic tx_seg_c,
	output logic tx_seg_d,
	output logic tx_seg_e,
	output logic tx_seg_f,
	output logic tx_seg_g,
	input logic  asci_or_hexa_tx,
	input logic  asci_or_hexa_rx    
);


logic [UART_DATA_WIDTH-1:0] tx_data;
logic tx_send;
logic parity_error;
logic rx_flag;
logic [UART_DATA_WIDTH-1:0] rx_data;
logic rx_flag_clr;
logic tx_flag_clr;
logic tx_flag;

risc_v_mike_gpio_module i_risc_v_mike_gpio_module(
    .clk(clk),
    .rst(~rst),
    .data_mmio_addr(data_mmio_addr),
    .data_mmio_wr_addr_val(data_mmio_wr_addr_val),
    .data_mmio_wr_data(data_mmio_wr_data),
    .data_mmio_rd_data(data_mmio_rd_data),
    .tx_data_ff(tx_data),
    .tx_send_ff(tx_send),
    .rx_flag_clr_ff(rx_flag_clr),
    .tx_flag_clr_ff(tx_flag_clr),
    .tx_flag(tx_flag),
    .parity_error(parity_error),
    .rx_flag(rx_flag),
    .rx_data(rx_data)
);


UART_MIKE i_top_UART_MIKE(
	.clk(clk),
	.n_rst(rst),
	.tx_data(tx_data),
	.tx_send(tx_send),
	.rx(rx),
	.tx(tx),
	.parity_error(parity_error),
	.rx_flag(rx_flag),
	.rx_data(rx_data),
	.rx_flag_clr(rx_flag_clr),
    .tx_flag_clr(tx_flag_clr),
    .tx_flag(tx_flag),
    .seg_a(seg_a),
    .seg_b(seg_b),
    .seg_c(seg_c),
    .seg_d(seg_d),
    .seg_e(seg_e),
    .seg_f(seg_f),
    .seg_g(seg_g),
    .tx_seg_a(tx_seg_a),
    .tx_seg_b(tx_seg_b),
    .tx_seg_c(tx_seg_c),
    .tx_seg_d(tx_seg_d),
    .tx_seg_e(tx_seg_e),
    .tx_seg_f(tx_seg_f),
    .tx_seg_g(tx_seg_g),
    .asci_or_hexa_tx(asci_or_hexa_tx),
    .asci_or_hexa_rx(asci_or_hexa_rx)
);



endmodule 
