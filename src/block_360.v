module block_360(
input i_pix_clk,
input rst_n,
input data_de,
input [10:0]pix_x,//1280*800 像素坐标);
input [10:0]pix_y,
input  [7:0]data_gray,

input r_Vsync_0,
input r_Hsync_0,

output reg [360*8-1:0]buf_360_flatted	//读出数据
);



parameter H_TOTAL='d1280;
parameter V_TOTAL='d800;

reg flag;
reg [7:0] max_gray;

reg [5:0] cnt_h53;//行像素
reg [4:0] cnt_h24;//行块 24X15
reg [5:0] cnt_v53;//场像素
reg [8:0] cnt_360;//分区计数


reg  [24*8-1:0] max_buf;


//integer j;
//initial
//begin
// for(j = 0; j < 24 ; j = j + 1) begin
//        max_buf[j]=8'b0;
//    end
//end





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


//计算
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

//赋值寄存
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

//buffer_360赋值
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
	buf_360_flatted<=0;
	else begin if(cnt_h53=='d52 && cnt_v53=='d52 )
				begin 
					if(max_gray>max_buf[((cnt_h24) * 8) +:8])
					buf_360_flatted[((cnt_360) * 8) +:8]<=max_gray;
					else
					buf_360_flatted[((cnt_360) * 8) +:8]<=max_buf[((cnt_h24) * 8) +:8];
				end
			end
	
end


//integer i;
//
//always@* begin
//    for(i = 0; i < 360 ; i = i + 1) begin
//        buf_360_flatted[(i * 8) +:8] <= buf_360[i];
//    end
//end







endmodule