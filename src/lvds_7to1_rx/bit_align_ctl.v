
`include "lvds_7to1_rx_defines.v"
`timescale 1 ns/ 1 ps

module bit_align_ctl
(
    input            reset        ,
    input            rx_clk       ,
    input      [6:0] rxclk_word   ,
    input            bit_aln_en   ,
    output     [3:0] O_PSDA       ,
    output     [3:0] O_DUTYDA     ,
    output           O_dphase_lock     
);

//=======================================================
`ifdef RX_CLK_PATTERN_1100011
    localparam RX_CLK_PT = 7'b1100011;
`endif

`ifdef RX_CLK_PATTERN_1100001
    localparam RX_CLK_PT = 7'b1100001;
`endif

//==========================================================        
localparam IDLE        = 4'd0; 
localparam D_PHASE     = 4'd1;
localparam JUDGE       = 4'd2;
localparam LOCK        = 4'd3;

`ifdef SIM
    localparam TIME_SWITCH = 32'h0000_3fff;
    localparam TIME_CHECK  = 32'h0000_3000;
    localparam PAT_CNT_S   = 32'h0000_1fff;
    localparam PAT_CNT_E   = 32'h0000_2fff;
    localparam PAT_DIFF    = 32'h0000_1001;
    localparam TIME_JUDGE  = 16'h03ff;
`else
    localparam TIME_SWITCH = 32'h008f_ffff;
    localparam TIME_CHECK  = 32'h008f_f000;
    localparam PAT_CNT_S   = 32'h001f_ffff;
    localparam PAT_CNT_E   = 32'h006f_ffff;
    localparam PAT_DIFF    = 32'h0050_0001;
    localparam TIME_JUDGE  = 16'h03ff;
`endif

`ifdef AUTO_PHASE
    localparam INIT_PHASE = `AUTO_INIT_PHASE; // 4'd0, 4'd8
`else
    localparam INIT_PHASE = 4'd0; // 4'd0, 4'd8
