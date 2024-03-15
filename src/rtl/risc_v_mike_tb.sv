import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module risc_v_mike_tb ();


logic clk;
logic rst;
logic rx;

risc_v_mike_top dut (.clk(clk), .rst(rst));
 integer depth;

  initial begin
    clk = 0;
    rst = 0;
    rx = 1;
  
      // for (depth = 0; depth < PC_CNT_ADDR_WIDTH; depth++) begin: g_instr_mem
      //       risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[depth] = 32'b0;
      // end
  
    #20


//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[2]  = 32'h00200093;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[3]  = 32'h00400113;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[4]  = 32'h00600193;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[5]  = 32'h00800213;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[6]  = 32'h00a00293;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[7]  = 32'h7ff00313;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[8]  = 32'h00602023;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[9]  = 32'h005020a3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[10] = 32'h00402123;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[11] = 32'h003021a3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[12] = 32'h00202223;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[13] = 32'h001022a3; 
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[14] = 32'h00102383;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[15] = 32'h00202403;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[16] = 32'h00302483;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[17] = 32'h002083b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[18] = 32'h402083b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[19] = 32'h401083b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[20] = 32'h0020c3b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[21] = 32'h0020e3b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[22] = 32'h0020f3b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[23] = 32'h001113b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[24] = 32'h001153b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[25] = 32'h401153b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[26] = 32'h0020a3b3;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[27] = 32'h00820463;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[25] = 32'h00821463;
//      risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[26] = 32'hff9ff06f;


        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[2]  = 32'h03c00093;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[3]  = 32'h04800113;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[4]  = 32'h06f00193;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[5]  = 32'h06c00213;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[6]  = 32'h06100293;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[7]  = 32'h00100313;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[8]  = 32'h0020a023;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[9]  = 32'h0060a0a3;

        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[11]  = 32'h00001463;
        // risc_v_mike_tb.dut.i_risc_v_mike_instruction_memory.data_mem_ff[12]  = 32'hffbff06f;





    #45
    rst = 1;


  end

  
  initial begin 
    forever #5 clk = ~clk;
  end

endmodule



  

