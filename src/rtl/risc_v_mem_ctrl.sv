import risc_v_mike_pkg::*;
import UART_MIKE_pkg::*;
//ENDIF
`include "risc_v_mike_header.svh"

module risc_v_mem_ctrl (
    input [DATA_32_W - 1:0] mem_bus_rd_addr,
    input [DATA_32_W - 1:0] mem_bus_wr_addr,
    input mem_bus_write,
    input mem_bus_read,

    input logic [DATA_32_W - 1:0] mem_bus_wr_data,
    output logic [DATA_32_W - 1:0] mem_bus_rd_data
);

// .text    --> 0x00400000
// .data    --> 0x10010000
// .stack   --> 0x7fffeffc
// .MMIO    --> 0xffff0000

parameter DATA_MAPPING_STACK_DIV = `DATA_MEM_DEPTH / 2;
parameter MEM_MAP_STACK_UPPER_LIMIT = STACK_UPPER;                                     // Stack upper limit definition
parameter MEM_MAP_STACK_LOWER_LIMIT = MEM_MAP_STACK_UPPER_LIMIT - DATA_MAPPING_STACK_DIV;       // Stack lower limit = stack upper limit, and static division we are setting
parameter MEM_MAP_DATA_UPPER_LIMIT = MEM_MAP_DATA_LOWER_LIMIT + DATA_MAPPING_STACK_DIV - 1;     
parameter MEM_MAP_DATA_LOWER_LIMIT = DATA_LOWER;
parameter MEM_MAP_TEXT_UPPER_LIMIT = MEM_MAP_TEXT_LOWER_LIMIT + `INST_MEM_DEPTH;
parameter MEM_MAP_TEXT_LOWER_LIMIT = TEXT_LOWER;
parameter MEM_MAP_MMIO_UPPER_LIMIT = MMIO_LOWER + `MMIO_MEM_SIZE;
parameter MEM_MAP_MMIO_LOWER_LIMIT = MMIO_LOWER;



logic [DATA_32_W - 1:0] data_rd_addr;
logic [DATA_32_W - 1:0] data_wr_addr;
logic data_wr_en;
logic data_rd_en;



// Detect which part of the virtual memory is targeted
assign data_stack_wr_addr = (mem_bus_wr_addr =< MEM_MAP_STACK_UPPER_LIMIT) | (mem_bus_wr_addr >= MEM_MAP_STACK_LOWER_LIMIT); // address in stack
assign data_mem_wr_addr = (mem_bus_wr_addr =< MEM_MAP_DATA_UPPER_LIMIT) | (mem_bus_wr_addr >= MEM_MAP_DATA_LOWER_LIMIT); // address in stack
assign data_mmio_wr_addr = (mem_bus_wr_addr =< MEM_MAP_MMIO_UPPER_LIMIT) | (mem_bus_wr_addr >= MEM_MAP_MMIO_LOWER_LIMIT); // address in stack
assign data_text_wr_addr = (mem_bus_wr_addr =< MEM_MAP_TEXT_UPPER_LIMIT) | (mem_bus_wr_addr >= MEM_MAP_TEXT_LOWER_LIMIT); // address in stack)




endmodule
