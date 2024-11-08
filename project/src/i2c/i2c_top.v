module i2c_top(
    input I_clk,
    input I_reset,

    inout wire sda,
    output wire scl,

    output reg [11:0] O_bright_data
);

reg [7:0] data_in;

reg start;
reg read_enable;
reg write_enable;

reg [12:0]cnt_5000;
reg [13:0]cnt_10000;

wire [7:0] O_data_out;
wire busy;


    // 状态配置
    localparam START        = 3'b000;
    localparam WRITE_START  = 3'b001;
    localparam READ_START   = 3'b010;
    localparam WAITING      = 3'b011;
    localparam WAIT_STOP    = 3'b100;
    localparam STOP         = 3'b101;
    

    wire [7:0] init_data_0, init_data_1, read_data_0, read_data_1; // 预配置的数据
    reg [2:0] state, next_state; // 状态控制
    
    reg [7:0] data[3:0];    // 需要写入的数据
    reg [2:0] data_count;   // 当前数据位

    reg RW; // 读写标志位，RW=1 时为写，RW=0 时为读
    reg [11:0] getData; // 缓存读取的数据，等待完整后再次读取 
    reg init_flag;

    reg clk;
    reg [7:0] clk_cnt;

//	reg clk_16;
//	reg [7:0] clk_16_count;

    reg dummy_write; // 虚写地址标志位 

    assign init_data_0   = 8'h00; // 寄存器 0x00
    assign init_data_1   = 8'h01; // 对 0x00 写入 0x01 以启用 ALS
    assign read_data_0   = 8'h0d; // ALS 高八位寄存器数据（低四位有效）
    assign read_data_1   = 8'h0c; // ALS 低八位寄存器数据

    // 生成 1s 延迟, 5000*10000
//	 always @(posedge I_clk or negedge I_reset) begin
//			if(!I_reset)  begin
//				cnt_10000<=0;
//			end
//			else if(cnt_10000=='d9999)
//				cnt_10000<=0;
//			else 
//				cnt_10000 <= cnt_10000 + 1'b1;
//	end
//			
//	always @(posedge I_clk or negedge I_reset) begin
//        if(!I_reset) begin
//            start_flag <= 0;
//            cnt_5000<=0;
//        end
//        else if(cnt_10000=='d9999)begin
//            if(cnt_5000=='d4999) begin
//                start_flag <= ~start_flag;
//                cnt_5000 <= 0;
//            end
//            else 
//                cnt_5000<=cnt_5000+1'b1;
//        end
//	end

    // assign clk = clk_test;

    // 从50MHz时钟生成400KHz时钟，供 I2C 通信使用
    always @(posedge I_clk or negedge I_reset) begin
        if(!I_reset) begin
            clk_cnt <= 8'd0;
            clk <= 0;
        end
        else begin
            if(clk_cnt == 124) begin
                clk_cnt <= 0;
                clk <= ~clk;
            end
            else begin
                clk_cnt <= clk_cnt + 1'b1;
            end
        end
    end
	
