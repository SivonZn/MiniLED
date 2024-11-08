// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] lvds_7to1_rx_top.v
//   \ \  / /\ \  / /    [Description ] LVDS 7:1 RX for Video 
//    \ \/ /  \ \/ /     [Timestamp   ] Friday November 20 14:00:30 2020
//     \  /    \  /      [version     ] 1.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     | 11/20/20     | Initial version 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

`include "lvds_7to1_rx_defines.v"

module LVDS_7to1_RX_Top 
(
    input            I_rst_n        ,
    output           O_pix_clk      , //x1   
    output reg       O_vs           ,
    output reg       O_hs           ,
    output reg       O_de           ,
    output     [3:0] O_pllphase     ,
    output           O_pllphase_lock,
    output           O_clkpat_lock  ,
`ifdef RX_ONE_CHANNEL
    `ifdef RX_RGB888
        input            I_clkin_p ,    
        input            I_clkin_n , 
        input      [3:0] I_din_p   ,    
        input      [3:0] I_din_n   ,  
        output reg [7:0] O_data_r  ,
        output reg [7:0] O_data_g  ,
        output reg [7:0] O_data_b  
    `endif 
    `ifdef RX_RGB666
        input            I_clkin_p ,    
        input            I_clkin_n , 
        input      [2:0] I_din_p   ,    
        input      [2:0] I_din_n   ,  
        output reg [5:0] O_data_r  ,
        output reg [5:0] O_data_g  ,
        output reg [5:0] O_data_b  
    `endif 
`endif 
`ifdef RX_TWO_CHANNEL
    `ifdef RX_RGB888
        input            I_clkin_p  ,    
        input            I_clkin_n  , 
        input      [3:0] I_dino_p   ,    
        input      [3:0] I_dino_n   , 
        input      [3:0] I_dine_p   ,    
        input      [3:0] I_dine_n   ,      
        output reg [7:0] O_data_ro  ,
        output reg [7:0] O_data_go  ,
        output reg [7:0] O_data_bo  ,
        output reg [7:0] O_data_re  ,
        output reg [7:0] O_data_ge  ,
        output reg [7:0] O_data_be 
    `endif 
    `ifdef RX_RGB666
        input            I_clkin_p  ,    
        input            I_clkin_n  , 
        input      [2:0] I_dino_p   ,    
        input      [2:0] I_dino_n   , 
        input      [2:0] I_dine_p   ,    
        input      [2:0] I_dine_n   ,      
        output reg [5:0] O_data_ro  ,
        output reg [5:0] O_data_go  ,
        output reg [5:0] O_data_bo  ,
        output reg [5:0] O_data_re  ,
        output reg [5:0] O_data_ge  ,
        output reg [5:0] O_data_be 
    `endif 
`endif 
);

`ifdef RX_ONE_CHANNEL
        wire [6:0]  rx_0;
        wire [6:0]  rx_1;
        wire [6:0]  rx_2;
    `ifdef RX_RGB888
        wire [6:0]  rx_3;
    `endif 
`endif 

`ifdef RX_TWO_CHANNEL
        wire [6:0]  rxo_0;
        wire [6:0]  rxo_1;
        wire [6:0]  rxo_2;
        wire [6:0]  rxe_0;
        wire [6:0]  rxe_1;
        wire [6:0]  rxe_2;
    `ifdef RX_RGB888
        wire [6:0]  rxo_3;
        wire [6:0]  rxe_3;
    `endif 
