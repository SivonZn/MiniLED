module block_360_ave(
input i_pix_clk,
input rst_n,
input data_de,
input [10:0]pix_x,//1280*800 像素坐标
input [10:0]pix_y,
input  [7:0]data_gray,
input [1:0] gray_mode,//算法模式切换
input r_Vsync_0,//场同步
input r_Hsync_0,//行同步
output reg [8:0] cnt_360,//分区坐标
output reg flag_done,//输出标志
output reg [7:0]buf_360_flatted	//输出数据

);
parameter H_TOTAL='d1280;
parameter V_TOTAL='d800;
reg flag;//有效像素标志
reg [7:0] max_gray;//行最大值
reg [7:0] ave_gray;//行均值
reg [13:0] ave_sum_h;//行像素灰度求和
reg [24*14-1:0] ave_sum_v;//行均值灰度求和
reg [5:0] cnt_h53;//行像素
reg [4:0] cnt_h24;//行块 24X15
reg [5:0] cnt_v53;//场像素
reg  [24*8-1:0] max_buf;//最大值寄存数组
reg  [24*8-1:0] ave_buf;//均值寄存数组
reg [7:0]buf_360_fore[360-1:0];//灰度值多帧缓存，用于动态修正
reg [7:0]buf_360_fore1[360-1:0];
reg [7:0]buf_360_fore2[360-1:0];
reg [7:0]buf_360_fore3[360-1:0];
reg [7:0]buf_360_fore4[360-1:0];
wire [7:0] BL_max;//最大值
wire [7:0] BL_ave;//均值
wire [7:0] BL_diff;//最大值与均值之差



//余量裁剪
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
	   flag<=0;
	else if(pix_x>'d3 && pix_x<=H_TOTAL-'d4) begin//头尾各减去4个像素，根据延迟进行修正
			if(pix_y>'d2 && pix_y<=V_TOTAL-'d3)
			 flag=1'b1;			
		   else flag<=0;
		  end
end


