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
    input          I_clk       ,  //50MHz      
    input          I_rst_n     ,
    output [3:0]   O_led       , 
    input          I_clkin_p   ,  //LVDS Input
    input          I_clkin_n   ,  //LVDS Input
    input  [3:0]   I_din_p     ,  //LVDS Input
    input  [3:0]   I_din_n     ,  //LVDS Input    
    output         O_clkout_p  ,
    output         O_clkout_n  ,
    output [3:0]   O_dout_p    ,
    output [3:0]   O_dout_n    ,


	  output [14-1:0] ddr_addr,
    output [3-1:0]  ddr_bank,
    output          ddr_cs,
    output          ddr_ras,
    output          ddr_cas,
    output          ddr_we,
    output          ddr_ck,
    output          ddr_ck_n,
    output          ddr_cke,
    output          ddr_odt,
    output          ddr_reset_n,
    output [2-1:0]  ddr_dm,
    inout  [16-1:0] ddr_dq,
    inout  [2-1:0]  ddr_dqs,
    inout  [2-1:0]  ddr_dqs_n,

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

reg [8*360-1:0] led_light_flatted;

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
//integer i;
//always @(posedge I_clk or negedge I_rst_n) begin
//    if(!I_rst_n)
//        led_light_flatted <= 0;
//    else
//        for(i = 0; i < 360; i = i + 8) begin
//            led_light_flatted[i*8+:8] <= 8'hff;
//        end
//end

//buffer_driver
buffer_360  max_gray_buffer(
    .clk_x1     (       ),
    .rst_n      (I_rst_n),
    .buf_en     (       ),
    .cnt_buf    (       ),
    .gray       (       ),

    .rd_buf_en  (       ),		//读使能
    .array_map  (       ),	//读地址

    .buf_360_flatted(led_light_flatted)	//读出数据
)

assign  running = (run_cnt < 32'd25_000_000) ? 1'b1 : 1'b0;

assign  O_led[0] = 1'b1;
assign  O_led[1] = 1'b1;
assign  O_led[2] = 1'b0;
assign  O_led[3] = running;

wire	[7:0] gray;
wire	[10:0]pix_x;
wire	[10:0]pix_y;

wire	[2:0] cnt_6;
wire		  wr_en;
wire	   page_sel;
wire [47:0] wr_data;
wire [15:0]	wr_addr;

wire 		  rd_en;
wire  [15:0]rd_addr;
wire  [8:0] cnt_360;

wire 		 clk_x1;//100M from DDr3 interface
wire 	app_rd_data_valid;
wire	  app_rd_data_end;
wire [64-1:0] app_rd_data;

wire  		buf_en;
wire [8:0]  cnt_buf;
wire [7:0] max_gray;



//=============================================================
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
    .I_pix_clk     (rx_sclk     ),                      
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



rgb_to_gray  gray_trans(
.i_pix_clk(rx_sclk),
.rst_n(I_rst_n),
.data_de(r_DE_0),
.data_r(r_R_0),
.data_g(r_G_0),
.data_b(r_B_0),


.gray(gray),
.pix_x(pix_x),
.pix_y(pix_y)
);



addr_wr wr_control(
.i_pix_clk(rx_sclk),
.rst_n(I_rst_n),
.data_de(r_DE_0),
.pix_x(pix_x),
.pix_y(pix_y),
.data_gray(gray),

.cnt_6(cnt_6),					

.wr_en(wr_en)   ,					
.page_sel(page_sel),                   
.wr_data(wr_data),
.wr_addr(wr_addr)
);


ddr3_syn_top DDr3
(
.clk(I_clk),   
.rst_nn(I_rst_n),
//	
.wr_en(wr_en),
.wr_data(wr_data),
.wr_addr(wr_addr),
.rd_en(rd_en),
.rd_addr(rd_addr),
//	
    .ddr_addr(ddr_addr),
    .ddr_bank(ddr_bank),
    .ddr_cs(ddr_cs),
    .ddr_ras(ddr_ras),
    .ddr_cas(ddr_cas),
    .ddr_we(ddr_we),
    .ddr_ck(ddr_ck),
    .ddr_ck_n(ddr_ck_n),
    .ddr_cke(ddr_cke),
    .ddr_odt(ddr_odt),
    .ddr_reset_n(ddr_reset_n),
    .ddr_dm(ddr_dm),
    .ddr_dq(ddr_dq),
    .ddr_dqs(ddr_dqs),
    .ddr_dqs_n(ddr_dqs_n),
    
	
	
	
	
	//
.clk_x1(clk_x1),
.app_rd_data_valid(app_rd_data_valid), 
.app_rd_data_end(app_rd_data_end),
.app_rd_data(app_rd_data)
  //
);



addr_rd_cal rd_control
(
.i_pix_clk(O_pix_clk),
.rst_n(I_rst_n),
.page_sel(page_sel),
.cnt_6(cnt_6), 


.rd_en(rd_en) ,	
.rd_addr(rd_addr),
.cnt_360(cnt_360) 


);

ddr_rd_receiver	rd_receiver
(
.clk_x1(clk_x1),
.rst_n(I_rst_n),
.rd_valid(app_rd_data_valid),
.rd_end(app_rd_data_end),
.rd_data(app_rd_data),

.buf_en(buf_en),
.cnt_buf(cnt_buf),
.max_gray(max_gray)

);


buffer_360  buffer_1(
.clk_x1(clk_x1),
.rst_n(I_rst_n),
.buf_en(buf_en),
.cnt_buf(cnt_buf),
.max_gray(max_gray)//,

//input rd_buf_en,		//读使能
//input [8:0]array_map,	//读地址
//
//output [7:0] gray_data	//读出数据

);

//MiniLED_driver
MiniLED_driver   MiniLED_driver_inst
(
  .I_clk(I_clk)       ,  //50MHz      
  .I_rst_n(I_rst_n)   ,   
 
  .LE(LE)          ,
  .DCLK(DCLK)      , //12.5M
  .SDI(SDI)        ,
  .GCLK(GCLK)      ,
  .scan1(scan1)    ,
  .scan2(scan2)    ,
  .scan3(scan3)    , 
  .scan4(scan4)     
);

































endmodule