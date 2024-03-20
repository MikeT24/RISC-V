
import risc_v_mike_pkg::*;
import UART_MIKE_pkg::*;

`include "uart/UART_MIKE_header.svh"				
`include "risc_v_mike_header.svh"


module risc_v_mike_gpio_module (
    input clk,
    input rst,
    input logic [ADDRESS_32_W-1:0] data_mmio_addr,
    input logic data_mmio_wr_addr_val,
    input logic [DATA_32_W-1:0] data_mmio_wr_data,
    output logic [DATA_32_W-1:0] data_mmio_rd_data,
    output logic [UART_DATA_WIDTH-1:0] tx_data_ff,
    output logic tx_send_ff,
    output logic rx_flag_clr_ff,	
    output logic tx_flag_clr_ff,
    input logic tx_flag,
    input logic parity_error,
    input logic rx_flag,
    input logic [UART_DATA_WIDTH-1:0] rx_data  
);



logic  [UART_DATA_WIDTH-1:0] tx_data;
logic tx_send;
logic rx_flag_clr;
logic tx_flag_clr;

`MIKE_FF_RST(tx_data_ff, tx_data, clk, rst)
`MIKE_FF_RST(tx_send_ff, tx_send, clk, rst)
`MIKE_FF_RST(rx_flag_clr_ff, rx_flag_clr, clk, rst)
`MIKE_FF_RST(tx_flag_clr_ff, tx_flag_clr, clk, rst)



assign tx_data = (data_mmio_wr_addr_val & (32'h0 == data_mmio_addr))? data_mmio_wr_data[7:0] : tx_data_ff;

assign tx_send       = (data_mmio_wr_addr_val & (32'd4 == data_mmio_addr))? data_mmio_wr_data[0] : tx_send_ff;
assign tx_flag_clr   = (data_mmio_wr_addr_val & (32'd8 == data_mmio_addr))? data_mmio_wr_data[0] : tx_flag_clr_ff;
assign rx_flag_clr   = (data_mmio_wr_addr_val & (32'd12 == data_mmio_addr))? data_mmio_wr_data[0] : rx_flag_clr_ff;


logic [UART_DATA_WIDTH-1:0] rx_data_ff;
logic tx_flag_ff;
logic parity_error_ff;
logic rx_flag_ff;

`MIKE_FF_RST(rx_data_ff, rx_data, clk, rst)  // 20
`MIKE_FF_RST(tx_flag_ff, tx_flag, clk, rst)   // 24
`MIKE_FF_RST(parity_error_ff, parity_error, clk, rst)
`MIKE_FF_RST(rx_flag_ff, rx_flag, clk, rst)


// NOT IDEAL WAY OF DOING IF MMIO/GPIO WILL HAVE MORE PORTS
// FINE FOR THIS APPLICATION

always_comb begin
    case (data_mmio_addr)
        0: data_mmio_rd_data = {24'h0,tx_data_ff};
        4: data_mmio_rd_data = {31'h0, tx_send_ff};
        8: data_mmio_rd_data = {31'h0,tx_flag_clr_ff};  
        12: data_mmio_rd_data = {31'h0,rx_flag_clr_ff};     //0xc
        16: data_mmio_rd_data = {24'h0,rx_data_ff};         //0x10
        //16: data_mmio_rd_data = {24'h0,8'ha};         //0x10 DEBUGGING ONLY
        20: data_mmio_rd_data = {31'h0, tx_flag_ff};        //0x14
        24: data_mmio_rd_data = {31'h0,rx_flag_ff};         //0x18
        default: data_mmio_rd_data = 32'hDEADBEEF; 
    endcase
end






endmodule