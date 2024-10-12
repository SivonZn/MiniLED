//Copyright (C)2014-2021 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.7.06 Beta
//Created Time: 2021-07-05 16:08:48
create_clock -name eclko -period 3.422 -waveform {0 1.711} [get_nets {LVDS_7to1_RX_Top_inst/lvds_71_rx/eclko}] -add
create_clock -name I_clk -period 20 -waveform {0 10} [get_ports {I_clk}] -add
create_clock -name I_clkin_p -period 11.976 -waveform {0 5.988} [get_ports {I_clkin_p}] -add
create_clock -name rx_sclk -period 11.976 -waveform {0 5.988} [get_nets {rx_sclk}] -add
set_clock_groups -exclusive -group [get_clocks {I_clkin_p}] -group [get_clocks {rx_sclk}] -group [get_clocks {eclko}]
