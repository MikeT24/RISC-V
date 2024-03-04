import risc_v_mike_pkg::*;

`include "../src/rtl/risc_v_mike_header.svh"


module risc_v_mem_ctrl_tb();

    logic [DATA_32_W - 1:0] mem_bus_rd_addr;
    logic [DATA_32_W - 1:0] mem_bus_wr_addr;
    logic mem_bus_write;
    logic mem_bus_read;
    logic [DATA_32_W - 1:0] mem_bus_wr_data;
    logic [DATA_32_W - 1:0] mem_bus_rd_data;
    logic sva_clk;
    logic rst;
    logic mem_bus_rd_addr_error;
    logic mem_bus_wr_addr_error;


    logic [DATA_32_W - 1:0] data_rd_addr;
    logic [DATA_32_W - 1:0] data_wr_addr;
    logic data_stack_wr_addr_val;
    logic data_mem_wr_addr_val;
    logic data_mmio_wr_addr_val;
    logic [ADDRESS_32_W-1:0] data_stack_wr_addr;
    logic [ADDRESS_32_W-1:0] data_mem_wr_addr;
    logic [ADDRESS_32_W-1:0] data_mmio_wr_addr;

    logic data_stack_rd_addr_val;
    logic data_mem_rd_addr_val;
    logic data_mmio_rd_addr_val;
    logic [ADDRESS_32_W-1:0] data_stack_rd_addr;
    logic [ADDRESS_32_W-1:0] data_mem_rd_addr;
    logic [ADDRESS_32_W-1:0] data_mmio_rd_addr;
    
    `ifdef MEM_BUS_INSTRUCTIONS
        logic data_text_wr_addr_val;
        logic [ADDRESS_32_W-1:0] data_text_wr_addr;
        logic data_text_rd_addr_val;
        logic [ADDRESS_32_W-1:0] data_text_rd_addr;    
    `endif
    
// .text    --> 0x00400000
// .data    --> 0x10010000
// .stack   --> 0x7fffeffc
// .MMIO    --> 0xffff0000
 
    integer test;

    risc_v_mem_ctrl dut(.*);

    logic data_mem_write;
    logic [ADDRESS_32_W-1:0] data_mem_addr;
    logic data_mem_bus_collision;

    assign data_mem_write = data_stack_wr_addr_val | data_mem_wr_addr_val;
    assign data_mem_addr = data_mem_wr_addr_val ? (data_mem_wr_addr) : (data_stack_wr_addr_val ? data_stack_wr_addr : 32'h0);
    assign data_mem_bus_collision = data_stack_wr_addr_val & data_mem_wr_addr_val;

    risc_v_mike_data_memory dut_mem(
        .clk(sva_clk),
        .rst(rst),
        .data_mem_addr(data_mem_wr_addr),
        .data_mem_write(data_mem_write),
        .data_mem_wr_data(32'hff),
        .data_mem_rd_data()
    );

    // input logic .clk,
    // input logic .rst,
    // input [DATA .data_mem_addr,     // rs1,
    // input logic .data_mem_write,              // mem_write
    // input logic .data_mem_wr_data,
    //             .data_mem_rd_data

    assign mem_bus_read = mem_bus_write;
    assign mem_bus_rd_addr = mem_bus_wr_addr;

    initial begin 
        sva_clk = 0; 
        rst = 1;
        #10;
        rst = 0;
        mem_bus_write = 1'b1;
        #5
        mem_bus_wr_addr = 32'h0;
        #5
        mem_bus_wr_addr = 32'h100;
        #5
        mem_bus_wr_addr = 32'h00400000;
        #5
        mem_bus_wr_addr = 32'h00400004;
        #5
        mem_bus_wr_addr = 32'h004000ff;
        #5
        mem_bus_wr_addr = 32'h10010000;
        #5
        mem_bus_wr_addr = 32'h10010004;
        #5
        mem_bus_wr_addr = 32'h100100ff;
        #5        
        mem_bus_wr_addr = 32'h10f10000;
        #5
        mem_bus_wr_addr = 32'h00400004;
        #5
        mem_bus_wr_addr = 32'h7fffeffc;
        #5
        mem_bus_wr_addr = 32'h7fffeff8;
        #5
        mem_bus_wr_addr = 32'h7fffef98;
        #5
        mem_bus_wr_addr = 32'h7fffeffc;
        #5
        mem_bus_wr_addr = 32'hffff0000;
        #5
        mem_bus_wr_addr = 32'hffff0010;

        for (int i = 0; i<`DATA_MEM_DEPTH; i=i+4) begin 
            mem_bus_wr_addr = i + DATA_LOWER;
            #5;
        end

        for (int i = 0 ; i<`DATA_MEM_DEPTH; i=i+4) begin 
            mem_bus_wr_addr = STACK_UPPER - i;
            test = i;
            #5;
        end

    end

    initial begin 
        forever #5 sva_clk = ~sva_clk;
      end

endmodule

