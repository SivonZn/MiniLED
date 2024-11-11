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
//  [Description ] MiniLED Backlight Algorithm
//
// ====================================================================================
//                                  Code Vision
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Versivon    |  Author    | Date       | Mod.
// ----------------------------------------------------------------------------------
// V1.0        |  Sunriz    | 11/11/24   | Initial version
// ----------------------------------------------------------------------------------
// ====================================================================================

module block_360_pro(
	input 				i_pix_clk	,
	input 				rst_n		,
	input 				data_de		,
	input [10:0]		pix_x		, // 1280*800 像素坐标
	input [10:0]		pix_y		,
	input [7:0]			data_gray	,
	input [1:0] 		gray_mode	, // 算法模式切换
	input 				r_Vsync_0	, // 场同�?
	input 				r_Hsync_0	, // 行同�?
	output reg [8:0] 	cnt_360		, // 分区坐标
	output reg 			flag_done	, // 输出标志
	output reg [7:0]	buf_360
);
    parameter H_TOTAL = 'd1280;
    parameter V_TOTAL = 'd800;
    reg 				flag;					// 有效像素标志
    reg  [7:0] 			max_gray;				// 行最大�??
    reg  [7:0] 			ave_gray;				// 行均�?
    reg  [13:0] 		ave_sum_h;				// 行像素灰度求�?
    reg  [24*14-1:0]	ave_sum_v;				// 行均值灰度求�?
    reg  [5:0] 			cnt_h53;				// 行像�?
    reg  [4:0] 			cnt_h24;				// 行块 24X15
    reg  [5:0] 			cnt_v53;				// 场像�?
    reg  [24*8-1:0] 	max_buf;				// �?大�?�寄存数�?
    reg  [24*8-1:0] 	ave_buf;				// 均�?�寄存数�?
    reg  [7:0]			buf_360_fore[360-1:0];	// 灰度值多帧缓存，用于动�?�修�?
    reg  [7:0]			buf_360_fore1[360-1:0];
    reg  [7:0]			buf_360_fore2[360-1:0];
    reg  [7:0]			buf_360_fore3[360-1:0];
    reg  [7:0]			buf_360_fore4[360-1:0];
    wire [7:0] 			BL_max;					// �?大�??
    wire [7:0] 			BL_ave;					// 均�??
    wire [7:0] 			BL_diff;				// �?大�?�与均�?�之�?
    
    // 余量裁剪
    always@(posedge i_pix_clk or negedge rst_n) begin
        if (!rst_n) begin
            flag <= 0;
		end
        else if (pix_x>'d3 && pix_x <= H_TOTAL-'d4) begin // 头尾各减�?4个像素，根据延迟进行修正
            if (pix_y>'d2 && pix_y <= V_TOTAL-'d3) begin
                flag = 1'b1;
			end
        	else begin
			 	flag <= 0;
			end
		end
	end
            
	// 对单个分区行 53 像素计数
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			cnt_h53 <= 0;
		end
		else if (data_de&&flag)begin
			if (cnt_h53 == 'd52) begin
				cnt_h53 <= 'd0;
			end
			else begin
				cnt_h53 <= cnt_h53+1'b1;
			end
		end
		else if (!flag) begin
			cnt_h53 <= 0;
		end
	end
			
			
	// �?�? 24 分区计数
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			cnt_h24 <= 0;
		end
		else if (data_de&&flag) begin
			if (cnt_h53 == 'd52) begin
				if (cnt_h24 == 'd23) begin
					cnt_h24 <= 'd0;
				end
				else begin
					cnt_h24 <= cnt_h24+1'b1;
				end
			end
			else if (r_Hsync_0) begin
				cnt_h24 <= 0;
			end
		end
	end
		
	// 分区 53 行计�?
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			cnt_v53 <= 0;
		end
		else if (data_de&&flag) begin
			if (cnt_h53 == 'd52&&cnt_h24 == 'd23) begin
				if (cnt_v53 == 'd52) begin
					cnt_v53 <= 'd0;
				end
				else begin
					cnt_v53 <= cnt_v53+1'b1;
				end
			end
		end
	end
				
	// 分区计数
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			cnt_360 <= 0;
		end
		else if (data_de&&flag) begin
			if (cnt_h53 == 'd52&&cnt_v53 == 'd52) begin
				if (cnt_360 == 'd359) begin
					cnt_360 <= 'd0;
				end
				else begin
					cnt_360 <= cnt_360+1'b1;
				end
			end
			else if (r_Vsync_0) begin
				cnt_360 <= 0;
			end
		end
	end
		
	// �?大�?�统�?
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			max_gray <= 8'b0;
		end
		else if (data_de&&flag) begin
			if (cnt_h53 == 'd0) begin
				max_gray <= data_gray; // 存入下一个分区的第一个数
			end
			else if (data_gray>max_gray) begin
				max_gray <= data_gray; // 实时比较更新�?大�??
			end
		end
	end		
				
	// �?大�?�寄存与寄存器复�?
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			max_buf <= 192'b0;
		end
		else if (data_de&&flag) begin
			if (cnt_h53 == 'd52) begin
				if (cnt_v53 == 'd52) begin
					max_buf[((cnt_h24)* 8) +:8] <= 8'b0; // 已完成当前分区的计算输出，将寄存器复�?
				end		
				else if (max_gray>max_buf[((cnt_h24) * 8) +:8]) begin
					max_buf[((cnt_h24) * 8) +:8] <= max_gray; // 将每个分区的行最大�?�寄存到对应 buffer
				end
			end
		end
	end

	// 均�?�算法和计算与复�?
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			ave_sum_h <= 14'b0;
		end
		else if (data_de&&flag) begin
			if (cnt_h53 == 'd0) begin
				ave_sum_h <= data_gray;
			end
			else begin
				ave_sum_h <= ave_sum_h + data_gray;	// 求一行的灰度之和
			end
		end
	end

	// 行均值求和寄存与寄存器复�?
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			ave_sum_v <= 336'b0;
		end
		else if (data_de&&flag) begin
			if (cnt_h53 == 'd52) begin
				if (cnt_v53 == 'd52) begin
					ave_sum_v[((cnt_h24)* 14) +:14] <= 14'b0; // 已完成当前分区的计算输出，将寄存器复�?
				end
				else begin
					ave_sum_v[((cnt_h24)* 14) +:14] <= ave_sum_v[((cnt_h24)* 14) +:14]  +  ave_sum_h/'d52; // 将行均�?�加入对应分区的 buffer �?
				end
			end
		end
	end

	assign BL_max  = (max_gray>max_buf[((cnt_h24) * 8) +:8]) ? max_gray : max_buf[((cnt_h24) * 8) +:8]; // 实时�?大�?�输�?
	assign BL_ave  = ave_sum_v[((cnt_h24)* 14) +:14]/52; // 实时均�?�输�?
	assign BL_diff = BL_max - BL_ave; // �?大�?�与均�?�之差，用于判断�?大�?�是否为非典型�??
		
	///�?大�?�优化算�?
	always@(posedge i_pix_clk or negedge rst_n) begin
		if (!rst_n) begin
			buf_360 <= 0;
			flag_done       <= 0;
		end 
		else begin
			if (cnt_h53 == 'd52 && cnt_v53 == 'd52)begin
				flag_done <= 1'b1;
				case(gray_mode)

					// MODE1 �?大�?�优化算�?
					2'b01: 	begin
								if (BL_diff > 200)begin // 非典型�?�判�?
									buf_360 <= (3 * buf_360_fore[cnt_360] + 3 * buf_360_fore1[cnt_360] + 
														2 * buf_360_fore2[cnt_360] + buf_360_fore3[cnt_360] + 
														buf_360_fore4[cnt_360] + (BL_max + BL_ave * 3) / 4) / 12; // 动�?�修正最大�??
									buf_360_fore[cnt_360] <= (BL_max + BL_ave * 3) / 8;	//静�?�修正非典型�?大�??
								end 
								else begin
									buf_360 <= (3 * buf_360_fore[cnt_360] + 3 * buf_360_fore1[cnt_360] +
														2 * buf_360_fore2[cnt_360] + buf_360_fore3[cnt_360] + 
														buf_360_fore4[cnt_360] + 2 * BL_max) / 12; // 动�?�修正最大�??
									buf_360_fore [cnt_360] <= BL_max;
								end
								buf_360_fore1[cnt_360] <= buf_360_fore[cnt_360]; //缓存数帧灰度值，用于动�?�修�?
								buf_360_fore2[cnt_360] <= buf_360_fore1[cnt_360];
								buf_360_fore3[cnt_360] <= buf_360_fore2[cnt_360];
								buf_360_fore4[cnt_360] <= buf_360_fore3[cnt_360];
							end

					// MODE2 �?大�?�静态修正算�?
					2'b10: 	begin 
								if (BL_diff > 200) begin
									buf_360 <= (BL_max + 3 * BL_ave) / 8;
								end
								else begin
									buf_360 <= BL_max;
								end
					end

					//MODE3 传统�?大�?�算�?
					2'b11:	begin
								buf_360 <= BL_max;	
							end
					
					default:begin
								buf_360 <= BL_max;
							end
				endcase
			end 
			else begin
				flag_done <= 0;
			end
		end
	end
			
endmodule