`endif

reg  [3:0]  current_state;         
reg  [3:0]  next_state;
     
reg  [31:0] time_cnt;//定时器
reg  [3:0]  phase_cnt;//相位计数0~7

reg  [15:0] judge_cnt;//定时器

reg  [31:0] pat_cnt_se;//检查pattern持续时间计数器
            
reg  [3:0]  phase_start;//能识别到clock pattern起始相位  
reg  [3:0]  phase_end;  //能识别到clock pattern结束相位
reg         start_confirm;//1, lock
     
reg  [7:0]  phase_flag;//8 phase confirm flag

wire [3:0]  phase_diff;
reg         dphase_lock; 
reg  [3:0]  PSDA/*synthesis syn_keep=1*/;
reg  [3:0]  PSDA_tmp/*synthesis syn_keep=1*/;
wire [4:0]  DUTYDA_tmp;

//=======================================================
//FSM
always @(posedge rx_clk or posedge reset)
begin
    if(reset)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always @(*)
begin
    if (reset) 
        next_state <= IDLE;
    else if (bit_aln_en == 1'b1)
        case (current_state) 
            IDLE    : 
                begin
                    next_state <= D_PHASE;  
                end
                        
            D_PHASE : 
                begin
                    if (phase_cnt == (INIT_PHASE+4'd7) && time_cnt == TIME_SWITCH)
                        next_state <= JUDGE;
                    else
                        next_state <= D_PHASE;
                end
                    
            JUDGE   : 
                begin
                    if(phase_flag!=8'd0 && (judge_cnt == (TIME_JUDGE+8'd255)))
                        next_state <= LOCK;
                    else if(phase_flag==8'd0 && (judge_cnt == (TIME_JUDGE+8'd255)))
                        next_state <= IDLE;
                    else
                        next_state <= JUDGE;
                end
                    
            LOCK    : 
                begin
                    next_state <= LOCK;
                end 
            
            default :
                begin
                    next_state <= IDLE;
                end
        endcase  
    else
        next_state <= next_state;
end

//====================================================== 
//D_PHASE状态长counter
always @(posedge rx_clk or posedge reset)
begin
    if (reset) 
        begin
            time_cnt <= 32'd0;
        end 
    else if (bit_aln_en) 
        begin
            if (current_state == D_PHASE) 
                begin
                    if(time_cnt>=TIME_SWITCH)
                        time_cnt <= 32'd0;
                    else
                        time_cnt <= time_cnt + 1'b1;
                end
            else
                time_cnt <= 32'd0;       
        end
    else
        begin
            time_cnt <= 32'd0;
        end
end

//8个phase counter
always @(posedge rx_clk or posedge reset)
begin
    if (reset) 
        begin
            phase_cnt <= INIT_PHASE;
        end 
    else if (bit_aln_en) 
        begin
            if (current_state == D_PHASE && time_cnt == TIME_SWITCH) 
                phase_cnt <= phase_cnt + 1'b1;
            else
                phase_cnt <= phase_cnt;       
        end
    else
        begin
            phase_cnt <= phase_cnt;  
        end
end

//JUDGE状态计数
always @(posedge rx_clk or posedge reset)
begin
    if (reset) 
        begin
            judge_cnt <= 16'd0;
        end 
    else if (bit_aln_en) 
        begin
            if (current_state == JUDGE) 
                begin
                    if(judge_cnt == (TIME_JUDGE+8'd255))
                        judge_cnt <= 16'd0;
                    else
                        judge_cnt <= judge_cnt + 1'b1;
                end
            else
                judge_cnt <= 16'd0;       
        end
    else
        begin
            judge_cnt <= 16'd0;  
        end
end


//------------------------------------------
always @(posedge rx_clk or posedge reset)
begin
    if (reset) 
        begin
            pat_cnt_se <= 32'd0;
        end 
    else if (bit_aln_en) 
        begin
            if (current_state == D_PHASE) 
                begin
                    if(time_cnt == 32'd1)
                        pat_cnt_se <= 32'd0;
                    else if(time_cnt >= PAT_CNT_S && time_cnt <= PAT_CNT_E)
                        begin
                            if(rxclk_word == RX_CLK_PT || rxclk_word == {RX_CLK_PT[5:0],RX_CLK_PT[6]} || rxclk_word == {RX_CLK_PT[4:0],RX_CLK_PT[6:5]} ||
                               rxclk_word == {RX_CLK_PT[3:0],RX_CLK_PT[6:4]} || rxclk_word == {RX_CLK_PT[2:0],RX_CLK_PT[6:3]} || 
                               rxclk_word == {RX_CLK_PT[1:0],RX_CLK_PT[6:2]} || rxclk_word == {RX_CLK_PT[0],RX_CLK_PT[6:1]})
                                pat_cnt_se <= pat_cnt_se + 1'b1;
                            else
                                pat_cnt_se <= pat_cnt_se;
                        end
                    else
                        pat_cnt_se <= pat_cnt_se;
                end
            else
                pat_cnt_se <= 32'd0;       
        end
    else
        begin
            pat_cnt_se <= 32'd0;  
        end
end

always @(posedge rx_clk or posedge reset)
begin
    if (reset) 
        begin
            phase_start   <= INIT_PHASE;  
            phase_end     <= INIT_PHASE;  
            start_confirm <= 1'b0;
            phase_flag    <= 8'd0;
        end 
    else if (bit_aln_en) 
        begin
            if (current_state == D_PHASE && time_cnt == TIME_CHECK) 
                begin
                    if(pat_cnt_se == PAT_DIFF)
                        begin
                            phase_end     <= phase_cnt     ;
                            phase_flag[phase_cnt-INIT_PHASE] <= 1'b1;                          
                            if(start_confirm==1'b0)
                                begin
                                    phase_start   <= phase_cnt   ;  
                                    start_confirm <= 1'b1 ;
                                end
                            else
                                begin
                                    phase_start   <= phase_start  ;  
                                    start_confirm <= start_confirm;
                                end
                        end
                    else
                        begin
                            phase_start   <= phase_start   ;  
                            phase_end     <= phase_end     ;  
                            start_confirm <= start_confirm ;
                            phase_flag    <= phase_flag    ;
                        end
                end
            else
                begin
                    phase_start   <= phase_start   ;  
                    phase_end     <= phase_end     ;  
                    start_confirm <= start_confirm ;
                    phase_flag    <= phase_flag    ;
                end      
        end
    else
        begin
            phase_start   <= phase_start  ;  
            phase_end     <= phase_end    ;  
            start_confirm <= start_confirm; 
            phase_flag    <= phase_flag    ;
        end
end

//--------------------------------
//求差
assign phase_diff = phase_end - phase_start;

always @(posedge rx_clk or posedge reset)
begin
    if (reset) 
        begin
            PSDA <= INIT_PHASE;
        end 
    else if (bit_aln_en) 
        begin
            if (current_state == JUDGE && judge_cnt == TIME_JUDGE) 
                PSDA <= phase_start + phase_diff[3:1] + 1'b1;
            else
                PSDA <= PSDA;       
        end
    else
        begin
            PSDA <= PSDA;  
        end
end
   

//====================================================== 
always @(posedge rx_clk or posedge reset)
begin
    if (reset) 
        begin
            PSDA_tmp <= INIT_PHASE;
            dphase_lock <= 1'b0;
        end 
    else if (bit_aln_en) 
        begin
            // PSDA_tmp <= 4'd0;
            // dphase_lock <= 1'b1;
            if (current_state == LOCK) 
                begin
                    PSDA_tmp <= PSDA;
                    dphase_lock <= 1'b1;
                end
            else
                begin
                    PSDA_tmp <= phase_cnt;
                    dphase_lock <= 1'b0;
                end
        end
    else
        begin
            PSDA_tmp <= PSDA_tmp; 
            dphase_lock <= 1'b0;
        end
end

assign DUTYDA_tmp = O_PSDA+4'd8;
assign O_DUTYDA = DUTYDA_tmp[3:0];

`ifdef AUTO_PHASE
    assign O_PSDA = PSDA_tmp;
    assign O_dphase_lock = dphase_lock;
`endif

`ifdef MANUAL_PHASE
    assign O_PSDA = `RX_CLKOUTP_PHASE;
    assign O_dphase_lock = 1'b1;
`endif


endmodule