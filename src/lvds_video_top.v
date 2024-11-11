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
    // LVDS 控制
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
	// RGB 转灰度   
    input  			max_mode	,
	input  			ave_mode	,
	input  			cor_mode	,
    // LED 灯板控制
	output          LE          ,
    output          DCLK        , //12.5M
    output          SDI         ,
    output          GCLK        ,
    output          scan1       ,
    output          scan2       ,
    output          scan3       , 
    output          scan4       ,
    input   [1:0]   led_mode    ,
    // IIC 光线传感器控制
    inout           sda         ,
    output          scl         
);

//======================================================
reg  [31:0] run_cnt;
reg Vsync_reg0;
reg Vsync_reg1;

reg [1:0] gray_mode;

wire        running;

//--------------------------
wire [7:0]  r_R_0;  // Red,   8-bit data depth
wire [7:0]  r_G_0;  // Green, 8-bit data depth
wire [7:0]  r_B_0;  // Blue,  8-bit data depth
wire        r_Vsync_0;
wire        r_Hsync_0;
wire        r_DE_0   ;

wire 		rx_sclk;

wire		flag_start;
wire  [7:0] led_light;

//wire        rx_sclk_copy;
//wire        rx_sclk_debug;

//==========================================================
//LED_SHOW_CURRENT_MODE
assign O_led[3] = (2'b00 == led_mode) ? 1'b1 : 1'b0;
assign O_led[2] = (2'b01 == led_mode) ? 1'b1 : 1'b0;
assign O_led[1] = (2'b10 == led_mode) ? 1'b1 : 1'b0;
assign O_led[0] = (2'b11 == led_mode) ? 1'b1 : 1'b0;



wire [7:0]data_gray;
wire [10:0]pix_x;
wire [10:0]pix_y;

wire [8:0] cnt_360;
wire flag_done;

wire [7:0] bright_data;



    always@(posedge I_clk or negedge I_rst_n) begin
        if(!I_rst_n) 
        gray_mode<=1;
        else begin 
            if(!max_mode)
                gray_mode<='d1;
            else if(!ave_mode)			
                gray_mode<='d2;
            else if(!cor_mode)
                gray_mode<='d3;
        end
    end
		
//==============================================================
// LVDS Reciver
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
// LVDS TX
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

//===================================================================================
// MiniLED_driver
MiniLED_driver   MiniLED_driver_inst
(
    .I_clk          (I_clk      ), //50MHz      
    .I_rst_n        (I_rst_n    ),   
    .I_led_light    (led_light  ),
    .I_led_mode     (led_mode   ),
	
	.i_pix_clk      (rx_sclk    ),
	.cnt_360        (cnt_360    ),
	.flag_done      (flag_done  ),
    .I_bright       (bright_data),
	
    .LE             (LE         ),
    .DCLK           (DCLK       ), //12.5M
    .SDI            (SDI        ),
    .GCLK           (GCLK       ),
    .scan1          (scan1      ),
    .scan2          (scan2      ),
    .scan3          (scan3      ), 
    .scan4          (scan4      )       
);

//===================================================================================
// RGB2GRAY
rgb_to_data_gray rtg(
    .i_pix_clk      (rx_sclk    ),
    .rst_n          (I_rst_n    ),
    .data_de        (r_DE_0     ),
    .data_r         (r_R_0      ),
    .data_g         (r_G_0      ),
    .data_b         (r_B_0      ),
    .data_gray      (data_gray  ),
    .pix_x          (pix_x      ),  // 1280*800 像素坐标
    .pix_y          (pix_y      )
);

//===================================================================================
// I2C_AP3216
AP3216_driver AP3216_driver_inst(
    .I_clk          (I_clk      ),
    .I_reset        (I_rst_n    ),
    .sda            (sda        ),
    .scl            (scl        ),
    .O_bright_data  (bright_data)
);

//===================================================================================
// 背光算法

block_360_ave calculate_pro(
    .i_pix_clk      (rx_sclk    ),
    .rst_n          (I_rst_n    ),
    .data_de        (r_DE_0     ),
    .pix_x          (pix_x      ), // 1280*800 像素坐标;
    .pix_y          (pix_y      ),
    .data_gray      (data_gray  ),

    .r_Hsync_0      (r_Hsync_0  ),
    .r_Vsync_0      (r_Vsync_0  ),

    .gray_mode      (gray_mode  ),

    .flag_done      (flag_done  ),
    .cnt_360        (cnt_360    ),
    .buf_360        (led_light  )  // 读出数据
);


endmodule