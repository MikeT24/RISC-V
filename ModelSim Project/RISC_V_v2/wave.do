onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/rsd
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/rs2
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/rs1
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/result_src
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/reg_write
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/pc_src
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/opcode
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/mem_write
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/intr_nmen
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/instruction
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/imm_src
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/funct7
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/funct3
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/alu_zero
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/alu_slt
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/alu_signed
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/alu_ctrl
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr
add wave -noupdate -divider MEM_CTRL
add wave -noupdate -radix hexadecimal /risc_v_mike_pkg::MEM_MAP_DATA_LOWER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mike_pkg::MEM_MAP_DATA_UPPER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mike_pkg::MEM_MAP_MMIO_LOWER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mike_pkg::MEM_MAP_MMIO_UPPER_LIMIT
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/sva_clk
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_rd_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_write
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_read
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_wr_addr_error
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/mem_bus_rd_addr_error
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_stack_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_stack_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mem_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mem_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mmio_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mmio_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_stack_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mem_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mmio_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_stack_rd_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mem_rd_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mem_ctrl/data_mmio_rd_addr
add wave -noupdate -divider ALU_OPS
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_alu/alu_src_a
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_alu/alu_src_b
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_alu/alu_ctrl
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_alu/alu_signed
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_alu/alu_result
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_alu/alu_zero
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_alu/alu_slt
add wave -noupdate -divider REG_FILE
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/clk
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/rst
add wave -noupdate -radix unsigned /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_addr_1
add wave -noupdate -radix unsigned /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_addr_2
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_write
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_wr_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_data_1
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_rd_data_2
add wave -noupdate -radix hexadecimal -childformat {{{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[31]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[30]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[29]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[28]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[27]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[26]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[25]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[24]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[23]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[22]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[21]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[20]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[19]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[18]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[17]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[16]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[15]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[14]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[13]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[12]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[11]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[10]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[9]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[8]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[7]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[6]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[5]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[4]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[3]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[2]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[1]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[0]} -radix hexadecimal}} -subitemconfig {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[31]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[30]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[29]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[28]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[27]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[26]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[25]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[24]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[23]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[22]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[21]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[20]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[19]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[18]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[17]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[16]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[15]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[14]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[13]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[12]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[11]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[10]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[9]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[8]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[7]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[6]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[5]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[4]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[3]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[2]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[1]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file[0]} {-height 15 -radix hexadecimal}} /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file
add wave -noupdate -radix hexadecimal -childformat {{{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[31]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[30]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[29]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[28]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[27]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[26]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[25]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[24]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[23]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[22]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[21]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[20]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[19]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[18]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[17]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[16]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[15]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[14]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[13]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[12]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[11]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[10]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[9]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[8]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[7]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[6]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[5]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[4]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[3]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[2]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[1]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[0]} -radix hexadecimal}} -subitemconfig {{/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[31]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[30]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[29]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[28]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[27]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[26]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[25]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[24]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[23]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[22]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[21]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[20]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[19]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[18]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[17]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[16]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[15]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[14]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[13]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[12]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[11]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[10]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[9]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[8]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[7]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[6]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[5]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[4]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[3]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[2]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[1]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff[0]} {-height 15 -radix hexadecimal}} /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/reg_file_ff
add wave -noupdate -divider MEM
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/clk
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/rst
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_write
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_wr_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_data_memory/data_mem_addr_allign
add wave -noupdate -divider PC_SOURCE
add wave -noupdate -radix hexadecimal -childformat {{{/risc_v_mike_tb_uni/dut/pc_addr[31]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[30]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[29]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[28]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[27]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[26]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[25]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[24]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[23]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[22]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[21]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[20]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[19]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[18]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[17]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[16]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[15]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[14]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[13]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[12]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[11]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[10]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[9]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[8]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[7]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[6]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[5]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[4]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[3]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[2]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[1]} -radix hexadecimal} {{/risc_v_mike_tb_uni/dut/pc_addr[0]} -radix hexadecimal}} -subitemconfig {{/risc_v_mike_tb_uni/dut/pc_addr[31]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[30]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[29]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[28]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[27]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[26]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[25]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[24]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[23]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[22]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[21]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[20]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[19]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[18]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[17]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[16]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[15]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[14]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[13]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[12]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[11]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[10]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[9]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[8]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[7]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[6]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[5]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[4]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[3]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[2]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[1]} {-height 15 -radix hexadecimal} {/risc_v_mike_tb_uni/dut/pc_addr[0]} {-height 15 -radix hexadecimal}} /risc_v_mike_tb_uni/dut/pc_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_nxt
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_branch
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_plus4
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_src
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_text_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_instruction_memory/data_mem_addr
add wave -noupdate -divider DUT
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_ctrl
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_result
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_signed
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_slt
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_a
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_b
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_a
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_src_sel_b
add wave -noupdate /risc_v_mike_tb_uni/dut/alu_zero
add wave -noupdate /risc_v_mike_tb_uni/dut/clk
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_bus_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_read
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mem_write
add wave -noupdate /risc_v_mike_tb_uni/dut/data_memory_addr_sel_vec
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_mmio_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_stack_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_stack_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_stack_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_rd_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_wr_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/data_text_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/funct3
add wave -noupdate /risc_v_mike_tb_uni/dut/funct7
add wave -noupdate /risc_v_mike_tb_uni/dut/gpio_port_in
add wave -noupdate /risc_v_mike_tb_uni/dut/gpio_port_out
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_ext
add wave -noupdate /risc_v_mike_tb_uni/dut/imm_src
add wave -noupdate /risc_v_mike_tb_uni/dut/instruction
add wave -noupdate /risc_v_mike_tb_uni/dut/intr_nmen
add wave -noupdate /risc_v_mike_tb_uni/dut/mem_write
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_addr_nxt
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_branch
add wave -noupdate -radix hexadecimal /risc_v_mike_tb_uni/dut/pc_plus4
add wave -noupdate /risc_v_mike_tb_uni/dut/pc_src
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_rd_data_1
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_rd_data_2
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_file_wr_data
add wave -noupdate /risc_v_mike_tb_uni/dut/reg_write
add wave -noupdate /risc_v_mike_tb_uni/dut/result_src
add wave -noupdate /risc_v_mike_tb_uni/dut/rs1
add wave -noupdate /risc_v_mike_tb_uni/dut/rs2
add wave -noupdate /risc_v_mike_tb_uni/dut/rsd
add wave -noupdate /risc_v_mike_tb_uni/dut/rst
add wave -noupdate /risc_v_mike_tb_uni/dut/rst_test
add wave -noupdate -divider GPIO
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/clk
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/data_mmio_addr
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/data_mmio_rd_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/data_mmio_wr_addr_val
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/data_mmio_wr_data
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/gpio_in1
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/gpio_out1
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/gpio_out1_ff
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/gpio_port_in
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/gpio_port_out
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_gpio_module/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {896 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 413
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
WaveRestoreZoom {883 ps} {1007 ps}
