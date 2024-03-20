onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /risc_v_mike_tb_uni/clk
add wave -noupdate /risc_v_mike_tb_uni/rst
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/curr_state
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/nxt_state
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_ctrl/rst
add wave -noupdate /risc_v_mike_tb_uni/dut/i_risc_v_mike_reg_file/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 348
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
WaveRestoreZoom {0 ps} {50 ps}
