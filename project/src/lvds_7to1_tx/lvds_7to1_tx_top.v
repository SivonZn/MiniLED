// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] lvds_7to1_tx_top.v
//   \ \  / /\ \  / /    [Description ] LVDS 7:1 TX for Video 
//    \ \/ /  \ \/ /     [Timestamp   ] Friday November 20 14:00:30 2020
//     \  /    \  /      [version     ] 2.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 11/20/20     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     |  6/11/21     |  
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========


`include "lvds_7to1_tx_defines.v"

module LVDS_7to1_TX_Top 
(
    input        I_rst_n       ,
`ifdef TX_USE_EXTERNAL_CLK
    input        I_serial_clk  ,//x3.5
`endif
    input        I_pix_clk     ,//x1
    input        I_vs          ,
    input        I_hs          ,
    input        I_de          ,
`ifdef TX_ONE_CHANNEL
    `ifdef TX_RGB888
        input  [7:0] I_data_r      ,
        input  [7:0] I_data_g      ,
        input  [7:0] I_data_b      ,
        output       O_clkout_p    ,
        output       O_clkout_n    ,
        output [3:0] O_dout_p      ,
        output [3:0] O_dout_n  
    `endif 
    `ifdef TX_RGB666
        input  [5:0] I_data_r      ,
        input  [5:0] I_data_g      ,
        input  [5:0] I_data_b      ,
        output       O_clkout_p    ,
        output       O_clkout_n    ,
        output [2:0] O_dout_p      ,
        output [2:0] O_dout_n  
    `endif 
`endif 
`ifdef TX_TWO_CHANNEL
    `ifdef TX_RGB888
        input  [7:0] I_data_ro      ,
        input  [7:0] I_data_go      ,
        input  [7:0] I_data_bo      ,
        input  [7:0] I_data_re      ,
        input  [7:0] I_data_ge      ,
        input  [7:0] I_data_be      ,
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            output       O_clkout_p     ,
            output       O_clkout_n     ,
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            output       O_clkouto_p    ,
            output       O_clkouto_n    ,
            output       O_clkoute_p    ,
            output       O_clkoute_n    ,
        `endif
        output [3:0] O_douto_p      ,
        output [3:0] O_douto_n      ,
        output [3:0] O_doute_p      ,
        output [3:0] O_doute_n 
    `endif 
    `ifdef TX_RGB666
        input  [5:0] I_data_ro      ,
        input  [5:0] I_data_go      ,
        input  [5:0] I_data_bo      ,
        input  [5:0] I_data_re      ,
        input  [5:0] I_data_ge      ,
        input  [5:0] I_data_be      ,
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            output       O_clkout_p     ,
            output       O_clkout_n     ,
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            output       O_clkouto_p    ,
            output       O_clkouto_n    ,
            output       O_clkoute_p    ,
            output       O_clkoute_n    ,
        `endif
        output [2:0] O_douto_p      ,
        output [2:0] O_douto_n      ,
        output [2:0] O_doute_p      ,
        output [2:0] O_doute_n 
    `endif 
`endif     
);

//==========================================================================
wire serial_clk;
wire rst_n1;

`ifdef TX_ONE_CHANNEL
        wire [6:0]  tx_0;
        wire [6:0]  tx_1;
        wire [6:0]  tx_2;
        wire        buf_clkout;
        wire        buf_dout2 ;
        wire        buf_dout1 ;
        wire        buf_dout0 ;
    `ifdef TX_RGB888
        wire [6:0]  tx_3;
        wire        buf_dout3 ;
    `endif 
`endif 

`ifdef TX_TWO_CHANNEL
        wire [6:0]  txo_0;
        wire [6:0]  txo_1;
        wire [6:0]  txo_2;
        wire [6:0]  txe_0;
        wire [6:0]  txe_1;
        wire [6:0]  txe_2;
        wire        buf_clkout;
        wire        buf_douto2 ;
        wire        buf_douto1 ;
        wire        buf_douto0 ;
        wire        buf_doute2 ;
        wire        buf_doute1 ;
        wire        buf_doute0 ;
    `ifdef TX_RGB888
        wire [6:0]  txo_3;
        wire [6:0]  txe_3;
        wire        buf_douto3 ;
        wire        buf_doute3 ;
    `endif
