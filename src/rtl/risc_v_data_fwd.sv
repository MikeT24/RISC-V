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
    input logic [DATA_32_W - 1:0] alu_result_w,
    input logic [DATA_32_W - 1:0] data_mem_rd_data_m,
    input logic [DATA_32_W - 1:0] data_mem_rd_data_w,
    input t_instr_opcode intr_opcode_d,
    input t_instr_opcode intr_opcode_e,
    input t_instr_opcode intr_opcode_m,
    input t_instr_opcode intr_opcode_w,
    input logic reg_write_e,
    input logic reg_write_m,
    input logic reg_write_w,
    input logic reg_write_hzd_free_m,
    input logic reg_write_hzd_free_w,
    input logic reg_write_hzd_free_w_plus1
);


// NO STALL WILL BE ADDED IN CASES OF LOAD2USE. 
// THIS FWD UNIT SHOULD DEAL WITH THE LOAD2USE CASE. 

//DEBUG
logic [2:0] alu_src_a_fwd; // {fwd_m, fwd_w}
logic [2:0] alu_src_b_fwd; 


t_instr_register rsd_w_plus1;   // Time while it stores in register
t_instr_opcode intr_opcode_w_plus1;
logic [DATA_32_W - 1:0] alu_result_w_plus1;
logic [DATA_32_W - 1:0] data_mem_rd_data_w_plus1;

logic reg_write_w_plus1;

`MIKE_FF(rsd_w_plus1, rsd_w, clk);
`MIKE_FF(reg_file_2_alu_2_m, reg_file_2_alu_2_e, clk);
`MIKE_FF(intr_opcode_w_plus1, intr_opcode_w, clk);

`MIKE_FF_NRST(data_mem_rd_data_w_plus1, data_mem_rd_data_w, clk, rst);
`MIKE_FF_NRST(alu_result_w_plus1, alu_result_w, clk, rst);
`MIKE_FF_NRST(reg_write_w_plus1, reg_write_w, clk, rst);




always_comb begin 
    if ((rs1_e == rsd_m) & (reg_write_hzd_free_m) & (rs1_e != ZERO)) begin 
        alu_src_a_fwd = 3'h4; 
        if ((intr_opcode_m != I_LOAD_TYPE)) begin 
            reg_file_2_alu_1_e = alu_result_m; // fwd from WB
        end
        else begin 
            reg_file_2_alu_1_e = data_mem_rd_data_m; // fwd from WB
        end
    end
    else if ((rs1_e == rsd_w) & (reg_write_hzd_free_w) & (rs1_e != ZERO)) begin 
        alu_src_a_fwd = 3'h2; 
        if ((intr_opcode_w != I_LOAD_TYPE)) begin 
            reg_file_2_alu_1_e = alu_result_w; // fwd from WB
        end
        else begin 
            reg_file_2_alu_1_e = data_mem_rd_data_w; // fwd from WB
        end
    end
    else if ((rs1_e == rsd_w_plus1) & (reg_write_hzd_free_w_plus1) & (rs1_e != ZERO)) begin 
        alu_src_a_fwd = 3'h1; 
        if ((intr_opcode_w_plus1 != I_LOAD_TYPE)) begin 
            reg_file_2_alu_1_e = alu_result_w_plus1; // fwd from WB
        end
        else begin 
            reg_file_2_alu_1_e = data_mem_rd_data_w_plus1; // fwd from WB
        end
    end    
    else begin
        alu_src_a_fwd = 3'h0; // no fwd
        reg_file_2_alu_1_e = reg_file_rd_data_1_e;
    end
end

always_comb begin 
    if ((rs2_e == rsd_m) & (reg_write_hzd_free_m) & (rs2_e != ZERO)) begin 
        alu_src_b_fwd = 3'h4; 
        if ((intr_opcode_m != I_LOAD_TYPE)) begin 
            reg_file_2_alu_2_e = alu_result_m; // fwd from WB
        end
        else begin 
            reg_file_2_alu_2_e = data_mem_rd_data_m; // fwd from WB
        end
    end
    else if ((rs2_e == rsd_w) & (reg_write_hzd_free_w) & (rs2_e != ZERO)) begin 
        alu_src_b_fwd = 3'h2; 
        if ((intr_opcode_w != I_LOAD_TYPE)) begin 
            reg_file_2_alu_2_e = alu_result_w; // fwd from WB
        end
        else begin 
            reg_file_2_alu_2_e = data_mem_rd_data_w; // fwd from WB
        end
    end 
    else if ((rs2_e == rsd_w_plus1) & (reg_write_hzd_free_w_plus1) & (rs2_e != ZERO)) begin 
        alu_src_b_fwd = 3'h1; 
        if ((intr_opcode_w_plus1 != I_LOAD_TYPE)) begin 
            reg_file_2_alu_2_e = alu_result_w_plus1; // fwd from WB
        end
        else begin 
            reg_file_2_alu_2_e = data_mem_rd_data_w_plus1; // fwd from WB
        end
    end   
    else begin
        alu_src_b_fwd = 3'h0;
        reg_file_2_alu_2_e = reg_file_rd_data_2_e; // no fwd

    end
end


endmodule