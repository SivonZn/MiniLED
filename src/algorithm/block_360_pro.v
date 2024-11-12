// ====================================================================================
// 
//  .oooooo..o                                   o8o             
// d8P'    `Y8                                   `"'             
// Y88bo.      oooo  oooo  ooo. .oo.   oooo d8b oooo    oooooooo 
//  `"Y8888o.  `888  `888  `888P"Y88b  `888""8P `888   d'""7d8P  
//      `"Y88b  888   888   888   888   888      888     .d8P'   
// oo     .d8P  888   888   888   888   888      888   .d8P'  .P 
// 8""88888P'   `V88V"V8P' o888o o888o d888b    o888o d8888888P  
                                                              
//  [Code name   ] block_360_pro.v
//  [Description ] Backlight Algorithm
//
// ====================================================================================
//                                  Code Vision
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Versivon    |  Author    | Date       | Mod.
// ----------------------------------------------------------------------------------
// V1.0        |  Sunriz    | 24/11/11   | Initial version
// ----------------------------------------------------------------------------------
// ====================================================================================

module block_360_pro(
	input i_pix_clk,
	input rst_n,
	input data_de,
	input [10:0]pix_x,//1280*800 像素坐标);
	input [10:0]pix_y,
	input  [7:0]data_gray,

	input [1:0] gray_mode,

	input r_Vsync_0,
	input r_Hsync_0,

	output reg [8:0] cnt_360,//分区计数
	output reg flag_done,
	output reg [7:0]buf_360_flatted	//读出数据
);

	parameter H_TOTAL='d1280;
	parameter V_TOTAL='d800;

	reg flag;

	reg [7:0] max_gray;//行最大值
	reg [7:0] ave_gray;//行均值

	reg [13:0] ave_sum_h;//行像素灰度求和
	reg [24*14-1:0] ave_sum_v;//行均值灰度求和

	reg [5:0] cnt_h53;//行像素
	reg [4:0] cnt_h24;//行块 24X15
	reg [5:0] cnt_v53;//场像素

	reg  [24*8-1:0] max_buf;
	reg  [24*8-1:0] ave_buf;
	reg [7:0]buf_360_fore[360-1:0];

	reg [7:0]buf_360_fore1[360-1:0];
	reg [7:0]buf_360_fore2[360-1:0];
	reg [7:0]buf_360_fore3[360-1:0];
	reg [7:0]buf_360_fore4[360-1:0];
	reg [7:0]buf_360_fore5[360-1:0];
	reg [7:0]buf_360_fore6[360-1:0];

	wire [7:0] BL_max;
	wire [7:0] BL_ave;
	wire [7:0] BL_diff;
	wire [7:0] BL_correction;

	//余量裁剪
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
		flag<=0;
		else if(pix_x>'d3 && pix_x<=H_TOTAL-'d4) //头尾各减去4个像素，根据延迟修正 ????????
				begin
				if(pix_y>'d2 && pix_y<=V_TOTAL-'d3)
				flag=1'b1;
				end
		else flag<=0;
	end
	
	//行像素计数
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
			cnt_h53<=0;
		else if(data_de&&flag)
			begin if(cnt_h53=='d52)			
					begin 
						cnt_h53<='d0;
					end
				
				else begin
						cnt_h53<=cnt_h53+1'b1;
					end
			end
		else if(!flag)
		cnt_h53<=0;
	end

	//行块计数
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
			cnt_h24<=0;
		else if(data_de&&flag)
			begin if(cnt_h53=='d52)			
					begin if(cnt_h24=='d23)
							cnt_h24<='d0;
						else 
						cnt_h24<=cnt_h24+1'b1;
					end	
			end
		else if(r_Hsync_0)
				cnt_h24<=0;
	end

	//场像素计数
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
			cnt_v53<=0;
		else if(data_de&&flag)
			begin if(cnt_h53=='d52&&cnt_h24=='d23)			
					begin if(cnt_v53=='d52)
							cnt_v53<='d0;
						else 
						cnt_v53<=cnt_v53+1'b1;
					end	
			end
					
	end

	//分区计数
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
			cnt_360<=0;
		else if(data_de&&flag)
			begin if(cnt_h53=='d52&&cnt_v53=='d52)			
					begin if(cnt_360=='d359)
							cnt_360<='d0;
						else 
						cnt_360<=cnt_360+1'b1;
					end	
			end
		else if(r_Vsync_0)
			cnt_360<=0;
	end


	//最大值计算
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
		max_gray<=8'b0;
		else if(data_de&&flag)
				begin if(cnt_h53=='d0)
					max_gray<=data_gray;
					else 
						
						if(data_gray>max_gray)
						max_gray<=data_gray;
				end
		
	end

	//最大值赋值寄存
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
		max_buf<=192'b0;
		else if(data_de&&flag)
				begin if(cnt_h53=='d52)
					begin
						if(cnt_v53=='d52)
							max_buf[((cnt_h24)* 8) +:8]<=8'b0;
							
						else 
							if(max_gray>max_buf[((cnt_h24) * 8) +:8])
							max_buf[((cnt_h24) * 8) +:8]<=max_gray;
							
					end
				end
		
	end

	//均值计算
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
		begin
		ave_sum_h<=14'b0;
		end
		else if(data_de&&flag)
				begin if(cnt_h53=='d0)
						ave_sum_h<=data_gray;
					else 
						ave_sum_h<=ave_sum_h + data_gray;
				end
		
	end

	//均值赋值寄存
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) 
		ave_sum_v<=336'b0;
		else if(data_de&&flag)
				begin if(cnt_h53=='d52)
					begin
						if(cnt_v53=='d52)
							ave_sum_v[((cnt_h24)* 14) +:14]<=14'b0;
							
						else 
							ave_sum_v[((cnt_h24)* 14) +:14] <= ave_sum_v[((cnt_h24)* 14) +:14]  +  ave_sum_h/'d52;
							
					end
				end
		
	end

	assign BL_max = (max_gray>max_buf[((cnt_h24) * 8) +:8]) ? max_gray : max_buf[((cnt_h24) * 8) +:8];
	assign BL_ave =ave_sum_v[((cnt_h24)* 14) +:14]/52;

	assign BL_diff= BL_max - BL_ave;
	assign BL_correction = (BL_diff + BL_diff/255)/255;

	///buffer_360赋值最大值算法
	always@(posedge i_pix_clk or negedge rst_n) begin
		if(!rst_n) begin
		buf_360_flatted<=0;
		flag_done<=0;
		end else begin 
				if(cnt_h53=='d52 && cnt_v53=='d52 )begin 
						flag_done<=1'b1;
						case(gray_mode)
						
						2'b01: begin								//设计均值修正最大值算法
									if(BL_diff>200)begin
										buf_360_flatted <= (buf_360_fore[cnt_360]+buf_360_fore1[cnt_360]+buf_360_fore2[cnt_360]+buf_360_fore3[cnt_360]+buf_360_fore4[cnt_360]+(BL_max + BL_ave*3)/8 )/6;
									
										buf_360_fore4[cnt_360]<=buf_360_fore3[cnt_360]; 
										buf_360_fore3[cnt_360]<=buf_360_fore2[cnt_360]; 									
										buf_360_fore2[cnt_360]<=buf_360_fore1[cnt_360];
										buf_360_fore1[cnt_360]<=buf_360_fore[cnt_360];
										buf_360_fore[cnt_360]<=(BL_max + BL_ave*3)/8;
									end else begin
										buf_360_flatted <=(buf_360_fore[cnt_360]+buf_360_fore1[cnt_360]+buf_360_fore2[cnt_360]+buf_360_fore3[cnt_360]+buf_360_fore4[cnt_360]+(BL_max * 3 + BL_ave * 1)/4)/6; 
										

										buf_360_fore4[cnt_360]<=buf_360_fore3[cnt_360]; 									
										buf_360_fore3[cnt_360]<=buf_360_fore2[cnt_360]; 
										buf_360_fore2[cnt_360]<=buf_360_fore1[cnt_360];
										buf_360_fore1[cnt_360]<=buf_360_fore[cnt_360];
										buf_360_fore [cnt_360]<=BL_max;
									end
								end							
						2'b10: buf_360_flatted <= BL_max ;
						2'b11: begin if(BL_diff>200)
										buf_360_flatted <= (BL_max + BL_ave)/4;			//设计均值修正最大值算法
									else 
										buf_360_flatted <= BL_max ;

								end		 
							default:buf_360_flatted <= BL_max;
						endcase
					end else
						flag_done<=0;	
				end
	end






endmodule