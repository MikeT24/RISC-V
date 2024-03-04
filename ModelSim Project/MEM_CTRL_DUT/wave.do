onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/DATA_MAPPING_STACK_DIV
add wave -noupdate /risc_v_mem_ctrl_tb/dut/data_rd_addr
add wave -noupdate /risc_v_mem_ctrl_tb/dut/data_rd_en
add wave -noupdate /risc_v_mem_ctrl_tb/dut/data_wr_addr
add wave -noupdate /risc_v_mem_ctrl_tb/dut/data_wr_en
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_rd_addr
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_rd_data
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_read
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_wr_data
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_write
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_DATA_LOWER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_DATA_UPPER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_MMIO_LOWER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_MMIO_UPPER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_STACK_LOWER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_STACK_UPPER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_TEXT_LOWER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/MEM_MAP_TEXT_UPPER_LIMIT
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_mem_wr_addr
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_mem_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_mmio_wr_addr
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_mmio_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_text_wr_addr
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_text_wr_addr_val
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_wr_addr_error
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_stack_wr_addr
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_stack_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/mem_bus_wr_addr
add wave -noupdate /risc_v_mem_ctrl_tb/test
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1040 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 488
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
WaveRestoreZoom {1020 ps} {1077 ps}
