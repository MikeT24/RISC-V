create_clock -name clk -period 20 [get_ports {clk_in}]
derive_pll_clocks