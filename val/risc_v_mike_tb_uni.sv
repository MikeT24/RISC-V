import risc_v_mike_pkg::*;

`include "../src/rtl/risc_v_mike_header.svh"

module risc_v_mike_tb_uni ();


logic clk;
logic rst;

`ifdef GPIO_ENABLED
    logic [GPIO_BYTE - 1:0] gpio_port_in;
    logic [GPIO_BYTE - 1:0] gpio_port_out;
    logic rx;
`endif  

integer depth;
logic [10:0][7:0] test;


risc_v_mike_top dut (
    .clk_in(clk), 
    .rst(~rst)  //negated rst
    );

  initial begin
    init_inputs();
    reset_sequence();
  end

  task init_inputs;
    test = "init";
    rst = 0;
    clk = 0;
  endtask

  task reset_sequence;
    test = "reset";
    @(posedge clk);
    rst = 1;
    #40;
    @(posedge clk);
    rst = 0;
  endtask

  initial begin 
    forever #5 clk = ~clk;
  end

`ifdef GPIO_ENABLED
  task send_uart();
    #20;
    rx = 0;
    #630
    rx = 1;
    #935
    rx = 0;
    #3500;
    rx = 1;
  endtask
`endif

endmodule
