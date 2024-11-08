
`include "lvds_7to1_rx_defines.v"

`timescale 1 ns / 1 ps

module LVDS71RX_1CLK8DATA 
(
    input        reset    ,
    input  [3:0] I_PSDA   ,
    input  [3:0] I_DUTYDA , 
    input        slip     ,
    output       lock     ,
    output       sclk     ,
    output [6:0] clk_phase,
    output       ibuf_clk ,
`ifdef RX_ONE_CHANNEL
    `ifdef RX_RGB888
        input        clk      ,
        input        clk_n    ,
        input  [3:0] datain   ,
        input  [3:0] datain_n ,
        output [6:0] q0       ,
        output [6:0] q1       ,
        output [6:0] q2       ,
        output [6:0] q3
    `endif
    `ifdef RX_RGB666
        input        clk      ,
        input        clk_n    ,
        input  [2:0] datain   ,
        input  [2:0] datain_n ,
        output [6:0] q0       ,
        output [6:0] q1       ,
        output [6:0] q2       
    `endif
`endif
`ifdef RX_TWO_CHANNEL
    `ifdef RX_RGB888
        input        clk      ,
        input        clk_n    ,
        input  [3:0] dataino  ,
        input  [3:0] dataino_n,
        input  [3:0] dataine  ,
        input  [3:0] dataine_n,
        output [6:0] qo0      ,
        output [6:0] qo1      ,
        output [6:0] qo2      ,
        output [6:0] qo3      ,
        output [6:0] qe0      ,
        output [6:0] qe1      ,
        output [6:0] qe2      ,
        output [6:0] qe3
    `endif
    `ifdef RX_RGB666
        input        clk      ,
        input        clk_n    ,
        input  [2:0] dataino  ,
        input  [2:0] dataino_n,
        input  [2:0] dataine  ,
        input  [2:0] dataine_n,
        output [6:0] qo0      ,
        output [6:0] qo1      ,
        output [6:0] qo2      ,
        output [6:0] qe0      ,
        output [6:0] qe1      ,
        output [6:0] qe2      
    `endif
`endif
);

wire sclk_t;
wire eclko;
wire lock_chk;

`ifdef RX_ONE_CHANNEL
        wire buf_clk;
        wire buf_dataini0;
        wire buf_dataini1;
        wire buf_dataini2;
    `ifdef RX_RGB888    
        wire buf_dataini3;
    `endif
    
        wire dly_dataini0;
        wire dly_dataini1;
        wire dly_dataini2;
    `ifdef RX_RGB888 
        wire dly_dataini3;
    `endif
`endif

`ifdef RX_TWO_CHANNEL
        wire buf_clk;
        wire buf_datainio0;
        wire buf_datainio1;
        wire buf_datainio2;
        wire buf_datainie0;
        wire buf_datainie1;
        wire buf_datainie2;
    `ifdef RX_RGB888     
        wire buf_datainio3;
        wire buf_datainie3;
    `endif
    
        wire dly_datainio0;
        wire dly_datainio1;
        wire dly_datainio2;
        wire dly_datainie0;
        wire dly_datainie1;
        wire dly_datainie2;
    `ifdef RX_RGB888 
        wire dly_datainio3;
        wire dly_datainie3;
    `endif
`endif

assign sclk = sclk_t;
assign lock = lock_chk;

assign ibuf_clk = buf_clk;

