
`include "lvds_7to1_tx_defines.v"

module ip_gddr71tx 
(
    input        refclk, 
    input        sclk, 
`ifdef TX_ONE_CHANNEL
    `ifdef TX_RGB888
        input  [6:0] data0, 
        input  [6:0] data1, 
        input  [6:0] data2, 
        input  [6:0] data3,
        output       clkout_p    ,
        output       clkout_n    ,
        output [3:0] dout_p      ,
        output [3:0] dout_n      ,
    `endif 
    `ifdef TX_RGB666
        input  [6:0] data0, 
        input  [6:0] data1, 
        input  [6:0] data2, 
        output       clkout_p    ,
        output       clkout_n    ,
        output [2:0] dout_p      ,
        output [2:0] dout_n      ,
    `endif 
`endif 
`ifdef TX_TWO_CHANNEL
    `ifdef TX_RGB888
        input  [6:0] datao0, 
        input  [6:0] datao1, 
        input  [6:0] datao2, 
        input  [6:0] datao3,
        input  [6:0] datae0, 
        input  [6:0] datae1, 
        input  [6:0] datae2, 
        input  [6:0] datae3,
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            output       clkout_p       ,
            output       clkout_n       ,
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            output       clkouto_p      ,
            output       clkouto_n      ,
            output       clkoute_p      ,
            output       clkoute_n      ,
        `endif
        output [3:0] douto_p      ,
        output [3:0] douto_n      ,
        output [3:0] doute_p      ,
        output [3:0] doute_n      ,
    `endif 
    `ifdef TX_RGB666
        input  [6:0] datao0, 
        input  [6:0] datao1, 
        input  [6:0] datao2, 
        input  [6:0] datae0, 
        input  [6:0] datae1, 
        input  [6:0] datae2, 
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            output       clkout_p       ,
            output       clkout_n       ,
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            output       clkouto_p      ,
            output       clkouto_n      ,
            output       clkoute_p      ,
            output       clkoute_n      ,
        `endif
        output [2:0] douto_p      ,
        output [2:0] douto_n      ,
        output [2:0] doute_p      ,
        output [2:0] doute_n      ,
    `endif 
`endif   
    input        reset
);

//=======================================================
`ifdef TX_CLK_PATTERN_1100011
    localparam TX_CLK_PT = 7'b1100011;
`endif

`ifdef TX_CLK_PATTERN_1100001
    localparam TX_CLK_PT = 7'b1100001;
`endif

//=======================================================
`ifdef TX_ONE_CHANNEL
        wire       buf_clkout;
        wire       buf_dout0 ;
        wire       buf_dout1 ;
        wire       buf_dout2 ;
    `ifdef TX_RGB888
        wire       buf_dout3 ;
    `endif 
`endif 

`ifdef TX_TWO_CHANNEL
    `ifdef TX_TWO_CHANNEL_ONE_CLOCK
        wire       buf_clkout;
    `endif
    `ifdef TX_TWO_CHANNEL_TWO_CLOCK
        wire       buf_clkouto;
        wire       buf_clkoute;
    `endif
        wire       buf_douto0;
        wire       buf_douto1;
        wire       buf_douto2;
        wire       buf_doute0;
        wire       buf_doute1;
        wire       buf_doute2;
    `ifdef TX_RGB888
        wire       buf_douto3;
        wire       buf_doute3;
    `endif 
