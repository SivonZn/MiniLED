module rgb_to_data_gray(
	input i_pix_clk,
	input rst_n,
	input data_de,	
	input[7:0] data_r,
	input[7:0] data_g,
	input[7:0] data_b,
	output reg [7:0] data_gray,
	output reg [10:0]pix_x,//1280*800 像素坐标
	output reg [10:0]pix_y
);

//计数像素行坐标
always@ (posedge i_pix_clk or negedge rst_n) begin
    if(!rst_n) 
        pix_x <= 11'd0;
    else if(data_de)begin
			if(pix_x =='d1280)
             pix_x <= 11'd1;
		   else
             pix_x <= pix_x + 1'b1;           
    end else 
		pix_x <= 11'b0;
end

//计数像素场坐标
always@ (posedge i_pix_clk or negedge rst_n) begin
    if(!rst_n) 
       pix_y <= 11'd1;
    else if(data_de) begin
		if(pix_x == 'd1279) begin
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
        data_gray <= 8'd0;
	else if(data_de) 		
		  data_gray <= ('d306 * data_r + 'd601 * data_g + 'd117 * data_b) / 'd1024;						//(0.299*data_r+0.587*data_g+0.144*data_b)*1024/1024;
end

endmodule