import risc_v_mike_pkg::*;
`include "risc_v_mike_header.svh"



module risc_v_data_fwd (
    input t_instr_register rs1_e,
    input t_instr_register rs2_e,
    input t_instr_register rsd_e,
    input t_instr_register rsd_m,
    input t_instr_register rsd_w,
    input logic [DATA_32_W - 1:0] reg_file_rd_data_1_e,
    input logic [DATA_32_W - 1:0] reg_file_rd_data_2_e,
    output logic [DATA_32_W - 1:0] reg_file_2_alu_1_e,
    output logic [DATA_32_W - 1:0] reg_file_2_alu_2_e,
    input logic [DATA_32_W - 1:0] alu_result_m,
    input logic [DATA_32_W - 1:0] alu_result_w
);

// {fwd_m, fwd_w}
always_comb begin 
    if (rs1_e == rsd_m) begin 
        reg_file_2_alu_1_e = alu_result_m; // fwd from MEM
    end
    else if (rs1_e == rsd_w) begin 
        reg_file_2_alu_1_e = alu_result_w; // fwd from WB

    end
    else begin
        reg_file_2_alu_1_e = reg_file_rd_data_1_e;
    end
end

always_comb begin 
    if (rs2_e == rsd_m) begin 
        reg_file_2_alu_2_e = alu_result_m;  // fwd from MEM
    end
    else if (rs2_e == rsd_w) begin 
        reg_file_2_alu_2_e = alu_result_w;  // fwd from WB
    end
    else begin
        reg_file_2_alu_2_e = reg_file_rd_data_2_e; // no fwd

    end
end


endmodule