//======================================================
`ifdef RX_ONE_CHANNEL
    TLVDS_IBUF      IB_clk_inst  (.O(buf_clk), .I(clk), .IB(clk_n));
    TLVDS_IBUF      IB0_inst (.O(buf_dataini0), .I(datain[0]), .IB(datain_n[0]));
    TLVDS_IBUF      IB1_inst (.O(buf_dataini1), .I(datain[1]), .IB(datain_n[1]));
    TLVDS_IBUF      IB2_inst (.O(buf_dataini2), .I(datain[2]), .IB(datain_n[2]));
    `ifdef RX_RGB888 
        TLVDS_IBUF      IB3_inst (.O(buf_dataini3), .I(datain[3]), .IB(datain_n[3]));
    `endif

    //-------------------------------------------------
    IODELAY u_IODELAY0
    (
        .DO   (dly_dataini0),
        .DF   (          ),
        .DI   (buf_dataini0),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam u_IODELAY0.C_STATIC_DLY=`D0_IODELAY;
    
    IODELAY u_IODELAY1
    (
        .DO   (dly_dataini1),
        .DF   (          ),
        .DI   (buf_dataini1),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam u_IODELAY1.C_STATIC_DLY=`D1_IODELAY;
    
    IODELAY u_IODELAY2
    (
        .DO   (dly_dataini2),
        .DF   (          ),
        .DI   (buf_dataini2),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam u_IODELAY2.C_STATIC_DLY=`D2_IODELAY;
    
    `ifdef RX_RGB888 
        IODELAY u_IODELAY3
        (
            .DO   (dly_dataini3),
            .DF   (          ),
            .DI   (buf_dataini3),
            .SDTAP(1'b0),
            .SETN (1'b1),
            .VALUE(1'b0)
        );
        defparam u_IODELAY3.C_STATIC_DLY=`D3_IODELAY;
    `endif
    
    //--------------------------------------------------------
    IVIDEO Inst8_IDDRX71A 
    (.D(buf_clk)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(clk_phase[0])
    ,.Q1(clk_phase[1])
    ,.Q2(clk_phase[2])
    ,.Q3(clk_phase[3])
    ,.Q4(clk_phase[4])
    ,.Q5(clk_phase[5])
    ,.Q6(clk_phase[6])
    );
    
    `ifdef RX_RGB888 
        IVIDEO Inst7_IDDRX71A3 
        (.D(dly_dataini3)
        ,.FCLK(eclko)
        ,.PCLK(sclk_t)
        ,.RESET(reset)
        ,.CALIB(slip)
        ,.Q0(q3[0])
        ,.Q1(q3[1])
        ,.Q2(q3[2])
        ,.Q3(q3[3])
        ,.Q4(q3[4])
        ,.Q5(q3[5])
        ,.Q6(q3[6])
        );
    `endif
    
    IVIDEO Inst7_IDDRX71A2 
    (.D(dly_dataini2)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(q2[0])
    ,.Q1(q2[1])
    ,.Q2(q2[2])
    ,.Q3(q2[3])
    ,.Q4(q2[4])
    ,.Q5(q2[5])
    ,.Q6(q2[6])
    );
    
    IVIDEO Inst7_IDDRX71A1 
    (.D(dly_dataini1)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(q1[0])
    ,.Q1(q1[1])
    ,.Q2(q1[2])
    ,.Q3(q1[3])
    ,.Q4(q1[4])
    ,.Q5(q1[5])
    ,.Q6(q1[6])
    );
    
    IVIDEO Inst7_IDDRX71A0 
    (.D(dly_dataini0)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(q0[0])
    ,.Q1(q0[1])
    ,.Q2(q0[2])
    ,.Q3(q0[3])
    ,.Q4(q0[4])
    ,.Q5(q0[5])
    ,.Q6(q0[6])
    );
`endif

`ifdef RX_TWO_CHANNEL
    TLVDS_IBUF      IB_clk_inst  (.O(buf_clk), .I(clk), .IB(clk_n));
    TLVDS_IBUF      IBo0_inst (.O(buf_datainio0), .I(dataino[0]), .IB(dataino_n[0]));
    TLVDS_IBUF      IBo1_inst (.O(buf_datainio1), .I(dataino[1]), .IB(dataino_n[1]));
    TLVDS_IBUF      IBo2_inst (.O(buf_datainio2), .I(dataino[2]), .IB(dataino_n[2]));
    TLVDS_IBUF      IBe0_inst (.O(buf_datainie0), .I(dataine[0]), .IB(dataine_n[0]));
    TLVDS_IBUF      IBe1_inst (.O(buf_datainie1), .I(dataine[1]), .IB(dataine_n[1]));
    TLVDS_IBUF      IBe2_inst (.O(buf_datainie2), .I(dataine[2]), .IB(dataine_n[2]));
    `ifdef RX_RGB888 
        TLVDS_IBUF      IBo3_inst (.O(buf_datainio3), .I(dataino[3]), .IB(dataino_n[3]));
        TLVDS_IBUF      IBe3_inst (.O(buf_datainie3), .I(dataine[3]), .IB(dataine_n[3]));
    `endif

    //-------------------------------------------------
    IODELAY uo_IODELAY0
    (
        .DO   (dly_datainio0),
        .DF   (          ),
        .DI   (buf_datainio0),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam uo_IODELAY0.C_STATIC_DLY=`DO0_IODELAY;
    
    IODELAY uo_IODELAY1
    (
        .DO   (dly_datainio1),
        .DF   (          ),
        .DI   (buf_datainio1),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam uo_IODELAY1.C_STATIC_DLY=`DO1_IODELAY;
    
    IODELAY uo_IODELAY2
    (
        .DO   (dly_datainio2),
        .DF   (          ),
        .DI   (buf_datainio2),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam uo_IODELAY2.C_STATIC_DLY=`DO2_IODELAY;
    
    `ifdef RX_RGB888 
        IODELAY uo_IODELAY3
        (
            .DO   (dly_datainio3),
            .DF   (          ),
            .DI   (buf_datainio3),
            .SDTAP(1'b0),
            .SETN (1'b1),
            .VALUE(1'b0)
        );
        defparam uo_IODELAY3.C_STATIC_DLY=`DO3_IODELAY;
    `endif
    
    //
    IODELAY ue_IODELAY0
    (
        .DO   (dly_datainie0),
        .DF   (          ),
        .DI   (buf_datainie0),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam ue_IODELAY0.C_STATIC_DLY=`DE0_IODELAY;
    
    IODELAY ue_IODELAY1
    (
        .DO   (dly_datainie1),
        .DF   (          ),
        .DI   (buf_datainie1),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam ue_IODELAY1.C_STATIC_DLY=`DE1_IODELAY;
    
    IODELAY ue_IODELAY2
    (
        .DO   (dly_datainie2),
        .DF   (          ),
        .DI   (buf_datainie2),
        .SDTAP(1'b0),
        .SETN (1'b1),
        .VALUE(1'b0)
    );
    defparam ue_IODELAY2.C_STATIC_DLY=`DE2_IODELAY;
    
    `ifdef RX_RGB888 
        IODELAY ue_IODELAY3
        (
            .DO   (dly_datainie3),
            .DF   (          ),
            .DI   (buf_datainie3),
            .SDTAP(1'b0),
            .SETN (1'b1),
            .VALUE(1'b0)
        );
        defparam ue_IODELAY3.C_STATIC_DLY=`DE3_IODELAY;
    `endif
    
    //--------------------------------------------------------
    IVIDEO Inst8_IDDRX71A_o 
    (.D(buf_clk)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(clk_phase[0])
    ,.Q1(clk_phase[1])
    ,.Q2(clk_phase[2])
    ,.Q3(clk_phase[3])
    ,.Q4(clk_phase[4])
    ,.Q5(clk_phase[5])
    ,.Q6(clk_phase[6])
    );
    
    `ifdef RX_RGB888 
        IVIDEO Inst7_IDDRX71A3_o  
        (.D(dly_datainio3)
        ,.FCLK(eclko)
        ,.PCLK(sclk_t)
        ,.RESET(reset)
        ,.CALIB(slip)
        ,.Q0(qo3[0])
        ,.Q1(qo3[1])
        ,.Q2(qo3[2])
        ,.Q3(qo3[3])
        ,.Q4(qo3[4])
        ,.Q5(qo3[5])
        ,.Q6(qo3[6])
        );
    `endif
    
    IVIDEO Inst7_IDDRX71A2_o  
    (.D(dly_datainio2)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(qo2[0])
    ,.Q1(qo2[1])
    ,.Q2(qo2[2])
    ,.Q3(qo2[3])
    ,.Q4(qo2[4])
    ,.Q5(qo2[5])
    ,.Q6(qo2[6])
    );
    
    IVIDEO Inst7_IDDRX71A1_o  
    (.D(dly_datainio1)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(qo1[0])
    ,.Q1(qo1[1])
    ,.Q2(qo1[2])
    ,.Q3(qo1[3])
    ,.Q4(qo1[4])
    ,.Q5(qo1[5])
    ,.Q6(qo1[6])
    );
    
    IVIDEO Inst7_IDDRX71A0_o 
    (.D(dly_datainio0)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(qo0[0])
    ,.Q1(qo0[1])
    ,.Q2(qo0[2])
    ,.Q3(qo0[3])
    ,.Q4(qo0[4])
    ,.Q5(qo0[5])
    ,.Q6(qo0[6])
    );
    
    //
    `ifdef RX_RGB888 
        IVIDEO Inst7_IDDRX71A3_e  
        (.D(dly_datainie3)
        ,.FCLK(eclko)
        ,.PCLK(sclk_t)
        ,.RESET(reset)
        ,.CALIB(slip)
        ,.Q0(qe3[0])
        ,.Q1(qe3[1])
        ,.Q2(qe3[2])
        ,.Q3(qe3[3])
        ,.Q4(qe3[4])
        ,.Q5(qe3[5])
        ,.Q6(qe3[6])
        );
    `endif
    
    IVIDEO Inst7_IDDRX71A2_e  
    (.D(dly_datainie2)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(qe2[0])
    ,.Q1(qe2[1])
    ,.Q2(qe2[2])
    ,.Q3(qe2[3])
    ,.Q4(qe2[4])
    ,.Q5(qe2[5])
    ,.Q6(qe2[6])
    );
    
    IVIDEO Inst7_IDDRX71A1_e  
    (.D(dly_datainie1)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(qe1[0])
    ,.Q1(qe1[1])
    ,.Q2(qe1[2])
    ,.Q3(qe1[3])
    ,.Q4(qe1[4])
    ,.Q5(qe1[5])
    ,.Q6(qe1[6])
    );
    
    IVIDEO Inst7_IDDRX71A0_e 
    (.D(dly_datainie0)
    ,.FCLK(eclko)
    ,.PCLK(sclk_t)
    ,.RESET(reset)
    ,.CALIB(slip)
    ,.Q0(qe0[0])
    ,.Q1(qe0[1])
    ,.Q2(qe0[2])
    ,.Q3(qe0[3])
    ,.Q4(qe0[4])
    ,.Q5(qe0[5])
    ,.Q6(qe0[6])
    );
`endif

//===============================================
`ifdef RX_USE_RPLL
    LVDS_RX_rPLL2 LVDS_RX_rPLL_inst
    (
        .clkout (        ), //x3.5
        .lock   (lock_chk), 
        .clkoutp(eclko   ), //x3.5 phase
        .reset  (reset   ), //reset
        .clkin  (buf_clk ), //x1
        .psda   (I_PSDA  ), //input [3:0] psda
        .dutyda (I_DUTYDA), //input [3:0] dutyda
        .fdly   (4'd15   )  //input [3:0] fdly
    );
`endif

`ifdef RX_USE_PLLVR
    LVDS_RX_PLLVR LVDS_RX_PLLVR_inst
    (
        .clkout (        ), //x3.5
        .lock   (lock_chk), 
        .clkoutp(eclko   ), //x3.5 phase
        .reset  (reset   ), //reset
        .clkin  (buf_clk ), //x1
        .psda   (I_PSDA  ), //input [3:0] psda
        .dutyda (I_DUTYDA), //input [3:0] dutyda
        .fdly   (4'd15   )  //input [3:0] fdly
    );
`endif

`ifdef RX_USE_CLKDIV_3_5
    CLKDIV Inst6_CLKDIVC 
    (.RESETN(~reset)//~reset
    ,.HCLKIN(eclko)
    ,.CALIB (1'b0)//slip
    ,.CLKOUT(sclk_t)
    );
    defparam Inst6_CLKDIVC.DIV_MODE = "3.5" ;
`else
    assign sclk_t = buf_clk; 
`endif

endmodule
