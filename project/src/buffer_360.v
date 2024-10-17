module buffer_360(
    input clk_x1,
    input rst_n,
    input buf_en,
    input [8:0] cnt_buf,
    input [7:0] gray,

    input rd_buf_en,		//读使能
    input [8:0] array_map,	//读地址

    output reg [360*8-1:0]buf_360_flatted	//读出数据

);

reg [7:0] buf_360 [0:360];// 0为空

always@(posedge clk_x1 or negedge rst_n) begin 
	if(!rst_n)
        buf_360[cnt_buf] <= 0;
	else if(buf_en)
		buf_360[cnt_buf] <= gray;
end

//读出数据（reg）
//	always@(posedge clk_x1 or negedge rst_n) begin 
//		if(!rst_n)
//		gray_data<=0;
//		else if(rd_buf_en)
//		gray_data<=buf_360[array_map];
//		else
//		gray_data<=gray_data;
//	
//	end

integer i;
always@* begin
    for(i = 1; i < 360 + 1; i = i + 1) begin
        buf_360_flatted[(i - 1) * 8 +:8] <= buf_360[i];
    end
end

endmodule