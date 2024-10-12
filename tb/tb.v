//---------------------------------------------------------------------
// File name  : tb.v
// Module name: tb
// Created by : 
// ---------------------------------------------------------------------
// Release history
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 11/23/20    | Initial version 
// ----------------------------------------------------------------------------------

`timescale 1ns / 1ps

module tb();

//========================================================
//parameters
parameter BMP_VIDEO_FORMAT		   = "WxH_xHz"; //video format
parameter BMP_PIXEL_CLK_PERIOD     = 13.468; //unit: ns
parameter BMP_PIXEL_CLK_FREQ	   = 1000.0/BMP_PIXEL_CLK_PERIOD;//pixel clock frequency, unit: MHz
parameter BMP_WIDTH				   = 160;
parameter BMP_HEIGHT			   = 120;
parameter BMP_OPENED_NAME		   = "../../tb/pic/img160.bmp";
parameter BMP_REPEAT			   = 1'b1;  //0:bmp increase  , 1:bmp repeat 
parameter BMP_LINK				   = 1'b0;  //0:单像素；1:双像素
								   
parameter BMP_OUTPUTED_WIDTH	   = BMP_WIDTH;
parameter BMP_OUTPUTED_HEIGHT	   = BMP_HEIGHT;
parameter BMP_OUTPUTED_NAME		   = "../../tb/pic/out0_001.bmp";
parameter BMP_OUTPUTED_NUMBER	   = 16'd3;

//=======================================================
reg  pixel_clock; //x1

reg  rst_n;

//------------
//dirver
wire	   vsync; 
wire	   hsync; 
wire	   data_valid; 
wire [7:0] data0_r; 
wire [7:0] data0_g;
wire [7:0] data0_b;

//--------------------------
wire       clkout0_p ;
wire       clkout0_n ;
wire [3:0] dataout0_p;
wire [3:0] dataout0_n;

//-------------------------
wire        lvds_rx_clk ;
wire        lvds_rx_vs  ;
wire        lvds_rx_hs  ;
wire        lvds_rx_de  ;
wire [23:0] lvds_rx_data;  

//-----------------
//monitor rgb input
wire		m_clk;
wire		m_vs_rgb;  
wire		m_hs_rgb;  
wire		m_de_rgb;  
wire [7:0]  m_data0_r;
wire [7:0]  m_data0_g;
wire [7:0]  m_data0_b;
wire [7:0]  m_data1_r;
wire [7:0]  m_data1_g;
wire [7:0]  m_data1_b;

//=====================================================
GSR GSR(.GSRI(1'b1));

//==============================================  
initial begin
  $fsdbDumpfile("tb.fsdb");
  $fsdbDumpvars;
end

//=====================================================
//pixel_clk
initial
  begin
	pixel_clock	     = 1'b0;
  end

always  #(BMP_PIXEL_CLK_PERIOD/2.0) pixel_clock = ~pixel_clock;


//=====================================================
//rst_n
initial
  begin
	rst_n=1'b0;
	
	#2000;
	rst_n=1'b1;
end

//==================================================
//video driver
driver #
(
	.BMP_VIDEO_FORMAT	(BMP_VIDEO_FORMAT   ),
	.BMP_PIXEL_CLK_FREQ (BMP_PIXEL_CLK_FREQ ),
	.BMP_WIDTH		    (BMP_WIDTH	        ),
	.BMP_HEIGHT		    (BMP_HEIGHT	        ),
	.BMP_OPENED_NAME	(BMP_OPENED_NAME    )
)
driver_inst
(
	.link_i	       (BMP_LINK   ), //0,单像素；1，双像素
	.repeat_en     (BMP_REPEAT ),
	.video_gen_en  (rst_n 	   ),
	.pixel_clock   (pixel_clock),
	.vsync	       (vsync	   ),//负极性 
	.hsync	       (hsync	   ),//负极性 
	.data_valid    (data_valid ),
	.data0_r       (data0_r	   ), 
	.data0_g       (data0_g	   ),
	.data0_b       (data0_b	   ), 
	.data1_r       (     	   ), 
	.data1_g       (     	   ),
	.data1_b       (     	   )
);

//======================================================
//LVDS TX
LVDS_7to1_TX_Top LVDS_7to1_TX_Top_inst
(
    .I_rst_n       (rst_n       ),
    .I_pix_clk     (pixel_clock ), //x1                       
    .I_vs          (vsync       ), 
    .I_hs          (hsync       ),
    .I_de          (data_valid  ),
    .I_data_r      (data0_r     ),
    .I_data_g      (data0_g     ),
    .I_data_b      (data0_b     ), 
    .O_clkout_p    (clkout0_p   ), 
    .O_clkout_n    (clkout0_n   ),
    .O_dout_p      (dataout0_p  ),    
    .O_dout_n      (dataout0_n  ) 
);

//======================================================
//LVDS RX
LVDS_7to1_RX_Top LVDS_7to1_RX_Top_inst
(
    .I_rst_n     (rst_n      ),
    .I_clkin_p   (clkout0_p  ),    // LVDS clock input pair
    .I_clkin_n   (clkout0_n  ),    // LVDS clock input pair
    .I_din_p     (dataout0_p ),    // LVDS data input pair 0
    .I_din_n     (dataout0_n ),    // LVDS data input pair 0
    .O_pix_clk   (lvds_rx_clk),  
    .O_vs        (lvds_rx_vs ),
    .O_hs        (lvds_rx_hs ),
    .O_de        (lvds_rx_de ),
    .O_data_r    (lvds_rx_data[ 7: 0]),
    .O_data_g    (lvds_rx_data[15: 8]),
    .O_data_b    (lvds_rx_data[23:16])
);

//======================================================
//monitor
assign m_clk     = lvds_rx_clk        ;
assign m_vs_rgb  = lvds_rx_vs         ;
assign m_hs_rgb  = lvds_rx_hs         ;
assign m_de_rgb  = lvds_rx_de         ;
assign m_data0_r = lvds_rx_data[ 7: 0];
assign m_data0_g = lvds_rx_data[15: 8];
assign m_data0_b = lvds_rx_data[23:16];
assign m_data1_r = 8'd0               ;
assign m_data1_g = 8'd0               ;
assign m_data1_b = 8'd0               ;

initial 
  begin
    force m_vs_rgb = 1'b0;
    
    #4000000; // Delay some time to avoid search time or unstable signals
    release m_vs_rgb;
  end 

monitor#
(
  .BMP_OUTPUTED_WIDTH  (BMP_OUTPUTED_WIDTH ),
  .BMP_OUTPUTED_HEIGHT (BMP_OUTPUTED_HEIGHT),
  .BMP_OUTPUTED_NAME   (BMP_OUTPUTED_NAME  ),
  .BMP_OUTPUTED_NUMBER (BMP_OUTPUTED_NUMBER)
)
monitor_inst
(
  .link_i	    (BMP_LINK	), //0,单像素；1，双像素
  .video2bmp_en (rst_n		),
  .pixel_clock  (m_clk		), 
  .vsync		(m_vs_rgb	), //负极性	   
  .hsync		(m_hs_rgb	), //负极性	   
  .data_valid   (m_de_rgb	), 
  .data0_r	    (m_data0_r	),	
  .data0_g	    (m_data0_g	),
  .data0_b	    (m_data0_b	),
  .data1_r	    (m_data1_r	),	
  .data1_g	    (m_data1_g	),
  .data1_b	    (m_data1_b	)
);
		  
endmodule
