//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Post-PnR Verilog Simulation Model file
//Tool Version: V1.9.10 (64-bit)
//Created Time: Mon Sep 30 10:14:07 2024

`timescale 100 ps/100 ps
module sram_top_gowin_top(
	clka,
	clkb,
	sdbpflag,
	wtaddr,
	wtdina,
	rst_n,
	promdout,
	latch_flag,
	frame_flag,
	doutb,
	datain,
	cntlatch
);
input clka;
input clkb;
input sdbpflag;
input [9:0] wtaddr;
input [15:0] wtdina;
input rst_n;
output [9:0] promdout;
output latch_flag;
output frame_flag;
output [15:0] doutb;
output [95:0] datain;
output [6:0] cntlatch;
wire GND;
wire VCC;
wire clka;
wire clkb;
wire [6:0] cntlatch;
wire [95:0] datain;
wire [15:0] doutb;
wire frame_flag;
wire latch_flag;
wire [9:0] promdout;
wire rst_n;
wire sdbpflag;
wire [9:0] wtaddr;
wire [15:0] wtdina;
wire \sram_top_ins/n202_4 ;
wire \sram_top_ins/promce_8 ;
wire \sram_top_ins/wren_8 ;
wire \sram_top_ins/data96_reg_95_6 ;
wire \sram_top_ins/data96_reg_79_6 ;
wire \sram_top_ins/data96_reg_63_6 ;
wire \sram_top_ins/data96_reg_47_6 ;
wire \sram_top_ins/data96_reg_31_6 ;
wire \sram_top_ins/data96_reg_15_6 ;
wire \sram_top_ins/latch_8 ;
wire \sram_top_ins/n641_5 ;
wire \sram_top_ins/n640_5 ;
wire \sram_top_ins/n638_5 ;
wire \sram_top_ins/n292_15 ;
wire \sram_top_ins/n291_15 ;
wire \sram_top_ins/n290_15 ;
wire \sram_top_ins/n289_15 ;
wire \sram_top_ins/n288_15 ;
wire \sram_top_ins/n287_15 ;
wire \sram_top_ins/n286_15 ;
wire \sram_top_ins/n285_15 ;
wire \sram_top_ins/n284_15 ;
wire \sram_top_ins/n283_15 ;
wire \sram_top_ins/n282_15 ;
wire \sram_top_ins/n281_15 ;
wire \sram_top_ins/n280_15 ;
wire \sram_top_ins/n279_15 ;
wire \sram_top_ins/n278_15 ;
wire \sram_top_ins/n277_16 ;
wire \sram_top_ins/n165_5 ;
wire \sram_top_ins/n163_5 ;
wire \sram_top_ins/n162_5 ;
wire \sram_top_ins/n161_5 ;
wire \sram_top_ins/n160_5 ;
wire \sram_top_ins/n159_5 ;
wire \sram_top_ins/n158_5 ;
wire \sram_top_ins/n228_15 ;
wire \sram_top_ins/n227_15 ;
wire \sram_top_ins/n226_15 ;
wire \sram_top_ins/n225_15 ;
wire \sram_top_ins/n224_15 ;
wire \sram_top_ins/n223_15 ;
wire \sram_top_ins/n222_15 ;
wire \sram_top_ins/n221_15 ;
wire \sram_top_ins/n220_15 ;
wire \sram_top_ins/n219_15 ;
wire \sram_top_ins/n218_15 ;
wire \sram_top_ins/n217_15 ;
wire \sram_top_ins/n216_15 ;
wire \sram_top_ins/n215_15 ;
wire \sram_top_ins/n214_15 ;
wire \sram_top_ins/n213_15 ;
wire \sram_top_ins/n202_5 ;
wire \sram_top_ins/n202_6 ;
wire \sram_top_ins/addrb_8_9 ;
wire \sram_top_ins/data96_reg_95_7 ;
wire \sram_top_ins/data96_reg_95_8 ;
wire \sram_top_ins/data96_reg_95_9 ;
wire \sram_top_ins/data96_reg_79_7 ;
wire \sram_top_ins/data96_reg_63_7 ;
wire \sram_top_ins/data96_reg_47_7 ;
wire \sram_top_ins/data96_reg_31_7 ;
wire \sram_top_ins/data96_reg_15_7 ;
wire \sram_top_ins/cntlatch_6_8 ;
wire \sram_top_ins/latch_9 ;
wire \sram_top_ins/n642_6 ;
wire \sram_top_ins/n640_6 ;
wire \sram_top_ins/n518_8 ;
wire \sram_top_ins/n517_8 ;
wire \sram_top_ins/n164_6 ;
wire \sram_top_ins/n162_6 ;
wire \sram_top_ins/n160_6 ;
wire \sram_top_ins/n158_6 ;
wire \sram_top_ins/addrb_8_10 ;
wire \sram_top_ins/addrb_8_11 ;
wire \sram_top_ins/data96_reg_95_10 ;
wire \sram_top_ins/data96_reg_95_11 ;
wire \sram_top_ins/cntlatch_6_9 ;
wire \sram_top_ins/latch_10 ;
wire \sram_top_ins/cnt_2_11 ;
wire \sram_top_ins/n164_8 ;
wire \sram_top_ins/n639_8 ;
wire \sram_top_ins/n204_8 ;
wire \sram_top_ins/n642_8 ;
wire \sram_top_ins/n517_10 ;
wire \sram_top_ins/n518_10 ;
wire \sram_top_ins/n166_12 ;
wire \sram_top_ins/addrb_8_13 ;
wire \sram_top_ins/n519_10 ;
wire \sram_top_ins/cnt_2_13 ;
wire \sram_top_ins/n639_11 ;
wire \sram_top_ins/cntlatch_6_109 ;
wire \sram_top_ins/n643_8 ;
wire \sram_top_ins/n644_8 ;
wire \sram_top_ins/n542_8 ;
wire \sram_top_ins/n543_8 ;
wire \sram_top_ins/n544_8 ;
wire \sram_top_ins/n545_8 ;
wire \sram_top_ins/n546_8 ;
wire \sram_top_ins/n547_8 ;
wire \sram_top_ins/n548_8 ;
wire \sram_top_ins/n549_8 ;
wire \sram_top_ins/n550_8 ;
wire \sram_top_ins/n551_8 ;
wire \sram_top_ins/n552_8 ;
wire \sram_top_ins/n553_8 ;
wire \sram_top_ins/n554_8 ;
wire \sram_top_ins/n555_8 ;
wire \sram_top_ins/n556_8 ;
wire \sram_top_ins/n557_8 ;
wire \sram_top_ins/n558_8 ;
wire \sram_top_ins/n559_8 ;
wire \sram_top_ins/n560_8 ;
wire \sram_top_ins/n561_8 ;
wire \sram_top_ins/n562_8 ;
wire \sram_top_ins/n563_8 ;
wire \sram_top_ins/n564_8 ;
wire \sram_top_ins/n565_8 ;
wire \sram_top_ins/n566_8 ;
wire \sram_top_ins/n567_8 ;
wire \sram_top_ins/n568_8 ;
wire \sram_top_ins/n569_8 ;
wire \sram_top_ins/n570_8 ;
wire \sram_top_ins/n571_8 ;
wire \sram_top_ins/n572_8 ;
wire \sram_top_ins/n573_8 ;
wire \sram_top_ins/n574_8 ;
wire \sram_top_ins/n575_8 ;
wire \sram_top_ins/n576_8 ;
wire \sram_top_ins/n577_8 ;
wire \sram_top_ins/n578_8 ;
wire \sram_top_ins/n579_8 ;
wire \sram_top_ins/n580_8 ;
wire \sram_top_ins/n581_8 ;
wire \sram_top_ins/n582_8 ;
wire \sram_top_ins/n583_8 ;
wire \sram_top_ins/n584_8 ;
wire \sram_top_ins/n585_8 ;
wire \sram_top_ins/n586_8 ;
wire \sram_top_ins/n587_8 ;
wire \sram_top_ins/n588_8 ;
wire \sram_top_ins/n589_8 ;
wire \sram_top_ins/n590_8 ;
wire \sram_top_ins/n591_8 ;
wire \sram_top_ins/n592_8 ;
wire \sram_top_ins/n593_8 ;
wire \sram_top_ins/n594_8 ;
wire \sram_top_ins/n595_8 ;
wire \sram_top_ins/n596_8 ;
wire \sram_top_ins/n597_8 ;
wire \sram_top_ins/n598_8 ;
wire \sram_top_ins/n599_8 ;
wire \sram_top_ins/n600_8 ;
wire \sram_top_ins/n601_8 ;
wire \sram_top_ins/n602_8 ;
wire \sram_top_ins/n603_8 ;
wire \sram_top_ins/n604_8 ;
wire \sram_top_ins/n605_8 ;
wire \sram_top_ins/n606_8 ;
wire \sram_top_ins/n607_8 ;
wire \sram_top_ins/n608_8 ;
wire \sram_top_ins/n609_8 ;
wire \sram_top_ins/n610_8 ;
wire \sram_top_ins/n611_8 ;
wire \sram_top_ins/n612_8 ;
wire \sram_top_ins/n613_8 ;
wire \sram_top_ins/n614_8 ;
wire \sram_top_ins/n615_8 ;
wire \sram_top_ins/n616_8 ;
wire \sram_top_ins/n617_8 ;
wire \sram_top_ins/n618_8 ;
wire \sram_top_ins/n619_8 ;
wire \sram_top_ins/n620_8 ;
wire \sram_top_ins/n621_8 ;
wire \sram_top_ins/n622_8 ;
wire \sram_top_ins/n623_8 ;
wire \sram_top_ins/n624_8 ;
wire \sram_top_ins/n625_8 ;
wire \sram_top_ins/n626_8 ;
wire \sram_top_ins/n627_8 ;
wire \sram_top_ins/n628_8 ;
wire \sram_top_ins/n629_8 ;
wire \sram_top_ins/n630_8 ;
wire \sram_top_ins/n631_8 ;
wire \sram_top_ins/n632_8 ;
wire \sram_top_ins/n633_8 ;
wire \sram_top_ins/n634_8 ;
wire \sram_top_ins/n635_8 ;
wire \sram_top_ins/n636_8 ;
wire \sram_top_ins/n637_8 ;
wire \sram_top_ins/n871_10 ;
wire \sram_top_ins/promce ;
wire \sram_top_ins/wren ;
wire \sram_top_ins/latch ;
wire \sram_top_ins/n209_6 ;
wire [95:0] \sram_top_ins/data96_reg ;
wire [8:0] \sram_top_ins/addrb ;
wire [2:0] \sram_top_ins/cnt ;
wire [31:10] \sram_top_ins/prom/DO ;
wire [31:16] \sram_top_ins/sdpb/DO ;
VCC VCC_cZ (
  .V(VCC)
);
GND GND_cZ (
  .G(GND)
);
GSR GSR (
	.GSRI(VCC)
);
LUT4 \sram_top_ins/n202_s0  (
	.I0(wtaddr[0]),
	.I1(wtaddr[1]),
	.I2(\sram_top_ins/n202_5 ),
	.I3(\sram_top_ins/n202_6 ),
	.F(\sram_top_ins/n202_4 )
);
defparam \sram_top_ins/n202_s0 .INIT=16'h1000;
LUT2 \sram_top_ins/promce_s3  (
	.I0(frame_flag),
	.I1(\sram_top_ins/addrb_8_9 ),
	.F(\sram_top_ins/promce_8 )
);
defparam \sram_top_ins/promce_s3 .INIT=4'hE;
LUT2 \sram_top_ins/wren_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/n202_4 ),
	.F(\sram_top_ins/wren_8 )
);
defparam \sram_top_ins/wren_s3 .INIT=4'hE;
LUT3 \sram_top_ins/data96_reg_95_s2  (
	.I0(\sram_top_ins/data96_reg_95_7 ),
	.I1(\sram_top_ins/data96_reg_95_8 ),
	.I2(\sram_top_ins/data96_reg_95_9 ),
	.F(\sram_top_ins/data96_reg_95_6 )
);
defparam \sram_top_ins/data96_reg_95_s2 .INIT=8'h01;
LUT3 \sram_top_ins/data96_reg_79_s2  (
	.I0(\sram_top_ins/data96_reg_95_8 ),
	.I1(\sram_top_ins/data96_reg_95_9 ),
	.I2(\sram_top_ins/data96_reg_79_7 ),
	.F(\sram_top_ins/data96_reg_79_6 )
);
defparam \sram_top_ins/data96_reg_79_s2 .INIT=8'h01;
LUT4 \sram_top_ins/data96_reg_63_s2  (
	.I0(\sram_top_ins/data96_reg_95_8 ),
	.I1(\sram_top_ins/data96_reg_95_9 ),
	.I2(\sram_top_ins/data96_reg_63_7 ),
	.I3(\sram_top_ins/cnt [1]),
	.F(\sram_top_ins/data96_reg_63_6 )
);
defparam \sram_top_ins/data96_reg_63_s2 .INIT=16'h0100;
LUT3 \sram_top_ins/data96_reg_47_s2  (
	.I0(\sram_top_ins/data96_reg_95_8 ),
	.I1(\sram_top_ins/data96_reg_95_9 ),
	.I2(\sram_top_ins/data96_reg_47_7 ),
	.F(\sram_top_ins/data96_reg_47_6 )
);
defparam \sram_top_ins/data96_reg_47_s2 .INIT=8'h10;
LUT4 \sram_top_ins/data96_reg_31_s2  (
	.I0(\sram_top_ins/data96_reg_95_8 ),
	.I1(\sram_top_ins/data96_reg_95_9 ),
	.I2(\sram_top_ins/data96_reg_31_7 ),
	.I3(\sram_top_ins/cnt [2]),
	.F(\sram_top_ins/data96_reg_31_6 )
);
defparam \sram_top_ins/data96_reg_31_s2 .INIT=16'h0100;
LUT4 \sram_top_ins/data96_reg_15_s2  (
	.I0(\sram_top_ins/data96_reg_95_8 ),
	.I1(\sram_top_ins/data96_reg_95_9 ),
	.I2(\sram_top_ins/data96_reg_15_7 ),
	.I3(\sram_top_ins/cnt [2]),
	.F(\sram_top_ins/data96_reg_15_6 )
);
defparam \sram_top_ins/data96_reg_15_s2 .INIT=16'h0100;
LUT4 \sram_top_ins/latch_s3  (
	.I0(\sram_top_ins/latch_9 ),
	.I1(\sram_top_ins/cnt [1]),
	.I2(\sram_top_ins/cnt [2]),
	.I3(\sram_top_ins/cnt [0]),
	.F(\sram_top_ins/latch_8 )
);
defparam \sram_top_ins/latch_s3 .INIT=16'hBAAB;
LUT4 \sram_top_ins/n641_s1  (
	.I0(cntlatch[2]),
	.I1(\sram_top_ins/n642_6 ),
	.I2(cntlatch[3]),
	.I3(\sram_top_ins/cntlatch_6_8 ),
	.F(\sram_top_ins/n641_5 )
);
defparam \sram_top_ins/n641_s1 .INIT=16'h7800;
LUT4 \sram_top_ins/n640_s1  (
	.I0(\sram_top_ins/n642_6 ),
	.I1(\sram_top_ins/n640_6 ),
	.I2(cntlatch[4]),
	.I3(\sram_top_ins/cntlatch_6_8 ),
	.F(\sram_top_ins/n640_5 )
);
defparam \sram_top_ins/n640_s1 .INIT=16'h7800;
LUT3 \sram_top_ins/n638_s1  (
	.I0(cntlatch[5]),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(\sram_top_ins/n639_8 ),
	.F(\sram_top_ins/n638_5 )
);
defparam \sram_top_ins/n638_s1 .INIT=8'h80;
LUT2 \sram_top_ins/n292_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[0]),
	.F(\sram_top_ins/n292_15 )
);
defparam \sram_top_ins/n292_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n291_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[1]),
	.F(\sram_top_ins/n291_15 )
);
defparam \sram_top_ins/n291_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n290_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[2]),
	.F(\sram_top_ins/n290_15 )
);
defparam \sram_top_ins/n290_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n289_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[3]),
	.F(\sram_top_ins/n289_15 )
);
defparam \sram_top_ins/n289_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n288_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[4]),
	.F(\sram_top_ins/n288_15 )
);
defparam \sram_top_ins/n288_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n287_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[5]),
	.F(\sram_top_ins/n287_15 )
);
defparam \sram_top_ins/n287_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n286_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[6]),
	.F(\sram_top_ins/n286_15 )
);
defparam \sram_top_ins/n286_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n285_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[7]),
	.F(\sram_top_ins/n285_15 )
);
defparam \sram_top_ins/n285_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n284_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[8]),
	.F(\sram_top_ins/n284_15 )
);
defparam \sram_top_ins/n284_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n283_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[9]),
	.F(\sram_top_ins/n283_15 )
);
defparam \sram_top_ins/n283_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n282_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[10]),
	.F(\sram_top_ins/n282_15 )
);
defparam \sram_top_ins/n282_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n281_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[11]),
	.F(\sram_top_ins/n281_15 )
);
defparam \sram_top_ins/n281_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n280_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[12]),
	.F(\sram_top_ins/n280_15 )
);
defparam \sram_top_ins/n280_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n279_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[13]),
	.F(\sram_top_ins/n279_15 )
);
defparam \sram_top_ins/n279_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n278_s10  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[14]),
	.F(\sram_top_ins/n278_15 )
);
defparam \sram_top_ins/n278_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n277_s11  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(doutb[15]),
	.F(\sram_top_ins/n277_16 )
);
defparam \sram_top_ins/n277_s11 .INIT=4'h4;
LUT3 \sram_top_ins/n165_s1  (
	.I0(\sram_top_ins/addrb [0]),
	.I1(\sram_top_ins/addrb [1]),
	.I2(\sram_top_ins/promce ),
	.F(\sram_top_ins/n165_5 )
);
defparam \sram_top_ins/n165_s1 .INIT=8'h60;
LUT4 \sram_top_ins/n163_s1  (
	.I0(\sram_top_ins/addrb [2]),
	.I1(\sram_top_ins/n164_6 ),
	.I2(\sram_top_ins/addrb [3]),
	.I3(\sram_top_ins/promce ),
	.F(\sram_top_ins/n163_5 )
);
defparam \sram_top_ins/n163_s1 .INIT=16'h7800;
LUT3 \sram_top_ins/n162_s1  (
	.I0(\sram_top_ins/addrb [4]),
	.I1(\sram_top_ins/n162_6 ),
	.I2(\sram_top_ins/promce ),
	.F(\sram_top_ins/n162_5 )
);
defparam \sram_top_ins/n162_s1 .INIT=8'h60;
LUT4 \sram_top_ins/n161_s1  (
	.I0(\sram_top_ins/addrb [4]),
	.I1(\sram_top_ins/n162_6 ),
	.I2(\sram_top_ins/addrb [5]),
	.I3(\sram_top_ins/promce ),
	.F(\sram_top_ins/n161_5 )
);
defparam \sram_top_ins/n161_s1 .INIT=16'h7800;
LUT3 \sram_top_ins/n160_s1  (
	.I0(\sram_top_ins/addrb [6]),
	.I1(\sram_top_ins/n160_6 ),
	.I2(\sram_top_ins/promce ),
	.F(\sram_top_ins/n160_5 )
);
defparam \sram_top_ins/n160_s1 .INIT=8'h60;
LUT4 \sram_top_ins/n159_s1  (
	.I0(\sram_top_ins/addrb [6]),
	.I1(\sram_top_ins/n160_6 ),
	.I2(\sram_top_ins/addrb [7]),
	.I3(\sram_top_ins/promce ),
	.F(\sram_top_ins/n159_5 )
);
defparam \sram_top_ins/n159_s1 .INIT=16'h7800;
LUT4 \sram_top_ins/n158_s1  (
	.I0(\sram_top_ins/n162_6 ),
	.I1(\sram_top_ins/n158_6 ),
	.I2(\sram_top_ins/addrb [8]),
	.I3(\sram_top_ins/promce ),
	.F(\sram_top_ins/n158_5 )
);
defparam \sram_top_ins/n158_s1 .INIT=16'h7800;
LUT2 \sram_top_ins/n228_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[0]),
	.F(\sram_top_ins/n228_15 )
);
defparam \sram_top_ins/n228_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n227_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[1]),
	.F(\sram_top_ins/n227_15 )
);
defparam \sram_top_ins/n227_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n226_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[2]),
	.F(\sram_top_ins/n226_15 )
);
defparam \sram_top_ins/n226_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n225_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[3]),
	.F(\sram_top_ins/n225_15 )
);
defparam \sram_top_ins/n225_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n224_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[4]),
	.F(\sram_top_ins/n224_15 )
);
defparam \sram_top_ins/n224_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n223_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[5]),
	.F(\sram_top_ins/n223_15 )
);
defparam \sram_top_ins/n223_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n222_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[6]),
	.F(\sram_top_ins/n222_15 )
);
defparam \sram_top_ins/n222_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n221_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[7]),
	.F(\sram_top_ins/n221_15 )
);
defparam \sram_top_ins/n221_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n220_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[8]),
	.F(\sram_top_ins/n220_15 )
);
defparam \sram_top_ins/n220_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n219_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[9]),
	.F(\sram_top_ins/n219_15 )
);
defparam \sram_top_ins/n219_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n218_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[10]),
	.F(\sram_top_ins/n218_15 )
);
defparam \sram_top_ins/n218_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n217_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[11]),
	.F(\sram_top_ins/n217_15 )
);
defparam \sram_top_ins/n217_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n216_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[12]),
	.F(\sram_top_ins/n216_15 )
);
defparam \sram_top_ins/n216_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n215_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[13]),
	.F(\sram_top_ins/n215_15 )
);
defparam \sram_top_ins/n215_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n214_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[14]),
	.F(\sram_top_ins/n214_15 )
);
defparam \sram_top_ins/n214_s10 .INIT=4'h4;
LUT2 \sram_top_ins/n213_s10  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(doutb[15]),
	.F(\sram_top_ins/n213_15 )
);
defparam \sram_top_ins/n213_s10 .INIT=4'h4;
LUT4 \sram_top_ins/n202_s1  (
	.I0(wtaddr[7]),
	.I1(wtaddr[9]),
	.I2(wtaddr[8]),
	.I3(wtaddr[6]),
	.F(\sram_top_ins/n202_5 )
);
defparam \sram_top_ins/n202_s1 .INIT=16'h1000;
LUT4 \sram_top_ins/n202_s2  (
	.I0(wtaddr[2]),
	.I1(wtaddr[4]),
	.I2(wtaddr[3]),
	.I3(wtaddr[5]),
	.F(\sram_top_ins/n202_6 )
);
defparam \sram_top_ins/n202_s2 .INIT=16'h1000;
LUT4 \sram_top_ins/addrb_8_s4  (
	.I0(\sram_top_ins/addrb [5]),
	.I1(\sram_top_ins/addrb [6]),
	.I2(\sram_top_ins/addrb_8_10 ),
	.I3(\sram_top_ins/addrb_8_11 ),
	.F(\sram_top_ins/addrb_8_9 )
);
defparam \sram_top_ins/addrb_8_s4 .INIT=16'h1000;
LUT3 \sram_top_ins/data96_reg_95_s3  (
	.I0(\sram_top_ins/cnt [0]),
	.I1(\sram_top_ins/cnt [1]),
	.I2(\sram_top_ins/cnt [2]),
	.F(\sram_top_ins/data96_reg_95_7 )
);
defparam \sram_top_ins/data96_reg_95_s3 .INIT=8'h3E;
LUT4 \sram_top_ins/data96_reg_95_s4  (
	.I0(\sram_top_ins/data96_reg_95_10 ),
	.I1(\sram_top_ins/addrb_8_10 ),
	.I2(\sram_top_ins/addrb [7]),
	.I3(\sram_top_ins/addrb [8]),
	.F(\sram_top_ins/data96_reg_95_8 )
);
defparam \sram_top_ins/data96_reg_95_s4 .INIT=16'h7000;
LUT3 \sram_top_ins/data96_reg_95_s5  (
	.I0(\sram_top_ins/addrb [1]),
	.I1(\sram_top_ins/addrb_8_10 ),
	.I2(\sram_top_ins/data96_reg_95_11 ),
	.F(\sram_top_ins/data96_reg_95_9 )
);
defparam \sram_top_ins/data96_reg_95_s5 .INIT=8'h40;
LUT3 \sram_top_ins/data96_reg_79_s3  (
	.I0(\sram_top_ins/cnt [0]),
	.I1(\sram_top_ins/cnt [1]),
	.I2(\sram_top_ins/cnt [2]),
	.F(\sram_top_ins/data96_reg_79_7 )
);
defparam \sram_top_ins/data96_reg_79_s3 .INIT=8'h3D;
LUT2 \sram_top_ins/data96_reg_63_s3  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(\sram_top_ins/cnt [0]),
	.F(\sram_top_ins/data96_reg_63_7 )
);
defparam \sram_top_ins/data96_reg_63_s3 .INIT=4'h4;
LUT3 \sram_top_ins/data96_reg_47_s3  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(\sram_top_ins/cnt [0]),
	.I2(\sram_top_ins/cnt [1]),
	.F(\sram_top_ins/data96_reg_47_7 )
);
defparam \sram_top_ins/data96_reg_47_s3 .INIT=8'hE0;
LUT2 \sram_top_ins/data96_reg_31_s3  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(\sram_top_ins/cnt [0]),
	.F(\sram_top_ins/data96_reg_31_7 )
);
defparam \sram_top_ins/data96_reg_31_s3 .INIT=4'h4;
LUT2 \sram_top_ins/data96_reg_15_s3  (
	.I0(\sram_top_ins/cnt [0]),
	.I1(\sram_top_ins/cnt [1]),
	.F(\sram_top_ins/data96_reg_15_7 )
);
defparam \sram_top_ins/data96_reg_15_s3 .INIT=4'h1;
LUT4 \sram_top_ins/cntlatch_6_s6  (
	.I0(\sram_top_ins/data96_reg_95_11 ),
	.I1(\sram_top_ins/addrb_8_10 ),
	.I2(\sram_top_ins/data96_reg_15_7 ),
	.I3(\sram_top_ins/cntlatch_6_9 ),
	.F(\sram_top_ins/cntlatch_6_8 )
);
defparam \sram_top_ins/cntlatch_6_s6 .INIT=16'h7000;
LUT4 \sram_top_ins/latch_s4  (
	.I0(cntlatch[3]),
	.I1(cntlatch[4]),
	.I2(cntlatch[5]),
	.I3(\sram_top_ins/latch_10 ),
	.F(\sram_top_ins/latch_9 )
);
defparam \sram_top_ins/latch_s4 .INIT=16'h0100;
LUT2 \sram_top_ins/n642_s2  (
	.I0(cntlatch[0]),
	.I1(cntlatch[1]),
	.F(\sram_top_ins/n642_6 )
);
defparam \sram_top_ins/n642_s2 .INIT=4'h8;
LUT2 \sram_top_ins/n640_s2  (
	.I0(cntlatch[2]),
	.I1(cntlatch[3]),
	.F(\sram_top_ins/n640_6 )
);
defparam \sram_top_ins/n640_s2 .INIT=4'h8;
LUT4 \sram_top_ins/n518_s4  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(\sram_top_ins/cnt [1]),
	.I2(\sram_top_ins/cnt [0]),
	.I3(\sram_top_ins/promce ),
	.F(\sram_top_ins/n518_8 )
);
defparam \sram_top_ins/n518_s4 .INIT=16'h1C00;
LUT4 \sram_top_ins/n517_s4  (
	.I0(\sram_top_ins/cnt [1]),
	.I1(\sram_top_ins/cnt [2]),
	.I2(\sram_top_ins/cnt [0]),
	.I3(\sram_top_ins/promce ),
	.F(\sram_top_ins/n517_8 )
);
defparam \sram_top_ins/n517_s4 .INIT=16'h2C00;
LUT2 \sram_top_ins/n164_s2  (
	.I0(\sram_top_ins/addrb [0]),
	.I1(\sram_top_ins/addrb [1]),
	.F(\sram_top_ins/n164_6 )
);
defparam \sram_top_ins/n164_s2 .INIT=4'h8;
LUT4 \sram_top_ins/n162_s2  (
	.I0(\sram_top_ins/addrb [0]),
	.I1(\sram_top_ins/addrb [1]),
	.I2(\sram_top_ins/addrb [2]),
	.I3(\sram_top_ins/addrb [3]),
	.F(\sram_top_ins/n162_6 )
);
defparam \sram_top_ins/n162_s2 .INIT=16'h8000;
LUT3 \sram_top_ins/n160_s2  (
	.I0(\sram_top_ins/addrb [4]),
	.I1(\sram_top_ins/addrb [5]),
	.I2(\sram_top_ins/n162_6 ),
	.F(\sram_top_ins/n160_6 )
);
defparam \sram_top_ins/n160_s2 .INIT=8'h80;
LUT4 \sram_top_ins/n158_s2  (
	.I0(\sram_top_ins/addrb [4]),
	.I1(\sram_top_ins/addrb [5]),
	.I2(\sram_top_ins/addrb [6]),
	.I3(\sram_top_ins/addrb [7]),
	.F(\sram_top_ins/n158_6 )
);
defparam \sram_top_ins/n158_s2 .INIT=16'h8000;
LUT3 \sram_top_ins/addrb_8_s5  (
	.I0(\sram_top_ins/addrb [2]),
	.I1(\sram_top_ins/addrb [3]),
	.I2(\sram_top_ins/addrb [4]),
	.F(\sram_top_ins/addrb_8_10 )
);
defparam \sram_top_ins/addrb_8_s5 .INIT=8'h01;
LUT4 \sram_top_ins/addrb_8_s6  (
	.I0(\sram_top_ins/addrb [0]),
	.I1(\sram_top_ins/addrb [1]),
	.I2(\sram_top_ins/addrb [7]),
	.I3(\sram_top_ins/addrb [8]),
	.F(\sram_top_ins/addrb_8_11 )
);
defparam \sram_top_ins/addrb_8_s6 .INIT=16'h4000;
LUT4 \sram_top_ins/data96_reg_95_s6  (
	.I0(\sram_top_ins/addrb [1]),
	.I1(\sram_top_ins/addrb [0]),
	.I2(\sram_top_ins/addrb [5]),
	.I3(\sram_top_ins/addrb [6]),
	.F(\sram_top_ins/data96_reg_95_10 )
);
defparam \sram_top_ins/data96_reg_95_s6 .INIT=16'h0007;
LUT4 \sram_top_ins/data96_reg_95_s7  (
	.I0(\sram_top_ins/addrb [5]),
	.I1(\sram_top_ins/addrb [6]),
	.I2(\sram_top_ins/addrb [7]),
	.I3(\sram_top_ins/addrb [8]),
	.F(\sram_top_ins/data96_reg_95_11 )
);
defparam \sram_top_ins/data96_reg_95_s7 .INIT=16'h0001;
LUT2 \sram_top_ins/cntlatch_6_s7  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(cntlatch[6]),
	.F(\sram_top_ins/cntlatch_6_9 )
);
defparam \sram_top_ins/cntlatch_6_s7 .INIT=4'h1;
LUT4 \sram_top_ins/latch_s5  (
	.I0(cntlatch[0]),
	.I1(cntlatch[1]),
	.I2(cntlatch[2]),
	.I3(cntlatch[6]),
	.F(\sram_top_ins/latch_10 )
);
defparam \sram_top_ins/latch_s5 .INIT=16'h0100;
LUT3 \sram_top_ins/cnt_2_s5  (
	.I0(\sram_top_ins/cnt [2]),
	.I1(\sram_top_ins/cnt [1]),
	.I2(\sram_top_ins/cnt [0]),
	.F(\sram_top_ins/cnt_2_11 )
);
defparam \sram_top_ins/cnt_2_s5 .INIT=8'h20;
LUT4 \sram_top_ins/n164_s3  (
	.I0(\sram_top_ins/addrb [2]),
	.I1(\sram_top_ins/addrb [0]),
	.I2(\sram_top_ins/addrb [1]),
	.I3(\sram_top_ins/promce ),
	.F(\sram_top_ins/n164_8 )
);
defparam \sram_top_ins/n164_s3 .INIT=16'h6A00;
LUT4 \sram_top_ins/n639_s3  (
	.I0(cntlatch[4]),
	.I1(\sram_top_ins/n642_6 ),
	.I2(cntlatch[2]),
	.I3(cntlatch[3]),
	.F(\sram_top_ins/n639_8 )
);
defparam \sram_top_ins/n639_s3 .INIT=16'h8000;
LUT4 \sram_top_ins/n204_s3  (
	.I0(wtaddr[0]),
	.I1(wtaddr[1]),
	.I2(\sram_top_ins/n202_5 ),
	.I3(\sram_top_ins/n202_6 ),
	.F(\sram_top_ins/n204_8 )
);
defparam \sram_top_ins/n204_s3 .INIT=16'hEFFF;
LUT4 \sram_top_ins/n642_s3  (
	.I0(cntlatch[2]),
	.I1(cntlatch[0]),
	.I2(cntlatch[1]),
	.I3(\sram_top_ins/cntlatch_6_8 ),
	.F(\sram_top_ins/n642_8 )
);
defparam \sram_top_ins/n642_s3 .INIT=16'h6A00;
LUT4 \sram_top_ins/n517_s5  (
	.I0(\sram_top_ins/addrb [1]),
	.I1(\sram_top_ins/addrb_8_10 ),
	.I2(\sram_top_ins/data96_reg_95_11 ),
	.I3(\sram_top_ins/n517_8 ),
	.F(\sram_top_ins/n517_10 )
);
defparam \sram_top_ins/n517_s5 .INIT=16'hBF00;
LUT4 \sram_top_ins/n518_s5  (
	.I0(\sram_top_ins/addrb [1]),
	.I1(\sram_top_ins/addrb_8_10 ),
	.I2(\sram_top_ins/data96_reg_95_11 ),
	.I3(\sram_top_ins/n518_8 ),
	.F(\sram_top_ins/n518_10 )
);
defparam \sram_top_ins/n518_s5 .INIT=16'hBF00;
LUT4 \sram_top_ins/n166_s4  (
	.I0(\sram_top_ins/addrb [0]),
	.I1(\sram_top_ins/promce ),
	.I2(sdbpflag),
	.I3(\sram_top_ins/addrb_8_9 ),
	.F(\sram_top_ins/n166_12 )
);
defparam \sram_top_ins/n166_s4 .INIT=16'h4446;
LUT3 \sram_top_ins/addrb_8_s7  (
	.I0(\sram_top_ins/promce ),
	.I1(sdbpflag),
	.I2(\sram_top_ins/addrb_8_9 ),
	.F(\sram_top_ins/addrb_8_13 )
);
defparam \sram_top_ins/addrb_8_s7 .INIT=8'hFE;
LUT4 \sram_top_ins/n519_s5  (
	.I0(\sram_top_ins/promce ),
	.I1(\sram_top_ins/cnt [0]),
	.I2(\sram_top_ins/data96_reg_95_9 ),
	.I3(\sram_top_ins/cnt_2_11 ),
	.F(\sram_top_ins/n519_10 )
);
defparam \sram_top_ins/n519_s5 .INIT=16'h0282;
LUT3 \sram_top_ins/cnt_2_s6  (
	.I0(\sram_top_ins/promce ),
	.I1(\sram_top_ins/data96_reg_95_9 ),
	.I2(\sram_top_ins/cnt_2_11 ),
	.F(\sram_top_ins/cnt_2_13 )
);
defparam \sram_top_ins/cnt_2_s6 .INIT=8'hF7;
LUT4 \sram_top_ins/n639_s5  (
	.I0(sdbpflag),
	.I1(cntlatch[5]),
	.I2(\sram_top_ins/n639_8 ),
	.I3(\sram_top_ins/cntlatch_6_8 ),
	.F(\sram_top_ins/n639_11 )
);
defparam \sram_top_ins/n639_s5 .INIT=16'h3C44;
LUT2 \sram_top_ins/cntlatch_6_s8  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.F(\sram_top_ins/cntlatch_6_109 )
);
defparam \sram_top_ins/cntlatch_6_s8 .INIT=4'hE;
LUT4 \sram_top_ins/n643_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(cntlatch[1]),
	.I3(cntlatch[0]),
	.F(\sram_top_ins/n643_8 )
);
defparam \sram_top_ins/n643_s3 .INIT=16'h1CD0;
LUT3 \sram_top_ins/n644_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(cntlatch[0]),
	.F(\sram_top_ins/n644_8 )
);
defparam \sram_top_ins/n644_s3 .INIT=8'h1C;
LUT4 \sram_top_ins/n542_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[95]),
	.I3(\sram_top_ins/data96_reg [95]),
	.F(\sram_top_ins/n542_8 )
);
defparam \sram_top_ins/n542_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n543_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[94]),
	.I3(\sram_top_ins/data96_reg [94]),
	.F(\sram_top_ins/n543_8 )
);
defparam \sram_top_ins/n543_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n544_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[93]),
	.I3(\sram_top_ins/data96_reg [93]),
	.F(\sram_top_ins/n544_8 )
);
defparam \sram_top_ins/n544_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n545_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[92]),
	.I3(\sram_top_ins/data96_reg [92]),
	.F(\sram_top_ins/n545_8 )
);
defparam \sram_top_ins/n545_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n546_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[91]),
	.I3(\sram_top_ins/data96_reg [91]),
	.F(\sram_top_ins/n546_8 )
);
defparam \sram_top_ins/n546_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n547_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[90]),
	.I3(\sram_top_ins/data96_reg [90]),
	.F(\sram_top_ins/n547_8 )
);
defparam \sram_top_ins/n547_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n548_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[89]),
	.I3(\sram_top_ins/data96_reg [89]),
	.F(\sram_top_ins/n548_8 )
);
defparam \sram_top_ins/n548_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n549_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[88]),
	.I3(\sram_top_ins/data96_reg [88]),
	.F(\sram_top_ins/n549_8 )
);
defparam \sram_top_ins/n549_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n550_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[87]),
	.I3(\sram_top_ins/data96_reg [87]),
	.F(\sram_top_ins/n550_8 )
);
defparam \sram_top_ins/n550_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n551_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[86]),
	.I3(\sram_top_ins/data96_reg [86]),
	.F(\sram_top_ins/n551_8 )
);
defparam \sram_top_ins/n551_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n552_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[85]),
	.I3(\sram_top_ins/data96_reg [85]),
	.F(\sram_top_ins/n552_8 )
);
defparam \sram_top_ins/n552_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n553_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[84]),
	.I3(\sram_top_ins/data96_reg [84]),
	.F(\sram_top_ins/n553_8 )
);
defparam \sram_top_ins/n553_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n554_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[83]),
	.I3(\sram_top_ins/data96_reg [83]),
	.F(\sram_top_ins/n554_8 )
);
defparam \sram_top_ins/n554_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n555_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[82]),
	.I3(\sram_top_ins/data96_reg [82]),
	.F(\sram_top_ins/n555_8 )
);
defparam \sram_top_ins/n555_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n556_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[81]),
	.I3(\sram_top_ins/data96_reg [81]),
	.F(\sram_top_ins/n556_8 )
);
defparam \sram_top_ins/n556_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n557_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[80]),
	.I3(\sram_top_ins/data96_reg [80]),
	.F(\sram_top_ins/n557_8 )
);
defparam \sram_top_ins/n557_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n558_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[79]),
	.I3(\sram_top_ins/data96_reg [79]),
	.F(\sram_top_ins/n558_8 )
);
defparam \sram_top_ins/n558_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n559_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[78]),
	.I3(\sram_top_ins/data96_reg [78]),
	.F(\sram_top_ins/n559_8 )
);
defparam \sram_top_ins/n559_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n560_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[77]),
	.I3(\sram_top_ins/data96_reg [77]),
	.F(\sram_top_ins/n560_8 )
);
defparam \sram_top_ins/n560_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n561_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[76]),
	.I3(\sram_top_ins/data96_reg [76]),
	.F(\sram_top_ins/n561_8 )
);
defparam \sram_top_ins/n561_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n562_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[75]),
	.I3(\sram_top_ins/data96_reg [75]),
	.F(\sram_top_ins/n562_8 )
);
defparam \sram_top_ins/n562_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n563_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[74]),
	.I3(\sram_top_ins/data96_reg [74]),
	.F(\sram_top_ins/n563_8 )
);
defparam \sram_top_ins/n563_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n564_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[73]),
	.I3(\sram_top_ins/data96_reg [73]),
	.F(\sram_top_ins/n564_8 )
);
defparam \sram_top_ins/n564_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n565_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[72]),
	.I3(\sram_top_ins/data96_reg [72]),
	.F(\sram_top_ins/n565_8 )
);
defparam \sram_top_ins/n565_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n566_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[71]),
	.I3(\sram_top_ins/data96_reg [71]),
	.F(\sram_top_ins/n566_8 )
);
defparam \sram_top_ins/n566_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n567_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[70]),
	.I3(\sram_top_ins/data96_reg [70]),
	.F(\sram_top_ins/n567_8 )
);
defparam \sram_top_ins/n567_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n568_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[69]),
	.I3(\sram_top_ins/data96_reg [69]),
	.F(\sram_top_ins/n568_8 )
);
defparam \sram_top_ins/n568_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n569_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[68]),
	.I3(\sram_top_ins/data96_reg [68]),
	.F(\sram_top_ins/n569_8 )
);
defparam \sram_top_ins/n569_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n570_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[67]),
	.I3(\sram_top_ins/data96_reg [67]),
	.F(\sram_top_ins/n570_8 )
);
defparam \sram_top_ins/n570_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n571_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[66]),
	.I3(\sram_top_ins/data96_reg [66]),
	.F(\sram_top_ins/n571_8 )
);
defparam \sram_top_ins/n571_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n572_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[65]),
	.I3(\sram_top_ins/data96_reg [65]),
	.F(\sram_top_ins/n572_8 )
);
defparam \sram_top_ins/n572_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n573_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[64]),
	.I3(\sram_top_ins/data96_reg [64]),
	.F(\sram_top_ins/n573_8 )
);
defparam \sram_top_ins/n573_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n574_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[63]),
	.I3(\sram_top_ins/data96_reg [63]),
	.F(\sram_top_ins/n574_8 )
);
defparam \sram_top_ins/n574_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n575_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[62]),
	.I3(\sram_top_ins/data96_reg [62]),
	.F(\sram_top_ins/n575_8 )
);
defparam \sram_top_ins/n575_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n576_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[61]),
	.I3(\sram_top_ins/data96_reg [61]),
	.F(\sram_top_ins/n576_8 )
);
defparam \sram_top_ins/n576_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n577_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[60]),
	.I3(\sram_top_ins/data96_reg [60]),
	.F(\sram_top_ins/n577_8 )
);
defparam \sram_top_ins/n577_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n578_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[59]),
	.I3(\sram_top_ins/data96_reg [59]),
	.F(\sram_top_ins/n578_8 )
);
defparam \sram_top_ins/n578_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n579_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[58]),
	.I3(\sram_top_ins/data96_reg [58]),
	.F(\sram_top_ins/n579_8 )
);
defparam \sram_top_ins/n579_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n580_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[57]),
	.I3(\sram_top_ins/data96_reg [57]),
	.F(\sram_top_ins/n580_8 )
);
defparam \sram_top_ins/n580_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n581_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[56]),
	.I3(\sram_top_ins/data96_reg [56]),
	.F(\sram_top_ins/n581_8 )
);
defparam \sram_top_ins/n581_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n582_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[55]),
	.I3(\sram_top_ins/data96_reg [55]),
	.F(\sram_top_ins/n582_8 )
);
defparam \sram_top_ins/n582_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n583_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[54]),
	.I3(\sram_top_ins/data96_reg [54]),
	.F(\sram_top_ins/n583_8 )
);
defparam \sram_top_ins/n583_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n584_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[53]),
	.I3(\sram_top_ins/data96_reg [53]),
	.F(\sram_top_ins/n584_8 )
);
defparam \sram_top_ins/n584_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n585_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[52]),
	.I3(\sram_top_ins/data96_reg [52]),
	.F(\sram_top_ins/n585_8 )
);
defparam \sram_top_ins/n585_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n586_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[51]),
	.I3(\sram_top_ins/data96_reg [51]),
	.F(\sram_top_ins/n586_8 )
);
defparam \sram_top_ins/n586_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n587_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[50]),
	.I3(\sram_top_ins/data96_reg [50]),
	.F(\sram_top_ins/n587_8 )
);
defparam \sram_top_ins/n587_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n588_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[49]),
	.I3(\sram_top_ins/data96_reg [49]),
	.F(\sram_top_ins/n588_8 )
);
defparam \sram_top_ins/n588_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n589_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[48]),
	.I3(\sram_top_ins/data96_reg [48]),
	.F(\sram_top_ins/n589_8 )
);
defparam \sram_top_ins/n589_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n590_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[47]),
	.I3(\sram_top_ins/data96_reg [47]),
	.F(\sram_top_ins/n590_8 )
);
defparam \sram_top_ins/n590_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n591_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[46]),
	.I3(\sram_top_ins/data96_reg [46]),
	.F(\sram_top_ins/n591_8 )
);
defparam \sram_top_ins/n591_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n592_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[45]),
	.I3(\sram_top_ins/data96_reg [45]),
	.F(\sram_top_ins/n592_8 )
);
defparam \sram_top_ins/n592_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n593_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[44]),
	.I3(\sram_top_ins/data96_reg [44]),
	.F(\sram_top_ins/n593_8 )
);
defparam \sram_top_ins/n593_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n594_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[43]),
	.I3(\sram_top_ins/data96_reg [43]),
	.F(\sram_top_ins/n594_8 )
);
defparam \sram_top_ins/n594_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n595_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[42]),
	.I3(\sram_top_ins/data96_reg [42]),
	.F(\sram_top_ins/n595_8 )
);
defparam \sram_top_ins/n595_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n596_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[41]),
	.I3(\sram_top_ins/data96_reg [41]),
	.F(\sram_top_ins/n596_8 )
);
defparam \sram_top_ins/n596_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n597_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[40]),
	.I3(\sram_top_ins/data96_reg [40]),
	.F(\sram_top_ins/n597_8 )
);
defparam \sram_top_ins/n597_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n598_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[39]),
	.I3(\sram_top_ins/data96_reg [39]),
	.F(\sram_top_ins/n598_8 )
);
defparam \sram_top_ins/n598_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n599_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[38]),
	.I3(\sram_top_ins/data96_reg [38]),
	.F(\sram_top_ins/n599_8 )
);
defparam \sram_top_ins/n599_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n600_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[37]),
	.I3(\sram_top_ins/data96_reg [37]),
	.F(\sram_top_ins/n600_8 )
);
defparam \sram_top_ins/n600_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n601_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[36]),
	.I3(\sram_top_ins/data96_reg [36]),
	.F(\sram_top_ins/n601_8 )
);
defparam \sram_top_ins/n601_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n602_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[35]),
	.I3(\sram_top_ins/data96_reg [35]),
	.F(\sram_top_ins/n602_8 )
);
defparam \sram_top_ins/n602_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n603_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[34]),
	.I3(\sram_top_ins/data96_reg [34]),
	.F(\sram_top_ins/n603_8 )
);
defparam \sram_top_ins/n603_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n604_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[33]),
	.I3(\sram_top_ins/data96_reg [33]),
	.F(\sram_top_ins/n604_8 )
);
defparam \sram_top_ins/n604_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n605_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[32]),
	.I3(\sram_top_ins/data96_reg [32]),
	.F(\sram_top_ins/n605_8 )
);
defparam \sram_top_ins/n605_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n606_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[31]),
	.I3(\sram_top_ins/data96_reg [31]),
	.F(\sram_top_ins/n606_8 )
);
defparam \sram_top_ins/n606_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n607_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[30]),
	.I3(\sram_top_ins/data96_reg [30]),
	.F(\sram_top_ins/n607_8 )
);
defparam \sram_top_ins/n607_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n608_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[29]),
	.I3(\sram_top_ins/data96_reg [29]),
	.F(\sram_top_ins/n608_8 )
);
defparam \sram_top_ins/n608_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n609_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[28]),
	.I3(\sram_top_ins/data96_reg [28]),
	.F(\sram_top_ins/n609_8 )
);
defparam \sram_top_ins/n609_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n610_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[27]),
	.I3(\sram_top_ins/data96_reg [27]),
	.F(\sram_top_ins/n610_8 )
);
defparam \sram_top_ins/n610_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n611_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[26]),
	.I3(\sram_top_ins/data96_reg [26]),
	.F(\sram_top_ins/n611_8 )
);
defparam \sram_top_ins/n611_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n612_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[25]),
	.I3(\sram_top_ins/data96_reg [25]),
	.F(\sram_top_ins/n612_8 )
);
defparam \sram_top_ins/n612_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n613_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[24]),
	.I3(\sram_top_ins/data96_reg [24]),
	.F(\sram_top_ins/n613_8 )
);
defparam \sram_top_ins/n613_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n614_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[23]),
	.I3(\sram_top_ins/data96_reg [23]),
	.F(\sram_top_ins/n614_8 )
);
defparam \sram_top_ins/n614_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n615_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[22]),
	.I3(\sram_top_ins/data96_reg [22]),
	.F(\sram_top_ins/n615_8 )
);
defparam \sram_top_ins/n615_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n616_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[21]),
	.I3(\sram_top_ins/data96_reg [21]),
	.F(\sram_top_ins/n616_8 )
);
defparam \sram_top_ins/n616_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n617_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[20]),
	.I3(\sram_top_ins/data96_reg [20]),
	.F(\sram_top_ins/n617_8 )
);
defparam \sram_top_ins/n617_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n618_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[19]),
	.I3(\sram_top_ins/data96_reg [19]),
	.F(\sram_top_ins/n618_8 )
);
defparam \sram_top_ins/n618_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n619_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[18]),
	.I3(\sram_top_ins/data96_reg [18]),
	.F(\sram_top_ins/n619_8 )
);
defparam \sram_top_ins/n619_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n620_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[17]),
	.I3(\sram_top_ins/data96_reg [17]),
	.F(\sram_top_ins/n620_8 )
);
defparam \sram_top_ins/n620_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n621_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[16]),
	.I3(\sram_top_ins/data96_reg [16]),
	.F(\sram_top_ins/n621_8 )
);
defparam \sram_top_ins/n621_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n622_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[15]),
	.I3(\sram_top_ins/data96_reg [15]),
	.F(\sram_top_ins/n622_8 )
);
defparam \sram_top_ins/n622_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n623_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[14]),
	.I3(\sram_top_ins/data96_reg [14]),
	.F(\sram_top_ins/n623_8 )
);
defparam \sram_top_ins/n623_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n624_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[13]),
	.I3(\sram_top_ins/data96_reg [13]),
	.F(\sram_top_ins/n624_8 )
);
defparam \sram_top_ins/n624_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n625_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[12]),
	.I3(\sram_top_ins/data96_reg [12]),
	.F(\sram_top_ins/n625_8 )
);
defparam \sram_top_ins/n625_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n626_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[11]),
	.I3(\sram_top_ins/data96_reg [11]),
	.F(\sram_top_ins/n626_8 )
);
defparam \sram_top_ins/n626_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n627_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[10]),
	.I3(\sram_top_ins/data96_reg [10]),
	.F(\sram_top_ins/n627_8 )
);
defparam \sram_top_ins/n627_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n628_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[9]),
	.I3(\sram_top_ins/data96_reg [9]),
	.F(\sram_top_ins/n628_8 )
);
defparam \sram_top_ins/n628_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n629_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[8]),
	.I3(\sram_top_ins/data96_reg [8]),
	.F(\sram_top_ins/n629_8 )
);
defparam \sram_top_ins/n629_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n630_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[7]),
	.I3(\sram_top_ins/data96_reg [7]),
	.F(\sram_top_ins/n630_8 )
);
defparam \sram_top_ins/n630_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n631_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[6]),
	.I3(\sram_top_ins/data96_reg [6]),
	.F(\sram_top_ins/n631_8 )
);
defparam \sram_top_ins/n631_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n632_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[5]),
	.I3(\sram_top_ins/data96_reg [5]),
	.F(\sram_top_ins/n632_8 )
);
defparam \sram_top_ins/n632_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n633_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[4]),
	.I3(\sram_top_ins/data96_reg [4]),
	.F(\sram_top_ins/n633_8 )
);
defparam \sram_top_ins/n633_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n634_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[3]),
	.I3(\sram_top_ins/data96_reg [3]),
	.F(\sram_top_ins/n634_8 )
);
defparam \sram_top_ins/n634_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n635_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[2]),
	.I3(\sram_top_ins/data96_reg [2]),
	.F(\sram_top_ins/n635_8 )
);
defparam \sram_top_ins/n635_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n636_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[1]),
	.I3(\sram_top_ins/data96_reg [1]),
	.F(\sram_top_ins/n636_8 )
);
defparam \sram_top_ins/n636_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n637_s3  (
	.I0(sdbpflag),
	.I1(\sram_top_ins/cntlatch_6_8 ),
	.I2(datain[0]),
	.I3(\sram_top_ins/data96_reg [0]),
	.F(\sram_top_ins/n637_8 )
);
defparam \sram_top_ins/n637_s3 .INIT=16'hDC10;
LUT4 \sram_top_ins/n871_s5  (
	.I0(\sram_top_ins/latch_9 ),
	.I1(\sram_top_ins/cnt [2]),
	.I2(\sram_top_ins/cnt [1]),
	.I3(\sram_top_ins/cnt [0]),
	.F(\sram_top_ins/n871_10 )
);
defparam \sram_top_ins/n871_s5 .INIT=16'h0400;
DFFCE \sram_top_ins/data96_reg_95_s0  (
	.D(\sram_top_ins/n213_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [95])
);
defparam \sram_top_ins/data96_reg_95_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_94_s0  (
	.D(\sram_top_ins/n214_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [94])
);
defparam \sram_top_ins/data96_reg_94_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_93_s0  (
	.D(\sram_top_ins/n215_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [93])
);
defparam \sram_top_ins/data96_reg_93_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_92_s0  (
	.D(\sram_top_ins/n216_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [92])
);
defparam \sram_top_ins/data96_reg_92_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_91_s0  (
	.D(\sram_top_ins/n217_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [91])
);
defparam \sram_top_ins/data96_reg_91_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_90_s0  (
	.D(\sram_top_ins/n218_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [90])
);
defparam \sram_top_ins/data96_reg_90_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_89_s0  (
	.D(\sram_top_ins/n219_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [89])
);
defparam \sram_top_ins/data96_reg_89_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_88_s0  (
	.D(\sram_top_ins/n220_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [88])
);
defparam \sram_top_ins/data96_reg_88_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_87_s0  (
	.D(\sram_top_ins/n221_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [87])
);
defparam \sram_top_ins/data96_reg_87_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_86_s0  (
	.D(\sram_top_ins/n222_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [86])
);
defparam \sram_top_ins/data96_reg_86_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_85_s0  (
	.D(\sram_top_ins/n223_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [85])
);
defparam \sram_top_ins/data96_reg_85_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_84_s0  (
	.D(\sram_top_ins/n224_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [84])
);
defparam \sram_top_ins/data96_reg_84_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_83_s0  (
	.D(\sram_top_ins/n225_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [83])
);
defparam \sram_top_ins/data96_reg_83_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_82_s0  (
	.D(\sram_top_ins/n226_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [82])
);
defparam \sram_top_ins/data96_reg_82_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_81_s0  (
	.D(\sram_top_ins/n227_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [81])
);
defparam \sram_top_ins/data96_reg_81_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_80_s0  (
	.D(\sram_top_ins/n228_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_95_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [80])
);
defparam \sram_top_ins/data96_reg_80_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_79_s0  (
	.D(\sram_top_ins/n213_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [79])
);
defparam \sram_top_ins/data96_reg_79_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_78_s0  (
	.D(\sram_top_ins/n214_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [78])
);
defparam \sram_top_ins/data96_reg_78_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_77_s0  (
	.D(\sram_top_ins/n215_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [77])
);
defparam \sram_top_ins/data96_reg_77_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_76_s0  (
	.D(\sram_top_ins/n216_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [76])
);
defparam \sram_top_ins/data96_reg_76_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_75_s0  (
	.D(\sram_top_ins/n217_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [75])
);
defparam \sram_top_ins/data96_reg_75_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_74_s0  (
	.D(\sram_top_ins/n218_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [74])
);
defparam \sram_top_ins/data96_reg_74_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_73_s0  (
	.D(\sram_top_ins/n219_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [73])
);
defparam \sram_top_ins/data96_reg_73_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_72_s0  (
	.D(\sram_top_ins/n220_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [72])
);
defparam \sram_top_ins/data96_reg_72_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_71_s0  (
	.D(\sram_top_ins/n221_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [71])
);
defparam \sram_top_ins/data96_reg_71_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_70_s0  (
	.D(\sram_top_ins/n222_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [70])
);
defparam \sram_top_ins/data96_reg_70_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_69_s0  (
	.D(\sram_top_ins/n223_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [69])
);
defparam \sram_top_ins/data96_reg_69_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_68_s0  (
	.D(\sram_top_ins/n224_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [68])
);
defparam \sram_top_ins/data96_reg_68_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_67_s0  (
	.D(\sram_top_ins/n225_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [67])
);
defparam \sram_top_ins/data96_reg_67_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_66_s0  (
	.D(\sram_top_ins/n226_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [66])
);
defparam \sram_top_ins/data96_reg_66_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_65_s0  (
	.D(\sram_top_ins/n227_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [65])
);
defparam \sram_top_ins/data96_reg_65_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_64_s0  (
	.D(\sram_top_ins/n228_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_79_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [64])
);
defparam \sram_top_ins/data96_reg_64_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_63_s0  (
	.D(\sram_top_ins/n213_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [63])
);
defparam \sram_top_ins/data96_reg_63_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_62_s0  (
	.D(\sram_top_ins/n214_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [62])
);
defparam \sram_top_ins/data96_reg_62_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_61_s0  (
	.D(\sram_top_ins/n215_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [61])
);
defparam \sram_top_ins/data96_reg_61_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_60_s0  (
	.D(\sram_top_ins/n216_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [60])
);
defparam \sram_top_ins/data96_reg_60_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_59_s0  (
	.D(\sram_top_ins/n217_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [59])
);
defparam \sram_top_ins/data96_reg_59_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_58_s0  (
	.D(\sram_top_ins/n218_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [58])
);
defparam \sram_top_ins/data96_reg_58_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_57_s0  (
	.D(\sram_top_ins/n219_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [57])
);
defparam \sram_top_ins/data96_reg_57_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_56_s0  (
	.D(\sram_top_ins/n220_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [56])
);
defparam \sram_top_ins/data96_reg_56_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_55_s0  (
	.D(\sram_top_ins/n221_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [55])
);
defparam \sram_top_ins/data96_reg_55_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_54_s0  (
	.D(\sram_top_ins/n222_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [54])
);
defparam \sram_top_ins/data96_reg_54_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_53_s0  (
	.D(\sram_top_ins/n223_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [53])
);
defparam \sram_top_ins/data96_reg_53_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_52_s0  (
	.D(\sram_top_ins/n224_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [52])
);
defparam \sram_top_ins/data96_reg_52_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_51_s0  (
	.D(\sram_top_ins/n225_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [51])
);
defparam \sram_top_ins/data96_reg_51_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_50_s0  (
	.D(\sram_top_ins/n226_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [50])
);
defparam \sram_top_ins/data96_reg_50_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_49_s0  (
	.D(\sram_top_ins/n227_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [49])
);
defparam \sram_top_ins/data96_reg_49_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_48_s0  (
	.D(\sram_top_ins/n228_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_63_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [48])
);
defparam \sram_top_ins/data96_reg_48_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_47_s0  (
	.D(\sram_top_ins/n213_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [47])
);
defparam \sram_top_ins/data96_reg_47_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_46_s0  (
	.D(\sram_top_ins/n214_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [46])
);
defparam \sram_top_ins/data96_reg_46_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_45_s0  (
	.D(\sram_top_ins/n215_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [45])
);
defparam \sram_top_ins/data96_reg_45_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_44_s0  (
	.D(\sram_top_ins/n216_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [44])
);
defparam \sram_top_ins/data96_reg_44_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_43_s0  (
	.D(\sram_top_ins/n217_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [43])
);
defparam \sram_top_ins/data96_reg_43_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_42_s0  (
	.D(\sram_top_ins/n218_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [42])
);
defparam \sram_top_ins/data96_reg_42_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_41_s0  (
	.D(\sram_top_ins/n219_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [41])
);
defparam \sram_top_ins/data96_reg_41_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_40_s0  (
	.D(\sram_top_ins/n220_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [40])
);
defparam \sram_top_ins/data96_reg_40_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_39_s0  (
	.D(\sram_top_ins/n221_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [39])
);
defparam \sram_top_ins/data96_reg_39_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_38_s0  (
	.D(\sram_top_ins/n222_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [38])
);
defparam \sram_top_ins/data96_reg_38_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_37_s0  (
	.D(\sram_top_ins/n223_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [37])
);
defparam \sram_top_ins/data96_reg_37_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_36_s0  (
	.D(\sram_top_ins/n224_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [36])
);
defparam \sram_top_ins/data96_reg_36_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_35_s0  (
	.D(\sram_top_ins/n225_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [35])
);
defparam \sram_top_ins/data96_reg_35_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_34_s0  (
	.D(\sram_top_ins/n226_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [34])
);
defparam \sram_top_ins/data96_reg_34_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_33_s0  (
	.D(\sram_top_ins/n227_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [33])
);
defparam \sram_top_ins/data96_reg_33_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_32_s0  (
	.D(\sram_top_ins/n228_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_47_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [32])
);
defparam \sram_top_ins/data96_reg_32_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_31_s0  (
	.D(\sram_top_ins/n277_16 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [31])
);
defparam \sram_top_ins/data96_reg_31_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_30_s0  (
	.D(\sram_top_ins/n278_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [30])
);
defparam \sram_top_ins/data96_reg_30_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_29_s0  (
	.D(\sram_top_ins/n279_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [29])
);
defparam \sram_top_ins/data96_reg_29_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_28_s0  (
	.D(\sram_top_ins/n280_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [28])
);
defparam \sram_top_ins/data96_reg_28_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_27_s0  (
	.D(\sram_top_ins/n281_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [27])
);
defparam \sram_top_ins/data96_reg_27_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_26_s0  (
	.D(\sram_top_ins/n282_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [26])
);
defparam \sram_top_ins/data96_reg_26_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_25_s0  (
	.D(\sram_top_ins/n283_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [25])
);
defparam \sram_top_ins/data96_reg_25_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_24_s0  (
	.D(\sram_top_ins/n284_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [24])
);
defparam \sram_top_ins/data96_reg_24_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_23_s0  (
	.D(\sram_top_ins/n285_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [23])
);
defparam \sram_top_ins/data96_reg_23_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_22_s0  (
	.D(\sram_top_ins/n286_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [22])
);
defparam \sram_top_ins/data96_reg_22_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_21_s0  (
	.D(\sram_top_ins/n287_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [21])
);
defparam \sram_top_ins/data96_reg_21_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_20_s0  (
	.D(\sram_top_ins/n288_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [20])
);
defparam \sram_top_ins/data96_reg_20_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_19_s0  (
	.D(\sram_top_ins/n289_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [19])
);
defparam \sram_top_ins/data96_reg_19_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_18_s0  (
	.D(\sram_top_ins/n290_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [18])
);
defparam \sram_top_ins/data96_reg_18_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_17_s0  (
	.D(\sram_top_ins/n291_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [17])
);
defparam \sram_top_ins/data96_reg_17_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_16_s0  (
	.D(\sram_top_ins/n292_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_31_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [16])
);
defparam \sram_top_ins/data96_reg_16_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_15_s0  (
	.D(\sram_top_ins/n277_16 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [15])
);
defparam \sram_top_ins/data96_reg_15_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_14_s0  (
	.D(\sram_top_ins/n278_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [14])
);
defparam \sram_top_ins/data96_reg_14_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_13_s0  (
	.D(\sram_top_ins/n279_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [13])
);
defparam \sram_top_ins/data96_reg_13_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_12_s0  (
	.D(\sram_top_ins/n280_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [12])
);
defparam \sram_top_ins/data96_reg_12_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_11_s0  (
	.D(\sram_top_ins/n281_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [11])
);
defparam \sram_top_ins/data96_reg_11_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_10_s0  (
	.D(\sram_top_ins/n282_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [10])
);
defparam \sram_top_ins/data96_reg_10_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_9_s0  (
	.D(\sram_top_ins/n283_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [9])
);
defparam \sram_top_ins/data96_reg_9_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_8_s0  (
	.D(\sram_top_ins/n284_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [8])
);
defparam \sram_top_ins/data96_reg_8_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_7_s0  (
	.D(\sram_top_ins/n285_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [7])
);
defparam \sram_top_ins/data96_reg_7_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_6_s0  (
	.D(\sram_top_ins/n286_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [6])
);
defparam \sram_top_ins/data96_reg_6_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_5_s0  (
	.D(\sram_top_ins/n287_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [5])
);
defparam \sram_top_ins/data96_reg_5_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_4_s0  (
	.D(\sram_top_ins/n288_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [4])
);
defparam \sram_top_ins/data96_reg_4_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_3_s0  (
	.D(\sram_top_ins/n289_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [3])
);
defparam \sram_top_ins/data96_reg_3_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_2_s0  (
	.D(\sram_top_ins/n290_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [2])
);
defparam \sram_top_ins/data96_reg_2_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_1_s0  (
	.D(\sram_top_ins/n291_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [1])
);
defparam \sram_top_ins/data96_reg_1_s0 .INIT=1'b0;
DFFCE \sram_top_ins/data96_reg_0_s0  (
	.D(\sram_top_ins/n292_15 ),
	.CLK(clkb),
	.CE(\sram_top_ins/data96_reg_15_6 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/data96_reg [0])
);
defparam \sram_top_ins/data96_reg_0_s0 .INIT=1'b0;
DFFC \sram_top_ins/frame_s0  (
	.D(\sram_top_ins/n202_4 ),
	.CLK(clka),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(frame_flag)
);
defparam \sram_top_ins/frame_s0 .INIT=1'b0;
DFFC \sram_top_ins/latchreg_s0  (
	.D(\sram_top_ins/latch ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(latch_flag)
);
defparam \sram_top_ins/latchreg_s0 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_8_s1  (
	.D(\sram_top_ins/n158_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [8])
);
defparam \sram_top_ins/addrb_8_s1 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_7_s1  (
	.D(\sram_top_ins/n159_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [7])
);
defparam \sram_top_ins/addrb_7_s1 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_6_s1  (
	.D(\sram_top_ins/n160_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [6])
);
defparam \sram_top_ins/addrb_6_s1 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_5_s1  (
	.D(\sram_top_ins/n161_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [5])
);
defparam \sram_top_ins/addrb_5_s1 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_4_s1  (
	.D(\sram_top_ins/n162_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [4])
);
defparam \sram_top_ins/addrb_4_s1 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_3_s1  (
	.D(\sram_top_ins/n163_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [3])
);
defparam \sram_top_ins/addrb_3_s1 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_2_s1  (
	.D(\sram_top_ins/n164_8 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [2])
);
defparam \sram_top_ins/addrb_2_s1 .INIT=1'b0;
DFFCE \sram_top_ins/addrb_1_s1  (
	.D(\sram_top_ins/n165_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/addrb_8_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [1])
);
defparam \sram_top_ins/addrb_1_s1 .INIT=1'b0;
DFFCE \sram_top_ins/promce_s1  (
	.D(frame_flag),
	.CLK(clka),
	.CE(\sram_top_ins/promce_8 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/promce )
);
defparam \sram_top_ins/promce_s1 .INIT=1'b0;
DFFCE \sram_top_ins/wren_s1  (
	.D(\sram_top_ins/n204_8 ),
	.CLK(clka),
	.CE(\sram_top_ins/wren_8 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/wren )
);
defparam \sram_top_ins/wren_s1 .INIT=1'b0;
DFFCE \sram_top_ins/cnt_2_s1  (
	.D(\sram_top_ins/n517_10 ),
	.CLK(clkb),
	.CE(\sram_top_ins/cnt_2_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/cnt [2])
);
defparam \sram_top_ins/cnt_2_s1 .INIT=1'b0;
DFFCE \sram_top_ins/cnt_1_s1  (
	.D(\sram_top_ins/n518_10 ),
	.CLK(clkb),
	.CE(\sram_top_ins/cnt_2_13 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/cnt [1])
);
defparam \sram_top_ins/cnt_1_s1 .INIT=1'b0;
DFFCE \sram_top_ins/cntlatch_6_s3  (
	.D(\sram_top_ins/n638_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/cntlatch_6_109 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(cntlatch[6])
);
defparam \sram_top_ins/cntlatch_6_s3 .INIT=1'b0;
DFFCE \sram_top_ins/cntlatch_4_s2  (
	.D(\sram_top_ins/n640_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/cntlatch_6_109 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(cntlatch[4])
);
defparam \sram_top_ins/cntlatch_4_s2 .INIT=1'b0;
DFFCE \sram_top_ins/cntlatch_3_s2  (
	.D(\sram_top_ins/n641_5 ),
	.CLK(clkb),
	.CE(\sram_top_ins/cntlatch_6_109 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(cntlatch[3])
);
defparam \sram_top_ins/cntlatch_3_s2 .INIT=1'b0;
DFFCE \sram_top_ins/cntlatch_2_s2  (
	.D(\sram_top_ins/n642_8 ),
	.CLK(clkb),
	.CE(\sram_top_ins/cntlatch_6_109 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(cntlatch[2])
);
defparam \sram_top_ins/cntlatch_2_s2 .INIT=1'b0;
DFFCE \sram_top_ins/latch_s1  (
	.D(\sram_top_ins/n871_10 ),
	.CLK(clkb),
	.CE(\sram_top_ins/latch_8 ),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/latch )
);
defparam \sram_top_ins/latch_s1 .INIT=1'b0;
DFFC \sram_top_ins/addrb_0_s3  (
	.D(\sram_top_ins/n166_12 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/addrb [0])
);
defparam \sram_top_ins/addrb_0_s3 .INIT=1'b0;
DFFC \sram_top_ins/cnt_0_s3  (
	.D(\sram_top_ins/n519_10 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(\sram_top_ins/cnt [0])
);
defparam \sram_top_ins/cnt_0_s3 .INIT=1'b0;
DFFC \sram_top_ins/cntlatch_5_s4  (
	.D(\sram_top_ins/n639_11 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(cntlatch[5])
);
defparam \sram_top_ins/cntlatch_5_s4 .INIT=1'b0;
DFFC \sram_top_ins/cntlatch_1_s4  (
	.D(\sram_top_ins/n643_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(cntlatch[1])
);
defparam \sram_top_ins/cntlatch_1_s4 .INIT=1'b0;
DFFC \sram_top_ins/cntlatch_0_s4  (
	.D(\sram_top_ins/n644_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(cntlatch[0])
);
defparam \sram_top_ins/cntlatch_0_s4 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_95_s3  (
	.D(\sram_top_ins/n542_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[95])
);
defparam \sram_top_ins/data96_send_95_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_94_s3  (
	.D(\sram_top_ins/n543_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[94])
);
defparam \sram_top_ins/data96_send_94_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_93_s3  (
	.D(\sram_top_ins/n544_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[93])
);
defparam \sram_top_ins/data96_send_93_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_92_s3  (
	.D(\sram_top_ins/n545_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[92])
);
defparam \sram_top_ins/data96_send_92_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_91_s3  (
	.D(\sram_top_ins/n546_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[91])
);
defparam \sram_top_ins/data96_send_91_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_90_s3  (
	.D(\sram_top_ins/n547_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[90])
);
defparam \sram_top_ins/data96_send_90_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_89_s3  (
	.D(\sram_top_ins/n548_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[89])
);
defparam \sram_top_ins/data96_send_89_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_88_s3  (
	.D(\sram_top_ins/n549_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[88])
);
defparam \sram_top_ins/data96_send_88_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_87_s3  (
	.D(\sram_top_ins/n550_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[87])
);
defparam \sram_top_ins/data96_send_87_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_86_s3  (
	.D(\sram_top_ins/n551_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[86])
);
defparam \sram_top_ins/data96_send_86_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_85_s3  (
	.D(\sram_top_ins/n552_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[85])
);
defparam \sram_top_ins/data96_send_85_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_84_s3  (
	.D(\sram_top_ins/n553_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[84])
);
defparam \sram_top_ins/data96_send_84_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_83_s3  (
	.D(\sram_top_ins/n554_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[83])
);
defparam \sram_top_ins/data96_send_83_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_82_s3  (
	.D(\sram_top_ins/n555_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[82])
);
defparam \sram_top_ins/data96_send_82_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_81_s3  (
	.D(\sram_top_ins/n556_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[81])
);
defparam \sram_top_ins/data96_send_81_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_80_s3  (
	.D(\sram_top_ins/n557_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[80])
);
defparam \sram_top_ins/data96_send_80_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_79_s3  (
	.D(\sram_top_ins/n558_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[79])
);
defparam \sram_top_ins/data96_send_79_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_78_s3  (
	.D(\sram_top_ins/n559_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[78])
);
defparam \sram_top_ins/data96_send_78_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_77_s3  (
	.D(\sram_top_ins/n560_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[77])
);
defparam \sram_top_ins/data96_send_77_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_76_s3  (
	.D(\sram_top_ins/n561_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[76])
);
defparam \sram_top_ins/data96_send_76_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_75_s3  (
	.D(\sram_top_ins/n562_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[75])
);
defparam \sram_top_ins/data96_send_75_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_74_s3  (
	.D(\sram_top_ins/n563_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[74])
);
defparam \sram_top_ins/data96_send_74_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_73_s3  (
	.D(\sram_top_ins/n564_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[73])
);
defparam \sram_top_ins/data96_send_73_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_72_s3  (
	.D(\sram_top_ins/n565_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[72])
);
defparam \sram_top_ins/data96_send_72_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_71_s3  (
	.D(\sram_top_ins/n566_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[71])
);
defparam \sram_top_ins/data96_send_71_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_70_s3  (
	.D(\sram_top_ins/n567_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[70])
);
defparam \sram_top_ins/data96_send_70_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_69_s3  (
	.D(\sram_top_ins/n568_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[69])
);
defparam \sram_top_ins/data96_send_69_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_68_s3  (
	.D(\sram_top_ins/n569_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[68])
);
defparam \sram_top_ins/data96_send_68_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_67_s3  (
	.D(\sram_top_ins/n570_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[67])
);
defparam \sram_top_ins/data96_send_67_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_66_s3  (
	.D(\sram_top_ins/n571_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[66])
);
defparam \sram_top_ins/data96_send_66_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_65_s3  (
	.D(\sram_top_ins/n572_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[65])
);
defparam \sram_top_ins/data96_send_65_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_64_s3  (
	.D(\sram_top_ins/n573_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[64])
);
defparam \sram_top_ins/data96_send_64_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_63_s3  (
	.D(\sram_top_ins/n574_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[63])
);
defparam \sram_top_ins/data96_send_63_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_62_s3  (
	.D(\sram_top_ins/n575_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[62])
);
defparam \sram_top_ins/data96_send_62_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_61_s3  (
	.D(\sram_top_ins/n576_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[61])
);
defparam \sram_top_ins/data96_send_61_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_60_s3  (
	.D(\sram_top_ins/n577_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[60])
);
defparam \sram_top_ins/data96_send_60_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_59_s3  (
	.D(\sram_top_ins/n578_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[59])
);
defparam \sram_top_ins/data96_send_59_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_58_s3  (
	.D(\sram_top_ins/n579_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[58])
);
defparam \sram_top_ins/data96_send_58_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_57_s3  (
	.D(\sram_top_ins/n580_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[57])
);
defparam \sram_top_ins/data96_send_57_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_56_s3  (
	.D(\sram_top_ins/n581_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[56])
);
defparam \sram_top_ins/data96_send_56_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_55_s3  (
	.D(\sram_top_ins/n582_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[55])
);
defparam \sram_top_ins/data96_send_55_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_54_s3  (
	.D(\sram_top_ins/n583_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[54])
);
defparam \sram_top_ins/data96_send_54_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_53_s3  (
	.D(\sram_top_ins/n584_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[53])
);
defparam \sram_top_ins/data96_send_53_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_52_s3  (
	.D(\sram_top_ins/n585_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[52])
);
defparam \sram_top_ins/data96_send_52_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_51_s3  (
	.D(\sram_top_ins/n586_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[51])
);
defparam \sram_top_ins/data96_send_51_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_50_s3  (
	.D(\sram_top_ins/n587_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[50])
);
defparam \sram_top_ins/data96_send_50_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_49_s3  (
	.D(\sram_top_ins/n588_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[49])
);
defparam \sram_top_ins/data96_send_49_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_48_s3  (
	.D(\sram_top_ins/n589_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[48])
);
defparam \sram_top_ins/data96_send_48_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_47_s3  (
	.D(\sram_top_ins/n590_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[47])
);
defparam \sram_top_ins/data96_send_47_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_46_s3  (
	.D(\sram_top_ins/n591_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[46])
);
defparam \sram_top_ins/data96_send_46_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_45_s3  (
	.D(\sram_top_ins/n592_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[45])
);
defparam \sram_top_ins/data96_send_45_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_44_s3  (
	.D(\sram_top_ins/n593_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[44])
);
defparam \sram_top_ins/data96_send_44_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_43_s3  (
	.D(\sram_top_ins/n594_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[43])
);
defparam \sram_top_ins/data96_send_43_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_42_s3  (
	.D(\sram_top_ins/n595_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[42])
);
defparam \sram_top_ins/data96_send_42_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_41_s3  (
	.D(\sram_top_ins/n596_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[41])
);
defparam \sram_top_ins/data96_send_41_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_40_s3  (
	.D(\sram_top_ins/n597_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[40])
);
defparam \sram_top_ins/data96_send_40_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_39_s3  (
	.D(\sram_top_ins/n598_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[39])
);
defparam \sram_top_ins/data96_send_39_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_38_s3  (
	.D(\sram_top_ins/n599_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[38])
);
defparam \sram_top_ins/data96_send_38_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_37_s3  (
	.D(\sram_top_ins/n600_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[37])
);
defparam \sram_top_ins/data96_send_37_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_36_s3  (
	.D(\sram_top_ins/n601_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[36])
);
defparam \sram_top_ins/data96_send_36_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_35_s3  (
	.D(\sram_top_ins/n602_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[35])
);
defparam \sram_top_ins/data96_send_35_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_34_s3  (
	.D(\sram_top_ins/n603_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[34])
);
defparam \sram_top_ins/data96_send_34_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_33_s3  (
	.D(\sram_top_ins/n604_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[33])
);
defparam \sram_top_ins/data96_send_33_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_32_s3  (
	.D(\sram_top_ins/n605_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[32])
);
defparam \sram_top_ins/data96_send_32_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_31_s3  (
	.D(\sram_top_ins/n606_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[31])
);
defparam \sram_top_ins/data96_send_31_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_30_s3  (
	.D(\sram_top_ins/n607_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[30])
);
defparam \sram_top_ins/data96_send_30_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_29_s3  (
	.D(\sram_top_ins/n608_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[29])
);
defparam \sram_top_ins/data96_send_29_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_28_s3  (
	.D(\sram_top_ins/n609_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[28])
);
defparam \sram_top_ins/data96_send_28_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_27_s3  (
	.D(\sram_top_ins/n610_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[27])
);
defparam \sram_top_ins/data96_send_27_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_26_s3  (
	.D(\sram_top_ins/n611_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[26])
);
defparam \sram_top_ins/data96_send_26_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_25_s3  (
	.D(\sram_top_ins/n612_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[25])
);
defparam \sram_top_ins/data96_send_25_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_24_s3  (
	.D(\sram_top_ins/n613_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[24])
);
defparam \sram_top_ins/data96_send_24_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_23_s3  (
	.D(\sram_top_ins/n614_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[23])
);
defparam \sram_top_ins/data96_send_23_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_22_s3  (
	.D(\sram_top_ins/n615_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[22])
);
defparam \sram_top_ins/data96_send_22_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_21_s3  (
	.D(\sram_top_ins/n616_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[21])
);
defparam \sram_top_ins/data96_send_21_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_20_s3  (
	.D(\sram_top_ins/n617_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[20])
);
defparam \sram_top_ins/data96_send_20_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_19_s3  (
	.D(\sram_top_ins/n618_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[19])
);
defparam \sram_top_ins/data96_send_19_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_18_s3  (
	.D(\sram_top_ins/n619_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[18])
);
defparam \sram_top_ins/data96_send_18_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_17_s3  (
	.D(\sram_top_ins/n620_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[17])
);
defparam \sram_top_ins/data96_send_17_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_16_s3  (
	.D(\sram_top_ins/n621_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[16])
);
defparam \sram_top_ins/data96_send_16_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_15_s3  (
	.D(\sram_top_ins/n622_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[15])
);
defparam \sram_top_ins/data96_send_15_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_14_s3  (
	.D(\sram_top_ins/n623_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[14])
);
defparam \sram_top_ins/data96_send_14_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_13_s3  (
	.D(\sram_top_ins/n624_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[13])
);
defparam \sram_top_ins/data96_send_13_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_12_s3  (
	.D(\sram_top_ins/n625_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[12])
);
defparam \sram_top_ins/data96_send_12_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_11_s3  (
	.D(\sram_top_ins/n626_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[11])
);
defparam \sram_top_ins/data96_send_11_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_10_s3  (
	.D(\sram_top_ins/n627_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[10])
);
defparam \sram_top_ins/data96_send_10_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_9_s3  (
	.D(\sram_top_ins/n628_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[9])
);
defparam \sram_top_ins/data96_send_9_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_8_s3  (
	.D(\sram_top_ins/n629_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[8])
);
defparam \sram_top_ins/data96_send_8_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_7_s3  (
	.D(\sram_top_ins/n630_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[7])
);
defparam \sram_top_ins/data96_send_7_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_6_s3  (
	.D(\sram_top_ins/n631_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[6])
);
defparam \sram_top_ins/data96_send_6_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_5_s3  (
	.D(\sram_top_ins/n632_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[5])
);
defparam \sram_top_ins/data96_send_5_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_4_s3  (
	.D(\sram_top_ins/n633_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[4])
);
defparam \sram_top_ins/data96_send_4_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_3_s3  (
	.D(\sram_top_ins/n634_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[3])
);
defparam \sram_top_ins/data96_send_3_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_2_s3  (
	.D(\sram_top_ins/n635_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[2])
);
defparam \sram_top_ins/data96_send_2_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_1_s3  (
	.D(\sram_top_ins/n636_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[1])
);
defparam \sram_top_ins/data96_send_1_s3 .INIT=1'b0;
DFFC \sram_top_ins/data96_send_0_s3  (
	.D(\sram_top_ins/n637_8 ),
	.CLK(clkb),
	.CLEAR(\sram_top_ins/n209_6 ),
	.Q(datain[0])
);
defparam \sram_top_ins/data96_send_0_s3 .INIT=1'b0;
INV \sram_top_ins/n209_s2  (
	.I(rst_n),
	.O(\sram_top_ins/n209_6 )
);
pROM \sram_top_ins/prom/prom_inst_0  (
	.CLK(clkb),
	.OCE(VCC),
	.CE(\sram_top_ins/promce ),
	.RESET(GND),
	.AD({GND, \sram_top_ins/addrb [8:0], GND, GND, GND, GND}),
	.DO({\sram_top_ins/prom/DO [31:10], promdout[9:0]})
);
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_00=256'h00E10165014D0135015901410129000000000000003D0025000D000000000000;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_01=256'h0075005D00810069005100D500BD00A500C900B10099011D010500ED011100F9;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_02=256'h010D00F500DD0161014901310155013D01250045002D0015003900210009008D;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_03=256'h0005008900710059007D0065004D00D100B900A100C500AD00950119010100E9;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_04=256'h00FD00E5010900F100D9015D0145012D0151013901210041002900110035001D;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_05=256'h0031001900010085006D005500790061004900CD00B5009D00C100A900910115;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_06=256'h00E20166014E0136015A0142012A000000000000003E0026000E000000000000;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_07=256'h0076005E0082006A005200D600BE00A600CA00B2009A011E010600EE011200FA;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_08=256'h010E00F600DE0162014A01320156013E01260046002E0016003A0022000A008E;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_09=256'h0006008A0072005A007E0066004E00D200BA00A200C600AE0096011A010200EA;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_0A=256'h00FE00E6010A00F200DA015E0146012E0152013A01220042002A00120036001E;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_0B=256'h0032001A00020086006E0056007A0062004A00CE00B6009E00C200AA00920116;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_0C=256'h00E30167014F0137015B0143012B000000000000003F0027000F000000000000;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_0D=256'h0077005F0083006B005300D700BF00A700CB00B3009B011F010700EF011300FB;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_0E=256'h010F00F700DF0163014B01330157013F01270047002F0017003B0023000B008F;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_0F=256'h0007008B0073005B007F0067004F00D300BB00A300C700AF0097011B010300EB;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_10=256'h00FF00E7010B00F300DB015F0147012F0153013B01230043002B00130037001F;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_11=256'h0033001B00030087006F0057007B0063004B00CF00B7009F00C300AB00930117;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_12=256'h00E4016801500138015C0144012C000000000000004000280010000000000000;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_13=256'h007800600084006C005400D800C000A800CC00B4009C0120010800F0011400FC;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_14=256'h011000F800E00164014C0134015801400128004800300018003C0024000C0090;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_15=256'h0008008C0074005C00800068005000D400BC00A400C800B00098011C010400EC;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_16=256'h010000E8010C00F400DC0160014801300154013C01240044002C001400380020;
defparam \sram_top_ins/prom/prom_inst_0 .INIT_RAM_17=256'h0034001C0004008800700058007C0064004C00D000B800A000C400AC00940118;
defparam \sram_top_ins/prom/prom_inst_0 .READ_MODE=1'b0;
defparam \sram_top_ins/prom/prom_inst_0 .BIT_WIDTH=16;
defparam \sram_top_ins/prom/prom_inst_0 .RESET_MODE="SYNC";
SDPB \sram_top_ins/sdpb/sdpb_inst_0  (
	.CLKA(clka),
	.CEA(\sram_top_ins/wren ),
	.RESETA(GND),
	.CLKB(clkb),
	.CEB(VCC),
	.RESETB(GND),
	.OCE(VCC),
	.BLKSELA({GND, GND, GND}),
	.BLKSELB({GND, GND, GND}),
	.DI({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, wtdina[15:0]}),
	.ADA({GND, wtaddr[8:0], GND, GND, VCC, VCC}),
	.ADB({GND, promdout[8:0], GND, GND, GND, GND}),
	.DO({\sram_top_ins/sdpb/DO [31:16], doutb[15:0]})
);
defparam \sram_top_ins/sdpb/sdpb_inst_0 .READ_MODE=1'b0;
defparam \sram_top_ins/sdpb/sdpb_inst_0 .BIT_WIDTH_0=16;
defparam \sram_top_ins/sdpb/sdpb_inst_0 .BIT_WIDTH_1=16;
defparam \sram_top_ins/sdpb/sdpb_inst_0 .RESET_MODE="SYNC";
defparam \sram_top_ins/sdpb/sdpb_inst_0 .BLK_SEL_0=3'b000;
defparam \sram_top_ins/sdpb/sdpb_inst_0 .BLK_SEL_1=3'b000;
endmodule