`endif  

//=====================================================
`ifdef TX_ONE_CHANNEL 
    //clock pattern 7'b1100011
    OVIDEO ODDR71B_clk_inst  
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(TX_CLK_PT[6]), 
        .D5(TX_CLK_PT[5]), 
        .D4(TX_CLK_PT[4]), 
        .D3(TX_CLK_PT[3]), 
        .D2(TX_CLK_PT[2]), 
        .D1(TX_CLK_PT[1]), 
        .D0(TX_CLK_PT[0]), 
        .Q(buf_clkout)
    );
    defparam ODDR71B_clk_inst.GSREN="true";
    defparam ODDR71B_clk_inst.LSREN ="false";

    `ifdef TX_RGB888
        OVIDEO ODDR71B_d3_inst 
        (
            .PCLK(sclk), 
            .FCLK(refclk), 
            .RESET(reset), 
            .D6(data3[6]), 
            .D5(data3[5]), 
            .D4(data3[4]), 
            .D3(data3[3]), 
            .D2(data3[2]), 
            .D1(data3[1]), 
            .D0(data3[0]), 
            .Q(buf_dout3)
        );
        defparam ODDR71B_d3_inst.GSREN="true";
        defparam ODDR71B_d3_inst.LSREN ="false";
    `endif
        
    OVIDEO ODDR71B_d2_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(data2[6]), 
        .D5(data2[5]), 
        .D4(data2[4]), 
        .D3(data2[3]), 
        .D2(data2[2]), 
        .D1(data2[1]), 
        .D0(data2[0]), 
        .Q(buf_dout2)
    );
    defparam ODDR71B_d2_inst.GSREN="true";
    defparam ODDR71B_d2_inst.LSREN ="false";
        
    OVIDEO ODDR71B_d1_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(data1[6]), 
        .D5(data1[5]), 
        .D4(data1[4]), 
        .D3(data1[3]), 
        .D2(data1[2]), 
        .D1(data1[1]), 
        .D0(data1[0]), 
        .Q(buf_dout1)
    );
    defparam ODDR71B_d1_inst.GSREN="true";
    defparam ODDR71B_d1_inst.LSREN ="false";
        
    OVIDEO ODDR71B_d0_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(data0[6]), 
        .D5(data0[5]), 
        .D4(data0[4]), 
        .D3(data0[3]), 
        .D2(data0[2]), 
        .D1(data0[1]), 
        .D0(data0[0]), 
        .Q(buf_dout0)
    );
    defparam ODDR71B_d0_inst.GSREN="true";
    defparam ODDR71B_d0_inst.LSREN ="false";
    
    `ifdef USE_TLVDS_OBUF
        TLVDS_OBUF Inst_OB  (.O(clkout_p),  .OB(clkout_n),  .I(buf_clkout));
        TLVDS_OBUF Inst_OB0 (.O(dout_p[0]), .OB(dout_n[0]), .I(buf_dout0));
        TLVDS_OBUF Inst_OB1 (.O(dout_p[1]), .OB(dout_n[1]), .I(buf_dout1));
        TLVDS_OBUF Inst_OB2 (.O(dout_p[2]), .OB(dout_n[2]), .I(buf_dout2));
        `ifdef TX_RGB888
            TLVDS_OBUF Inst_OB3 (.O(dout_p[3]), .OB(dout_n[3]), .I(buf_dout3));
        `endif
    `endif
    
    `ifdef USE_ELVDS_OBUF
        ELVDS_OBUF Inst_OB  (.O(clkout_p),  .OB(clkout_n),  .I(buf_clkout));
        ELVDS_OBUF Inst_OB0 (.O(dout_p[0]), .OB(dout_n[0]), .I(buf_dout0));
        ELVDS_OBUF Inst_OB1 (.O(dout_p[1]), .OB(dout_n[1]), .I(buf_dout1));
        ELVDS_OBUF Inst_OB2 (.O(dout_p[2]), .OB(dout_n[2]), .I(buf_dout2));
        `ifdef TX_RGB888
            ELVDS_OBUF Inst_OB3 (.O(dout_p[3]), .OB(dout_n[3]), .I(buf_dout3));
        `endif
    `endif
