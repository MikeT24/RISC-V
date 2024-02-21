import risc_v_mike_pkg::*;
//IFDEF HERE
import UART_MIKE_pkg::*;
//ENDIF
`include "risc_v_mike_header.svh"


module risc_v_mike_data_memory #(
    parameter DATA_MEM_DEPTH = 16
)(
    input logic clk,
    input logic rst,
    input [DATA_32_W - 1:0] data_mem_addr,     // rs1,
    input logic data_mem_write,              // mem_write
    input logic [DATA_32_W - 1:0] data_mem_wr_data,
    output logic [DATA_32_W - 1:0] data_mem_rd_data
    //ENDIF
);


logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem;
logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem_ff;

genvar depth;


generate
    for (depth = 0; depth < DATA_MEM_DEPTH; depth++) begin : g_data_mem //depth-2 for having gpio ins 
        assign data_mem[depth] = (data_mem_write & (depth == data_mem_addr))? data_mem_wr_data : data_mem_ff[depth];
        // Actual flip flop
        `MIKE_FF_RST(data_mem_ff[depth], data_mem[depth], clk, rst) // Add enable to save power
    end
endgenerate

//Data read assignments
//Should some sort of address error be added? 
assign data_mem_rd_data = (data_mem_addr < DATA_MEM_DEPTH) ? data_mem_ff[data_mem_addr] : 'b0;





//TODO: Asserts to prevent undesired addresses


endmodule