
//---------------------------------------------
`define	USE_TLVDS_OBUF
//`define	USE_ELVDS_OBUF


//----------Using External Clock--------------
// `define	TX_USE_EXTERNAL_CLK  

`ifdef TX_USE_EXTERNAL_CLK
`else
	`define	TX_USE_RPLL
    // `define	TX_USE_PLLVR
`endif

//----------------------------------------------
`define	TX_ONE_CHANNEL
//`define	TX_TWO_CHANNEL

`ifdef TX_TWO_CHANNEL
    `define	TX_TWO_CHANNEL_ONE_CLOCK
    // `define	TX_TWO_CHANNEL_TWO_CLOCK
`endif


//----------------------------------------------
`define TX_VESA
// `define TX_JEIDA


//----------------------------------------------
`define TX_RGB888
// `define TX_RGB666


//----------------------------------------------
`define TX_CLK_PATTERN_1100011
// `define TX_CLK_PATTERN_1100001

