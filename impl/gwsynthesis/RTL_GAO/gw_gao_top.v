module gw_gao(
    \AP3216_driver_inst/state[1] ,
    \AP3216_driver_inst/state[0] ,
    \AP3216_driver_inst/next_state[1] ,
    \AP3216_driver_inst/next_state[0] ,
    \AP3216_driver_inst/i2c_top_inst/state[2] ,
    \AP3216_driver_inst/i2c_top_inst/state[1] ,
    \AP3216_driver_inst/i2c_top_inst/state[0] ,
    \AP3216_driver_inst/i2c_top_inst/next_state[2] ,
    \AP3216_driver_inst/i2c_top_inst/next_state[1] ,
    \AP3216_driver_inst/i2c_top_inst/next_state[0] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[11] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[10] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[9] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[8] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[7] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[6] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[5] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[4] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[3] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[2] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[1] ,
    \AP3216_driver_inst/i2c_top_inst/O_bright_data[0] ,
    I_rst_n,
    \AP3216_driver_inst/ms_clk ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \AP3216_driver_inst/state[1] ;
input \AP3216_driver_inst/state[0] ;
input \AP3216_driver_inst/next_state[1] ;
input \AP3216_driver_inst/next_state[0] ;
input \AP3216_driver_inst/i2c_top_inst/state[2] ;
input \AP3216_driver_inst/i2c_top_inst/state[1] ;
input \AP3216_driver_inst/i2c_top_inst/state[0] ;
input \AP3216_driver_inst/i2c_top_inst/next_state[2] ;
input \AP3216_driver_inst/i2c_top_inst/next_state[1] ;
input \AP3216_driver_inst/i2c_top_inst/next_state[0] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[11] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[10] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[9] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[8] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[7] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[6] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[5] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[4] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[3] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[2] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[1] ;
input \AP3216_driver_inst/i2c_top_inst/O_bright_data[0] ;
input I_rst_n;
input \AP3216_driver_inst/ms_clk ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \AP3216_driver_inst/state[1] ;
wire \AP3216_driver_inst/state[0] ;
wire \AP3216_driver_inst/next_state[1] ;
wire \AP3216_driver_inst/next_state[0] ;
wire \AP3216_driver_inst/i2c_top_inst/state[2] ;
wire \AP3216_driver_inst/i2c_top_inst/state[1] ;
wire \AP3216_driver_inst/i2c_top_inst/state[0] ;
wire \AP3216_driver_inst/i2c_top_inst/next_state[2] ;
wire \AP3216_driver_inst/i2c_top_inst/next_state[1] ;
wire \AP3216_driver_inst/i2c_top_inst/next_state[0] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[11] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[10] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[9] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[8] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[7] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[6] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[5] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[4] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[3] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[2] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[1] ;
wire \AP3216_driver_inst/i2c_top_inst/O_bright_data[0] ;
wire I_rst_n;
wire \AP3216_driver_inst/ms_clk ;
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
    .trig0_i(I_rst_n),
    .data_i({\AP3216_driver_inst/state[1] ,\AP3216_driver_inst/state[0] ,\AP3216_driver_inst/next_state[1] ,\AP3216_driver_inst/next_state[0] ,\AP3216_driver_inst/i2c_top_inst/state[2] ,\AP3216_driver_inst/i2c_top_inst/state[1] ,\AP3216_driver_inst/i2c_top_inst/state[0] ,\AP3216_driver_inst/i2c_top_inst/next_state[2] ,\AP3216_driver_inst/i2c_top_inst/next_state[1] ,\AP3216_driver_inst/i2c_top_inst/next_state[0] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[11] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[10] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[9] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[8] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[7] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[6] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[5] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[4] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[3] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[2] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[1] ,\AP3216_driver_inst/i2c_top_inst/O_bright_data[0] }),
    .clk_i(\AP3216_driver_inst/ms_clk )
);

endmodule
