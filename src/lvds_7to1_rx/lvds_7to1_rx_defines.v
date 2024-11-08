
//---------------------------------------------
// `define AUTO_PHASE
`define MANUAL_PHASE

`ifdef AUTO_PHASE
    `define AUTO_INIT_PHASE 4'd0  // 4'd0, 4'd8
    //`define SIM // open the define can accelerate the bit align simulation
`endif

`ifdef MANUAL_PHASE
    `define RX_CLKOUTP_PHASE 4'd10  // 4'd0~4'd15  
`endif


//---------------------------------------------
`define	RX_USE_RPLL
//`define	RX_USE_PLLVR


//----------------------------------------------
`define	RX_ONE_CHANNEL
//`define	RX_TWO_CHANNEL

`ifdef RX_ONE_CHANNEL
    `define	D0_IODELAY 0
    `define	D1_IODELAY 0
    `define	D2_IODELAY 0
    `define	D3_IODELAY 0
`endif

`ifdef RX_TWO_CHANNEL
    // `define	DO0_IODELAY 0
    // `define	DO1_IODELAY 0
    // `define	DO2_IODELAY 0
    // `define	DO3_IODELAY 0
    // `define	DE0_IODELAY 0
    // `define	DE1_IODELAY 0
    // `define	DE2_IODELAY 0
    // `define	DE3_IODELAY 0
`endif


//----------------------------------------------
`define RX_VESA
// `define RX_JEIDA


//----------------------------------------------
`define RX_RGB888
// `define RX_RGB666


//----------------------------------------------
`define RX_CLK_PATTERN_1100011
// `define RX_CLK_PATTERN_1100001


//----------Using Clock DIV 3.5--------------
`define	RX_USE_CLKDIV_3_5  
