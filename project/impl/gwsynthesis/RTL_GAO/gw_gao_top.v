module gw_gao(
    \MiniLED_driver_inst/u1/wtaddr_wire[9] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[8] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[7] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[6] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[5] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[4] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[3] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[2] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[1] ,
    \MiniLED_driver_inst/u1/wtaddr_wire[0] ,
    \MiniLED_driver_inst/u1/light_reg[1][7] ,
    \MiniLED_driver_inst/u1/light_reg[1][6] ,
    \MiniLED_driver_inst/u1/light_reg[1][5] ,
    \MiniLED_driver_inst/u1/light_reg[1][4] ,
    \MiniLED_driver_inst/u1/light_reg[1][3] ,
    \MiniLED_driver_inst/u1/light_reg[1][2] ,
    \MiniLED_driver_inst/u1/light_reg[1][1] ,
    \MiniLED_driver_inst/u1/light_reg[1][0] ,
    \MiniLED_driver_inst/u1/light_reg[0][7] ,
    \MiniLED_driver_inst/u1/light_reg[0][6] ,
    \MiniLED_driver_inst/u1/light_reg[0][5] ,
    \MiniLED_driver_inst/u1/light_reg[0][4] ,
    \MiniLED_driver_inst/u1/light_reg[0][3] ,
    \MiniLED_driver_inst/u1/light_reg[0][2] ,
    \MiniLED_driver_inst/u1/light_reg[0][1] ,
    \MiniLED_driver_inst/u1/light_reg[0][0] ,
    \MiniLED_driver_inst/u1/light_reg[5][7] ,
    \MiniLED_driver_inst/u1/light_reg[5][6] ,
    \MiniLED_driver_inst/u1/light_reg[5][5] ,
    \MiniLED_driver_inst/u1/light_reg[5][4] ,
    \MiniLED_driver_inst/u1/light_reg[5][3] ,
    \MiniLED_driver_inst/u1/light_reg[5][2] ,
    \MiniLED_driver_inst/u1/light_reg[5][1] ,
    \MiniLED_driver_inst/u1/light_reg[5][0] ,
    \MiniLED_driver_inst/u1/light_reg[4][7] ,
    \MiniLED_driver_inst/u1/light_reg[4][6] ,
    \MiniLED_driver_inst/u1/light_reg[4][5] ,
    \MiniLED_driver_inst/u1/light_reg[4][4] ,
    \MiniLED_driver_inst/u1/light_reg[4][3] ,
    \MiniLED_driver_inst/u1/light_reg[4][2] ,
    \MiniLED_driver_inst/u1/light_reg[4][1] ,
    \MiniLED_driver_inst/u1/light_reg[4][0] ,
    \MiniLED_driver_inst/u1/light_reg[3][7] ,
    \MiniLED_driver_inst/u1/light_reg[3][6] ,
    \MiniLED_driver_inst/u1/light_reg[3][5] ,
    \MiniLED_driver_inst/u1/light_reg[3][4] ,
    \MiniLED_driver_inst/u1/light_reg[3][3] ,
    \MiniLED_driver_inst/u1/light_reg[3][2] ,
    \MiniLED_driver_inst/u1/light_reg[3][1] ,
    \MiniLED_driver_inst/u1/light_reg[3][0] ,
    \MiniLED_driver_inst/u1/light_reg[2][7] ,
    \MiniLED_driver_inst/u1/light_reg[2][6] ,
    \MiniLED_driver_inst/u1/light_reg[2][5] ,
    \MiniLED_driver_inst/u1/light_reg[2][4] ,
    \MiniLED_driver_inst/u1/light_reg[2][3] ,
    \MiniLED_driver_inst/u1/light_reg[2][2] ,
    \MiniLED_driver_inst/u1/light_reg[2][1] ,
    \MiniLED_driver_inst/u1/light_reg[2][0] ,
    \MiniLED_driver_inst/u1/clk ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \MiniLED_driver_inst/u1/wtaddr_wire[9] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[8] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[7] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[6] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[5] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[4] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[3] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[2] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[1] ;
input \MiniLED_driver_inst/u1/wtaddr_wire[0] ;
input \MiniLED_driver_inst/u1/light_reg[1][7] ;
input \MiniLED_driver_inst/u1/light_reg[1][6] ;
input \MiniLED_driver_inst/u1/light_reg[1][5] ;
input \MiniLED_driver_inst/u1/light_reg[1][4] ;
input \MiniLED_driver_inst/u1/light_reg[1][3] ;
input \MiniLED_driver_inst/u1/light_reg[1][2] ;
input \MiniLED_driver_inst/u1/light_reg[1][1] ;
input \MiniLED_driver_inst/u1/light_reg[1][0] ;
input \MiniLED_driver_inst/u1/light_reg[0][7] ;
input \MiniLED_driver_inst/u1/light_reg[0][6] ;
input \MiniLED_driver_inst/u1/light_reg[0][5] ;
input \MiniLED_driver_inst/u1/light_reg[0][4] ;
input \MiniLED_driver_inst/u1/light_reg[0][3] ;
input \MiniLED_driver_inst/u1/light_reg[0][2] ;
input \MiniLED_driver_inst/u1/light_reg[0][1] ;
input \MiniLED_driver_inst/u1/light_reg[0][0] ;
input \MiniLED_driver_inst/u1/light_reg[5][7] ;
input \MiniLED_driver_inst/u1/light_reg[5][6] ;
input \MiniLED_driver_inst/u1/light_reg[5][5] ;
input \MiniLED_driver_inst/u1/light_reg[5][4] ;
input \MiniLED_driver_inst/u1/light_reg[5][3] ;
input \MiniLED_driver_inst/u1/light_reg[5][2] ;
input \MiniLED_driver_inst/u1/light_reg[5][1] ;
input \MiniLED_driver_inst/u1/light_reg[5][0] ;
input \MiniLED_driver_inst/u1/light_reg[4][7] ;
input \MiniLED_driver_inst/u1/light_reg[4][6] ;
input \MiniLED_driver_inst/u1/light_reg[4][5] ;
input \MiniLED_driver_inst/u1/light_reg[4][4] ;
input \MiniLED_driver_inst/u1/light_reg[4][3] ;
input \MiniLED_driver_inst/u1/light_reg[4][2] ;
input \MiniLED_driver_inst/u1/light_reg[4][1] ;
input \MiniLED_driver_inst/u1/light_reg[4][0] ;
input \MiniLED_driver_inst/u1/light_reg[3][7] ;
input \MiniLED_driver_inst/u1/light_reg[3][6] ;
input \MiniLED_driver_inst/u1/light_reg[3][5] ;
input \MiniLED_driver_inst/u1/light_reg[3][4] ;
input \MiniLED_driver_inst/u1/light_reg[3][3] ;
input \MiniLED_driver_inst/u1/light_reg[3][2] ;
input \MiniLED_driver_inst/u1/light_reg[3][1] ;
input \MiniLED_driver_inst/u1/light_reg[3][0] ;
input \MiniLED_driver_inst/u1/light_reg[2][7] ;
input \MiniLED_driver_inst/u1/light_reg[2][6] ;
input \MiniLED_driver_inst/u1/light_reg[2][5] ;
input \MiniLED_driver_inst/u1/light_reg[2][4] ;
input \MiniLED_driver_inst/u1/light_reg[2][3] ;
input \MiniLED_driver_inst/u1/light_reg[2][2] ;
input \MiniLED_driver_inst/u1/light_reg[2][1] ;
input \MiniLED_driver_inst/u1/light_reg[2][0] ;
input \MiniLED_driver_inst/u1/clk ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \MiniLED_driver_inst/u1/wtaddr_wire[9] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[8] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[7] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[6] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[5] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[4] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[3] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[2] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[1] ;
wire \MiniLED_driver_inst/u1/wtaddr_wire[0] ;
wire \MiniLED_driver_inst/u1/light_reg[1][7] ;
wire \MiniLED_driver_inst/u1/light_reg[1][6] ;
wire \MiniLED_driver_inst/u1/light_reg[1][5] ;
wire \MiniLED_driver_inst/u1/light_reg[1][4] ;
wire \MiniLED_driver_inst/u1/light_reg[1][3] ;
wire \MiniLED_driver_inst/u1/light_reg[1][2] ;
wire \MiniLED_driver_inst/u1/light_reg[1][1] ;
wire \MiniLED_driver_inst/u1/light_reg[1][0] ;
wire \MiniLED_driver_inst/u1/light_reg[0][7] ;
wire \MiniLED_driver_inst/u1/light_reg[0][6] ;
wire \MiniLED_driver_inst/u1/light_reg[0][5] ;
wire \MiniLED_driver_inst/u1/light_reg[0][4] ;
wire \MiniLED_driver_inst/u1/light_reg[0][3] ;
wire \MiniLED_driver_inst/u1/light_reg[0][2] ;
wire \MiniLED_driver_inst/u1/light_reg[0][1] ;
wire \MiniLED_driver_inst/u1/light_reg[0][0] ;
wire \MiniLED_driver_inst/u1/light_reg[5][7] ;
wire \MiniLED_driver_inst/u1/light_reg[5][6] ;
wire \MiniLED_driver_inst/u1/light_reg[5][5] ;
wire \MiniLED_driver_inst/u1/light_reg[5][4] ;
wire \MiniLED_driver_inst/u1/light_reg[5][3] ;
wire \MiniLED_driver_inst/u1/light_reg[5][2] ;
wire \MiniLED_driver_inst/u1/light_reg[5][1] ;
wire \MiniLED_driver_inst/u1/light_reg[5][0] ;
wire \MiniLED_driver_inst/u1/light_reg[4][7] ;
wire \MiniLED_driver_inst/u1/light_reg[4][6] ;
wire \MiniLED_driver_inst/u1/light_reg[4][5] ;
wire \MiniLED_driver_inst/u1/light_reg[4][4] ;
wire \MiniLED_driver_inst/u1/light_reg[4][3] ;
wire \MiniLED_driver_inst/u1/light_reg[4][2] ;
wire \MiniLED_driver_inst/u1/light_reg[4][1] ;
wire \MiniLED_driver_inst/u1/light_reg[4][0] ;
wire \MiniLED_driver_inst/u1/light_reg[3][7] ;
wire \MiniLED_driver_inst/u1/light_reg[3][6] ;
wire \MiniLED_driver_inst/u1/light_reg[3][5] ;
wire \MiniLED_driver_inst/u1/light_reg[3][4] ;
wire \MiniLED_driver_inst/u1/light_reg[3][3] ;
wire \MiniLED_driver_inst/u1/light_reg[3][2] ;
wire \MiniLED_driver_inst/u1/light_reg[3][1] ;
wire \MiniLED_driver_inst/u1/light_reg[3][0] ;
wire \MiniLED_driver_inst/u1/light_reg[2][7] ;
wire \MiniLED_driver_inst/u1/light_reg[2][6] ;
wire \MiniLED_driver_inst/u1/light_reg[2][5] ;
wire \MiniLED_driver_inst/u1/light_reg[2][4] ;
wire \MiniLED_driver_inst/u1/light_reg[2][3] ;
wire \MiniLED_driver_inst/u1/light_reg[2][2] ;
wire \MiniLED_driver_inst/u1/light_reg[2][1] ;
wire \MiniLED_driver_inst/u1/light_reg[2][0] ;
wire \MiniLED_driver_inst/u1/clk ;
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
    .trig0_i({\MiniLED_driver_inst/u1/wtaddr_wire[9] ,\MiniLED_driver_inst/u1/wtaddr_wire[8] ,\MiniLED_driver_inst/u1/wtaddr_wire[7] ,\MiniLED_driver_inst/u1/wtaddr_wire[6] ,\MiniLED_driver_inst/u1/wtaddr_wire[5] ,\MiniLED_driver_inst/u1/wtaddr_wire[4] ,\MiniLED_driver_inst/u1/wtaddr_wire[3] ,\MiniLED_driver_inst/u1/wtaddr_wire[2] ,\MiniLED_driver_inst/u1/wtaddr_wire[1] ,\MiniLED_driver_inst/u1/wtaddr_wire[0] ,\MiniLED_driver_inst/u1/light_reg[5][7] ,\MiniLED_driver_inst/u1/light_reg[5][6] ,\MiniLED_driver_inst/u1/light_reg[5][5] ,\MiniLED_driver_inst/u1/light_reg[5][4] ,\MiniLED_driver_inst/u1/light_reg[5][3] ,\MiniLED_driver_inst/u1/light_reg[5][2] ,\MiniLED_driver_inst/u1/light_reg[5][1] ,\MiniLED_driver_inst/u1/light_reg[5][0] ,\MiniLED_driver_inst/u1/light_reg[4][7] ,\MiniLED_driver_inst/u1/light_reg[4][6] ,\MiniLED_driver_inst/u1/light_reg[4][5] ,\MiniLED_driver_inst/u1/light_reg[4][4] ,\MiniLED_driver_inst/u1/light_reg[4][3] ,\MiniLED_driver_inst/u1/light_reg[4][2] ,\MiniLED_driver_inst/u1/light_reg[4][1] ,\MiniLED_driver_inst/u1/light_reg[4][0] ,\MiniLED_driver_inst/u1/light_reg[3][7] ,\MiniLED_driver_inst/u1/light_reg[3][6] ,\MiniLED_driver_inst/u1/light_reg[3][5] ,\MiniLED_driver_inst/u1/light_reg[3][4] ,\MiniLED_driver_inst/u1/light_reg[3][3] ,\MiniLED_driver_inst/u1/light_reg[3][2] ,\MiniLED_driver_inst/u1/light_reg[3][1] ,\MiniLED_driver_inst/u1/light_reg[3][0] ,\MiniLED_driver_inst/u1/light_reg[2][7] ,\MiniLED_driver_inst/u1/light_reg[2][6] ,\MiniLED_driver_inst/u1/light_reg[2][5] ,\MiniLED_driver_inst/u1/light_reg[2][4] ,\MiniLED_driver_inst/u1/light_reg[2][3] ,\MiniLED_driver_inst/u1/light_reg[2][2] ,\MiniLED_driver_inst/u1/light_reg[2][1] ,\MiniLED_driver_inst/u1/light_reg[2][0] ,\MiniLED_driver_inst/u1/light_reg[1][7] ,\MiniLED_driver_inst/u1/light_reg[1][6] ,\MiniLED_driver_inst/u1/light_reg[1][5] ,\MiniLED_driver_inst/u1/light_reg[1][4] ,\MiniLED_driver_inst/u1/light_reg[1][3] ,\MiniLED_driver_inst/u1/light_reg[1][2] ,\MiniLED_driver_inst/u1/light_reg[1][1] ,\MiniLED_driver_inst/u1/light_reg[1][0] ,\MiniLED_driver_inst/u1/light_reg[0][7] ,\MiniLED_driver_inst/u1/light_reg[0][6] ,\MiniLED_driver_inst/u1/light_reg[0][5] ,\MiniLED_driver_inst/u1/light_reg[0][4] ,\MiniLED_driver_inst/u1/light_reg[0][3] ,\MiniLED_driver_inst/u1/light_reg[0][2] ,\MiniLED_driver_inst/u1/light_reg[0][1] ,\MiniLED_driver_inst/u1/light_reg[0][0] }),
    .data_i({\MiniLED_driver_inst/u1/wtaddr_wire[9] ,\MiniLED_driver_inst/u1/wtaddr_wire[8] ,\MiniLED_driver_inst/u1/wtaddr_wire[7] ,\MiniLED_driver_inst/u1/wtaddr_wire[6] ,\MiniLED_driver_inst/u1/wtaddr_wire[5] ,\MiniLED_driver_inst/u1/wtaddr_wire[4] ,\MiniLED_driver_inst/u1/wtaddr_wire[3] ,\MiniLED_driver_inst/u1/wtaddr_wire[2] ,\MiniLED_driver_inst/u1/wtaddr_wire[1] ,\MiniLED_driver_inst/u1/wtaddr_wire[0] ,\MiniLED_driver_inst/u1/light_reg[1][7] ,\MiniLED_driver_inst/u1/light_reg[1][6] ,\MiniLED_driver_inst/u1/light_reg[1][5] ,\MiniLED_driver_inst/u1/light_reg[1][4] ,\MiniLED_driver_inst/u1/light_reg[1][3] ,\MiniLED_driver_inst/u1/light_reg[1][2] ,\MiniLED_driver_inst/u1/light_reg[1][1] ,\MiniLED_driver_inst/u1/light_reg[1][0] ,\MiniLED_driver_inst/u1/light_reg[0][7] ,\MiniLED_driver_inst/u1/light_reg[0][6] ,\MiniLED_driver_inst/u1/light_reg[0][5] ,\MiniLED_driver_inst/u1/light_reg[0][4] ,\MiniLED_driver_inst/u1/light_reg[0][3] ,\MiniLED_driver_inst/u1/light_reg[0][2] ,\MiniLED_driver_inst/u1/light_reg[0][1] ,\MiniLED_driver_inst/u1/light_reg[0][0] ,\MiniLED_driver_inst/u1/light_reg[5][7] ,\MiniLED_driver_inst/u1/light_reg[5][6] ,\MiniLED_driver_inst/u1/light_reg[5][5] ,\MiniLED_driver_inst/u1/light_reg[5][4] ,\MiniLED_driver_inst/u1/light_reg[5][3] ,\MiniLED_driver_inst/u1/light_reg[5][2] ,\MiniLED_driver_inst/u1/light_reg[5][1] ,\MiniLED_driver_inst/u1/light_reg[5][0] ,\MiniLED_driver_inst/u1/light_reg[4][7] ,\MiniLED_driver_inst/u1/light_reg[4][6] ,\MiniLED_driver_inst/u1/light_reg[4][5] ,\MiniLED_driver_inst/u1/light_reg[4][4] ,\MiniLED_driver_inst/u1/light_reg[4][3] ,\MiniLED_driver_inst/u1/light_reg[4][2] ,\MiniLED_driver_inst/u1/light_reg[4][1] ,\MiniLED_driver_inst/u1/light_reg[4][0] ,\MiniLED_driver_inst/u1/light_reg[3][7] ,\MiniLED_driver_inst/u1/light_reg[3][6] ,\MiniLED_driver_inst/u1/light_reg[3][5] ,\MiniLED_driver_inst/u1/light_reg[3][4] ,\MiniLED_driver_inst/u1/light_reg[3][3] ,\MiniLED_driver_inst/u1/light_reg[3][2] ,\MiniLED_driver_inst/u1/light_reg[3][1] ,\MiniLED_driver_inst/u1/light_reg[3][0] ,\MiniLED_driver_inst/u1/light_reg[2][7] ,\MiniLED_driver_inst/u1/light_reg[2][6] ,\MiniLED_driver_inst/u1/light_reg[2][5] ,\MiniLED_driver_inst/u1/light_reg[2][4] ,\MiniLED_driver_inst/u1/light_reg[2][3] ,\MiniLED_driver_inst/u1/light_reg[2][2] ,\MiniLED_driver_inst/u1/light_reg[2][1] ,\MiniLED_driver_inst/u1/light_reg[2][0] }),
    .clk_i(\MiniLED_driver_inst/u1/clk )
);

endmodule
