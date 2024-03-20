onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/nxt_state
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/curr_state
add wave -noupdate -divider {MEM CTRL}
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/I_or_D
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_nxt
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_update
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_result_ff
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/mem_bus_address_input
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_stack_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_read
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_rd_addr_val
add wave -noupdate -radix decimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/direct_addressing
add wave -noupdate -divider ALU
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_ctrl
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/instruction_write
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_src
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_bus_rd_data
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/instruction_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/intr_nmen
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/alu_ctrl
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/opcode
add wave -noupdate /risc_v_mike_tb_uni/dut/rs1
add wave -noupdate /risc_v_mike_tb_uni/dut/rs2
add wave -noupdate /risc_v_mike_tb_uni/dut/rsd
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_a
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_b
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_src_a
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_src_b
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_result
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/alu_result_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_source
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_source
add wave -noupdate -radix decimal /risc_v_mike_tb_uni/dut/alu_result_select
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_write
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_signed
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_slt
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_zero
add wave -noupdate /risc_v_mike_tb_uni/dut/clk
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_1
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_1_ff
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_2
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_2_ff
add wave -noupdate -divider {MEMORY ACCESS}
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/mem_write_output
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_wr_addr_error
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_write
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mem_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mmio_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_stack_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_stack_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_write
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_write
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_bus_rd_data_ff
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_rd_data
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_memory_addr_sel_vec
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mmio_rd_data
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mmio_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_stack_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_stack_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_rd_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_rd_data
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_text_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/funct3
add wave -noupdate /risc_v_mike_tb_uni/dut/funct7
add wave -noupdate /risc_v_mike_tb_uni/dut/I_or_D
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_ext
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_src
add wave -noupdate /risc_v_mike_tb_uni/dut/instruction_write
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_bus_address_input
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_write
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_branch
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_plus4
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_src
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_update
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_write
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_1
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_1_ff
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_2
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/reg_file_rd_data_2_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_wr_data
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_write
add wave -noupdate /risc_v_mike_tb_uni/dut/result_src
add wave -noupdate /risc_v_mike_tb_uni/dut/rs1
add wave -noupdate /risc_v_mike_tb_uni/dut/rs2
add wave -noupdate /risc_v_mike_tb_uni/dut/rsd
add wave -noupdate /risc_v_mike_tb_uni/dut/rst
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_bus_rd_data
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/data_mem_bus_rd_data_ff
add wave -noupdate -divider INSTRUCTION_MEM
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_wr_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_wr_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_write
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_addr_1
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_addr_2
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_data_1
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_data_2
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_test
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_addr
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[8]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[7]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[6]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[5]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[4]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[3]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[2]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[1]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_ff[0]}
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/direct_addressing
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/error_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/rst
add wave -noupdate -radix hexadecimal -childformat {{{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[31]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[30]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[29]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[28]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[27]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[26]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[25]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[24]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[23]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[22]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[21]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[20]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[19]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[18]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[17]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[16]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[15]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[14]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[13]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[12]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[11]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[10]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[9]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[8]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[7]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[6]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[5]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[4]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[3]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[2]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[1]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[0]} -radix hexadecimal}} -expand -subitemconfig {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[31]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[30]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[29]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[28]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[27]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[26]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[25]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[24]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[23]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[22]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[21]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[20]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[19]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[18]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[17]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[16]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[15]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[14]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[13]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[12]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[11]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[10]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[9]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[8]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[7]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[6]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[5]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[4]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[3]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[2]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[1]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[0]} {-height 15 -radix hexadecimal}} /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file
add wave -noupdate -divider MEM
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_addr_allign
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_write
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[0]}
add wave -noupdate -radix hexadecimal {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[1]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[2]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[3]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[4]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[5]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[6]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[7]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[8]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[9]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[10]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[11]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[12]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[13]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[14]}
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff[15]}
add wave -noupdate -divider UART
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_flag_clr
add wave -noupdate /risc_v_mike_tb_uni/dut/rst
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/rst
add wave -noupdate -radix decimal /risc_v_mike_tb_uni/dut/i_UART_UNCORE/data_mmio_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_risc_v_mike_gpio_module/data_mmio_wr_addr_val
add wave -noupdate {/risc_v_mike_tb_uni/dut/i_UART_UNCORE/data_mmio_wr_data[0]}
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/data_mmio_wr_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/data_mmio_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/tx_flag
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/tx_flag_clr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/tx_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/tx_send
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/rx_flag_clr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/clk
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/data_mmio_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/parity_error
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/rx
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_start
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/rx_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/rx_flag
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/tx
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/tx_flag
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/tx_flag_clr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_counter/count
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_counter/count
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/clk
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/n_rst
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/parity_error
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/pre_tx
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_byte
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_clk_cnt_debug
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_clk_cnt_delete
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_clk_overflow
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_counter_done
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_counter_done_sticky
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_counter_done_sticky_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_counter_ov
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_data_cnt_delete
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_data_index
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_done
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_done_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_done_nxt
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_flag
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_flag_clr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_flag_clr_sync
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_flag_nxt
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_inprg
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_inprg_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_shift_en
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_shift_en_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_shift_val_debug
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/rx_start
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/shift_pulse_allign
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/shift_pulse_allign_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_byte
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_clk_cnt_debug
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_clk_overflow
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_data_cnt_delete
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_done
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_flag
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_flag_clr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_flg_internal
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_flg_internal_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_index
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_inprg
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_inprg_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_send
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_send_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_send_ff2
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/tx_send_sync
add wave -noupdate /risc_v_mike_tb_uni/dut/i_UART_UNCORE/i_top_UART_MIKE/uart_data_width
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6095 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 330
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
WaveRestoreZoom {6043 ps} {6134 ps}
