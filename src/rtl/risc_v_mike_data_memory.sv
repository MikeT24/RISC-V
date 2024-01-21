import risc_v_mike_pkg::*;
//IFDEF HERE
import UART_MIKE_pkg::*;
//ENDIF
`include "risc_v_mike_header.svh"


module risc_v_mike_data_memory #(
    parameter DATA_MEM_WIDTH = 64, //temp
    parameter DATA_MEM_DEPTH = 16
)(
    input logic clk,
    input logic rst,
    input [DATA_32_W - 1:0] data_mem_addr,     // rs1,
    input logic data_mem_write,              // mem_write
    input logic [DATA_32_W - 1:0] data_mem_wr_data,
    output logic [DATA_32_W - 1:0] data_mem_rd_data,
    //IFDEF HERE
    output logic [DATA_32_W-1:0] gpio_out0,
    output logic [DATA_32_W-1:0] gpio_out1,
    input logic [DATA_32_W-1:0] gpio_in0,
    input logic [DATA_32_W-1:0] gpio_in1
    //ENDIF
);


logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem;
logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem_ff;

genvar depth;
genvar depth_gpio;

//GPIO INPUTS ARE NOT WRITABLE
assign data_mem[DATA_MEM_DEPTH-2] = gpio_in0;   // GPIO_IN0 == 62
assign data_mem[DATA_MEM_DEPTH-1] = gpio_in1;   // GPIO_IN1 == 63

generate
    for (depth = 0; depth < DATA_MEM_DEPTH; depth++) begin : g_data_mem //depth-2 for having gpio ins 
        if (depth < DATA_MEM_DEPTH-2) begin 
            // Write to data_mem if reg_write is asserted
            // Write just to the enabled address
            assign data_mem[depth] = (data_mem_write & (depth == data_mem_addr))? data_mem_wr_data : data_mem_ff[depth];
        end 
        // Actual flip flop
        `MIKE_FF_RST(data_mem_ff[depth], data_mem[depth], clk, rst)
    end
endgenerate

//Data read assignments
assign data_mem_rd_data = (data_mem_addr < DATA_MEM_DEPTH) ? data_mem_ff[data_mem_addr] : 'b0;

assign gpio_out0 =  data_mem_ff[DATA_MEM_DEPTH-4]; // GPIO_OUT0 == 60
assign gpio_out1 =  data_mem_ff[DATA_MEM_DEPTH-3]; // GPIO_OUT1 == 61





//TODO: Asserts to prevent undesired addresses


endmodule