`endif 

//===========================================================
`ifdef TX_USE_EXTERNAL_CLK
    assign serial_clk = I_serial_clk;
    assign rst_n1 = I_rst_n;
`else
    `ifdef TX_USE_RPLL
        wire pll_lock;
        LVDS_TX_rPLL2 LVDS_TX_rPLL_inst
        (
            .clkout(serial_clk), //x3.5
            .lock  (pll_lock  ),
            .reset (1'b0      ), 
            .clkin (I_pix_clk )  //x1
        );
        //------------
        assign rst_n1 = I_rst_n & pll_lock;
    `endif
    `ifdef TX_USE_PLLVR
        wire pll_lock;
        LVDS_TX_PLLVR LVDS_TX_PLLVR_inst
        (
            .clkout(serial_clk), //x3.5
            .lock  (pll_lock  ),
            .reset (1'b0      ), 
            .clkin (I_pix_clk )  //x1
        );
        //------------
        assign rst_n1 = I_rst_n & pll_lock;
    `endif
`endif

//======================================================================
//Data mapping
`ifdef TX_ONE_CHANNEL
    `ifdef TX_VESA
        `ifdef TX_RGB888
            assign  tx_0 = {I_data_r[0], I_data_r[1], I_data_r[2], I_data_r[3], I_data_r[4], I_data_r[5], I_data_g[0]};
            assign  tx_1 = {I_data_g[1], I_data_g[2], I_data_g[3], I_data_g[4], I_data_g[5], I_data_b[0], I_data_b[1]};
            assign  tx_2 = {I_data_b[2], I_data_b[3], I_data_b[4], I_data_b[5], I_hs       , I_vs       , I_de};
            assign  tx_3 = {I_data_r[6], I_data_r[7], I_data_g[6], I_data_g[7], I_data_b[6], I_data_b[7], 1'b1};
        `endif
        `ifdef TX_RGB666
            assign  tx_0 = {I_data_r[0], I_data_r[1], I_data_r[2], I_data_r[3], I_data_r[4], I_data_r[5], I_data_g[0]};
            assign  tx_1 = {I_data_g[1], I_data_g[2], I_data_g[3], I_data_g[4], I_data_g[5], I_data_b[0], I_data_b[1]};
            assign  tx_2 = {I_data_b[2], I_data_b[3], I_data_b[4], I_data_b[5], I_hs       , I_vs       , I_de};
        `endif
    `endif
    
    `ifdef TX_JEIDA
        `ifdef TX_RGB888
            assign  tx_0 = {I_data_r[2], I_data_r[3], I_data_r[4], I_data_r[5], I_data_r[6], I_data_r[7], I_data_g[2]};
            assign  tx_1 = {I_data_g[3], I_data_g[4], I_data_g[5], I_data_g[6], I_data_g[7], I_data_b[2], I_data_b[3]};
            assign  tx_2 = {I_data_b[4], I_data_b[5], I_data_b[6], I_data_b[7], I_hs       , I_vs       , I_de};
            assign  tx_3 = {I_data_r[0], I_data_r[1], I_data_g[0], I_data_g[1], I_data_b[0], I_data_b[1], 1'b1};
        `endif
        `ifdef TX_RGB666
            assign  tx_0 = {I_data_r[0], I_data_r[1], I_data_r[2], I_data_r[3], I_data_r[4], I_data_r[5], I_data_g[0]};
            assign  tx_1 = {I_data_g[1], I_data_g[2], I_data_g[3], I_data_g[4], I_data_g[5], I_data_b[0], I_data_b[1]};
            assign  tx_2 = {I_data_b[2], I_data_b[3], I_data_b[4], I_data_b[5], I_hs       , I_vs       , I_de};
        `endif
    `endif
`endif

`ifdef TX_TWO_CHANNEL
    `ifdef TX_VESA
        `ifdef TX_RGB888
            assign  txo_0 = {I_data_ro[0], I_data_ro[1], I_data_ro[2], I_data_ro[3], I_data_ro[4], I_data_ro[5], I_data_go[0]};
            assign  txo_1 = {I_data_go[1], I_data_go[2], I_data_go[3], I_data_go[4], I_data_go[5], I_data_bo[0], I_data_bo[1]};
            assign  txo_2 = {I_data_bo[2], I_data_bo[3], I_data_bo[4], I_data_bo[5], I_hs        , I_vs        , I_de};
            assign  txo_3 = {I_data_ro[6], I_data_ro[7], I_data_go[6], I_data_go[7], I_data_bo[6], I_data_bo[7], 1'b1};
            
            assign  txe_0 = {I_data_re[0], I_data_re[1], I_data_re[2], I_data_re[3], I_data_re[4], I_data_re[5], I_data_ge[0]};
            assign  txe_1 = {I_data_ge[1], I_data_ge[2], I_data_ge[3], I_data_ge[4], I_data_ge[5], I_data_be[0], I_data_be[1]};
            assign  txe_2 = {I_data_be[2], I_data_be[3], I_data_be[4], I_data_be[5], I_hs        , I_vs        , I_de};
            assign  txe_3 = {I_data_re[6], I_data_re[7], I_data_ge[6], I_data_ge[7], I_data_be[6], I_data_be[7], 1'b1};
        `endif 
        `ifdef TX_RGB666
            assign  txo_0 = {I_data_ro[0], I_data_ro[1], I_data_ro[2], I_data_ro[3], I_data_ro[4], I_data_ro[5], I_data_go[0]};
            assign  txo_1 = {I_data_go[1], I_data_go[2], I_data_go[3], I_data_go[4], I_data_go[5], I_data_bo[0], I_data_bo[1]};
            assign  txo_2 = {I_data_bo[2], I_data_bo[3], I_data_bo[4], I_data_bo[5], I_hs        , I_vs        , I_de};
            
            assign  txe_0 = {I_data_re[0], I_data_re[1], I_data_re[2], I_data_re[3], I_data_re[4], I_data_re[5], I_data_ge[0]};
            assign  txe_1 = {I_data_ge[1], I_data_ge[2], I_data_ge[3], I_data_ge[4], I_data_ge[5], I_data_be[0], I_data_be[1]};
            assign  txe_2 = {I_data_be[2], I_data_be[3], I_data_be[4], I_data_be[5], I_hs        , I_vs        , I_de};
        `endif 
    `endif
    
    `ifdef TX_JEIDA
        `ifdef TX_RGB888
            assign  txo_0 = {I_data_ro[2], I_data_ro[3], I_data_ro[4], I_data_ro[5], I_data_ro[6], I_data_ro[7], I_data_go[2]};
            assign  txo_1 = {I_data_go[3], I_data_go[4], I_data_go[5], I_data_go[6], I_data_go[7], I_data_bo[2], I_data_bo[3]};
            assign  txo_2 = {I_data_bo[4], I_data_bo[5], I_data_bo[6], I_data_bo[7], I_hs        , I_vs       , I_de};
            assign  txo_3 = {I_data_ro[0], I_data_ro[1], I_data_go[0], I_data_go[1], I_data_bo[0], I_data_bo[1], 1'b1};
            
            assign  txe_0 = {I_data_re[2], I_data_re[3], I_data_re[4], I_data_re[5], I_data_re[6], I_data_re[7], I_data_ge[2]};
            assign  txe_1 = {I_data_ge[3], I_data_ge[4], I_data_ge[5], I_data_ge[6], I_data_ge[7], I_data_be[2], I_data_be[3]};
            assign  txe_2 = {I_data_be[4], I_data_be[5], I_data_be[6], I_data_be[7], I_hs        , I_vs        , I_de};
            assign  txe_3 = {I_data_re[0], I_data_re[1], I_data_ge[0], I_data_ge[1], I_data_be[0], I_data_be[1], 1'b1};
        `endif
        `ifdef TX_RGB666
            assign  txo_0 = {I_data_ro[0], I_data_ro[1], I_data_ro[2], I_data_ro[3], I_data_ro[4], I_data_ro[5], I_data_go[0]};
            assign  txo_1 = {I_data_go[1], I_data_go[2], I_data_go[3], I_data_go[4], I_data_go[5], I_data_bo[0], I_data_bo[1]};
            assign  txo_2 = {I_data_bo[2], I_data_bo[3], I_data_bo[4], I_data_bo[5], I_hs        , I_vs        , I_de};
            
            assign  txe_0 = {I_data_re[0], I_data_re[1], I_data_re[2], I_data_re[3], I_data_re[4], I_data_re[5], I_data_ge[0]};
            assign  txe_1 = {I_data_ge[1], I_data_ge[2], I_data_ge[3], I_data_ge[4], I_data_ge[5], I_data_be[0], I_data_be[1]};
            assign  txe_2 = {I_data_be[2], I_data_be[3], I_data_be[4], I_data_be[5], I_hs        , I_vs        , I_de};
        `endif
    `endif
`endif

//======================================================================
//OVIDEO
ip_gddr71tx ip_gddr71tx_inst
(
    .refclk       (serial_clk    ),
    .sclk         (I_pix_clk     ),
`ifdef TX_ONE_CHANNEL
    `ifdef TX_RGB888
        .data0        (tx_0          ), 
        .data1        (tx_1          ), 
        .data2        (tx_2          ), 
        .data3        (tx_3          ),
        .clkout_p     (O_clkout_p    ),
        .clkout_n     (O_clkout_n    ),
        .dout_p       (O_dout_p      ),
        .dout_n       (O_dout_n      ),
    `endif
    `ifdef TX_RGB666
        .data0        (tx_0          ), 
        .data1        (tx_1          ), 
        .data2        (tx_2          ), 
        .clkout_p     (O_clkout_p    ),
        .clkout_n     (O_clkout_n    ),
        .dout_p       (O_dout_p      ),
        .dout_n       (O_dout_n      ),
    `endif
`endif 
`ifdef TX_TWO_CHANNEL
    `ifdef TX_RGB888
        .datao0       (txo_0         ), 
        .datao1       (txo_1         ), 
        .datao2       (txo_2         ), 
        .datao3       (txo_3         ),
        .datae0       (txe_0         ), 
        .datae1       (txe_1         ), 
        .datae2       (txe_2         ), 
        .datae3       (txe_3         ),
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            .clkout_p      (O_clkout_p     ), 
            .clkout_n      (O_clkout_n     ),
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            .clkouto_p     (O_clkouto_p    ), 
            .clkouto_n     (O_clkouto_n    ),
            .clkoute_p     (O_clkoute_p    ), 
            .clkoute_n     (O_clkoute_n    ),
        `endif
        .douto_p      (O_douto_p     ),
        .douto_n      (O_douto_n     ),
        .doute_p      (O_doute_p     ),
        .doute_n      (O_doute_n     ),
    `endif
    `ifdef TX_RGB666
        .datao0       (txo_0         ), 
        .datao1       (txo_1         ), 
        .datao2       (txo_2         ), 
        .datae0       (txe_0         ), 
        .datae1       (txe_1         ), 
        .datae2       (txe_2         ), 
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            .clkout_p      (O_clkout_p     ), 
            .clkout_n      (O_clkout_n     ),
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            .clkouto_p     (O_clkouto_p    ), 
            .clkouto_n     (O_clkouto_n    ),
            .clkoute_p     (O_clkoute_p    ), 
            .clkoute_n     (O_clkoute_n    ),
        `endif
        .douto_p      (O_douto_p     ),
        .douto_n      (O_douto_n     ),
        .doute_p      (O_doute_p     ),
        .doute_n      (O_doute_n     ),
    `endif
`endif  
    .reset        (!rst_n1       )
);

endmodule
