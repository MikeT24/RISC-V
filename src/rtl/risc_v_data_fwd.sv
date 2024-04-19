import risc_v_mike_pkg::*;
`include "risc_v_mike_header.svh"



module risc_v_data_fwd (
    input logic clk,
    input logic rst,
    input t_instr_register rs1_e,
    input t_instr_register rs2_e,
    input t_instr_register rsd_e,
    input t_instr_register rsd_m,
    input t_instr_register rsd_w,
    input logic [DATA_32_W - 1:0] reg_file_rd_data_1_e,
    input logic [DATA_32_W - 1:0] reg_file_rd_data_2_e,
    output logic [DATA_32_W - 1:0] reg_file_2_alu_1_e,
    output logic [DATA_32_W - 1:0] reg_file_2_alu_2_e,
    output logic [DATA_32_W - 1:0] reg_file_2_alu_2_m,
    input logic [DATA_32_W - 1:0] alu_result_m,
    input logic [DATA_32_W - 1:0] alu_result_w
);


t_instr_register rsd_w_plus1;   // Time while it stores in register
logic [DATA_32_W - 1:0] alu_result_w_plus1;

`MIKE_FF(rsd_w_plus1, rsd_w, clk);

`MIKE_FF(reg_file_2_alu_2_m, reg_file_2_alu_2_e, clk);

`MIKE_FF_NRST(alu_result_w_plus1, alu_result_w, clk, rst) 


//DEBUG
logic [2:0] alu_src_a_fwd; // {fwd_m, fwd_w}
logic [2:0] alu_src_b_fwd; 

always_comb begin 
    if (rs1_e == rsd_m) begin 
        alu_src_a_fwd = 3'h4; 
        reg_file_2_alu_1_e = alu_result_m; // fwd from MEM
    end
    else if (rs1_e == rsd_w) begin 
        alu_src_a_fwd = 3'h2; 
        reg_file_2_alu_1_e = alu_result_w; // fwd from WB
    end
    else if (rs1_e == rsd_w_plus1) begin 
        alu_src_a_fwd = 3'h1; 
        reg_file_2_alu_1_e = alu_result_w_plus1; // fwd from WB
    end    
    else begin
        alu_src_a_fwd = 3'h0; // no fwd
        reg_file_2_alu_1_e = reg_file_rd_data_1_e;
    end
end

always_comb begin 
    if (rs2_e == rsd_m) begin 
        alu_src_b_fwd = 3'h4; 
        reg_file_2_alu_2_e = alu_result_m;  // fwd from MEM
    end
    else if (rs2_e == rsd_w) begin 
        alu_src_b_fwd = 3'h2; 
        reg_file_2_alu_2_e = alu_result_w;  // fwd from WB
    end
    else if (rs2_e == rsd_w_plus1) begin 
        alu_src_b_fwd = 3'h1; 
        reg_file_2_alu_2_e = alu_result_w_plus1; // fwd from WB
    end   
    else begin
        alu_src_b_fwd = 3'h0;
        reg_file_2_alu_2_e = reg_file_rd_data_2_e; // no fwd

    end
end


endmodule