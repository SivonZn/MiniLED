//Copyright (C)2014-2021 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.7.06Beta
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Created Time: Tue Jun 15 17:21:14 2021

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    LVDS_TX_rPLL your_instance_name(
        .clkout(clkout_o), //output clkout
        .lock(lock_o), //output lock
        .reset(reset_i), //input reset
        .clkin(clkin_i) //input clkin
    );

//--------Copy end-------------------
