module ddr_rd_receiver(
input clk_x1,
input rst_n,
input rd_valid,
input rd_end,
input [63:0]rd_data,


output  buf_en,
output reg [8:0]cnt_buf,
output reg [7:0] max_gray

);

reg [8:0]cnt_477;


wire [7:0] temp_12;			//用于最大值计算电路
wire [7:0] temp_34;
reg [7:0] temp_56;
reg [7:0] temp_14;
wire [7:0] max;

wire [7:0]data_r1;		
wire [7:0]data_r2;
wire [7:0]data_r3;
wire [7:0]data_r4;
wire [7:0]data_r5;
wire [7:0]data_r6;

assign data_r1=rd_data[47:40];
assign data_r2=rd_data[39:32];
assign data_r3=rd_data[31:24];
assign data_r4=rd_data[23:16];
assign data_r5=rd_data[15:8];
assign data_r6=rd_data[7:0];




//分区最大值计算

assign temp_12=(data_r1>=data_r2)?data_r1:data_r2;
assign temp_34=(data_r3>=data_r4)?data_r3:data_r4;
//assign temp_56=(data_r5>=data_r6)?data_r5:data_r6;
//assign temp_14=(temp_12>=temp_34)?temp_12:temp_34;
assign max    =(temp_14>=temp_56)?temp_14:temp_56;


always@(posedge clk_x1 or negedge rst_n) begin 
	if(!rst_n)
	
	max_gray<=0;
	
	else begin
			if(rd_valid&&rd_end)
				begin
					if(temp_12>=temp_34)
					temp_14<=temp_12;
					else
					temp_14<=temp_34;
					
					if(data_r5>=data_r6)
					temp_56<=data_r5;
					else
					temp_56<=data_r6;
					
				end
			else
				begin
				if(max>max_gray)
				max_gray<=max;
				else 
				max_gray<=max_gray;
				
				end
		end
	
end


assign buf_en=(cnt_477=='d477)?1'b1:1'b0;
//最大值输出计数	
always@(posedge clk_x1 or negedge rst_n) begin 
	if(!rst_n)
	begin
	cnt_477<=0;
	cnt_buf<=0;
	end
	else if(rd_valid&&rd_end)
		begin
			if(cnt_477=='d477)
				begin
				cnt_477<='d1;
					if(cnt_buf=='d360)
					cnt_buf<='d1;
					else
					cnt_buf<=cnt_buf+1'b1;
				end
			
			else
				cnt_477<=cnt_477+1'b1;
		end
		
end


endmodule