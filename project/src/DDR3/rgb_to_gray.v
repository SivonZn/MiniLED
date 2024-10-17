module rgb_to_gray(
input i_pix_clk,
input rst_n,
input data_de,
input[7:0] data_r,
input[7:0] data_g,
input[7:0] data_b,


output reg [7:0] gray,
output reg [10:0]pix_x,//1280*800 像素坐标
output reg [10:0]pix_y
);

//行计数器对像素时钟计数
always@ (posedge i_pix_clk or negedge rst_n) begin
    if(!rst_n) 
        pix_x <= 11'd0;
    else if(data_de)
	begin
        if(pix_x =='d1280)
            pix_x <= 11'd1;
        else
            pix_x <= pix_x + 1'b1;           
    end
end

//场计数器对行计数
always@ (posedge i_pix_clk or negedge rst_n) begin
    if(!rst_n) 
        pix_y <= 11'd1;
    else if(data_de)
	begin
        if(pix_x =='d1280) begin
            if(pix_y == 'd800)
                pix_y <= 11'd1;
            else
                pix_y <= pix_y + 1'b1;    
        end
    end    
end

//灰度转换

	

always@ (posedge i_pix_clk or negedge rst_n) begin
	 if(!rst_n) 
        gray <= 8'd0;
	else if(data_de)
	begin	
		gray<=('d306*data_r+'d601*data_g+'d117*data_b)/'d1024;						//(0.299*data_r+0.587*data_g+0.144*data_b)*1024/1024;
	end
end

endmodule