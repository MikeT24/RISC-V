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
    output tx
);


logic [UART_DATA_WIDTH-1:0] tx_data;
logic tx_send;
logic parity_error;
logic rx_flag;
logic [UART_DATA_WIDTH-1:0] rx_data;
logic rx_flag_clr;


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
    .tx_flag(tx_flag)
);



endmodule 
