
import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"


module risc_v_mike_gpio_module (
    input clk,
    input rst,
    input logic [ADDRESS_32_W-1:0] data_mmio_addr,
    input logic data_mmio_wr_addr_val,
    input logic [GPIO_BYTE-1:0] gpio_port_in,
    output logic [GPIO_BYTE-1:0] gpio_port_out,
    input logic [DATA_32_W-1:0] data_mmio_wr_data,
    output logic [DATA_32_W-1:0] data_mmio_rd_data
);


// TWO ACCESES FOR THE HW5
logic [DATA_32_W-1:0] gpio_in1;
logic [DATA_32_W-1:0] gpio_out1;
logic [DATA_32_W-1:0] gpio_out1_ff;


//This module is done exclusively for HW5


assign gpio_out1 = (data_mmio_wr_addr_val & (32'h0 == data_mmio_addr))? data_mmio_wr_data : gpio_out1_ff;
assign gpio_port_out = gpio_out1;


`MIKE_FF_RST(gpio_out1_ff, gpio_out1, clk, rst);
`MIKE_FF_RST(gpio_in1, gpio_port_in, clk, rst);

always_comb begin
    if (~data_mmio_wr_addr_val) begin 
        assign data_mmio_rd_data = 32'h0;
    end
    else if (0 == data_mmio_addr) begin 
        assign data_mmio_rd_data = gpio_out1_ff;
    end
    else if (4 == data_mmio_addr) begin 
        assign data_mmio_rd_data = gpio_in1;
    end
end


endmodule