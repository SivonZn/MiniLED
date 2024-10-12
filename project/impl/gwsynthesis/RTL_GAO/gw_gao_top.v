module gw_gao(
    \O_led[3] ,
    \O_led[2] ,
    \O_led[1] ,
    \O_led[0] ,
    rx_sclk,
    \LVDS_7to1_RX_Top_inst/O_data_r[7] ,
    \LVDS_7to1_RX_Top_inst/O_data_r[6] ,
    \LVDS_7to1_RX_Top_inst/O_data_r[5] ,
    \LVDS_7to1_RX_Top_inst/O_data_r[4] ,
    \LVDS_7to1_RX_Top_inst/O_data_r[3] ,
    \LVDS_7to1_RX_Top_inst/O_data_r[2] ,
    \LVDS_7to1_RX_Top_inst/O_data_r[1] ,
    \LVDS_7to1_RX_Top_inst/O_data_r[0] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[7] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[6] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[5] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[4] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[3] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[2] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[1] ,
    \LVDS_7to1_RX_Top_inst/O_data_g[0] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[7] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[6] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[5] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[4] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[3] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[2] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[1] ,
    \LVDS_7to1_RX_Top_inst/O_data_b[0] ,
    \LVDS_7to1_RX_Top_inst/O_de ,
    \LVDS_7to1_RX_Top_inst/O_hs ,
    \LVDS_7to1_RX_Top_inst/O_vs ,
    I_clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \O_led[3] ;
input \O_led[2] ;
input \O_led[1] ;
input \O_led[0] ;
input rx_sclk;
input \LVDS_7to1_RX_Top_inst/O_data_r[7] ;
input \LVDS_7to1_RX_Top_inst/O_data_r[6] ;
input \LVDS_7to1_RX_Top_inst/O_data_r[5] ;
input \LVDS_7to1_RX_Top_inst/O_data_r[4] ;
input \LVDS_7to1_RX_Top_inst/O_data_r[3] ;
input \LVDS_7to1_RX_Top_inst/O_data_r[2] ;
input \LVDS_7to1_RX_Top_inst/O_data_r[1] ;
input \LVDS_7to1_RX_Top_inst/O_data_r[0] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[7] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[6] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[5] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[4] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[3] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[2] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[1] ;
input \LVDS_7to1_RX_Top_inst/O_data_g[0] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[7] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[6] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[5] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[4] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[3] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[2] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[1] ;
input \LVDS_7to1_RX_Top_inst/O_data_b[0] ;
input \LVDS_7to1_RX_Top_inst/O_de ;
input \LVDS_7to1_RX_Top_inst/O_hs ;
input \LVDS_7to1_RX_Top_inst/O_vs ;
input I_clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \O_led[3] ;
wire \O_led[2] ;
wire \O_led[1] ;
wire \O_led[0] ;
wire rx_sclk;
wire \LVDS_7to1_RX_Top_inst/O_data_r[7] ;
wire \LVDS_7to1_RX_Top_inst/O_data_r[6] ;
wire \LVDS_7to1_RX_Top_inst/O_data_r[5] ;
wire \LVDS_7to1_RX_Top_inst/O_data_r[4] ;
wire \LVDS_7to1_RX_Top_inst/O_data_r[3] ;
wire \LVDS_7to1_RX_Top_inst/O_data_r[2] ;
wire \LVDS_7to1_RX_Top_inst/O_data_r[1] ;
wire \LVDS_7to1_RX_Top_inst/O_data_r[0] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[7] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[6] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[5] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[4] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[3] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[2] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[1] ;
wire \LVDS_7to1_RX_Top_inst/O_data_g[0] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[7] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[6] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[5] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[4] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[3] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[2] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[1] ;
wire \LVDS_7to1_RX_Top_inst/O_data_b[0] ;
wire \LVDS_7to1_RX_Top_inst/O_de ;
wire \LVDS_7to1_RX_Top_inst/O_hs ;
wire \LVDS_7to1_RX_Top_inst/O_vs ;
wire I_clk;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i(rx_sclk),
    .data_i({\O_led[3] ,\O_led[2] ,\O_led[1] ,\O_led[0] ,rx_sclk,\LVDS_7to1_RX_Top_inst/O_data_r[7] ,\LVDS_7to1_RX_Top_inst/O_data_r[6] ,\LVDS_7to1_RX_Top_inst/O_data_r[5] ,\LVDS_7to1_RX_Top_inst/O_data_r[4] ,\LVDS_7to1_RX_Top_inst/O_data_r[3] ,\LVDS_7to1_RX_Top_inst/O_data_r[2] ,\LVDS_7to1_RX_Top_inst/O_data_r[1] ,\LVDS_7to1_RX_Top_inst/O_data_r[0] ,\LVDS_7to1_RX_Top_inst/O_data_g[7] ,\LVDS_7to1_RX_Top_inst/O_data_g[6] ,\LVDS_7to1_RX_Top_inst/O_data_g[5] ,\LVDS_7to1_RX_Top_inst/O_data_g[4] ,\LVDS_7to1_RX_Top_inst/O_data_g[3] ,\LVDS_7to1_RX_Top_inst/O_data_g[2] ,\LVDS_7to1_RX_Top_inst/O_data_g[1] ,\LVDS_7to1_RX_Top_inst/O_data_g[0] ,\LVDS_7to1_RX_Top_inst/O_data_b[7] ,\LVDS_7to1_RX_Top_inst/O_data_b[6] ,\LVDS_7to1_RX_Top_inst/O_data_b[5] ,\LVDS_7to1_RX_Top_inst/O_data_b[4] ,\LVDS_7to1_RX_Top_inst/O_data_b[3] ,\LVDS_7to1_RX_Top_inst/O_data_b[2] ,\LVDS_7to1_RX_Top_inst/O_data_b[1] ,\LVDS_7to1_RX_Top_inst/O_data_b[0] ,\LVDS_7to1_RX_Top_inst/O_de ,\LVDS_7to1_RX_Top_inst/O_hs ,\LVDS_7to1_RX_Top_inst/O_vs }),
    .clk_i(I_clk)
);

endmodule