`endif

`ifdef TX_TWO_CHANNEL 
    //clock pattern 7'b1100011
    `ifdef TX_TWO_CHANNEL_ONE_CLOCK
        OVIDEO ODDR71B_clk_inst  
        (
            .PCLK(sclk), 
            .FCLK(refclk), 
            .RESET(reset), 
            .D6(TX_CLK_PT[6]), 
            .D5(TX_CLK_PT[5]), 
            .D4(TX_CLK_PT[4]), 
            .D3(TX_CLK_PT[3]), 
            .D2(TX_CLK_PT[2]), 
            .D1(TX_CLK_PT[1]), 
            .D0(TX_CLK_PT[0]), 
            .Q(buf_clkout)
        );
        defparam ODDR71B_clk_inst.GSREN="true";
        defparam ODDR71B_clk_inst.LSREN ="false";
    `endif
    
    `ifdef TX_TWO_CHANNEL_TWO_CLOCK
        OVIDEO ODDR71B_clko_inst  
        (
            .PCLK(sclk), 
            .FCLK(refclk), 
            .RESET(reset), 
            .D6(TX_CLK_PT[6]), 
            .D5(TX_CLK_PT[5]), 
            .D4(TX_CLK_PT[4]), 
            .D3(TX_CLK_PT[3]), 
            .D2(TX_CLK_PT[2]), 
            .D1(TX_CLK_PT[1]), 
            .D0(TX_CLK_PT[0]), 
            .Q(buf_clkouto)
        );
        defparam ODDR71B_clko_inst.GSREN="true";
        defparam ODDR71B_clko_inst.LSREN ="false";
        
        OVIDEO ODDR71B_clke_inst  
        (
            .PCLK(sclk), 
            .FCLK(refclk), 
            .RESET(reset), 
            .D6(1'b1), 
            .D5(1'b1), 
            .D4(1'b0), 
            .D3(1'b0), 
            .D2(1'b0), 
            .D1(1'b1), 
            .D0(1'b1), 
            .Q(buf_clkoute)
        );
        defparam ODDR71B_clke_inst.GSREN="true";
        defparam ODDR71B_clke_inst.LSREN ="false";
    `endif
    
    //odd
    `ifdef TX_RGB888
        OVIDEO ODDR71B_do3_inst 
        (
            .PCLK(sclk), 
            .FCLK(refclk), 
            .RESET(reset), 
            .D6(datao3[6]), 
            .D5(datao3[5]), 
            .D4(datao3[4]), 
            .D3(datao3[3]), 
            .D2(datao3[2]), 
            .D1(datao3[1]), 
            .D0(datao3[0]), 
            .Q(buf_douto3)
        );
        defparam ODDR71B_do3_inst.GSREN="true";
        defparam ODDR71B_do3_inst.LSREN ="false";
    `endif
        
    OVIDEO ODDR71B_do2_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(datao2[6]), 
        .D5(datao2[5]), 
        .D4(datao2[4]), 
        .D3(datao2[3]), 
        .D2(datao2[2]), 
        .D1(datao2[1]), 
        .D0(datao2[0]), 
        .Q(buf_douto2)
    );
    defparam ODDR71B_do2_inst.GSREN="true";
    defparam ODDR71B_do2_inst.LSREN ="false";
        
    OVIDEO ODDR71B_do1_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(datao1[6]), 
        .D5(datao1[5]), 
        .D4(datao1[4]), 
        .D3(datao1[3]), 
        .D2(datao1[2]), 
        .D1(datao1[1]), 
        .D0(datao1[0]), 
        .Q(buf_douto1)
    );
    defparam ODDR71B_do1_inst.GSREN="true";
    defparam ODDR71B_do1_inst.LSREN ="false";
        
    OVIDEO ODDR71B_do0_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(datao0[6]), 
        .D5(datao0[5]), 
        .D4(datao0[4]), 
        .D3(datao0[3]), 
        .D2(datao0[2]), 
        .D1(datao0[1]), 
        .D0(datao0[0]), 
        .Q(buf_douto0)
    );
    defparam ODDR71B_do0_inst.GSREN="true";
    defparam ODDR71B_do0_inst.LSREN ="false";
    
    //even
    `ifdef TX_RGB888
        OVIDEO ODDR71B_de3_inst 
        (
            .PCLK(sclk), 
            .FCLK(refclk), 
            .RESET(reset), 
            .D6(datae3[6]), 
            .D5(datae3[5]), 
            .D4(datae3[4]), 
            .D3(datae3[3]), 
            .D2(datae3[2]), 
            .D1(datae3[1]), 
            .D0(datae3[0]), 
            .Q(buf_doute3)
        );
        defparam ODDR71B_de3_inst.GSREN="true";
        defparam ODDR71B_de3_inst.LSREN ="false";
    `endif
        
    OVIDEO ODDR71B_de2_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(datae2[6]), 
        .D5(datae2[5]), 
        .D4(datae2[4]), 
        .D3(datae2[3]), 
        .D2(datae2[2]), 
        .D1(datae2[1]), 
        .D0(datae2[0]), 
        .Q(buf_doute2)
    );
    defparam ODDR71B_de2_inst.GSREN="true";
    defparam ODDR71B_de2_inst.LSREN ="false";
        
    OVIDEO ODDR71B_de1_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(datae1[6]), 
        .D5(datae1[5]), 
        .D4(datae1[4]), 
        .D3(datae1[3]), 
        .D2(datae1[2]), 
        .D1(datae1[1]), 
        .D0(datae1[0]), 
        .Q(buf_doute1)
    );
    defparam ODDR71B_de1_inst.GSREN="true";
    defparam ODDR71B_de1_inst.LSREN ="false";
        
    OVIDEO ODDR71B_de0_inst 
    (
        .PCLK(sclk), 
        .FCLK(refclk), 
        .RESET(reset), 
        .D6(datae0[6]), 
        .D5(datae0[5]), 
        .D4(datae0[4]), 
        .D3(datae0[3]), 
        .D2(datae0[2]), 
        .D1(datae0[1]), 
        .D0(datae0[0]), 
        .Q(buf_doute0)
    );
    defparam ODDR71B_de0_inst.GSREN="true";
    defparam ODDR71B_de0_inst.LSREN ="false";
    
    `ifdef USE_TLVDS_OBUF
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            TLVDS_OBUF Inst_OB   (.O(clkout_p),   .OB(clkout_n),   .I(buf_clkout));
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            TLVDS_OBUF Inst_OBo   (.O(clkouto_p),   .OB(clkouto_n),   .I(buf_clkouto));
            TLVDS_OBUF Inst_OBe   (.O(clkoute_p),   .OB(clkoute_n),   .I(buf_clkoute));
        `endif
        TLVDS_OBUF Insto_OB0 (.O(douto_p[0]), .OB(douto_n[0]), .I(buf_douto0));
        TLVDS_OBUF Insto_OB1 (.O(douto_p[1]), .OB(douto_n[1]), .I(buf_douto1));
        TLVDS_OBUF Insto_OB2 (.O(douto_p[2]), .OB(douto_n[2]), .I(buf_douto2));
        TLVDS_OBUF Inste_OB0 (.O(doute_p[0]), .OB(doute_n[0]), .I(buf_doute0));
        TLVDS_OBUF Inste_OB1 (.O(doute_p[1]), .OB(doute_n[1]), .I(buf_doute1));
        TLVDS_OBUF Inste_OB2 (.O(doute_p[2]), .OB(doute_n[2]), .I(buf_doute2));
        `ifdef TX_RGB888
            TLVDS_OBUF Insto_OB3 (.O(douto_p[3]), .OB(douto_n[3]), .I(buf_douto3));
            TLVDS_OBUF Inste_OB3 (.O(doute_p[3]), .OB(doute_n[3]), .I(buf_doute3));
        `endif
    `endif
    
    `ifdef USE_ELVDS_OBUF
        `ifdef TX_TWO_CHANNEL_ONE_CLOCK
            ELVDS_OBUF Inst_OB   (.O(clkout_p),   .OB(clkout_n),   .I(buf_clkout));
        `endif
        `ifdef TX_TWO_CHANNEL_TWO_CLOCK
            ELVDS_OBUF Inst_OBo   (.O(clkouto_p),   .OB(clkouto_n),   .I(buf_clkouto));
            ELVDS_OBUF Inst_OBe   (.O(clkoute_p),   .OB(clkoute_n),   .I(buf_clkoute));
        `endif
        ELVDS_OBUF Insto_OB0 (.O(douto_p[0]), .OB(douto_n[0]), .I(buf_douto0));
        ELVDS_OBUF Insto_OB1 (.O(douto_p[1]), .OB(douto_n[1]), .I(buf_douto1));
        ELVDS_OBUF Insto_OB2 (.O(douto_p[2]), .OB(douto_n[2]), .I(buf_douto2));
        ELVDS_OBUF Inste_OB0 (.O(doute_p[0]), .OB(doute_n[0]), .I(buf_doute0));
        ELVDS_OBUF Inste_OB1 (.O(doute_p[1]), .OB(doute_n[1]), .I(buf_doute1));
        ELVDS_OBUF Inste_OB2 (.O(doute_p[2]), .OB(doute_n[2]), .I(buf_doute2));
        `ifdef TX_RGB888
            ELVDS_OBUF Insto_OB3 (.O(douto_p[3]), .OB(douto_n[3]), .I(buf_douto3));
            ELVDS_OBUF Inste_OB3 (.O(doute_p[3]), .OB(doute_n[3]), .I(buf_doute3));
        `endif
    `endif
`endif



endmodule
