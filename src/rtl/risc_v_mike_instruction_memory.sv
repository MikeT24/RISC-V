import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_instruction_memory #(
    parameter DATA_MEM_WIDTH = 32,
    parameter DATA_MEM_DEPTH = 16,
)(
    input logic clk,
    input logic rst,
    input t_register_addr data_mem_addr,     
    output logic [DATA_32_W - 1:0] data_mem_rd_data,
);


logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem;
logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem_ff;


for (genvar depth = 0; depth < DATA_MEM_DEPTH; depth++) begin
    // Write to data_mem if reg_write is asserted
    // Write just to the enabled address
    // Actual flip flop
    `MIKE_FF_RST(data_mem_ff, data_mem, clk, rst)
end

//Data read assignments
assign data_mem_rd_data = data_mem_ff[data_mem_addr];


//TODO: Asserts to prevent undesired addresses


endmodule