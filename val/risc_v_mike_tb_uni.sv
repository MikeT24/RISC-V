import risc_v_mike_pkg::*;

`include "../src/rtl/risc_v_mike_header.svh"

module risc_v_mike_tb_uni ();


logic clk;
logic rst;
logic rx;
`ifdef GPIO_ENABLED
    logic [GPIO_BYTE - 1:0] gpio_port_in;
    logic [GPIO_BYTE - 1:0] gpio_port_out;
`endif  


risc_v_mike_top dut (
    // `ifdef GPIO_ENABLED
    //     .gpio_port_in(gpio_port_in),
    //     .gpio_port_out(gpio_port_out),
    // `endif  
    .clk(clk), 
    .rst(rst),
    .rx(rx)
    );
 integer depth;

  initial begin

    clk = 0;
    rst = 0;
    rx = 1;
    #20
    rst = 1;
    #20;
    rx = 0;
    #630
    rx = 1;
    #935
    rx = 0;
    #3500;
    rx = 1;
    
  end

  
  initial begin 
    forever #5 clk = ~clk;
  end

endmodule