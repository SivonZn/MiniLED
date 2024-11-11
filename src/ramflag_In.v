 module ramflag_In(
    input           clk,   // 25Mclk
    input           rst_n,
	
	input           i_pix_clk,
    input [7:0]     I_light_reg,
	input [8:0]     cnt_360         ,
	input  	        flag_done       ,
    
    input [1:0]     mode_selector   ,
    input [7:0]     I_bright        ,

    output          sdbpflag_wire   ,
    output [15:0]   wtdina_wire     ,
    output [9:0]    wtaddr_wire
);
    reg [11:0]      cnt;                //用于延迟 1250 个 dclk 等待配置寄存器时间。
    reg [30:0]      cnt1;               //用于周期性发送 sdbpflag 信号，可以设置 cnt1 长度修改发送 sdbpflag 信号时间间隔
    reg [9:0]       cnt2;               // 用于每帧暂存时间
    reg [13:0]      cnt3;               // 每一轮 addr 自加 +1 当 addr=cnt3 时点亮对应位置的灯珠
    reg             flag= 'd0;          //标志配置寄存器结束，可以发送 sdbp 数据了;
    reg             sdbpflag;
    reg [15:0]      wtdina;             //灯珠驱动亮度值
    reg [9:0]       wtaddr;             //灯珠驱动地址
    reg [7:0]       light_reg[360-1:0]; //缓存灯珠数据
    reg [8:0]       cnt_360_delay;      //对灰度数据坐标进行延迟修正


    assign sdbpflag_wire = sdbpflag;
    assign wtdina_wire = wtdina;
    assign wtaddr_wire = wtaddr;


    // cnt 记满后视为配置寄存器完毕
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            flag <= 0;
            cnt <= 0;
        end
        else if(cnt < 2500) begin
            flag <= 0;
            cnt <= cnt + 1;
        end
        else if(cnt == 2500) begin
            flag <= 1;
        end
    end

    // cnt1 用来计数 sdbpflag 的周期
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            cnt1 <= 0;
        end
        else if(cnt1 >= 420_000)begin
            cnt1 <= 0;
        end
        else begin
            cnt1 <= cnt1 + 1;
        end
    end

    // cnt2 用来计数流水灯状态下每颗灯点亮的持续时间
    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n) begin
            cnt2 <= 0;
        end
        else if(cnt1 == 0 && flag) begin 
            if(cnt2 == 19) begin // cnt2 是一颗灯保持亮的速率
                cnt2 <= 0;
            end
            else begin
                cnt2 <= cnt2 + 1;
            end
        end
    end

    // cnt3 用来计数点亮灯珠的位置
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            cnt3 <= 0;
        end
        else if(cnt1 == 1 && cnt2 == 0 && flag) begin
            if(cnt3 >= 359) begin
                cnt3 <= 0;
            end
            else begin
                cnt3 <= cnt3 + 1;
            end
        end
    end

    // 以下 always 块作用为控制输出信号
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            sdbpflag <= 0;
        end
        else if(cnt1 == 1 && flag)begin
            sdbpflag <= 1;
        end
        else if(cnt1 == 30 && flag)begin
            sdbpflag <= 0;  
        end
    end
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            wtaddr <= 0;
        end
        else if(cnt1 == 3) begin
            wtaddr <= 0;
        end 
        else if (cnt1 > 4 && cnt1 <=4+360 && flag) begin // cnt1:5-364 wtaddr:1-360
            wtaddr <= wtaddr + 1;
        end
        else if(cnt1 > 4+360) begin
            wtaddr <= 0; 
        end
    end

    //对输入的灯珠灰度值缓存
    always@(posedge i_pix_clk )begin
        if(!rst_n) begin
            cnt_360_delay <= 0;
        end
        else if(flag_done)begin
            light_reg[cnt_360_delay] <= I_light_reg;
            cnt_360_delay <= cnt_360;
        end
    end

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            wtdina <= 0;
        end
        else begin
            case(mode_selector)

                // 未处理的全背光模式
                2'b00:  begin
                            if(cnt1 > 3 && cnt1 <= 364 && flag)
                                wtdina <= 8'hE0 * 255; // 224*256 ; 
                            else
                                wtdina <= 0;
                        end

                // 分区背光左右 off/on 半屏对比
                2'b01:  begin
                            if(wtaddr%24==0 || (wtaddr-1)%24==0 || (wtaddr-2)%24==0 || 
                               (wtaddr-3)%24==0 || (wtaddr-4)%24==0 || (wtaddr-5)%24==0 || 
                               (wtaddr-6)%24==0 || (wtaddr-7)%24==0 || (wtaddr-8)%24==0 || 
                               (wtaddr-9)%24==0 || (wtaddr-10)%24==0 || (wtaddr-11)%24==0) begin
                                wtdina <= 8'hE0*255;
                            end
                            else begin
                                wtdina <=  light_reg[wtaddr] * 255;
                            end
                        end

                // 开启亮度自动调节的分区背光模式
                2'b10:  begin 
                            if(cnt1 > 3 && cnt1 <= 364 && flag) begin
                                wtdina <= light_reg[wtaddr] * I_bright;
                            end
                            else begin
                                wtdina <= 0;
                            end
                        end

                // 分区背光模式
                2'b11:  begin
                            if(cnt1 > 3 && cnt1 <= 364 && flag) begin
                                wtdina <= light_reg[wtaddr] * 255;
                            end
                            else begin
                                wtdina <= 0;
                            end
                        end
                // 全亮
                default:begin
                            if(cnt1>3 && cnt1<=364 && flag) begin
                                wtdina <= 16'hffff; 
                            end
                            else begin
                                wtdina <= 0;
                            end
                        end
            endcase
        end
    end

endmodule