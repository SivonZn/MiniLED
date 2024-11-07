//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10.02
//Part Number: GW2A-LV55PG484C8/I7
//Device: GW2A-55
//Created Time: Thu Nov  7 20:54:07 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    LVDS_TX_rPLL2 your_instance_name(
        .clkout(clkout), //output clkout
        .lock(lock), //output lock
        .clkoutp(clkoutp), //output clkoutp
        .reset(reset), //input reset
        .clkin(clkin), //input clkin
        .psda(psda), //input [3:0] psda
        .dutyda(dutyda), //input [3:0] dutyda
        .fdly(fdly) //input [3:0] fdly
    );

//--------Copy end-------------------