`endif 

wire        pll_lock;            // PLL locked status
wire  [6:0] RCLK_out_sclk/*synthesis syn_keep=1*/;       // 7-bit parallel clock data, sclk domain 
wire        ibuf_clk;

wire        dphase_lock; // status output, from bit_align module
reg         dphase_lock_d1;      // sync pipe
reg         dphase_lock_d2;      // sync pipe

wire        slip;
wire        clock_word_lock;

wire [3:0]  PSDA;
wire [3:0]  DUTYDA;

reg  [18:0] delay_count = 0;     // delay after RCLK_in established
reg         release_reset = 0;   // asserts at end of delay
reg         reset_sync;


//==============================================================================
`ifdef RX_ONE_CHANNEL
    `ifdef RX_VESA
        `ifdef RX_RGB888
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_r <= 8'd0;
                        O_data_g <= 8'd0;
                        O_data_b <= 8'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_r <= {rx_3[5], rx_3[6], rx_0[1], rx_0[2], rx_0[3], rx_0[4], rx_0[5], rx_0[6]};
                        O_data_g <= {rx_3[3], rx_3[4], rx_1[2], rx_1[3], rx_1[4], rx_1[5], rx_1[6], rx_0[0]};
                        O_data_b <= {rx_3[1], rx_3[2], rx_2[3], rx_2[4], rx_2[5], rx_2[6], rx_1[0], rx_1[1]};
                    end
                else
                    begin
                        O_data_r <= 8'd0;
                        O_data_g <= 8'd0;
                        O_data_b <= 8'd0;
                    end 
            end
        `endif
        `ifdef RX_RGB666
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_r <= 6'd0;
                        O_data_g <= 6'd0;
                        O_data_b <= 6'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_r <= {rx_0[1], rx_0[2], rx_0[3], rx_0[4], rx_0[5], rx_0[6]};
                        O_data_g <= {rx_1[2], rx_1[3], rx_1[4], rx_1[5], rx_1[6], rx_0[0]};
                        O_data_b <= {rx_2[3], rx_2[4], rx_2[5], rx_2[6], rx_1[0], rx_1[1]};
                    end
                else
                    begin
                        O_data_r <= 6'd0;
                        O_data_g <= 6'd0;
                        O_data_b <= 6'd0;
                    end 
            end
        `endif
    `endif
    
    `ifdef RX_JEIDA
        `ifdef RX_RGB888
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_r <= 8'd0;
                        O_data_g <= 8'd0;
                        O_data_b <= 8'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_r <= {rx_0[1], rx_0[2], rx_0[3], rx_0[4], rx_0[5], rx_0[6], rx_3[5], rx_3[6]};
                        O_data_g <= {rx_1[2], rx_1[3], rx_1[4], rx_1[5], rx_1[6], rx_0[0], rx_3[3], rx_3[4]};
                        O_data_b <= {rx_2[3], rx_2[4], rx_2[5], rx_2[6], rx_1[0], rx_1[1], rx_3[1], rx_3[2]};
                    end
                else
                    begin
                        O_data_r <= 8'd0;
                        O_data_g <= 8'd0;
                        O_data_b <= 8'd0;
                    end
            end
        `endif
        `ifdef RX_RGB666
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_r <= 6'd0;
                        O_data_g <= 6'd0;
                        O_data_b <= 6'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_r <= {rx_0[1], rx_0[2], rx_0[3], rx_0[4], rx_0[5], rx_0[6]};
                        O_data_g <= {rx_1[2], rx_1[3], rx_1[4], rx_1[5], rx_1[6], rx_0[0]};
                        O_data_b <= {rx_2[3], rx_2[4], rx_2[5], rx_2[6], rx_1[0], rx_1[1]};
                    end
                else
                    begin
                        O_data_r <= 6'd0;
                        O_data_g <= 6'd0;
                        O_data_b <= 6'd0;
                    end 
            end
        `endif
    `endif
    
    always @(posedge O_pix_clk or posedge reset_sync) 
    begin
        if(reset_sync == 1'b1) 
            begin
                O_vs <= 1'b0;
                O_hs <= 1'b0;
                O_de <= 1'b0;
            end 
        else if(clock_word_lock)
            begin   
                O_vs <= rx_2[1];
                O_hs <= rx_2[2];
                O_de <= rx_2[0];
            end
        else
            begin
                O_vs <= 1'b0;
                O_hs <= 1'b0;
                O_de <= 1'b0;
            end 
    end
`endif 

`ifdef RX_TWO_CHANNEL
    `ifdef RX_VESA
        `ifdef RX_RGB888
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_ro <= 8'd0;
                        O_data_go <= 8'd0;
                        O_data_bo <= 8'd0;
                        O_data_re <= 8'd0;
                        O_data_ge <= 8'd0;
                        O_data_be <= 8'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_ro <= {rxo_3[5], rxo_3[6], rxo_0[1], rxo_0[2], rxo_0[3], rxo_0[4], rxo_0[5], rxo_0[6]};
                        O_data_go <= {rxo_3[3], rxo_3[4], rxo_1[2], rxo_1[3], rxo_1[4], rxo_1[5], rxo_1[6], rxo_0[0]};
                        O_data_bo <= {rxo_3[1], rxo_3[2], rxo_2[3], rxo_2[4], rxo_2[5], rxo_2[6], rxo_1[0], rxo_1[1]};
                        O_data_re <= {rxe_3[5], rxe_3[6], rxe_0[1], rxe_0[2], rxe_0[3], rxe_0[4], rxe_0[5], rxe_0[6]};
                        O_data_ge <= {rxe_3[3], rxe_3[4], rxe_1[2], rxe_1[3], rxe_1[4], rxe_1[5], rxe_1[6], rxe_0[0]};
                        O_data_be <= {rxe_3[1], rxe_3[2], rxe_2[3], rxe_2[4], rxe_2[5], rxe_2[6], rxe_1[0], rxe_1[1]};
                    end
                else
                    begin
                        O_data_ro <= 8'd0;
                        O_data_go <= 8'd0;
                        O_data_bo <= 8'd0;
                        O_data_re <= 8'd0;
                        O_data_ge <= 8'd0;
                        O_data_be <= 8'd0;
                    end 
            end
        `endif
        `ifdef RX_RGB666
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_ro <= 6'd0;
                        O_data_go <= 6'd0;
                        O_data_bo <= 6'd0;
                        O_data_re <= 6'd0;
                        O_data_ge <= 6'd0;
                        O_data_be <= 6'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_ro <= {rxo_0[1], rxo_0[2], rxo_0[3], rxo_0[4], rxo_0[5], rxo_0[6]};
                        O_data_go <= {rxo_1[2], rxo_1[3], rxo_1[4], rxo_1[5], rxo_1[6], rxo_0[0]};
                        O_data_bo <= {rxo_2[3], rxo_2[4], rxo_2[5], rxo_2[6], rxo_1[0], rxo_1[1]};
                        O_data_re <= {rxe_0[1], rxe_0[2], rxe_0[3], rxe_0[4], rxe_0[5], rxe_0[6]};
                        O_data_ge <= {rxe_1[2], rxe_1[3], rxe_1[4], rxe_1[5], rxe_1[6], rxe_0[0]};
                        O_data_be <= {rxe_2[3], rxe_2[4], rxe_2[5], rxe_2[6], rxe_1[0], rxe_1[1]};
                    end
                else
                    begin
                        O_data_ro <= 6'd0;
                        O_data_go <= 6'd0;
                        O_data_bo <= 6'd0;
                        O_data_re <= 6'd0;
                        O_data_ge <= 6'd0;
                        O_data_be <= 6'd0;
                    end 
            end
        `endif
    `endif
    
    `ifdef RX_JEIDA
        `ifdef RX_RGB888
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_ro = 8'd0;
                        O_data_go = 8'd0;
                        O_data_bo = 8'd0;
                        O_data_re = 8'd0;
                        O_data_ge = 8'd0;
                        O_data_be = 8'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_ro = {rxo_0[1], rxo_0[2], rxo_0[3], rxo_0[4], rxo_0[5], rxo_0[6], rxo_3[5], rxo_3[6]};
                        O_data_go = {rxo_1[2], rxo_1[3], rxo_1[4], rxo_1[5], rxo_1[6], rxo_0[0], rxo_3[3], rxo_3[4]};
                        O_data_bo = {rxo_2[3], rxo_2[4], rxo_2[5], rxo_2[6], rxo_1[0], rxo_1[1], rxo_3[1], rxo_3[2]};
                        O_data_re = {rxe_0[1], rxe_0[2], rxe_0[3], rxe_0[4], rxe_0[5], rxe_0[6], rxe_3[5], rxe_3[6]};
                        O_data_ge = {rxe_1[2], rxe_1[3], rxe_1[4], rxe_1[5], rxe_1[6], rxe_0[0], rxe_3[3], rxe_3[4]};
                        O_data_be = {rxe_2[3], rxe_2[4], rxe_2[5], rxe_2[6], rxe_1[0], rxe_1[1], rxe_3[1], rxe_3[2]};
                    end
                else
                    begin
                        O_data_ro = 8'd0;
                        O_data_go = 8'd0;
                        O_data_bo = 8'd0;
                        O_data_re = 8'd0;
                        O_data_ge = 8'd0;
                        O_data_be = 8'd0;
                    end 
            end
        `endif
        `ifdef RX_RGB666
            always @(posedge O_pix_clk or posedge reset_sync) 
            begin
                if(reset_sync == 1'b1) 
                    begin
                        O_data_ro <= 6'd0;
                        O_data_go <= 6'd0;
                        O_data_bo <= 6'd0;
                        O_data_re <= 6'd0;
                        O_data_ge <= 6'd0;
                        O_data_be <= 6'd0;
                    end 
                else if(clock_word_lock)
                    begin   
                        O_data_ro <= {rxo_0[1], rxo_0[2], rxo_0[3], rxo_0[4], rxo_0[5], rxo_0[6]};
                        O_data_go <= {rxo_1[2], rxo_1[3], rxo_1[4], rxo_1[5], rxo_1[6], rxo_0[0]};
                        O_data_bo <= {rxo_2[3], rxo_2[4], rxo_2[5], rxo_2[6], rxo_1[0], rxo_1[1]};
                        O_data_re <= {rxe_0[1], rxe_0[2], rxe_0[3], rxe_0[4], rxe_0[5], rxe_0[6]};
                        O_data_ge <= {rxe_1[2], rxe_1[3], rxe_1[4], rxe_1[5], rxe_1[6], rxe_0[0]};
                        O_data_be <= {rxe_2[3], rxe_2[4], rxe_2[5], rxe_2[6], rxe_1[0], rxe_1[1]};
                    end
                else
                    begin
                        O_data_ro <= 6'd0;
                        O_data_go <= 6'd0;
                        O_data_bo <= 6'd0;
                        O_data_re <= 6'd0;
                        O_data_ge <= 6'd0;
                        O_data_be <= 6'd0;
                    end
            end
        `endif
    `endif
    
    always @(posedge O_pix_clk or posedge reset_sync) 
    begin
        if(reset_sync == 1'b1) 
            begin
                O_vs <= 1'b0;
                O_hs <= 1'b0;
                O_de <= 1'b0;
            end 
        else if(clock_word_lock)
            begin   
                O_vs <= rxe_2[1];
                O_hs <= rxe_2[2];
                O_de <= rxe_2[0];
            end
        else
            begin
                O_vs <= 1'b0;
                O_hs <= 1'b0;
                O_de <= 1'b0;
            end 
    end
`endif 

//==============================================================================
LVDS71RX_1CLK8DATA lvds_71_rx 
(
    .reset      (reset_sync   ),
    .I_PSDA     (PSDA         ),
    .I_DUTYDA   (DUTYDA       ),
    .slip       (slip         ),
    .lock       (pll_lock     ),                   
    .sclk       (O_pix_clk    ),  //x1     //4:3                   
    .clk_phase  (RCLK_out_sclk),
    .ibuf_clk   (ibuf_clk     ),
`ifdef RX_ONE_CHANNEL
    `ifdef RX_RGB888
        .clk        (I_clkin_p    ),
        .clk_n      (I_clkin_n    ),
        .datain     (I_din_p      ),
        .datain_n   (I_din_n      ),
        .q0         (rx_0         ),
        .q1         (rx_1         ),
        .q2         (rx_2         ),
        .q3         (rx_3         )
    `endif 
    `ifdef RX_RGB666
        .clk        (I_clkin_p    ),
        .clk_n      (I_clkin_n    ),
        .datain     (I_din_p      ),
        .datain_n   (I_din_n      ),
        .q0         (rx_0         ),
        .q1         (rx_1         ),
        .q2         (rx_2         )
    `endif 
`endif 
`ifdef RX_TWO_CHANNEL
    `ifdef RX_RGB888
        .clk        (I_clkin_p    ),
        .clk_n      (I_clkin_n    ),
        .dataino    (I_dino_p     ),
        .dataino_n  (I_dino_n     ),
        .dataine    (I_dine_p     ),
        .dataine_n  (I_dine_n     ),
        .qo0        (rxo_0        ),
        .qo1        (rxo_1        ),
        .qo2        (rxo_2        ),
        .qo3        (rxo_3        ),
        .qe0        (rxe_0        ),
        .qe1        (rxe_1        ),
        .qe2        (rxe_2        ),
        .qe3        (rxe_3        )
    `endif
    `ifdef RX_RGB666
        .clk        (I_clkin_p    ),
        .clk_n      (I_clkin_n    ),
        .dataino    (I_dino_p     ),
        .dataino_n  (I_dino_n     ),
        .dataine    (I_dine_p     ),
        .dataine_n  (I_dine_n     ),
        .qo0        (rxo_0        ),
        .qo1        (rxo_1        ),
        .qo2        (rxo_2        ),
        .qe0        (rxe_0        ),
        .qe1        (rxe_1        ),
        .qe2        (rxe_2        )
    `endif
`endif
); 

bit_align_ctl bit_aln_ctl_inst //PLL phase align
(.rx_clk        (O_pix_clk)
,.reset         (reset_sync)  
,.bit_aln_en    (pll_lock)//pll_lock_sync
,.rxclk_word    (RCLK_out_sclk)
,.O_PSDA        (PSDA  )
,.O_DUTYDA      (DUTYDA)
,.O_dphase_lock (dphase_lock) //TBD
);    

assign O_pllphase      = PSDA;
assign O_pllphase_lock = dphase_lock;
assign O_clkpat_lock   = clock_word_lock;

word_align_ctl wd_aln_ctl_inst  //find 7'b1100011
(.clk             (O_pix_clk) 
,.rst             (reset_sync)  
,.clock_word      (RCLK_out_sclk) //TBD
,.align_enable    (dphase_lock_d2) // slave to bit_align_ctl and PLL
,.slip            (slip) //TBD
,.clock_word_lock (clock_word_lock)
);

        
always @(posedge O_pix_clk or posedge reset_sync) 
begin
    if(reset_sync == 1'b1) 
        begin
            dphase_lock_d1 <= 1'b0;
            dphase_lock_d2 <= 1'b0;
        end 
    else 
        begin   
            dphase_lock_d1 <= dphase_lock && pll_lock;
            dphase_lock_d2 <= dphase_lock_d1;
        end
end


/////////////////   
always @(posedge ibuf_clk or negedge I_rst_n) 
begin
    if(!I_rst_n) 
        delay_count <= 19'd0;
    else if(delay_count[17] == 1'b0) 
        delay_count <= delay_count + 1'b1;
end
    
always @(posedge ibuf_clk or negedge I_rst_n) 
begin
    if(!I_rst_n) 
        release_reset <= 1'b0;
    else if(release_reset == 1'b0) 
        release_reset <= delay_count[16];
end 
 
always @(posedge ibuf_clk or negedge I_rst_n) 
begin
   if(!I_rst_n)
       reset_sync <= 1'b1;
   else
       reset_sync <= !release_reset;
end

endmodule
