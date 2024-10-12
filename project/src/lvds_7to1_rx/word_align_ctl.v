module word_align_ctl 
(input   wire        clk            // clock -> sclk
,input   wire        rst            // asynchronous reset
,input   wire  [6:0] clock_word     // deserializer (IDDRX71) output
,input   wire        align_enable   // ciruit enable
,output  reg         slip           // slip command to deserializer
,output  reg         clock_word_lock// slip command to deserializer
);

//=======================================================
`ifdef RX_CLK_PATTERN_1100011
    localparam RX_CLK_PT = 7'b1100011;
`endif

`ifdef RX_CLK_PATTERN_1100001
    localparam RX_CLK_PT = 7'b1100001;
`endif

//=======================================================
reg     [5:0]   count;          // counter

always @ (posedge clk or posedge rst)
    if (rst) begin   
        count <= 6'd0;
    end 
    else begin
        if (!align_enable)
            count <= 6'd0;
        else
            count <= count + 1'b1;
    end

always @ (posedge clk or posedge rst)
    if (rst) begin   
        slip <= 1'b0;
    end 
    else begin
        if((count == 6'd1) && (clock_word != RX_CLK_PT)) begin
            slip <= 1'b1;
        end 
        else if((count == 6'd2) || !align_enable) begin
            slip <= 1'b0;
        end
    end

always @ (posedge clk or posedge rst)
begin
    if (rst)   
        clock_word_lock <= 1'b0;
    else if(clock_word == RX_CLK_PT)
        clock_word_lock <= 1'b1;
    else
        clock_word_lock <= 1'b0;
end

endmodule
