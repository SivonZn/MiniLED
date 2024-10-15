// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] lvds_video_top.v
//   \ \  / /\ \  / /    [Description ] LVDS Video
//    \ \/ /  \ \/ /     [Timestamp   ] Friday November 20 14:00:30 2020
//     \  /    \  /      [version     ] 1.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 11/20/20     | Initial version 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

module lvds_video_top
(
    input           I_clk       ,  //50MHz      
    input           I_rst_n     ,
    output  [3:0]   O_led       , 
    input           I_clkin_p   ,  //LVDS Input
    input           I_clkin_n   ,  //LVDS Input
    input   [3:0]   I_din_p     ,  //LVDS Input
    input   [3:0]   I_din_n     ,  //LVDS Input    
    output          O_clkout_p  ,
    output          O_clkout_n  ,
    output  [3:0]   O_dout_p    ,
    output  [3:0]   O_dout_n    ,

	output          LE          ,
    output          DCLK        , //12.5M
    output          SDI         ,
    output          GCLK        ,
    output          scan1       ,
    output          scan2       ,
    output          scan3       , 
    output          scan4       ,
    input   [1:0]   led_mode    
);

//======================================================
reg  [31:0] run_cnt;
wire        running;

//--------------------------
wire [7:0]  r_R_0;  // Red,   8-bit data depth
wire [7:0]  r_G_0;  // Green, 8-bit data depth
wire [7:0]  r_B_0;  // Blue,  8-bit data depth
wire        r_Vsync_0;
wire        r_Hsync_0;
wire        r_DE_0   ;

wire 		rx_sclk;
//wire        rx_sclk_copy;
//wire        rx_sclk_debug;

reg [8*9-1:0] led_light_flatted;

//===================================================
//LED test
//always @(posedge I_clk or negedge I_rst_n)//I_clk
//begin
//    if(!I_rst_n)
//        run_cnt <= 32'd0;
//    else if(run_cnt >= 32'd50_000_000)
//        run_cnt <= 32'd0;
//    else
//        run_cnt <= run_cnt + 1'b1;
//end

//assign  running = (run_cnt < 32'd25_000_000) ? 1'b1 : 1'b0;

//assign  O_led[0] = 1'b1;
//assign  O_led[1] = 1'b1;
//assign  O_led[2] = 1'b0;
//assign  O_led[3] = running;
assign O_led[3] = (2'b00 == led_mode) ? 1'b1 : 1'b0;
assign O_led[2] = (2'b01 == led_mode) ? 1'b1 : 1'b0;
assign O_led[1] = (2'b10 == led_mode) ? 1'b1 : 1'b0;
assign O_led[0] = (2'b11 == led_mode) ? 1'b1 : 1'b0;


//==========================================================
//LED_LIGHT_REG_TEST
integer i;
always @(posedge I_clk or negedge I_rst_n) begin
    if(!I_rst_n)
        led_light_flatted <= 0;
    else
        for(i = 0; i < 8 * 9; i  = i + 1) begin
            led_light_flatted[i] <= 1;
        end
end

//MiniLED_driver
MiniLED_driver   MiniLED_driver_inst
(
    .I_clk(I_clk)       ,  //50MHz      
    .I_rst_n(I_rst_n)   ,   
    .I_led_light(led_light_flatted) ,
    .I_led_mode(led_mode) ,
    .LE(LE)             ,
    .DCLK(DCLK)         , //12.5M
    .SDI(SDI)           ,
    .GCLK(GCLK)         ,
    .scan1(scan1)       ,
    .scan2(scan2)       ,
    .scan3(scan3)       , 
    .scan4(scan4)       
);




//==============================================================
//LVDS Reciver
LVDS_7to1_RX_Top LVDS_7to1_RX_Top_inst
(
    .I_rst_n        (I_rst_n    ),
    .I_clkin_p      (I_clkin_p  ),    // LVDS clock input pair
    .I_clkin_n      (I_clkin_n  ),    // LVDS clock input pair
    .I_din_p        (I_din_p    ),    // LVDS data input pair 0
    .I_din_n        (I_din_n    ),    // LVDS data input pair 0
    .O_pllphase     (           ),
    .O_pllphase_lock(           ),
    .O_clkpat_lock  (           ),
    .O_pix_clk      (rx_sclk    ),  
    .O_vs           (r_Vsync_0  ),
    .O_hs           (r_Hsync_0  ),
    .O_de           (r_DE_0     ),
    .O_data_r       (r_R_0      ),
    .O_data_g       (r_G_0      ),
    .O_data_b       (r_B_0      )
);

//===================================================================================
//LVDS TX
LVDS_7to1_TX_Top LVDS_7to1_TX_Top_inst
(
    .I_rst_n       (I_rst_n     ),
    .I_pix_clk     (rx_sclk     ), //x1                       
    .I_vs          (r_Vsync_0   ), 
    .I_hs          (r_Hsync_0   ),
    .I_de          (r_DE_0      ),
    .I_data_r      (r_R_0       ),
    .I_data_g      (r_G_0       ),
    .I_data_b      (r_B_0       ), 
    .O_clkout_p    (O_clkout_p  ), 
    .O_clkout_n    (O_clkout_n  ),
    .O_dout_p      (O_dout_p    ),    
    .O_dout_n      (O_dout_n    ) 
);

endmodule