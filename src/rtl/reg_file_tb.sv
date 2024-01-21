import risc_v_mike_pkg::*;

`include "risc_v_mike_header.svh"

module reg_file_tb (

);


logic clk;
logic rst;
t_register_addr rs1;    // rs1;
t_register_addr rs2;    // rs2;
t_register_addr rsd;      // rsd;
logic reg_write;                  //reg_write;
logic [DATA_32_W - 1:0] reg_file_wr_data;
 logic [DATA_32_W - 1:0] alu_src_a;
 logic [DATA_32_W - 1:0] reg_file_rd_data_2;



risc_v_mike_reg_file i_risc_v_mike_reg_file(
    .clk(clk),
    .rst(rst),
    .reg_file_rd_addr_1(rs1),    // rs1,
    .reg_file_rd_addr_2(rs2),    // rs2,
    .reg_file_wr_addr(rsd),      // rsd,
    .reg_file_write(reg_write),                  //reg_write,
    .reg_file_wr_data(reg_file_wr_data),
    .reg_file_rd_data_1(alu_src_a),
    .reg_file_rd_data_2(reg_file_rd_data_2)
);

  initial begin
    clk = 0;
    rst = 1;
    reg_write = 0;
    rs1 = 0;
    rs2 = 0;
    #15;
    rst=0;

    for (int i = 0; i<16; i=i+1) begin 
            reg_write = 1;
            reg_file_wr_data = i;
            rsd = i[5:0];
            #10;
    end 
#10;
reg_write = 0;

    for (int i = 0; i<16; i=i+1) begin 
            rs1 = i;
            rs2 = 15-i;
            #10;

    end

  end




  initial begin 
    forever #5 clk = ~clk;
  end


endmodule
  


