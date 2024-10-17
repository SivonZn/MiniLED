module addr_wr(
input i_pix_clk,
input rst_n,
input data_de,
input [10:0]pix_x,//1280*800 像素坐标);
input [10:0]pix_y,
input  [7:0]data_gray,

output reg [2:0] cnt_6,						//cnt_6=3时读一次，读写错开

output reg wr_en   ,						//不写入余量	
output reg page_sel,                        //page_sel跳变时 为1时开始写第二行块，作为读第一行块起始信号；反之读第二行块
output  [47:0]  wr_data,
output reg [15:0]wr_addr
);


parameter H_TOTAL='d1280;
parameter V_TOTAL='d800;

parameter PAGE_ONE='d1;		//0页起始地址0-11488   （9*24*53）一行块 
parameter PAGE_TWO='d11449;		//1页起始地址11489-22896

reg flag;
 reg [3:0] cnt_9;

reg [11:0] cnt_addr;

reg [7:0] data_1; 
reg [7:0] data_2; 
reg [7:0] data_3; 
reg [7:0] data_4; 
reg [7:0] data_5; 
reg [7:0] data_6; 

assign wr_data=(cnt_9=='d9)?{data_1[7:0],data_2[7:0],data_3[7:0],data_4[7:0],data_5[7:0],8'b0}:{data_1[7:0],data_2[7:0],data_3[7:0],data_4[7:0],data_5[7:0],data_6[7:0]};


//余量裁剪
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
	flag<=0;
	else if(pix_x>'d2 && pix_x<=H_TOTAL-'d4) //头尾各减去4个像素，根据延迟修正
			begin
			if(pix_y>'d2 && pix_y<=V_TOTAL-'d3)
			flag=1'b1;
			end
	else flag<=0;
end



//拼接计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
		cnt_6<=0;
	else if(data_de&&flag)
	begin if(cnt_9=='d8)				//已写入8个数据
			begin if(cnt_6=='d5)
					cnt_6<=3'b001;
				else cnt_6<=cnt_6+1'b1;
			end
		else begin	
				if(cnt_6=='d6)
				cnt_6<=3'b001;
				else
				cnt_6<=cnt_6+1'b1;
			end
	end
	else cnt_6<=0;
end




//拼接数据赋值
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
		begin
		data_1<=0;
		data_2<=0;
		data_3<=0;
		data_4<=0;
		data_5<=0;
		data_6<=0;
		end
	else
		begin
		case(cnt_6)
			4'd1    : data_1<= data_gray; 
			4'd2    : data_2<= data_gray; 
			4'd3    : data_3<= data_gray; 
			4'd4    : data_4<= data_gray; 
			4'd5    : data_5<= data_gray; 
			4'd6    : data_6<= data_gray;	
			default  :data_1<=0; 		
		endcase
		end
end
		

	
	
	
	
	
//写使能控制
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)begin	
		wr_en<=0;
		cnt_9<=0;
		end
	else if( data_de&&flag&& ((cnt_6=='d6)||(cnt_9=='d8&&cnt_6=='d5)))begin
			wr_en<=1'b1;														
			if(cnt_9=='d9)
			cnt_9<='d1;
			else
			cnt_9<=cnt_9+1'b1;
		end
	else 	wr_en<=0;
end


 //换页计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
		cnt_addr<=0;
		else if(cnt_9=='d9&&wr_en)
			begin if(cnt_addr=='d2544)
					cnt_addr<='d1;
				else	  
					cnt_addr<=cnt_addr+1'b1;
			end
end			


//翻页控制
always@(posedge i_pix_clk or negedge rst_n) begin
	 if(!rst_n) 
		page_sel<=0;
	else if(cnt_addr=='d1272)
		page_sel<=1'b1;
	else if( cnt_addr=='d2544)
		page_sel<=0;
		
end



//写地址控制
always@(posedge i_pix_clk or negedge rst_n) begin
	 if(!rst_n) 
		wr_addr<='d1;
		
	else if(cnt_addr=='d2544&&cnt_6==0)          //附加cnt_6防止wr_ddr被锁
		wr_addr<='d1;
		else if(wr_en)
		wr_addr<=wr_addr+1'b1;
	

end



endmodule