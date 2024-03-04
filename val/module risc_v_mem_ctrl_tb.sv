import risc_v_mike_pkg::*;
//ENDIF
`include "risc_v_mike_header.svh"

module risc_v_mem_ctrl_tb();

    logic [DATA_32_W - 1:0] mem_bus_rd_addr,
    logic [DATA_32_W - 1:0] mem_bus_wr_addr,
    logic mem_bus_write,
    logic mem_bus_read,

    logic [DATA_32_W - 1:0] mem_bus_wr_data,
    logic [DATA_32_W - 1:0] mem_bus_rd_data

 
    risc_v_mem_ctrl dut(*.);

    initial begin 
        assign mem_bus_write = 1'b0;
        assign mem_bus_wr_addr = 32'h00400000;
        #5
        assign mem_bus_wr_addr = 32'h00400004;
        #5
        assign mem_bus_wr_addr = 32'h0;
        #5
        assign mem_bus_wr_addr = 32'h100;
        #5
        assign mem_bus_wr_addr = 32'h10010000;
        #5
        assign mem_bus_wr_addr = 32'h10f10000;
        #5
        assign mem_bus_wr_addr = 32'h00400004;
        #5
        assign mem_bus_wr_addr = 32'h7fffeffc;
        #5
        assign mem_bus_wr_addr = 32'h7fffe000;
        #5
        assign mem_bus_wr_addr = 32'hffff0000;
        #5
        assign mem_bus_wr_addr = 32'hffff0010;

    end



endmodule

