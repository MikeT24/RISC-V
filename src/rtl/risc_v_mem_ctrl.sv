import risc_v_mike_pkg::*;
//ENDIF
`include "risc_v_mike_header.svh"



module risc_v_mem_ctrl (

    `ifdef MEM_BUS_INSTRUCTIONS
        output logic data_text_wr_addr_val,
        output logic [ADDRESS_32_W-1:0] data_text_wr_addr,
        output logic data_text_rd_addr_val,
        output logic [ADDRESS_32_W-1:0] data_text_rd_addr,
    `endif

    input sva_clk,
    input [DATA_32_W - 1:0] mem_bus_rd_addr,
    input [DATA_32_W - 1:0] mem_bus_wr_addr,
    input mem_bus_write,
    input mem_bus_read,
    output logic mem_bus_wr_addr_error,
    output logic mem_bus_rd_addr_error,
    output logic data_stack_wr_addr_val,
    output logic data_mem_wr_addr_val,
    output logic data_mmio_wr_addr_val,
    output logic [ADDRESS_32_W-1:0] data_stack_wr_addr,
    output logic [ADDRESS_32_W-1:0] data_mem_wr_addr,
    output logic [ADDRESS_32_W-1:0] data_mmio_wr_addr,
    output logic data_stack_rd_addr_val,
    output logic data_mem_rd_addr_val,
    output logic data_mmio_rd_addr_val,
    output logic [ADDRESS_32_W-1:0] data_stack_rd_addr,
    output logic [ADDRESS_32_W-1:0] data_mem_rd_addr,
    output logic [ADDRESS_32_W-1:0] data_mmio_rd_addr
);


// .text    --> 0x00400000
// .data    --> 0x10010000
// .stack   --> 0x7fffeffc
// .MMIO    --> 0xffff0000
// THIS PRACTICE DOES NOT COMPLY WITH OFFICIAL MMIO MAPPING



// WRITE ADDRESS DECODE
// Detect which part of the virtual memory is targeted
assign data_stack_wr_addr_val   = (mem_bus_write) & (mem_bus_wr_addr <= MEM_MAP_STACK_UPPER_LIMIT) & (mem_bus_wr_addr >= MEM_MAP_STACK_LOWER_LIMIT); // address in stack
assign data_mem_wr_addr_val     = (mem_bus_write) & (mem_bus_wr_addr <= MEM_MAP_DATA_UPPER_LIMIT) & (mem_bus_wr_addr >= MEM_MAP_DATA_LOWER_LIMIT); // address in stack
assign data_mmio_wr_addr_val    = (mem_bus_write) & (mem_bus_wr_addr <= MEM_MAP_MMIO_UPPER_LIMIT) & (mem_bus_wr_addr >= MEM_MAP_MMIO_LOWER_LIMIT); // address in stack

// Calculate the correct address
assign data_stack_wr_addr   = mem_bus_wr_addr - MEM_MAP_STACK_UPPER_LIMIT + DATA_MAPPING_STACK_DIV;
assign data_mem_wr_addr     = mem_bus_wr_addr - MEM_MAP_DATA_LOWER_LIMIT;
assign data_mmio_wr_addr    = mem_bus_wr_addr - MEM_MAP_MMIO_LOWER_LIMIT;

`ifdef MEM_BUS_INSTRUCTIONS
    assign data_text_wr_addr_val    = (mem_bus_write) & (mem_bus_wr_addr <= MEM_MAP_TEXT_UPPER_LIMIT) & (mem_bus_wr_addr >= MEM_MAP_TEXT_LOWER_LIMIT); // address in stack)
    assign data_text_wr_addr    = mem_bus_wr_addr - MEM_MAP_TEXT_LOWER_LIMIT;
`endif


// Fire error if an address does not map to any function
`ifdef MEM_BUS_INSTRUCTIONS
    assign mem_bus_wr_addr_error = (mem_bus_write) ? ~(data_stack_wr_addr_val | data_mem_wr_addr_val | data_mmio_wr_addr_val | data_text_wr_addr_val) : 1'b0;
`endif
`ifndef MEM_BUS_INSTRUCTIONS 
    assign mem_bus_wr_addr_error = (mem_bus_write) ? ~(data_stack_wr_addr_val | data_mem_wr_addr_val | data_mmio_wr_addr_val) : 1'b0;
`endif

// TODO: Check if making this a module is worth it 
// READ ADDRESS DECODE
// Detect which part of the virtual memory is targeted
assign data_stack_rd_addr_val   = (mem_bus_read) & (mem_bus_rd_addr <= MEM_MAP_STACK_UPPER_LIMIT) & (mem_bus_rd_addr >= MEM_MAP_STACK_LOWER_LIMIT); // address in stack
assign data_mem_rd_addr_val     = (mem_bus_read) & (mem_bus_rd_addr <= MEM_MAP_DATA_UPPER_LIMIT) & (mem_bus_rd_addr >= MEM_MAP_DATA_LOWER_LIMIT); // address in stack
assign data_mmio_rd_addr_val    = (mem_bus_read) & (mem_bus_rd_addr <= MEM_MAP_MMIO_UPPER_LIMIT) & (mem_bus_rd_addr >= MEM_MAP_MMIO_LOWER_LIMIT); // address in stack

// Calculate the correct address
assign data_stack_rd_addr   = mem_bus_rd_addr - MEM_MAP_STACK_UPPER_LIMIT + DATA_MAPPING_STACK_DIV;
assign data_mem_rd_addr     = mem_bus_rd_addr - MEM_MAP_DATA_LOWER_LIMIT;
assign data_mmio_rd_addr    = mem_bus_rd_addr - MEM_MAP_MMIO_LOWER_LIMIT;

`ifdef MEM_BUS_INSTRUCTIONS
    assign data_text_rd_addr_val    = (mem_bus_read) & (mem_bus_rd_addr <= MEM_MAP_TEXT_UPPER_LIMIT) & (mem_bus_rd_addr >= MEM_MAP_TEXT_LOWER_LIMIT); // address in stack)
    assign data_text_rd_addr    = mem_bus_rd_addr - MEM_MAP_TEXT_LOWER_LIMIT;
`endif 

// Fire error if an address does not map to any function
`ifdef MEM_BUS_INSTRUCTIONS
    assign mem_bus_rd_addr_error = (mem_bus_read) ? ~(data_stack_rd_addr_val | data_mem_rd_addr_val | data_mmio_rd_addr_val | data_text_rd_addr_val) : 1'b0;
`endif
`ifndef MEM_BUS_INSTRUCTIONS
    assign mem_bus_rd_addr_error = (mem_bus_read) ? ~(data_stack_rd_addr_val | data_mem_rd_addr_val | data_mmio_rd_addr_val) : 1'b0;
`endif

// MODELSIM not compatible with asserts
/*
ADDRESS_ERROR_RD: assert property ( @(negedge sva_clk) !mem_bus_rd_addr_error);
ADDRESS_ERROR_WR: assert property ( @(negedge sva_clk) !mem_bus_wr_addr_error);
*/


endmodule
