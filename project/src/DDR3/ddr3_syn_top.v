`timescale 1ps /1ps

module ddr3_syn_top
(
    input           clk,   
    input           rst_nn,//KEY1
//	
	input   		wr_en,
	input    [47:0] wr_data,
	input    [15:0]	wr_addr,
	input    		rd_en,
	input	 [15:0] rd_addr,
//	
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
    output [4-1:0]  led,  
	
	
	
	
	//
	output wire clk_x1,
  output app_rd_data_valid, 
  output app_rd_data_end,
  output [64-1:0] app_rd_data
  //
);
    
    wire           app_wdf_wren;
    wire [8-1:0]   app_wdf_mask;
    wire           app_wdf_end; 
    wire [64-1:0]  app_wdf_data/* synthesis syn_keep=1 */;
    wire           app_en;
    wire [2:0]     app_cmd;
    wire [28:0]  app_addr;
    wire           app_burst;
    wire           app_wdf_rdy;
    wire           app_rdy;
//  wire           app_rd_data_valid; 
//  wire           app_rd_data_end;
//  wire [64-1:0]  app_rd_data;
    
    wire           memory_clk;
    wire           pll_lock;
    
    reg  [31:0]    run_cnt;
 
    wire           init_calib_complete;
    wire           error;
    wire           error_flag;
    wire           running;

// `define DEBUG_PORT_ENABLE

`ifdef DEBUG_PORT_ENABLE
    wire [16-1:0]               dbg_vector4_out; //[8*DQS_WIDTH-1:0]
    wire [6-1:0]                dbg_vector3_out; //[3*DQS_WIDTH-1:0]
    wire [4-1:0]                dbg_vector2_out; //[4*DQS_WIDTH-1:0]
    wire [7:0]                  dbg_vector1_out; 
`endif
assign    rst_n    = rst_nn;


//assign led[0] = ~init_calib_complete;//F16
//assign led[1] = running;//G12
//assign led[2] = ~error;//F13
//assign led[3] = ~error_flag;//F14


//LED test
always @(posedge clk_x1 or negedge rst_n)
	if(!rst_n)
		run_cnt <= 32'd0;
	else if(run_cnt >= 32'd50_000_000)
		run_cnt <= 32'd0;
	else
		run_cnt <= run_cnt + 1'b1;

assign  running  = (run_cnt < 32'd25_000_000) ? 1'b1 : 1'b0;

DDR3_test #
    (
     .ADDR_WIDTH    (28) ,
     .APP_DATA_WIDTH(64) ,
     .APP_MASK_WIDTH(8),
     .BURST_MODE    ("4")//4,8
    )u_rd(
    .clk                (clk_x1),
    .rst                (~rst_n), 
	//
	.wr_en(wr_en),
	.wr_data(wr_data),
	.wr_addr(wr_addr),
	.rd_en(rd_en),
	.rd_addr(rd_addr),
	//
	
    .app_rdy            (app_rdy),
    .app_en             (app_en),
    .app_cmd            (app_cmd),
    .app_addr           (app_addr),
    .app_wdf_data       (app_wdf_data),
    .app_wdf_wren       (app_wdf_wren),
    .app_wdf_end        (app_wdf_end),
    .app_wdf_mask       (app_wdf_mask),
    .app_wdf_rdy        (app_wdf_rdy),
    .app_burst          (app_burst),
   //.app_rd_data_valid  (app_rd_data_valid),
   //.app_rd_data_end    (app_rd_data_end),
   //.app_rd_data        (app_rd_data), 
    .init_calib_complete(init_calib_complete),
    .error              (error),
    .error_flag         (error_flag)
    );

Gowin_rPLL pll(
        .clkout(memory_clk), //output clkout
        .lock(pll_lock), //output lock
        .reset(~rst_n), //input reset
        .clkin(clk) //input clkin
    );

DDR3_Memory_Interface_Top u_ddr3 (
    .clk             (clk),
    .memory_clk      (memory_clk),
    .pll_lock        (pll_lock),
    .rst_n           (rst_n),
    .cmd_ready       (app_rdy),
    .cmd             (app_cmd),
    .cmd_en          (app_en),
    .addr            (app_addr),
    .wr_data_rdy     (app_wdf_rdy),
    .wr_data         (app_wdf_data),
    .wr_data_en      (app_wdf_wren),
    .wr_data_end     (app_wdf_end),
    .wr_data_mask    (app_wdf_mask),
    .rd_data         (app_rd_data),
    .rd_data_valid   (app_rd_data_valid),
    .rd_data_end     (app_rd_data_end),
    .sr_req          (1'b0),
    .ref_req         (1'b0),
    .sr_ack          (),
    .ref_ack         (),
    .init_calib_complete(init_calib_complete),
    .clk_out         (clk_x1),
    `ifdef ECC
    .ecc_err         (ecc_err),
    `endif
    .burst           (app_burst),
    .ddr_rst         (),
    `ifdef DEBUG_PORT_ENABLE
    .dbg_vector4_out (dbg_vector4_out),
    .dbg_vector3_out (dbg_vector3_out),
    .dbg_vector2_out (dbg_vector2_out), 
    .dbg_vector1_out (dbg_vector1_out), 
    `endif
    // mem interface
    .O_ddr_addr      (ddr_addr),
    .O_ddr_ba        (ddr_bank),
    .O_ddr_cs_n      (ddr_cs),
    .O_ddr_ras_n     (ddr_ras),
    .O_ddr_cas_n     (ddr_cas),
    .O_ddr_we_n      (ddr_we),
    .O_ddr_clk       (ddr_ck),
    .O_ddr_clk_n     (ddr_ck_n),
    .O_ddr_cke       (ddr_cke),
    .O_ddr_odt       (ddr_odt),
    .O_ddr_reset_n   (ddr_reset_n),
    .O_ddr_dqm       (ddr_dm),
    .IO_ddr_dq       (ddr_dq),
    .IO_ddr_dqs      (ddr_dqs),
    .IO_ddr_dqs_n    (ddr_dqs_n)
);


endmodule




