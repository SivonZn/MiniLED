//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.10.02 
//Created Time: 2024-11-08 17:26:24
create_clock -name rx_sclk -period 14.245 -waveform {0 5.988} [get_nets {rx_sclk}] -add
create_clock -name eclko -period 4.07 -waveform {0 1.711} [get_nets {LVDS_7to1_RX_Top_inst/lvds_71_rx/eclko}] -add
create_clock -name I_clkin_p -period 14.245 -waveform {0 5.988} [get_ports {I_clkin_p}] -add
create_clock -name scl -period 10000 -waveform {0 5000} [get_ports {scl}] -add
create_clock -name i2c_clk -period 2500 -waveform {0 1250} [get_regs {AP3216_driver_inst/i2c_top_inst/clk_s1}] -add
create_clock -name I_clk -period 20 -waveform {0 10} [get_ports {I_clk}] -add
set_clock_groups -exclusive -group [get_clocks {I_clkin_p}] -group [get_clocks {rx_sclk}] -group [get_clocks {eclko}]
