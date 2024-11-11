module AP3216_driver (
    input I_clk,
    input I_reset,
    // I2C 
    inout wire sda,
    output wire scl,
    // 处理后的实时背光亮度值
    output reg [7:0] O_bright_data
);

wire [11:0] bright_data;

    // 状态
    localparam DECTECT      = 2'b00;
    localparam WAIT         = 2'b01;
    localparam CHANGE       = 2'b10;
    reg [1:0] state;
    reg [1:0] next_state;

    // 亮度寄存器
    reg [11:0] last_bright;
    reg [11:0] target_bright;
    reg [11:0] new_bright_data;

    // 延迟控制寄存器
    reg ms_delay_flag;
    reg [26:0] ms_delay_count;
    reg s_delay_flag;
    reg [30:0] s_delay_count;
	
	reg clk_25M;
	always @(posedge I_clk) begin
	  if(!I_reset) 
	  clk_25M<=0;
	  else
	  clk_25M<=~clk_25M;
	end
	

    // 12位数据转8位，并限制最低值
    always @(posedge I_clk) begin 
        if(new_bright_data < 64) begin
            O_bright_data <= 8'd4;
        end
        else begin
            O_bright_data <= new_bright_data >> 4;
        end
    end

    // 状态机 
    always @(posedge I_clk or negedge I_reset) begin 
        if(!I_reset) begin

            // 初始化用于延迟的数据
            s_delay_flag <= 0;
            s_delay_count <= 'd50_000_000;
            ms_delay_flag <= 0;
            ms_delay_count <= 'd50_000;

            // 初始化默认亮度
            last_bright <= 12'd2048;
            target_bright <= 12'd2048;
            new_bright_data <= 12'd2048;

            // 初始化状态机
            state <= DECTECT;
            next_state <= DECTECT;
        end
        else begin
            state = next_state;
            case (state)
                // 检测亮度大幅变化
                DECTECT:    begin 
                                if(bright_data < last_bright + 1500 || bright_data > last_bright - 1500) begin
                                    s_delay_flag <= 1; // 进入延迟
                                    next_state <= WAIT;
                                end
                                else begin
                                    last_bright <= bright_data;
                                    next_state <= DECTECT;
                                end
                            end

                // 等待，用于确定进行亮度调整
                WAIT:       begin 
                                if(s_delay_flag == 1) begin // 2s 延迟
                                    if(s_delay_count == 0) begin
                                        s_delay_count  <= 'd100_000_000;
                                        s_delay_flag <= !s_delay_flag;
                                        next_state <= WAIT;
                                    end
                                    else begin
                                        s_delay_count <= s_delay_count - 1'b1;
                                        next_state <= WAIT;
                                    end
                                end
                                else begin
                                    if(als_avg > last_bright + 1500 || als_avg < last_bright - 1500) begin // 当这两秒内亮度平均值确实发生了变化
                                        target_bright <= als_avg;
                                        ms_delay_flag <= 1;
                                        next_state <= CHANGE; // 开始调整亮度
                                    end
                                    else begin
                                        last_bright <= als_avg;
                                        next_state <= DECTECT; // 返回检测
                                    end
                                end
                            end

                // 平滑调整亮度
                CHANGE :    begin 
                                if(ms_delay_flag == 1) begin // 亮度每 1ms 跳变一次
                                    if(ms_delay_count == 0) begin
                                        ms_delay_count  <= 'd50_000;
                                        ms_delay_flag <= !ms_delay_flag;
                                        next_state <= CHANGE;
                                    end
                                    else begin
                                        ms_delay_count <= ms_delay_count - 1'b1;
                                        next_state <= CHANGE;
                                    end
                                end
                                else begin // 亮度变化过程
                                    if(new_bright_data > target_bright) begin
                                        new_bright_data <= new_bright_data - 1'b1;
                                        ms_delay_flag = 1;
                                        next_state <= CHANGE;
                                    end
                                    else if(new_bright_data < target_bright) begin
                                        new_bright_data <= new_bright_data + 1'b1;
                                        ms_delay_flag = 1;
                                        next_state <= CHANGE;
                                    end 
                                    else begin
                                        last_bright <= target_bright;
                                        next_state <= DECTECT;
                                    end
                                end
                            end
            endcase
        end
    end

//===================================================================================
    // ALS 一秒内平均值计算部分
    reg [11:0] als_value[9:0];
    reg [11:0] als_avg;
    reg [3:0] als_cnt;
    reg als_100_clk;
    reg  [20:0] als_100_cnt;

    always @(posedge I_clk or negedge I_reset) begin
        if(!I_reset) begin
            als_avg <= 0;
        end
        else begin
            als_avg = ( als_value[0] + als_value[1] + als_value[2] +   // 取一秒内亮度的平均值
                        als_value[3] + als_value[4] + als_value[5] + 
                        als_value[6] + als_value[7] + als_value[8] + 
                        als_value[9]) / 10; 
        end
    end

    // 读取 ALS 值到 als_value 寄存器
    always @(posedge als_100_clk or negedge I_reset) begin 
        if(!I_reset) begin
            als_cnt <= 0;
        end
        else begin
            als_value[als_cnt] = bright_data;
            if(als_cnt == 9) begin
                als_cnt <= 0;
            end
            else begin
                als_cnt <= als_cnt + 1'b1;
            end
        end
    end

    // 生成用于 ALS 的 10Hz 时钟
    always @(posedge I_clk or negedge I_reset) begin 
        if(!I_reset) begin
            als_100_clk <= 0;
            als_100_cnt <= 'd249_999;
        end
        else if(als_100_cnt == 0) begin
            als_100_cnt  <= 'd249_999;
            als_100_clk <= !als_100_clk;
        end
        else begin
            als_100_cnt <= als_100_cnt - 1'b1;
        end
    end

//===================================================================================
// 实例化i2c_top 模块
i2c_top i2c_top_inst ( 
    .I_clk          (I_clk      ),
    .I_reset        (I_reset    ),
    .sda            (sda        ),
    .scl            (scl        ),
    .O_bright_data  (bright_data)
);

endmodule