//对单个分区行53像素计数
always@(posedge i_pix_clk or negedge rst_n) begin
	 if(!rst_n) 
		cnt_h53<=0;
	else if(data_de&&flag)begin
			if(cnt_h53=='d52)			
			  cnt_h53<='d0;				
			else 
			  cnt_h53<=cnt_h53+1'b1;
		end
	else if(!flag)
	cnt_h53<=0;
end


//一行24分区计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
		cnt_h24<=0;
	else if(data_de&&flag)
		  if(cnt_h53=='d52)	begin		
			 if(cnt_h24=='d23)
				cnt_h24<='d0;
			else 
				cnt_h24<=cnt_h24+1'b1;
		 end	
	else if(r_Hsync_0)
		  cnt_h24<=0;
end


//分区53行计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
		cnt_v53<=0;
	else if(data_de&&flag)
		   if(cnt_h53=='d52&&cnt_h24=='d23) begin			
			  if(cnt_v53=='d52)
				 cnt_v53<='d0;
		     else 
				 cnt_v53<=cnt_v53+1'b1;
		  end					
end


//分区计数
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
		cnt_360<=0;
	else if(data_de&&flag)
		   if(cnt_h53=='d52&&cnt_v53=='d52) begin			
			  if(cnt_360=='d359)
				 cnt_360<='d0;
		     else 
				 cnt_360<=cnt_360+1'b1;
		  end	
	else if(r_Vsync_0)
		  cnt_360<=0;
end


//最大值统计
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
		max_gray<=8'b0;
	else if(data_de&&flag) begin
			 if(cnt_h53=='d0)
				max_gray<=data_gray;  //存入下一个分区的第一个数
		    else if(data_gray>max_gray)
				max_gray<=data_gray; //实时比较更新最大值
		end	
end



//最大值寄存与寄存器复位
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
	   max_buf<=192'b0;
	else if(data_de&&flag) 
			 if(cnt_h53=='d52) begin
				 if(cnt_v53=='d52)
					max_buf[((cnt_h24)* 8) +:8]<=8'b0;		//已完成当前分区的计算输出，将寄存器复位
			    else if(max_gray>max_buf[((cnt_h24) * 8) +:8])
					max_buf[((cnt_h24) * 8) +:8]<=max_gray;	//将每个分区的行最大值寄存到对应buffer
			end		
end



//均值算法和计算与复位
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
	   ave_sum_h<=14'b0;
	else if(data_de&&flag) begin
			if(cnt_h53=='d0)
			  ave_sum_h<=data_gray;
		   else 
			  ave_sum_h<=ave_sum_h + data_gray;	//求一行的灰度之和
		end
end




//行均值求和寄存与寄存器复位
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) 
		ave_sum_v<=336'b0;
	else if(data_de&&flag) 
			 if(cnt_h53=='d52) begin
				if(cnt_v53=='d52)
					ave_sum_v[((cnt_h24)* 14) +:14]<=14'b0;//已完成当前分区的计算输出，将寄存器复位
			   else 
					ave_sum_v[((cnt_h24)* 14) +:14] <= ave_sum_v[((cnt_h24)* 14) +:14]  +  ave_sum_h/'d52;//将行均值加入对应分区的buffer；
			end	
end





assign BL_max = (max_gray>max_buf[((cnt_h24) * 8) +:8]) ? max_gray : max_buf[((cnt_h24) * 8) +:8]; //实时最大值输出
assign BL_ave =ave_sum_v[((cnt_h24)* 14) +:14]/52; //实时均值输出
assign BL_diff= BL_max - BL_ave; //最大值与均值之差，用于判断最大值是否为非典型值															



///最大值优化算法
always@(posedge i_pix_clk or negedge rst_n) begin
	if(!rst_n) begin
		buf_360_flatted<=0;
		flag_done<=0;
	end else  begin 
				   if(cnt_h53=='d52 && cnt_v53=='d52 )begin 
				   	 flag_done<=1'b1;
				      case(gray_mode)
				   		 2'b01: begin	//MODE1 最大值优化算法								
				   		 			if(BL_diff>200)begin //非典型值判断
				   		 				buf_360_flatted <= (3*buf_360_fore[cnt_360]+3*buf_360_fore1[cnt_360]+2*buf_360_fore2[cnt_360]+buf_360_fore3[cnt_360]+buf_360_fore4[cnt_360]+(BL_max + BL_ave*3)/4 )/12;//动态修正最大值 
				   		 				buf_360_fore[cnt_360]<=(BL_max + BL_ave*3)/8;	//静态修正非典型最大值	
				   		 		   end else begin										
				   		 				buf_360_flatted <=(3*buf_360_fore[cnt_360]+3*buf_360_fore1[cnt_360]+2*buf_360_fore2[cnt_360]+buf_360_fore3[cnt_360]+buf_360_fore4[cnt_360]+2*BL_max )/12; //动态修正最大值
				   		 				buf_360_fore [cnt_360]<=BL_max;
				   				   end 
				   		 			buf_360_fore1[cnt_360]<=buf_360_fore[cnt_360]; //缓存数帧灰度值，用于动态修正
				   		 			buf_360_fore2[cnt_360]<=buf_360_fore1[cnt_360];								 										
				   		 			buf_360_fore3[cnt_360]<=buf_360_fore2[cnt_360]; 
				   		 			buf_360_fore4[cnt_360]<=buf_360_fore3[cnt_360]; 			
				   		 	end							
				   		 2'b10: begin   //MODE2 最大值静态修正算法
				   					if(BL_diff>200) 
				   		 				buf_360_flatted <= (BL_max +3*BL_ave)/8;			
				   		 			else 
				   		 				buf_360_flatted <= BL_max ;
				   		 	end
				   		 2'b11: 
				   				buf_360_flatted <= BL_max ;		//MODE3 传统最大值算法
				   		 	
				   		  default:buf_360_flatted <= BL_max;
				    endcase
				  end else
					flag_done<=0;	
			end
end

endmodule