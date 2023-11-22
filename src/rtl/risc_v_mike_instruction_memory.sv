import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_instruction_memory #(
    parameter DATA_MEM_WIDTH = 32,
    parameter DATA_MEM_DEPTH = 1024
)(
    input logic clk,
    input logic rst,
    input t_pc_addr data_mem_addr,     
    output logic [DATA_32_W - 1:0] data_mem_rd_data
);

t_pc_addr direct_addressing;
logic error_addr;

logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem;
logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem_ff;

assign direct_addressing = data_mem_addr >> 2;
assign error_addr = data_mem_addr % 4;

// genvar depth;
// generate
//     for (depth = 0; depth < DATA_MEM_DEPTH; depth++) begin: g_instr_mem
//         // Write to data_mem if reg_write is asserted
//         // Write just to the enabled address
//         // Actual flip flop
//         // assign data_mem[depth] = (rst)? 'h0 : data_mem_ff[depth];
//        // `MIKE_FF_RST(data_mem_ff[depth], data_mem[depth], clk, rst)
//     end
// endgenerate


// //Data read assignments
 

// assign data_mem_ff = [0] = 32'b00000000000100000100000100010011;
// assign data_mem_ff = [1] = 32'b00000000000100000100000100010011;
// assign data_mem_ff = [2] = 32'b00000000000100000100000100010011;
// assign data_mem_ff = [3] = 32'b00000000000100000100000100010011;
assign data_mem_rd_data = data_mem_ff[direct_addressing];


//TODO: Asserts to prevent undesired addresses


endmodule