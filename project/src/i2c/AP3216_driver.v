module AP3216_driver (
    input I_clk,
    input I_reset,

    inout wire sda,
    output wire scl,

    output reg [11:0] O_bright_data
);

wire [11:0] bright_data;

    localparam DECTECT  = 2'b00;
    localparam WAIT     = 2'b01;
    localparam CHANGE   = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;

    reg [11:0] last_bright;
    wire [11:0] current_bright;
    reg [11:0] target_bright;

    reg ms_delay_flag;
    reg [15:0] ms_delay_count;
    reg s_delay_flag;
    reg [15:0] s_delay_count;

    assign current_bright = bright_data;

    always @(posedge I_clk or negedge I_reset) begin
        if(!I_reset) begin

            s_delay_flag <= 0;
            s_delay_count <= 'd50_000_000;
            ms_delay_flag <= 0;
            ms_delay_count <= 'd50_000;

            last_bright <= 12'd32768;
            target_bright <= 12'd32768;
            O_bright_data <= 12'd32768;

            state <= DECTECT;
            next_state <= DECTECT;
        end
        else if(I_clk) begin
            state = next_state;
            case (state)
                DECTECT : begin
                    if(current_bright < last_bright + 10000 || current_bright > last_bright - 10000) begin
                        last_bright <= current_bright;
                        s_delay_flag <= 1;
                        next_state <= WAIT;
                    end
                    else begin
                        last_bright <= current_bright;
                        next_state <= DECTECT;
                    end
                end
                WAIT : begin
                    if(s_delay_flag == 1) begin // 1s 延迟
                        if(s_delay_count == 0) begin
                            s_delay_count  <= 'd50_000;
                            s_delay_flag <= !s_delay_flag;
                            next_state <= WAIT;
                        end
                        else begin
                            s_delay_count <= s_delay_count - 1;
                            next_state <= WAIT;
                        end
                    end
                    else begin
                        if(current_bright > last_bright + 10000 || current_bright < last_bright - 10000) begin
                            target_bright <= current_bright;
                            ms_delay_flag <= 1;
                            next_state <= CHANGE;
                        end
                        else begin
                            last_bright <= current_bright;
                            next_state <= DECTECT;
                        end
                    end
                end
                CHANGE : begin
                    if(ms_delay_flag == 1) begin
                        if(ms_delay_count == 0) begin
                            ms_delay_count  <= 'd50_000;
                            ms_delay_flag <= !ms_delay_flag;
                            next_state <= CHANGE;
                        end
                        else begin
                            ms_delay_count <= ms_delay_count - 1;
                            next_state <= CHANGE;
                        end
                    end
                    else if(O_bright_data > target_bright - 16) begin
                        O_bright_data <= O_bright_data - 16;
                    end
                    else if(O_bright_data < target_bright + 16) begin
                        O_bright_data <= O_bright_data + 16;
                    end
                end
            endcase
        end
    end

i2c_top i2c_top_inst (
    .I_clk          (I_clk      ),
    .I_reset        (I_reset    ),
    .sda            (sda        ),
    .scl            (scl        ),
    .O_bright_data  (bright_data)
);

endmodule