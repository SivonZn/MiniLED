module addr_rd_cal(
input i_pix_clk,
input rst_n,
input page_sel,
input [2:0]cnt_6, 



output  rd_en ,	
output reg [15:0]rd_addr,
output reg [8:0] cnt_360 


);

wire rd_flag;
reg reg_0;
reg reg_1;
assign rd_flag=reg_0^reg_1; //换页信号
reg rd_start;

reg [15:0]rd_addr_reg;
reg [15:0]test_cnt;


reg [3:0] cnt_rd9;			//读计数信号
reg [5:0]cnt_53;
reg [4:0]cnt_24;








parameter PAGE_ONE='d1;					//0页起始地址0-11488   （9*24*53）一行块 
parameter PAGE_TWO='d11449;				//1页起始地址11489-22896
parameter ADDR_ADJUST_H='d208;			//读块时，换行地址偏移量      addr+9*24-9+1=208				(9*24=216为一行地址)
parameter ADDR_ADJUST_B='d11231;		//读块时，换块地址偏移量   addr-(9*24*52-1)；	9*24*52-1=11231


//换页脉冲识别
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
		begin
		reg_0<=0;
		reg_1<=0;
		end
	else 
		begin 
		reg_0<=page_sel;
		reg_1<=reg_0;
		end
end


//读使能控制
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
	begin

	rd_start<=0;
	end
	else if(rd_flag)
	rd_start<=1'b1;
	else if(rd_en&&cnt_rd9=='d9&&cnt_53=='d53&&cnt_24=='d24)
	rd_start<=1'b0;
	else
	rd_start<=rd_start;
end	
	
assign rd_en=(cnt_6=='d3&&rd_start)?1'b1:1'b0;



//跳地址计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
	cnt_rd9<='d1;
	else if(rd_en)
		begin
			if(cnt_rd9=='d9)
			cnt_rd9<='d1;
			else
			cnt_rd9<=cnt_rd9+1'b1;
		end
	
	else cnt_rd9<=cnt_rd9;
	
end






//读地址控制
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
	begin
	rd_addr_reg<='d1;
	test_cnt<='d11449;
	end
	else if(rd_flag&&page_sel)			//写完第一行，准备读地址
	rd_addr_reg<=PAGE_ONE;
	else if(rd_flag&&!page_sel)
	rd_addr_reg<=PAGE_TWO;
	
	else if(rd_en)
		begin
		test_cnt<=test_cnt+1'b1;
				if(cnt_rd9=='d9)
				begin if(cnt_53=='d53)
						rd_addr_reg<=rd_addr_reg-ADDR_ADJUST_B;
					 else
						rd_addr_reg<=rd_addr_reg+ADDR_ADJUST_H;
				end	
			 else
				begin
				rd_addr_reg<=rd_addr_reg+1'b1;
				
				end
		end
	
	else  begin
		rd_addr_reg<=rd_addr_reg;
		test_cnt<=test_cnt;
		end
end

//地址延迟一个时钟
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
	rd_addr<='d1;
	else
	rd_addr<=rd_addr_reg;

end


//在读行计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
	cnt_53<='d1;
	else if(rd_en&&cnt_rd9=='d9)
		begin
			if(cnt_53=='d53)
			cnt_53<='d1;
			else
			cnt_53<=cnt_53+1'b1;
		end
	
	else cnt_53<=cnt_53;
	
end



//行块计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
	cnt_24<='d1;
	else if(rd_en&&cnt_rd9=='d9&&cnt_53=='d53)
		begin
			if(cnt_24=='d24)
			cnt_24<='d1;
			else
			cnt_24<=cnt_24+1'b1;
		end
	
	else cnt_24<=cnt_24;
	
end
//在处理分区计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n)
	cnt_360<='d1;
	else if(rd_en&&cnt_rd9=='d9&&cnt_53=='d53)
		begin
			if(cnt_360=='d360)
			cnt_360<='d1;
			else
			cnt_360<=cnt_360+1'b1;
		end
	
	else cnt_360<=cnt_360;
	
end














endmodule