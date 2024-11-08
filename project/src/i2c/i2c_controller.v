module i2c_controller (
    input wire I_clk,               // 系统时钟
    input wire I_reset,             // 系统复位
    input wire I_start,             // 开始信号
    input wire [7:0] I_data_in,     // 要写入的数据
    input wire I_write_enable,      // 写入使能
    input wire I_read_enable,       // 读取使能
    output reg [7:0] O_data_out,    // 读取的数据
    output reg O_busy,              // 正在进行I2C通信
    output reg scl,                 // I2C时钟信号
    inout wire sda                  // I2C数据信号
);

    // I2C 状态定义
    localparam IDLE         = 3'b000;
    localparam START        = 3'b001;
    localparam SEND_ADDR    = 3'b010;
    localparam SEND_RW      = 3'b011;
    localparam WAIT_ACK     = 3'b100;
    localparam WRITE_DATA   = 3'b101;
    localparam READ_DATA    = 3'b110;
    localparam STOP         = 3'b111;


    reg [2:0] state, next_state;
    reg [3:0] bit_cnt;
    reg sda_out, sda_enable;
    // reg slave_ready;
    wire [6:0] i2c_addr; // 外设地址
    wire raw_sda;
    wire sda_in;
    reg rw_flag;
    reg mode_change;
    reg sda_rw_change;
    reg data_to_write;
    reg addr_to_write;
    reg [1:0] clk_count;
    reg get_ack;

    // 将 SDA 配置为输入或输出
    assign sda = sda_enable ? sda_out : 1'bz;
    assign sda_in = sda;
    // assign raw_sda = sda;

    // 配置外设地址
    assign i2c_addr = 7'h1E;
    
    always @(posedge I_clk or posedge I_reset) begin
        if(I_reset) begin
            clk_count <= 0;
            scl <= 0;
        end else if(clk_count == 0) begin
            scl <= ~scl;
            clk_count <= clk_count + 1'b1;
        end
        else if(clk_count == 2) begin // I2C时钟信号生成，4:1，输入 clk 为 400kHz，输出 scl 为 100kHz
            scl <= ~scl;
            clk_count <= clk_count + 1'b1;
        end 
        else if(clk_count == 3) begin
            clk_count <= 1'b0;
        end
        else begin
            clk_count <= clk_count + 1'b1;
        end
    end

    always @(posedge I_clk or posedge I_reset) begin
        if(I_reset) begin
            state <= IDLE;
        end
        else begin
            if(clk_count == 1) begin
                data_to_write <= I_data_in[bit_cnt];
                addr_to_write <= i2c_addr[bit_cnt];
                state <= next_state;
            end
            // else if(clk_count == 3) begin
            //     sda_in <= raw_sda;
            // end
        end
    end

    // 状态机
    always @(posedge I_clk or posedge I_reset) begin
        if (I_reset) begin
            next_state <= IDLE;
            O_busy <= 0;
            O_data_out <= 0;
            sda_out <= 1;
            sda_enable <= 0; // 配置为接收
        end
        else if(clk_count == 1) begin
            if(mode_change) begin
                sda_out <= 0;
                mode_change <= 0;
            end
        end
        else if(clk_count == 2) begin
            if(sda_rw_change == 1) begin
                sda_enable <= ~sda_enable; // 配置为接收
                sda_rw_change <= 0;
            end
        end
        else if(clk_count == 3) begin
            case (state)
                IDLE:       begin
                                O_busy <= 0;
                                if (I_start) begin
                                    if(I_write_enable) begin //设置为写入
                                        O_busy <= 1;
                                        rw_flag <= 0;
                                        next_state <= START;
                                    end
                                    else if(I_read_enable) begin //设置为读取
                                        O_busy <= 1;
                                        rw_flag <= 1;
                                        next_state <= START;
                                    end
                                    else begin
                                        next_state <= IDLE;
                                    end
                                end 
                                else begin
                                    next_state <= IDLE;
                                end
                            end

                START:      begin
                                sda_enable <= 1; // 配置为发送
                                mode_change <= 1; // 产生开始信号
                                next_state <= SEND_ADDR;
                                bit_cnt <= 6;
                            end

                SEND_ADDR:  begin
                                get_ack <= 0;
                                sda_out <= addr_to_write; // 发送设备地址
                                if (bit_cnt == 0) begin
                                    next_state <= SEND_RW;
                                    bit_cnt <= 4'd7;
                                end else begin
                                    bit_cnt <= bit_cnt - 1'b1;
                                end
                            end

                SEND_RW:    begin
                                sda_out <= rw_flag; // 发送R/W位
                                sda_rw_change <= 1;
                                next_state <= WAIT_ACK;
                                get_ack <= 0;
                            end

                WAIT_ACK:   begin // 处理XACK
                                if(rw_flag == 1 && sda_enable == 1) begin
                                    sda_out <= 1; // 响应NACK
                                    O_busy <= 0; //读取完成，结束忙状态
                                    next_state <= STOP;
                                end
                                else if(sda_in == 0) begin //从机ACK
                                    get_ack <= 1;
                                    if (O_busy) begin // 当从SEND_RW状态进入时
                                        if(rw_flag == 0) begin //如果是写入
                                            // slave_ready <= 1;
                                            next_state <= WRITE_DATA;
                                        end
                                        else begin //如果是读取
                                            // slave_ready <= 1;
                                            next_state <= READ_DATA;
                                        end
                                    end
                                    else if(I_write_enable) begin // 连续写入
                                        O_busy <= 1;
                                        bit_cnt <= 4'd7;
                                        // sda_enable <= 1; // 配置为发送
                                        next_state <= WRITE_DATA;
                                    end
                                    else if(I_read_enable) begin // 写入切换读取
                                        O_busy <= 1;
                                        rw_flag <= 1;
                                        sda_out <= 1;
                                        // sda_enable <= 1; // 配置为发送
                                        next_state <= START;
                                    end
                                    else begin
                                        sda_rw_change <= 1;
                                        // slave_ready <= 0;
                                        next_state <= STOP;
                                    end
                                end
                                else begin
                                    // slave_ready <= 0;
                                    next_state <= STOP;
                                end
                            end

                WRITE_DATA: begin
                                sda_enable <= 1; // 配置为发送
                                sda_out <= data_to_write; // 发送数据
                                if (bit_cnt == 0) begin
                                    O_busy <= 0; //写入完成，结束忙状态
                                    bit_cnt <= 4'd7;
                                    sda_rw_change <= 1;
                                    next_state <= WAIT_ACK;
                                    get_ack <= 0;
                                end else begin
                                    bit_cnt <= bit_cnt - 1'b1;
                                end
                            end

                READ_DATA:  begin
                                sda_enable <= 0; 
                                O_data_out[bit_cnt] <= sda_in;
                                if(bit_cnt == 0) begin
                                    bit_cnt <= 4'd7;
                                    sda_rw_change <= 1;
                                    next_state <= STOP;
                                end
                                else begin
                                    bit_cnt <= bit_cnt - 1'b1;
                                end
                            end

                STOP:       begin
                                sda_out <= 1; // 产生停止信号
                                next_state <= IDLE;
                            end
            endcase
        end
        else begin
            next_state <= next_state;
        end
    end

endmodule