// 1/16 逻辑分析仪采样时钟
//	always @posedge I_clk or negedge I_reset) begin
//        if(!I_reset) begin
//            clk_16_count <= 8'd0;
//            clk_16 <= 0;
//        end
//        else if(I_clk) begin
//            if(clk_16_count == 3) begin
//                clk_16_count <= 0;
//                clk_16 <= ~clk_16;
//            end
//            else begin
//                clk_16_count <= clk_16_count + 1;
//            end
//        end
//    end

    always @(posedge scl or negedge I_reset) begin //状态机
        if(!I_reset) begin  //数据初始化
            // 状态初始化
            next_state <= START;
            state <=- START;
            start  <= 0;

            // 初始化读写操作信号 
            read_enable <= 0;
            write_enable <= 0;

            // 初始化缓存的数据 
            data_in <= 0; 
            getData <= 0;

            // 将预配置数据传入data数组             
            data[0] <= init_data_0;
            data[1] <= init_data_1;
            data[2] <= read_data_0;
            data[3] <= read_data_1;

            data_count <= 0; // 从第一个数据开始
            RW <= 1; // 设置为写入
        end
        else begin // scl 上升沿触发
            state = next_state;
            // 默认回零
            start <= 0;
            write_enable <= 0;
            read_enable <= 0;

            case (state)
                START:      begin // 初始状态
                                if(RW) begin // 准备写入
                                    start <= 1;
                                    write_enable <= 1;
                                    next_state <= WRITE_START;
                                end
                                else begin // 准备读取 
                                    start <= 1;
                                    read_enable <= 1;
                                    next_state <= READ_START;
                                end
                            end

                WRITE_START:begin
                                data_in <= data[data_count]; //设置写入的数据
                                next_state <= WAITING;
                            end

                READ_START: begin
                                getData <= 0; // 清空缓存数据 
                                next_state <= WAITING;
                            end

                WAITING:    begin // 等待数据处理 
                                if(busy) begin // 等待一组数据处理完成
                                    if(RW == 0) begin // 当状态为写入时
                                        next_state <= WAITING;
                                    end
                                    else begin // 当状态为读取时
                                        next_state <= WAITING; 
                                    end
                                end
                                else begin // 读取/写入结束

                                    if(data_count == 0) begin // 当前位于第一个数据
                                        start <= 1;
                                        write_enable <= 1;
                                        data_count <= data_count + 1'd1; // 下一数据
                                        next_state <= WRITE_START;
                                    end

                                    else if(data_count == 1) begin // 当前位于第二个数据
                                        data_count <= data_count + 1'd1; // 下一数据
                                        // 切换为虚写地址的模式
                                        RW <= 1; // 写入模式                                            
                                        dummy_write <= 1; // 设置虚写状态 
                                        next_state <= WAIT_STOP; // 额外的一个scl周期延迟
                                    end

                                    else if(data_count == 2) begin // 当前位于第三个数据
                                        if(dummy_write == 1) begin // 当处于虚写地址的状态时
                                            // 开始读取
                                            start <= 1;
                                            read_enable <= 1;
                                            RW <= 0; // 切换为读取模式
                                            next_state <= READ_START;
                                            dummy_write = ~dummy_write; // 取消虚写状态                           
                                        end
                                        else begin // 处于非虚写地址状态，即读取结束
                                            getData[7:0] <= O_data_out; // 读出低八位数据
                                            data_count <= data_count + 1'd1; // 下一数据
                                            // 切换为虚写地址的模式
                                            start <= 1;
                                            write_enable <= 1;
                                            RW <= 1; // 切换为写入模式
                                            dummy_write <= 1; // 设置虚写状态 
                                            next_state <= WAIT_STOP; // 额外的一个scl周期延迟
                                        end
                                    end

                                    else if(data_count == 3) begin // 当前位于第四个数据
                                        if(dummy_write == 1) begin // 当处于虚写地址的状态时
                                            // 开始读取
                                            start <= 1;
                                            read_enable <= 1;
                                            RW <= 0; 
                                            next_state <= READ_START;
                                            dummy_write = ~dummy_write; // 取消虚写状态    
                                        end
                                        else begin // 处于非虚写地址状态，即读取结束
                                            getData[11:8] <= O_data_out[3:0]; // 读出高四位数据
                                            data_count <= 0; 
                                            RW <= 0; // 切换为读取模式
                                            next_state <= STOP;
                                        end
                                    end
                                end
                            end

                WAIT_STOP:  begin // 额外的一个scl周期延迟，用于写入或读取一段数据完成之后
                                next_state <= START;
                            end

                STOP:       begin // 用于重新读取
                                O_bright_data <= getData; // 输出缓存的数据
                                data_count <= 2; // 进入读取
                                RW <= 1; // 切换为写入模式
                                dummy_write <= 1; // 设置虚写状态 
                                next_state <= START;
                            end

                default:    begin // default
                                state <= state;
                            end
            endcase
        end
    end

i2c_controller i2c_controller_inst(             //实例化I2C控制器
    .I_clk(clk),                    // 系统时钟
    .I_reset(!I_reset),             // 系统复位
    .I_start(start),                // 开始信号
    .I_data_in(data_in),            // 要写入的数据
    .I_write_enable(write_enable),  // 写入使能
    .I_read_enable(read_enable),    // 读取使能
    .O_data_out(O_data_out),        // 读取的数据
    .O_busy(busy),                  // 正在进行I2C通信
    .scl(scl),                      // I2C时钟信号
    .sda(sda)                       // I2C数据信号
);


endmodule