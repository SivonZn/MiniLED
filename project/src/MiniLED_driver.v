module MiniLED_driver
(
    input          I_clk       ,  //50MHz      
    input          I_rst_n     ,   
    //led
    output         LE          ,
    output         DCLK        , //12.5M
    output         SDI         ,
    output         GCLK         ,
    output         scan1       ,
    output         scan2       ,
    output         scan3       , 
    output         scan4       
);

wire clk25M;
wire clk1M;
wire sdbpflag;
wire [9:0]wtaddr;
wire [6:0]cntlatch;
wire frame_flag;
wire latch_flag;
wire [95:0]datain;
wire [15:0]wtdina;
//PLL分频
SPI7001_25M_1M_rPLL SPI7001_25M_1M_rPLL_inst(
         .clkout(clk25M), //output clkout
         .clkoutd(clk1M), //output clkoutd
         .clkin(I_clk) //input clkin
);
//ramflag_1是模拟分区背光算法后控制灯板点亮的模块（通过信号sdbpflag、wtaddr、wtdina传入LED驱动芯片接口模块进行后续输出）
ramflag_1 u1(
    .clk(clk25M),
    .rst_n(I_rst_n),
    .sdbpflag_wire(sdbpflag),//写入一帧起始信号
    .wtdina_wire(wtdina),//写入的灰度值
    .wtaddr_wire(wtaddr)//灯板上灯珠位置对应的地址
);
//以下代码不建议做修改
sram_top_gowin_top u2(
    .clka(clk25M),
    .clkb(clk1M),
    .sdbpflag(sdbpflag),
    .wtaddr(wtaddr),
    .wtdina(wtdina),
    .rst_n(I_rst_n),
    .latch_flag(latch_flag),
    .frame_flag(frame_flag),
    .datain(datain),
    .cntlatch(cntlatch)
);

SPI7001_gowin_top u3(
    .clock(clk25M),
    .clk_1M(clk1M),
    .rst_n(I_rst_n),
    .frame_f(frame_flag),
    .rgb_f(latch_flag),
    .rgb_data(datain),
    .cntlatch(cntlatch),
    .LE(LE),
    .DCLK(DCLK),
    .SDI(SDI),
    .GCLK(GCLK),
    .scan1(scan1),
    .scan2(scan2),
    .scan3(scan3),
    .scan4(scan4),
    .scan1_wire(scan1_wire)
);

endmodule