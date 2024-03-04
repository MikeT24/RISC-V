onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_write
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/mem_bus_wr_addr
add wave -noupdate /risc_v_mem_ctrl_tb/dut/mem_bus_wr_addr_error
add wave -noupdate /risc_v_mem_ctrl_tb/dut/data_stack_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_stack_wr_addr
add wave -noupdate /risc_v_mem_ctrl_tb/dut/data_mem_wr_addr_val
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut/data_mem_wr_addr
add wave -noupdate /risc_v_mem_ctrl_tb/dut_mem/data_mem_write
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut_mem/data_mem_wr_data
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut_mem/data_mem_ff
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut_mem/data_mem_addr_allign
add wave -noupdate -radix hexadecimal /risc_v_mem_ctrl_tb/dut_mem/data_mem_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {65 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 339
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
WaveRestoreZoom {48 ps} {90 ps}
