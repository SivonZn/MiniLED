
`timescale 1ps/1ps

module DDR3_test #(
    parameter ADDR_WIDTH     = 28,
    parameter APP_DATA_WIDTH = 64,
    parameter APP_MASK_WIDTH = 8,
    parameter BURST_MODE     = "4" //4,8
    )
    (
    //input
    clk, //100M
    rst, 
    app_rdy, 
    app_wdf_rdy,
  //app_rd_data_valid,
  //app_rd_data_end,
  //app_rd_data, 
    init_calib_complete,
	
	//
	wr_en,
	wr_data,
	wr_addr,
	rd_en,
	rd_addr,
	//
	
	
	
	
    //output
    app_en, 
    app_cmd, 
    app_addr, 
    app_wdf_data/* synthesis syn_keep=1 */, 
    app_wdf_wren,
    app_wdf_end, 
    app_wdf_mask, 
    app_burst,
    error,
    error_flag
    );

    input clk; 
    input rst; 
    input app_rdy; 
    input app_wdf_rdy;
 // input app_rd_data_valid; 
 // input app_rd_data_end;
//  input [APP_DATA_WIDTH-1:0] app_rd_data;
    input init_calib_complete;
	
	//
	input   		wr_en;
	input    [47:0] wr_data;
	input    [15:0]	wr_addr;
	input    		rd_en;
	input	 [15:0] rd_addr;
	//

    output reg app_en;
    output reg [2:0] app_cmd;
    output reg [ADDR_WIDTH-1:0] app_addr;
    output reg [APP_DATA_WIDTH-1:0] app_wdf_data/* synthesis syn_keep=1 */;
    output reg app_wdf_wren;
    output reg app_wdf_end;
    output reg [APP_MASK_WIDTH-1:0] app_wdf_mask;
    output reg app_burst;
    output  error;
    output error_flag;
/////////////////////////////////////////////////
    reg [7:0] cnt;
    reg [27:0] reg_addr;
    wire[4:0] mem_index;
    
    wire[3:0] addr_step;
    
    reg [1:0] error_d;
    reg [1:0] error_flag_d;
    
    always@(posedge clk or posedge rst)
    begin
      if (rst)
        cnt <= 8'd0;
      else if(app_rdy & app_wdf_rdy & init_calib_complete)
        cnt <= cnt + 1'b1;
      else
        cnt <= cnt;
    end
    
    always@(posedge clk or posedge rst)
    begin
      if (rst)
        reg_addr <= 28'd0;
      else if(cnt==8'd255 && app_rdy && app_wdf_rdy && init_calib_complete)
        reg_addr <= reg_addr + addr_step;
      else
        reg_addr <= reg_addr;
    end
    
    assign mem_index = reg_addr[6:2];

    wire  [APP_DATA_WIDTH-1:0] mem_data   [0:31];
    assign  mem_data[0]  = 64'h8808_7728_e878_f685;
    assign  mem_data[1]  = 64'h1505_5a21_25b5_fa1a;
    assign  mem_data[2]  = 64'h2404_0bf2_d464_ab25;
    assign  mem_data[3]  = 64'h3303_45e3_f173_213a;
    assign  mem_data[4]  = 64'h42e2_6694_42b2_f245;
    assign  mem_data[5]  = 64'h5101_6735_d351_435a;
    assign  mem_data[6]  = 64'h6000_0826_d440_f465;
    assign  mem_data[7]  = 64'h7606_8947_86b6_357a;
                           
    assign  mem_data[8]  = 64'h1000_0100_2180_f290;
    assign  mem_data[9]  = 64'h3000_0300_429e_d4a1;
    assign  mem_data[10] = 64'h5000_0500_63ac_b6b2;
    assign  mem_data[11] = 64'h7000_0700_84ba_98c3;
    assign  mem_data[12] = 64'h9000_0900_a5c8_7ad4;
    assign  mem_data[13] = 64'hb000_0b00_c6d6_5ce5;
    assign  mem_data[14] = 64'hd000_0d00_e7e4_3ef6;
    assign  mem_data[15] = 64'hf000_0f00_08f2_1f07;
                           
    assign  mem_data[16] = 64'h8808_7728_b870_f688;
    assign  mem_data[17] = 64'h1505_5a21_25b1_fa19;
    assign  mem_data[18] = 64'h2404_0bf2_a462_ab2a;
    assign  mem_data[19] = 64'h3303_45e3_d173_213b;
    assign  mem_data[20] = 64'h42e2_6694_42b4_f24c;
    assign  mem_data[21] = 64'h5101_6735_d355_435d;
    assign  mem_data[22] = 64'h6000_0826_f446_f46e;
    assign  mem_data[23] = 64'h7606_8947_86b7_357f;
                           
    assign  mem_data[24] = 64'h1000_0100_1c42_12ce;
    assign  mem_data[25] = 64'h3000_0300_3a54_34df;
    assign  mem_data[26] = 64'h5000_0500_5a66_56ea;
    assign  mem_data[27] = 64'h7000_0700_7a78_78f3;
    assign  mem_data[28] = 64'h9000_0900_9b8a_9a02;
    assign  mem_data[29] = 64'hb000_0b00_bb9c_bc11;
    assign  mem_data[30] = 64'hd000_0d00_dbae_de20;
    assign  mem_data[31] = 64'hf000_0f00_fcb0_f03d;



generate
    if(BURST_MODE == "4") begin: app_burst_4
        assign addr_step = 4'd4;
        
        always@(posedge clk or posedge rst)
        begin
            if(rst)
                begin
                            app_en        <= 1'b0;
                            app_cmd       <= 3'b000;
                            app_wdf_wren  <= 1'b0;
                            app_wdf_end   <= 1'b0;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= {ADDR_WIDTH{1'b0}};
                            app_wdf_data  <= {APP_DATA_WIDTH{1'b0}};
                end
            else if(app_rdy && app_wdf_rdy && init_calib_complete && wr_en)//cnt==8'd10)
                begin
                            app_en        <= 1'b1;
                            app_cmd       <= 3'b000;//write
                            app_wdf_wren  <= 1'b1;
                            app_wdf_end   <= 1'b1;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= {12'd0,wr_addr}; //reg_addr;
                            app_wdf_data  <= {16'b0,wr_data};//mem_data[mem_index];
                end
            else if(app_rdy && init_calib_complete && rd_en)//cnt==8'd70)
                begin
                            app_en        <= 1'b1;
                            app_cmd       <= 3'b001;//read
                            app_wdf_wren  <= 1'b0;
                            app_wdf_end   <= 1'b0;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= {12'd0,rd_addr};//reg_addr;
                            app_wdf_data  <= {APP_DATA_WIDTH{1'b0}};
                end
            else 
                begin
                            app_en        <= 1'b0;
                            app_cmd       <= 3'b000;
                            app_wdf_wren  <= 1'b0;
                            app_wdf_end   <= 1'b0;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= {ADDR_WIDTH{1'b0}};
                            app_wdf_data  <= {APP_DATA_WIDTH{1'b0}};
                end
        end
        
        //-------
        always@(posedge clk or posedge rst)
        begin
            if(rst) 
            begin
                error_d[0]      <= 1'b0;
                error_flag_d[0] <= 1'b0;
            end
            //		else if(app_rd_data_valid & (app_rd_data !== mem_data[mem_index]))
            //		begin
            //		    error_d[0]      <= 1'b1;
            //		    error_flag_d[0] <= 1'b1;
            //		end
            //		else
            //		begin
            //		    error_d[0]      <= error_d[0];
            //		    error_flag_d[0] <= 1'b0;
            //		end
        end
        
        always@(posedge clk or posedge rst)
        begin
            if(rst) 
            begin
                error_d[1]      <= 1'b0;
                error_flag_d[1] <= 1'b0;
            end 
            else
            begin
                error_d[1]      <= error_d[0];
                error_flag_d[1] <= error_flag_d[0];
            end 
        end
    end //app_burst_4
    
    else if(BURST_MODE == "8") begin: app_burst_8
        assign addr_step = 4'd8;
        
        always@(posedge clk or posedge rst)
        begin
            if(rst)
                begin
                            app_en        <= 1'b0;
                            app_cmd       <= 3'b000;
                            app_wdf_wren  <= 1'b0;
                            app_wdf_end   <= 1'b0;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= {ADDR_WIDTH{1'b0}};
                            app_wdf_data  <= {APP_DATA_WIDTH{1'b0}};
                end
            else if(app_rdy && app_wdf_rdy && init_calib_complete && cnt==8'd10)
                begin
                            app_en        <= 1'b1;
                            app_cmd       <= 3'b000;//write
                            app_wdf_wren  <= 1'b1;
                            app_wdf_end   <= 1'b0;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= reg_addr;
                            app_wdf_data  <= mem_data[mem_index];
                end
            else if(app_rdy && app_wdf_rdy && init_calib_complete && cnt==8'd11)
                begin
                            app_en        <= 1'b1;
                            app_cmd       <= 3'b000;//write
                            app_wdf_wren  <= 1'b1;
                            app_wdf_end   <= 1'b1;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= reg_addr;
                            app_wdf_data  <= mem_data[mem_index+1'b1];
                end
            else if(app_rdy && init_calib_complete && cnt==8'd70)
                begin
                            app_en        <= 1'b1;
                            app_cmd       <= 3'b001;//read
                            app_wdf_wren  <= 1'b0;
                            app_wdf_end   <= 1'b0;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= reg_addr;
                            app_wdf_data  <= {APP_DATA_WIDTH{1'b0}};
                end
            else 
                begin
                            app_en        <= 1'b0;
                            app_cmd       <= 3'b000;
                            app_wdf_wren  <= 1'b0;
                            app_wdf_end   <= 1'b0;
                            app_wdf_mask  <= {APP_MASK_WIDTH{1'b0}};
                            app_burst     <= 1'b0;
                            app_addr      <= {ADDR_WIDTH{1'b0}};
                            app_wdf_data  <= {APP_DATA_WIDTH{1'b0}};
                end
        end
        
        //-------
        always@(posedge clk or posedge rst)
        begin
            if(rst) 
            begin
                error_d[0]      <= 1'b0;
                error_flag_d[0] <= 1'b0;
            end
            //		else if((app_rd_data_valid & !app_rd_data_end & (app_rd_data !== mem_data[mem_index])) ||
            //		        (app_rd_data_valid & app_rd_data_end & (app_rd_data !== mem_data[mem_index+1'b1])))
            //		begin
            //		    error_d[0]      <= 1'b1;
            //		    error_flag_d[0] <= 1'b1;
            //		end
            //		else
            //		begin
            //		    error_d[0]      <= error_d[0];
            //		    error_flag_d[0] <= 1'b0;
            //		end
        end
        
        always@(posedge clk or posedge rst)
        begin
            if(rst) 
            begin
                error_d[1]      <= 1'b0;
                error_flag_d[1] <= 1'b0;
            end 
            else
            begin
                error_d[1]      <= error_d[0];
                error_flag_d[1] <= error_flag_d[0];
            end 
        end
    end//app_burst_8

endgenerate

////////////////////////////////////////////////////////////
    

assign error      = error_d[1];
assign error_flag = error_flag_d[1];
 
endmodule




