import risc_v_mike_pkg::*;

`include "../src/rtl/risc_v_mike_header.svh"

module risc_v_mike_tb_uni ();


logic clk;
logic rst;
`ifdef GPIO_ENABLED
    logic [GPIO_BYTE - 1:0] gpio_port_in;
    logic [GPIO_BYTE - 1:0] gpio_port_out;
`endif  


risc_v_mike_top dut (
    `ifdef GPIO_ENABLED
        .gpio_port_in(gpio_port_in),
        .gpio_port_out(gpio_port_out),
    `endif  
    .clk(clk), 
    .rst(rst));
 integer depth;

  initial begin
    gpio_port_in = 0;
    clk = 0;
    rst = 0;
    #20
    rst = 1;
  end

  
  initial begin 
    forever #5 clk = ~clk;
  end

endmodule