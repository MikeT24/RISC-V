
import risc_v_mike_pkg::*;
import UART_MIKE_pkg::*;

`include "uart/UART_MIKE_header.svh"				
`include "risc_v_mike_header.svh"


module risc_v_mike_clk_divider (
    input logic clk_in,
    input logic rst_in,
    output logic clk,
    output logic rst_out
);

logic [7:0] pre_clk_cnt;
logic [8:0] pre_clk_cnt_full;

logic rst_tmp;

always @(posedge clk_in) begin
    if (~rst_in) begin 
        pre_clk_cnt <= 1'b0;
    end
    else begin
        pre_clk_cnt <= pre_clk_cnt + 1'b1;
    end
end

assign pre_clk_cnt_full = {pre_clk_cnt, clk_in};
assign clk = pre_clk_cnt_full[CLK_DIV];


always @(posedge clk_in or negedge rst_in) begin
    if (~rst_in) begin 
        rst_out <= 1'b0;
        rst_tmp <= 1'b0;
    end
    else begin
        rst_tmp <= rst_in;
        rst_out <= rst_tmp;
    end
end

    //assign clk = clk_in;
    

endmodule
