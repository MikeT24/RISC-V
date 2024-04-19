onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/instruction_d
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal_f
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal_d
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal_e
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal_m
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal_w
add wave -noupdate /risc_v_mike_tb_uni/dut/clk
add wave -noupdate /risc_v_mike_tb_uni/dut/clk_in
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_f
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_d
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_m
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_addr_w
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_branch_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_plus4_f
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_plus4_d
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_plus4_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_plus4_m
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_plus4_w
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_nxt_f
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_text_rd_addr_f
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_src_d
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_src_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_text_rd_addr_m
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal
add wave -noupdate -divider CTRL
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_d
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_ctrl_d
add wave -noupdate /risc_v_mike_tb_uni/dut/intr_nmen_d
add wave -noupdate /risc_v_mike_tb_uni/dut/rs1_d
add wave -noupdate /risc_v_mike_tb_uni/dut/rs2_d
add wave -noupdate /risc_v_mike_tb_uni/dut/rsd_d
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_signed_d
add wave -noupdate -divider Execute
add wave -noupdate /risc_v_mike_tb_uni/dut/intr_nmen_e
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_ctrl_e
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_a_e
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_b_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_src_a_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_src_b_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_result_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/rs1_e
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/rs2_e
add wave -noupdate /risc_v_mike_tb_uni/dut/rsd_e
add wave -noupdate -divider REGISTER
add wave -noupdate -radix hexadecimal -childformat {{{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[31]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[30]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[29]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[28]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[27]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[26]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[25]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[24]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[23]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[22]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[21]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[20]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[19]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[18]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[17]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[16]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[15]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[14]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[13]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[12]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[11]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[10]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[9]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[8]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[7]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[6]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[5]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[4]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[3]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[2]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[1]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[0]} -radix hexadecimal}} -subitemconfig {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[31]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[30]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[29]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[28]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[27]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[26]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[25]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[24]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[23]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[22]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[21]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[20]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[19]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[18]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[17]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[16]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[15]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[14]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[13]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[12]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[11]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[10]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[9]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[8]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[7]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[6]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[5]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[4]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[3]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[2]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[1]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[0]} {-height 15 -radix hexadecimal}} /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_addr_1
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_addr_2
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_data_1
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_data_2
add wave -noupdate -divider Mem
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/rs1_m
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/rs2_m
add wave -noupdate /risc_v_mike_tb_uni/dut/rsd_m
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_result_m
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/mem_bus_address_input_m
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mmio_wr_addr_m
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_wr_addr_val_m
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_stack_wr_addr_m
add wave -noupdate /risc_v_mike_tb_uni/dut/data_stack_wr_addr_val_m
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_wr_addr_m
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_wr_addr_val_m
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_write_m
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_read_m
add wave -noupdate -divider wb
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/rs1_w
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/rs2_w
add wave -noupdate /risc_v_mike_tb_uni/dut/rsd_w
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_result_w
add wave -noupdate /risc_v_mike_tb_uni/dut/result_src_w
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_wr_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_write
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_wr_data
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_wr_data_w
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_signed_e
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_signed_m
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_slt
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_slt_e
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_a_d
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_b_d
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_addr_m
add wave -noupdate /risc_v_mike_tb_uni/dut/funct3_d
add wave -noupdate /risc_v_mike_tb_uni/dut/funct3_e
add wave -noupdate /risc_v_mike_tb_uni/dut/funct3_m
add wave -noupdate /risc_v_mike_tb_uni/dut/funct7_d
add wave -noupdate /risc_v_mike_tb_uni/dut/funct7_e
add wave -noupdate /risc_v_mike_tb_uni/dut/funct7_m
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_ext_d
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_ext_e
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_src_d
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_src_e
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_src_m
add wave -noupdate /risc_v_mike_tb_uni/dut/instruction_d
add wave -noupdate /risc_v_mike_tb_uni/dut/instruction_f
add wave -noupdate /risc_v_mike_tb_uni/dut/intr_nmen_d
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_bus_address_input
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_write_d
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_write_e
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_write_m
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_write_w
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_src_m
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_rd_data_1_d
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_rd_data_1_e
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_rd_data_2_d
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_rd_data_2_e
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_rd_data_2_m
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_wr_data_w
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_write_d
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_write_e
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_write_m
add wave -noupdate /risc_v_mike_tb_uni/dut/result_src_d
add wave -noupdate /risc_v_mike_tb_uni/dut/result_src_e
add wave -noupdate /risc_v_mike_tb_uni/dut/result_src_m
add wave -noupdate /risc_v_mike_tb_uni/dut/result_src_w
add wave -noupdate /risc_v_mike_tb_uni/dut/rs1_d
add wave -noupdate /risc_v_mike_tb_uni/dut/rs2_d
add wave -noupdate /risc_v_mike_tb_uni/dut/rst
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_internal
add wave -noupdate /risc_v_mike_tb_uni/dut/rx
add wave -noupdate /risc_v_mike_tb_uni/dut/seg_a
add wave -noupdate /risc_v_mike_tb_uni/dut/seg_b
add wave -noupdate /risc_v_mike_tb_uni/dut/seg_c
add wave -noupdate /risc_v_mike_tb_uni/dut/seg_d
add wave -noupdate /risc_v_mike_tb_uni/dut/seg_e
add wave -noupdate /risc_v_mike_tb_uni/dut/seg_f
add wave -noupdate /risc_v_mike_tb_uni/dut/seg_g
add wave -noupdate /risc_v_mike_tb_uni/dut/tx
add wave -noupdate /risc_v_mike_tb_uni/dut/tx_seg_a
add wave -noupdate /risc_v_mike_tb_uni/dut/tx_seg_b
add wave -noupdate /risc_v_mike_tb_uni/dut/tx_seg_c
add wave -noupdate /risc_v_mike_tb_uni/dut/tx_seg_d
add wave -noupdate /risc_v_mike_tb_uni/dut/tx_seg_e
add wave -noupdate /risc_v_mike_tb_uni/dut/tx_seg_f
add wave -noupdate /risc_v_mike_tb_uni/dut/tx_seg_g
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 285
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {65 ps} {247 ps}
