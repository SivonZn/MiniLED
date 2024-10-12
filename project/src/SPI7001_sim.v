//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Post-PnR Verilog Simulation Model file
//Tool Version: V1.9.10 (64-bit)
//Created Time: Mon Sep  2 15:51:35 2024

`timescale 100 ps/100 ps
module SPI7001(
	clock,
	clk_1M,
	rst_n,
	frame_f,
	rgb_f,
	rgb_data,
	cnt_s,
	cnt_ms,
	cnt_us,
	cntlatch,
	LE,
	DCLK,
	SDI,
	GCLK,
	scan1,
	scan2,
	scan3,
	scan4,
	scan1_wire
);
input clock;
input clk_1M;
input rst_n;
input frame_f;
input rgb_f;
input [95:0] rgb_data;
input [9:0] cnt_s;
input [9:0] cnt_ms;
input [9:0] cnt_us;
input [6:0] cntlatch;
output LE;
output DCLK;
output SDI;
output GCLK;
output scan1;
output scan2;
output scan3;
output scan4;
output scan1_wire;
wire DCLK;
wire GCLK;
wire [9:0] GCLK_cnt;
wire GCLK_flag;
wire GCLK_flag_10;
wire GCLK_r;
wire GCLK_rr;
wire GND;
wire LE;
wire LE_8;
wire SDI;
wire SDI_10;
wire SDI_12;
wire SDI_8;
wire SDI_9;
wire VCC;
wire clk_1M;
wire clock;
wire [9:0] cnt_GCLK;
wire cnt_GCLK_9_11;
wire cnt_GCLK_9_12;
wire cnt_GCLK_9_13;
wire cnt_GCLK_9_15;
wire cnt_GCLK_9_19;
wire cnt_GCLK_9_9;
wire [9:0] cnt_ms;
wire [9:0] cnt_s;
wire [2:0] cnt_scan;
wire cnt_scan_0_13;
wire [13:0] cnt_scanwire;
wire [9:0] cnt_us;
wire [6:0] cntlatch;
wire [47:0] data48_reg;
wire data48_reg_47_10;
wire data48_reg_47_11;
wire data48_reg_47_8;
wire data48_reg_47_9;
wire [95:0] data96_reg;
wire data96_reg_95_10;
wire data96_reg_95_11;
wire data96_reg_95_13;
wire data96_reg_95_15;
wire data96_reg_95_8;
wire data96_reg_95_9;
wire frame_f;
wire frame_p;
wire frame_r;
wire frame_rr;
wire [6:0] latch_cnt;
wire latch_cnt_6_10;
wire latch_cnt_6_11;
wire latch_cnt_6_12;
wire latch_cnt_6_14;
wire latch_cnt_6_9;
wire [47:44] le48_reg;
wire le48_reg_46_8;
wire le48_reg_46_9;
wire le48_reg_47_7;
wire le48_reg_47_8;
wire le48_reg_47_9;
wire [95:0] le96_reg;
wire n1448_12;
wire n1448_13;
wire n1450_15;
wire n1450_16;
wire n1450_17;
wire n1450_18;
wire n1452_14;
wire n1454_12;
wire n1658_12;
wire n1658_13;
wire n1660_12;
wire n1662_12;
wire n1662_13;
wire n1664_12;
wire n1666_12;
wire n1668_12;
wire n1670_14;
wire n1672_14;
wire n1674_14;
wire n1676_14;
wire n1678_14;
wire n1680_14;
wire n1682_14;
wire n1684_14;
wire n1686_14;
wire n1688_14;
wire n1690_14;
wire n1692_14;
wire n1694_14;
wire n1696_14;
wire n1698_14;
wire n1700_14;
wire n1702_14;
wire n1704_14;
wire n1706_14;
wire n1708_14;
wire n1710_14;
wire n1712_14;
wire n1714_14;
wire n1716_14;
wire n1718_14;
wire n1720_14;
wire n1722_14;
wire n1724_14;
wire n1726_14;
wire n1728_14;
wire n1730_14;
wire n1732_14;
wire n1734_14;
wire n1736_14;
wire n1738_14;
wire n1740_14;
wire n1742_14;
wire n1744_14;
wire n1746_14;
wire n1748_14;
wire n1750_14;
wire n1752_14;
wire n1754_14;
wire n1756_14;
wire n1758_14;
wire n1760_14;
wire n1762_14;
wire n1764_14;
wire n1766_14;
wire n1768_14;
wire n1770_14;
wire n1772_14;
wire n1774_14;
wire n1776_14;
wire n1778_14;
wire n1780_14;
wire n1782_14;
wire n1784_14;
wire n1786_14;
wire n1788_14;
wire n1790_14;
wire n1792_14;
wire n1794_14;
wire n1796_14;
wire n1798_14;
wire n1800_14;
wire n1802_14;
wire n1804_14;
wire n1806_14;
wire n1808_14;
wire n1810_14;
wire n1812_14;
wire n1814_14;
wire n1816_14;
wire n1818_14;
wire n1820_14;
wire n1822_14;
wire n1824_14;
wire n1826_14;
wire n1828_14;
wire n1830_14;
wire n1832_14;
wire n1834_14;
wire n1836_14;
wire n1838_14;
wire n1840_14;
wire n1842_14;
wire n1844_14;
wire n1846_14;
wire n1848_14;
wire n1850_14;
wire n1852_14;
wire n1854_14;
wire n1856_14;
wire n1858_14;
wire n1860_14;
wire n1862_14;
wire n1864_14;
wire n1866_14;
wire n1868_14;
wire n1870_14;
wire n1872_14;
wire n1874_14;
wire n1876_14;
wire n1878_14;
wire n1880_14;
wire n1882_14;
wire n1884_14;
wire n1886_14;
wire n1888_14;
wire n1890_14;
wire n1892_14;
wire n1894_14;
wire n1896_14;
wire n1898_14;
wire n1900_14;
wire n1902_14;
wire n1904_14;
wire n1906_14;
wire n1908_14;
wire n1910_14;
wire n1912_14;
wire n1914_14;
wire n1916_14;
wire n1918_14;
wire n1920_14;
wire n1922_14;
wire n1924_14;
wire n1926_14;
wire n1928_14;
wire n1930_14;
wire n1932_14;
wire n1934_14;
wire n1936_14;
wire n1938_14;
wire n1940_14;
wire n1942_14;
wire n1944_14;
wire n1946_14;
wire n1948_14;
wire n1950_14;
wire n1952_14;
wire n1954_14;
wire n1956_14;
wire n1958_14;
wire n1960_14;
wire n1962_14;
wire n1964_14;
wire n1966_14;
wire n1968_14;
wire n1970_14;
wire n1972_14;
wire n1974_14;
wire n1976_14;
wire n1978_14;
wire n1980_14;
wire n1982_14;
wire n1984_14;
wire n1986_14;
wire n1988_14;
wire n1990_14;
wire n1992_14;
wire n1994_14;
wire n1996_14;
wire n1998_14;
wire n2000_14;
wire n2002_14;
wire n2004_14;
wire n2006_14;
wire n2008_14;
wire n2010_14;
wire n2012_14;
wire n2014_14;
wire n2016_14;
wire n2018_14;
wire n2020_14;
wire n2022_14;
wire n2024_14;
wire n2026_14;
wire n2028_14;
wire n2030_14;
wire n2032_14;
wire n2034_14;
wire n2036_14;
wire n2038_14;
wire n2040_14;
wire n2042_14;
wire n2044_14;
wire n2046_14;
wire n2048_14;
wire n2050_14;
wire n2052_14;
wire n2054_14;
wire n2069_18;
wire n2069_19;
wire n2069_20;
wire n2069_21;
wire n2069_23;
wire n2069_25;
wire n2071_13;
wire n2071_14;
wire n2071_15;
wire n2071_16;
wire n2072_21;
wire n2072_23;
wire n2072_25;
wire n2072_27;
wire n2072_29;
wire n2073_18;
wire n2073_20;
wire n2073_22;
wire n2074_16;
wire n2074_17;
wire n2074_19;
wire n2074_21;
wire n2075_16;
wire n2075_17;
wire n2075_18;
wire n2075_19;
wire n2075_22;
wire n2076_21;
wire n2077_18;
wire n2077_21;
wire n2077_22;
wire n2077_24;
wire n2077_26;
wire n2078_18;
wire n2078_20;
wire n2078_22;
wire n2079_18;
wire n2079_20;
wire n2079_23;
wire n2079_25;
wire n2080_18;
wire n2080_19;
wire n2080_20;
wire n2080_23;
wire n2081_18;
wire n2081_19;
wire n2081_22;
wire n2082_18;
wire n2082_19;
wire n2082_20;
wire n2082_21;
wire n2082_22;
wire n2082_23;
wire n2083_18;
wire n2085_16;
wire n2085_17;
wire n2087_13;
wire n2087_14;
wire n2089_15;
wire n2089_16;
wire n2089_17;
wire n2091_15;
wire n2091_16;
wire n2091_19;
wire n2093_13;
wire n2095_13;
wire n2095_14;
wire n2097_13;
wire n2099_13;
wire n2099_16;
wire n2101_13;
wire n2103_15;
wire n2105_15;
wire n2107_15;
wire n2107_16;
wire n2109_15;
wire n2109_16;
wire n2111_15;
wire n2111_16;
wire n2113_15;
wire n2113_16;
wire n2115_15;
wire n2115_16;
wire n2117_13;
wire n2117_14;
wire n2119_13;
wire n2119_14;
wire n2121_15;
wire n2121_17;
wire n2123_13;
wire n2125_15;
wire n2127_13;
wire n2129_15;
wire n2129_16;
wire n2129_19;
wire n2131_15;
wire n2133_13;
wire n2135_13;
wire n2137_14;
wire n2137_16;
wire n2139_13;
wire n2139_16;
wire n2141_13;
wire n2143_13;
wire n2145_15;
wire n2147_13;
wire n2147_14;
wire n2149_13;
wire n2151_13;
wire n2151_14;
wire n2153_15;
wire n2155_13;
wire n2157_13;
wire n2157_14;
wire n2159_15;
wire n2161_15;
wire n2161_16;
wire n2163_13;
wire n2163_14;
wire n2165_13;
wire n2165_16;
wire n2167_15;
wire n2169_13;
wire n2171_13;
wire n2171_14;
wire n2173_15;
wire n2173_16;
wire n2175_13;
wire n2177_13;
wire n2179_13;
wire n2179_14;
wire n2179_15;
wire n2179_16;
wire n2180_16;
wire n2180_17;
wire n2180_18;
wire n2180_19;
wire n2180_20;
wire n2180_21;
wire n2180_22;
wire n2180_23;
wire n2180_24;
wire n2180_25;
wire n2182_20;
wire n2182_21;
wire n2182_22;
wire n2182_25;
wire n25_10;
wire n25_11;
wire n25_15;
wire n25_17;
wire n25_7;
wire n25_9;
wire n26_11;
wire n26_6;
wire n26_7;
wire n26_9;
wire n27_8;
wire n28_6;
wire n28_7;
wire n28_8;
wire n29_6;
wire n30_8;
wire n31_6;
wire n31_7;
wire n3202_3;
wire n3202_4;
wire n3202_6;
wire n3202_7;
wire n3202_9;
wire n3257_8;
wire n3257_9;
wire n3258_7;
wire n3258_8;
wire n3259_7;
wire n3259_8;
wire n3260_7;
wire n3260_8;
wire n3261_7;
wire n3261_8;
wire n3262_7;
wire n3262_8;
wire n3263_10;
wire n3263_7;
wire n3264_7;
wire n3264_8;
wire n3265_7;
wire n3266_7;
wire n32_8;
wire n3346_10;
wire n3346_5;
wire n3346_6;
wire n3346_8;
wire n3347_5;
wire n3348_5;
wire n3348_6;
wire n3349_5;
wire n3350_5;
wire n3350_8;
wire n3351_5;
wire n3352_5;
wire n3352_6;
wire n3353_7;
wire n3354_5;
wire n3355_8;
wire n33_6;
wire n33_9;
wire n3416_13;
wire n3416_14;
wire n3416_15;
wire n3416_16;
wire n3416_17;
wire n3416_22;
wire n3416_26;
wire n3416_4;
wire n3416_7;
wire n3416_8;
wire n3416_9;
wire n3435_13;
wire n3436_6;
wire n3436_7;
wire n3436_8;
wire n3437_6;
wire n3463_10;
wire n3463_14;
wire n3463_6;
wire n3463_8;
wire n3463_9;
wire n3464_6;
wire n3465_6;
wire n3466_8;
wire n34_8;
wire n35_6;
wire n35_7;
wire n36_8;
wire n37_8;
wire n38_10;
wire n4557_10;
wire n4557_5;
wire n4557_8;
wire n56_6;
wire n60_6;
wire n66_4;
wire n68_3;
wire n79_6;
wire [95:0] rgb_data;
wire rgb_f;
wire rgb_p;
wire rgb_r;
wire rgb_rr;
wire rgb_rrr;
wire rst_n;
wire scan1;
wire scan1_wire;
wire scan1_wire_d_5;
wire scan1_wire_d_6;
wire scan1_wire_d_7;
wire scan1_wire_d_8;
wire scan2;
wire scan3;
wire scan4;
wire [7:0] state_cnt;
wire [1:0] state_m_id;
wire state_m_id_1_9;
wire [3:0] state_s_id;
wire time_flag;
VCC VCC_cZ (
  .V(VCC)
);
GND GND_cZ (
  .G(GND)
);
GSR GSR (
	.GSRI(VCC)
);
LUT2 n66_s0 (
	.I0(frame_rr),
	.I1(frame_r),
	.F(n66_4)
);
defparam n66_s0.INIT=4'h4;
LUT2 n68_s0 (
	.I0(rgb_rrr),
	.I1(rgb_r),
	.F(n68_3)
);
defparam n68_s0.INIT=4'h4;
LUT4 n3202_s0 (
	.I0(state_cnt[0]),
	.I1(n3202_4),
	.I2(n3202_9),
	.I3(n3202_6),
	.F(n3202_3)
);
defparam n3202_s0.INIT=16'h8000;
LUT4 le48_reg_47_s3 (
	.I0(state_s_id[1]),
	.I1(rst_n),
	.I2(le48_reg_47_8),
	.I3(le48_reg_47_9),
	.F(le48_reg_47_7)
);
defparam le48_reg_47_s3.INIT=16'h4000;
LUT3 data48_reg_47_s4 (
	.I0(data48_reg_47_9),
	.I1(state_m_id[0]),
	.I2(data48_reg_47_10),
	.F(data48_reg_47_8)
);
defparam data48_reg_47_s4.INIT=8'h70;
LUT2 le48_reg_46_s4 (
	.I0(le48_reg_47_7),
	.I1(le48_reg_46_9),
	.F(le48_reg_46_8)
);
defparam le48_reg_46_s4.INIT=4'h8;
LUT4 data96_reg_95_s4 (
	.I0(data96_reg_95_9),
	.I1(data96_reg_95_10),
	.I2(rst_n),
	.I3(le48_reg_47_9),
	.F(data96_reg_95_8)
);
defparam data96_reg_95_s4.INIT=16'hE000;
LUT2 state_m_id_1_s4 (
	.I0(n2069_25),
	.I1(n2071_13),
	.F(state_m_id_1_9)
);
defparam state_m_id_1_s4.INIT=4'hE;
LUT4 n2071_s9 (
	.I0(n3202_6),
	.I1(n2071_14),
	.I2(n2071_15),
	.I3(n2071_16),
	.F(n2071_13)
);
defparam n2071_s9.INIT=16'h8000;
LUT4 n2072_s16 (
	.I0(n2069_18),
	.I1(n2072_27),
	.I2(n2072_23),
	.I3(state_s_id[3]),
	.F(n2072_21)
);
defparam n2072_s16.INIT=16'h8F88;
LUT4 n2074_s12 (
	.I0(n2074_17),
	.I1(n2069_18),
	.I2(n2074_21),
	.I3(n2074_19),
	.F(n2074_16)
);
defparam n2074_s12.INIT=16'hFFF4;
LUT4 n2075_s12 (
	.I0(n2075_17),
	.I1(le48_reg_47_9),
	.I2(n2075_18),
	.I3(n2075_19),
	.F(n2075_16)
);
defparam n2075_s12.INIT=16'hF8FF;
LUT4 n2077_s14 (
	.I0(n2077_24),
	.I1(n2077_26),
	.I2(state_cnt[6]),
	.I3(n2077_21),
	.F(n2077_18)
);
defparam n2077_s14.INIT=16'h30FA;
LUT4 n2078_s14 (
	.I0(n2072_23),
	.I1(n2078_22),
	.I2(n2077_21),
	.I3(state_cnt[5]),
	.F(n2078_18)
);
defparam n2078_s14.INIT=16'h530C;
LUT4 n2079_s14 (
	.I0(n2077_21),
	.I1(state_cnt[4]),
	.I2(n2079_23),
	.I3(n2079_20),
	.F(n2079_18)
);
defparam n2079_s14.INIT=16'hFC14;
LUT4 n2080_s14 (
	.I0(n2080_19),
	.I1(n2077_21),
	.I2(state_cnt[3]),
	.I3(n2080_20),
	.F(n2080_18)
);
defparam n2080_s14.INIT=16'h5775;
LUT4 n2081_s14 (
	.I0(n2081_19),
	.I1(n2077_21),
	.I2(state_cnt[2]),
	.I3(n2071_14),
	.F(n2081_18)
);
defparam n2081_s14.INIT=16'h5775;
LUT4 n2082_s14 (
	.I0(n2082_19),
	.I1(n2082_20),
	.I2(state_cnt[0]),
	.I3(state_cnt[1]),
	.F(n2082_18)
);
defparam n2082_s14.INIT=16'h5730;
LUT3 n2083_s14 (
	.I0(n2082_20),
	.I1(n2082_19),
	.I2(state_cnt[0]),
	.F(n2083_18)
);
defparam n2083_s14.INIT=8'h35;
LUT4 n2085_s12 (
	.I0(n2085_17),
	.I1(data48_reg[46]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2085_16)
);
defparam n2085_s12.INIT=16'h050C;
LUT4 n2087_s9 (
	.I0(n2087_14),
	.I1(data48_reg[45]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2087_13)
);
defparam n2087_s9.INIT=16'h0A0C;
LUT4 n2093_s9 (
	.I0(n2072_27),
	.I1(data48_reg[42]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2093_13)
);
defparam n2093_s9.INIT=16'h0A0C;
LUT4 n2095_s9 (
	.I0(n2095_14),
	.I1(data48_reg[41]),
	.I2(n2073_20),
	.I3(data48_reg_47_9),
	.F(n2095_13)
);
defparam n2095_s9.INIT=16'h00F8;
LUT4 n2097_s9 (
	.I0(n2074_17),
	.I1(data48_reg[40]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2097_13)
);
defparam n2097_s9.INIT=16'h050C;
LUT3 n2099_s9 (
	.I0(n2099_16),
	.I1(data48_reg[39]),
	.I2(n2075_18),
	.F(n2099_13)
);
defparam n2099_s9.INIT=8'hF8;
LUT2 n2101_s9 (
	.I0(data48_reg[38]),
	.I1(n2099_16),
	.F(n2101_13)
);
defparam n2101_s9.INIT=4'h8;
LUT4 n2117_s9 (
	.I0(data48_reg_47_9),
	.I1(n2117_14),
	.I2(data48_reg[30]),
	.I3(n2099_16),
	.F(n2117_13)
);
defparam n2117_s9.INIT=16'hF444;
LUT3 n2119_s9 (
	.I0(n2099_16),
	.I1(data48_reg[29]),
	.I2(n2119_14),
	.F(n2119_13)
);
defparam n2119_s9.INIT=8'hF8;
LUT3 n2123_s9 (
	.I0(n2099_16),
	.I1(data48_reg[27]),
	.I2(n2119_14),
	.F(n2123_13)
);
defparam n2123_s9.INIT=8'hF8;
LUT3 n2127_s9 (
	.I0(n2099_16),
	.I1(data48_reg[25]),
	.I2(n2119_14),
	.F(n2127_13)
);
defparam n2127_s9.INIT=8'hF8;
LUT4 n2133_s9 (
	.I0(n4557_5),
	.I1(data48_reg[22]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2133_13)
);
defparam n2133_s9.INIT=16'h0A0C;
LUT2 n2135_s9 (
	.I0(data48_reg[21]),
	.I1(n2099_16),
	.F(n2135_13)
);
defparam n2135_s9.INIT=4'h8;
LUT4 n2139_s9 (
	.I0(n2139_16),
	.I1(data48_reg[19]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2139_13)
);
defparam n2139_s9.INIT=16'h050C;
LUT2 n2141_s9 (
	.I0(data48_reg[18]),
	.I1(n2099_16),
	.F(n2141_13)
);
defparam n2141_s9.INIT=4'h8;
LUT2 n2143_s9 (
	.I0(data48_reg[17]),
	.I1(n2099_16),
	.F(n2143_13)
);
defparam n2143_s9.INIT=4'h8;
LUT3 n2147_s9 (
	.I0(n2099_16),
	.I1(data48_reg[15]),
	.I2(n2147_14),
	.F(n2147_13)
);
defparam n2147_s9.INIT=8'hF8;
LUT4 n2149_s9 (
	.I0(n2099_16),
	.I1(data48_reg[14]),
	.I2(n2139_16),
	.I3(n2069_18),
	.F(n2149_13)
);
defparam n2149_s9.INIT=16'hF088;
LUT4 n2151_s9 (
	.I0(n2151_14),
	.I1(data48_reg[13]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2151_13)
);
defparam n2151_s9.INIT=16'h0A0C;
LUT4 n2155_s9 (
	.I0(data48_reg[11]),
	.I1(state_s_id[0]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2155_13)
);
defparam n2155_s9.INIT=16'h0C0A;
LUT2 n2157_s9 (
	.I0(data48_reg_47_9),
	.I1(n2157_14),
	.F(n2157_13)
);
defparam n2157_s9.INIT=4'h1;
LUT4 n2163_s9 (
	.I0(n2163_14),
	.I1(data48_reg[7]),
	.I2(data48_reg_47_9),
	.I3(n2069_18),
	.F(n2163_13)
);
defparam n2163_s9.INIT=16'h0A0C;
LUT3 n2165_s9 (
	.I0(n2099_16),
	.I1(data48_reg[6]),
	.I2(n2165_16),
	.F(n2165_13)
);
defparam n2165_s9.INIT=8'hF8;
LUT3 n2169_s9 (
	.I0(n2099_16),
	.I1(data48_reg[4]),
	.I2(n2165_16),
	.F(n2169_13)
);
defparam n2169_s9.INIT=8'hF8;
LUT3 n2171_s9 (
	.I0(n2099_16),
	.I1(data48_reg[3]),
	.I2(n2171_14),
	.F(n2171_13)
);
defparam n2171_s9.INIT=8'hF8;
LUT2 n2175_s9 (
	.I0(data48_reg[1]),
	.I1(n2099_16),
	.F(n2175_13)
);
defparam n2175_s9.INIT=4'h8;
LUT3 n2177_s9 (
	.I0(n2099_16),
	.I1(data48_reg[0]),
	.I2(n2171_14),
	.F(n2177_13)
);
defparam n2177_s9.INIT=8'hF8;
LUT3 n2179_s9 (
	.I0(data48_reg[47]),
	.I1(n2179_14),
	.I2(n2179_15),
	.F(n2179_13)
);
defparam n2179_s9.INIT=8'h80;
LUT4 n2180_s12 (
	.I0(n2180_17),
	.I1(le48_reg_47_9),
	.I2(n2180_18),
	.I3(n2180_19),
	.F(n2180_16)
);
defparam n2180_s12.INIT=16'hFFF4;
LUT2 n1454_s8 (
	.I0(DCLK),
	.I1(n4557_10),
	.F(n1454_12)
);
defparam n1454_s8.INIT=4'h8;
LUT4 n1658_s8 (
	.I0(latch_cnt[5]),
	.I1(n1658_13),
	.I2(latch_cnt[6]),
	.I3(n2054_14),
	.F(n1658_12)
);
defparam n1658_s8.INIT=16'h7800;
LUT3 n1660_s8 (
	.I0(latch_cnt[5]),
	.I1(n1658_13),
	.I2(n2054_14),
	.F(n1660_12)
);
defparam n1660_s8.INIT=8'h60;
LUT4 n1662_s8 (
	.I0(latch_cnt[3]),
	.I1(n1662_13),
	.I2(latch_cnt[4]),
	.I3(n2054_14),
	.F(n1662_12)
);
defparam n1662_s8.INIT=16'h7800;
LUT3 n1664_s8 (
	.I0(latch_cnt[3]),
	.I1(n1662_13),
	.I2(n2054_14),
	.F(n1664_12)
);
defparam n1664_s8.INIT=8'h60;
LUT4 n1666_s8 (
	.I0(latch_cnt[0]),
	.I1(latch_cnt[1]),
	.I2(latch_cnt[2]),
	.I3(n2054_14),
	.F(n1666_12)
);
defparam n1666_s8.INIT=16'h7800;
LUT3 n1668_s8 (
	.I0(latch_cnt[0]),
	.I1(latch_cnt[1]),
	.I2(n2054_14),
	.F(n1668_12)
);
defparam n1668_s8.INIT=8'h60;
LUT3 n2089_s10 (
	.I0(data48_reg_47_9),
	.I1(n2089_16),
	.I2(n2071_13),
	.F(n2089_15)
);
defparam n2089_s10.INIT=8'hF4;
LUT3 n2091_s10 (
	.I0(n2099_16),
	.I1(data48_reg[43]),
	.I2(n2091_16),
	.F(n2091_15)
);
defparam n2091_s10.INIT=8'h8F;
LUT3 n2103_s10 (
	.I0(n2099_16),
	.I1(data48_reg[37]),
	.I2(n2071_13),
	.F(n2103_15)
);
defparam n2103_s10.INIT=8'hF8;
LUT3 n2105_s10 (
	.I0(n2099_16),
	.I1(data48_reg[36]),
	.I2(n2071_13),
	.F(n2105_15)
);
defparam n2105_s10.INIT=8'hF8;
LUT4 n2107_s10 (
	.I0(n2117_14),
	.I1(n2107_16),
	.I2(data48_reg_47_9),
	.I3(n2071_13),
	.F(n2107_15)
);
defparam n2107_s10.INIT=16'hFF0E;
LUT3 n2109_s10 (
	.I0(data48_reg_47_9),
	.I1(n2109_16),
	.I2(n2071_13),
	.F(n2109_15)
);
defparam n2109_s10.INIT=8'hF4;
LUT3 n2111_s10 (
	.I0(data48_reg_47_9),
	.I1(n2111_16),
	.I2(n2071_13),
	.F(n2111_15)
);
defparam n2111_s10.INIT=8'hF1;
LUT3 n2113_s10 (
	.I0(data48_reg_47_9),
	.I1(n2113_16),
	.I2(n2071_13),
	.F(n2113_15)
);
defparam n2113_s10.INIT=8'hF4;
LUT4 n2115_s10 (
	.I0(n2147_14),
	.I1(n2115_16),
	.I2(data48_reg_47_9),
	.I3(n2071_13),
	.F(n2115_15)
);
defparam n2115_s10.INIT=16'hFF0E;
LUT4 n2129_s10 (
	.I0(n2129_16),
	.I1(data48_reg_47_9),
	.I2(n2137_14),
	.I3(n2129_19),
	.F(n2129_15)
);
defparam n2129_s10.INIT=16'hF2FF;
LUT4 n2131_s10 (
	.I0(data48_reg_47_9),
	.I1(n2095_14),
	.I2(data48_reg[23]),
	.I3(n2129_19),
	.F(n2131_15)
);
defparam n2131_s10.INIT=16'h40FF;
LUT4 n2145_s10 (
	.I0(n2071_13),
	.I1(data48_reg[16]),
	.I2(n2171_14),
	.I3(n2099_16),
	.F(n2145_15)
);
defparam n2145_s10.INIT=16'hFCFA;
LUT3 n2161_s10 (
	.I0(data48_reg_47_9),
	.I1(n2161_16),
	.I2(n2071_13),
	.F(n2161_15)
);
defparam n2161_s10.INIT=8'hF4;
LUT3 n2173_s10 (
	.I0(data48_reg_47_9),
	.I1(n2173_16),
	.I2(n2071_13),
	.F(n2173_15)
);
defparam n2173_s10.INIT=8'hF1;
LUT3 n1448_s7 (
	.I0(le48_reg_46_9),
	.I1(le48_reg[47]),
	.I2(n1448_13),
	.F(n1448_12)
);
defparam n1448_s7.INIT=8'h4F;
LUT3 n1450_s10 (
	.I0(le48_reg[45]),
	.I1(n1450_16),
	.I2(n4557_10),
	.F(n1450_15)
);
defparam n1450_s10.INIT=8'hF8;
LUT3 n1452_s9 (
	.I0(le48_reg[44]),
	.I1(n1450_16),
	.I2(n4557_10),
	.F(n1452_14)
);
defparam n1452_s9.INIT=8'hF8;
LUT4 n1672_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[94]),
	.I2(rgb_data[95]),
	.I3(n2054_14),
	.F(n1672_14)
);
defparam n1672_s9.INIT=16'hF888;
LUT4 n1674_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[93]),
	.I2(rgb_data[94]),
	.I3(n2054_14),
	.F(n1674_14)
);
defparam n1674_s9.INIT=16'hF888;
LUT4 n1676_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[92]),
	.I2(rgb_data[93]),
	.I3(n2054_14),
	.F(n1676_14)
);
defparam n1676_s9.INIT=16'hF888;
LUT4 n1678_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[91]),
	.I2(rgb_data[92]),
	.I3(n2054_14),
	.F(n1678_14)
);
defparam n1678_s9.INIT=16'hF888;
LUT4 n1680_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[90]),
	.I2(rgb_data[91]),
	.I3(n2054_14),
	.F(n1680_14)
);
defparam n1680_s9.INIT=16'hF888;
LUT4 n1682_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[89]),
	.I2(rgb_data[90]),
	.I3(n2054_14),
	.F(n1682_14)
);
defparam n1682_s9.INIT=16'hF888;
LUT4 n1684_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[88]),
	.I2(rgb_data[89]),
	.I3(n2054_14),
	.F(n1684_14)
);
defparam n1684_s9.INIT=16'hF888;
LUT4 n1686_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[87]),
	.I2(rgb_data[88]),
	.I3(n2054_14),
	.F(n1686_14)
);
defparam n1686_s9.INIT=16'hF888;
LUT4 n1688_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[86]),
	.I2(rgb_data[87]),
	.I3(n2054_14),
	.F(n1688_14)
);
defparam n1688_s9.INIT=16'hF888;
LUT4 n1690_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[85]),
	.I2(rgb_data[86]),
	.I3(n2054_14),
	.F(n1690_14)
);
defparam n1690_s9.INIT=16'hF888;
LUT4 n1692_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[84]),
	.I2(rgb_data[85]),
	.I3(n2054_14),
	.F(n1692_14)
);
defparam n1692_s9.INIT=16'hF888;
LUT4 n1694_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[83]),
	.I2(rgb_data[84]),
	.I3(n2054_14),
	.F(n1694_14)
);
defparam n1694_s9.INIT=16'hF888;
LUT4 n1696_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[82]),
	.I2(rgb_data[83]),
	.I3(n2054_14),
	.F(n1696_14)
);
defparam n1696_s9.INIT=16'hF888;
LUT4 n1698_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[81]),
	.I2(rgb_data[82]),
	.I3(n2054_14),
	.F(n1698_14)
);
defparam n1698_s9.INIT=16'hF888;
LUT4 n1700_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[80]),
	.I2(rgb_data[81]),
	.I3(n2054_14),
	.F(n1700_14)
);
defparam n1700_s9.INIT=16'hF888;
LUT4 n1702_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[79]),
	.I2(rgb_data[80]),
	.I3(n2054_14),
	.F(n1702_14)
);
defparam n1702_s9.INIT=16'hF888;
LUT4 n1704_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[78]),
	.I2(rgb_data[79]),
	.I3(n2054_14),
	.F(n1704_14)
);
defparam n1704_s9.INIT=16'hF888;
LUT4 n1706_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[77]),
	.I2(rgb_data[78]),
	.I3(n2054_14),
	.F(n1706_14)
);
defparam n1706_s9.INIT=16'hF888;
LUT4 n1708_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[76]),
	.I2(rgb_data[77]),
	.I3(n2054_14),
	.F(n1708_14)
);
defparam n1708_s9.INIT=16'hF888;
LUT4 n1710_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[75]),
	.I2(rgb_data[76]),
	.I3(n2054_14),
	.F(n1710_14)
);
defparam n1710_s9.INIT=16'hF888;
LUT4 n1712_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[74]),
	.I2(rgb_data[75]),
	.I3(n2054_14),
	.F(n1712_14)
);
defparam n1712_s9.INIT=16'hF888;
LUT4 n1714_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[73]),
	.I2(rgb_data[74]),
	.I3(n2054_14),
	.F(n1714_14)
);
defparam n1714_s9.INIT=16'hF888;
LUT4 n1716_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[72]),
	.I2(rgb_data[73]),
	.I3(n2054_14),
	.F(n1716_14)
);
defparam n1716_s9.INIT=16'hF888;
LUT4 n1718_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[71]),
	.I2(rgb_data[72]),
	.I3(n2054_14),
	.F(n1718_14)
);
defparam n1718_s9.INIT=16'hF888;
LUT4 n1720_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[70]),
	.I2(rgb_data[71]),
	.I3(n2054_14),
	.F(n1720_14)
);
defparam n1720_s9.INIT=16'hF888;
LUT4 n1722_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[69]),
	.I2(rgb_data[70]),
	.I3(n2054_14),
	.F(n1722_14)
);
defparam n1722_s9.INIT=16'hF888;
LUT4 n1724_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[68]),
	.I2(rgb_data[69]),
	.I3(n2054_14),
	.F(n1724_14)
);
defparam n1724_s9.INIT=16'hF888;
LUT4 n1726_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[67]),
	.I2(rgb_data[68]),
	.I3(n2054_14),
	.F(n1726_14)
);
defparam n1726_s9.INIT=16'hF888;
LUT4 n1728_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[66]),
	.I2(rgb_data[67]),
	.I3(n2054_14),
	.F(n1728_14)
);
defparam n1728_s9.INIT=16'hF888;
LUT4 n1730_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[65]),
	.I2(rgb_data[66]),
	.I3(n2054_14),
	.F(n1730_14)
);
defparam n1730_s9.INIT=16'hF888;
LUT4 n1732_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[64]),
	.I2(rgb_data[65]),
	.I3(n2054_14),
	.F(n1732_14)
);
defparam n1732_s9.INIT=16'hF888;
LUT4 n1734_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[63]),
	.I2(rgb_data[64]),
	.I3(n2054_14),
	.F(n1734_14)
);
defparam n1734_s9.INIT=16'hF888;
LUT4 n1736_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[62]),
	.I2(rgb_data[63]),
	.I3(n2054_14),
	.F(n1736_14)
);
defparam n1736_s9.INIT=16'hF888;
LUT4 n1738_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[61]),
	.I2(rgb_data[62]),
	.I3(n2054_14),
	.F(n1738_14)
);
defparam n1738_s9.INIT=16'hF888;
LUT4 n1740_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[60]),
	.I2(rgb_data[61]),
	.I3(n2054_14),
	.F(n1740_14)
);
defparam n1740_s9.INIT=16'hF888;
LUT4 n1742_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[59]),
	.I2(rgb_data[60]),
	.I3(n2054_14),
	.F(n1742_14)
);
defparam n1742_s9.INIT=16'hF888;
LUT4 n1744_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[58]),
	.I2(rgb_data[59]),
	.I3(n2054_14),
	.F(n1744_14)
);
defparam n1744_s9.INIT=16'hF888;
LUT4 n1746_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[57]),
	.I2(rgb_data[58]),
	.I3(n2054_14),
	.F(n1746_14)
);
defparam n1746_s9.INIT=16'hF888;
LUT4 n1748_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[56]),
	.I2(rgb_data[57]),
	.I3(n2054_14),
	.F(n1748_14)
);
defparam n1748_s9.INIT=16'hF888;
LUT4 n1750_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[55]),
	.I2(rgb_data[56]),
	.I3(n2054_14),
	.F(n1750_14)
);
defparam n1750_s9.INIT=16'hF888;
LUT4 n1752_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[54]),
	.I2(rgb_data[55]),
	.I3(n2054_14),
	.F(n1752_14)
);
defparam n1752_s9.INIT=16'hF888;
LUT4 n1754_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[53]),
	.I2(rgb_data[54]),
	.I3(n2054_14),
	.F(n1754_14)
);
defparam n1754_s9.INIT=16'hF888;
LUT4 n1756_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[52]),
	.I2(rgb_data[53]),
	.I3(n2054_14),
	.F(n1756_14)
);
defparam n1756_s9.INIT=16'hF888;
LUT4 n1758_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[51]),
	.I2(rgb_data[52]),
	.I3(n2054_14),
	.F(n1758_14)
);
defparam n1758_s9.INIT=16'hF888;
LUT4 n1760_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[50]),
	.I2(rgb_data[51]),
	.I3(n2054_14),
	.F(n1760_14)
);
defparam n1760_s9.INIT=16'hF888;
LUT4 n1762_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[49]),
	.I2(rgb_data[50]),
	.I3(n2054_14),
	.F(n1762_14)
);
defparam n1762_s9.INIT=16'hF888;
LUT4 n1764_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[48]),
	.I2(rgb_data[49]),
	.I3(n2054_14),
	.F(n1764_14)
);
defparam n1764_s9.INIT=16'hF888;
LUT4 n1766_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[47]),
	.I2(rgb_data[48]),
	.I3(n2054_14),
	.F(n1766_14)
);
defparam n1766_s9.INIT=16'hF888;
LUT4 n1768_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[46]),
	.I2(rgb_data[47]),
	.I3(n2054_14),
	.F(n1768_14)
);
defparam n1768_s9.INIT=16'hF888;
LUT4 n1770_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[45]),
	.I2(rgb_data[46]),
	.I3(n2054_14),
	.F(n1770_14)
);
defparam n1770_s9.INIT=16'hF888;
LUT4 n1772_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[44]),
	.I2(rgb_data[45]),
	.I3(n2054_14),
	.F(n1772_14)
);
defparam n1772_s9.INIT=16'hF888;
LUT4 n1774_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[43]),
	.I2(rgb_data[44]),
	.I3(n2054_14),
	.F(n1774_14)
);
defparam n1774_s9.INIT=16'hF888;
LUT4 n1776_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[42]),
	.I2(rgb_data[43]),
	.I3(n2054_14),
	.F(n1776_14)
);
defparam n1776_s9.INIT=16'hF888;
LUT4 n1778_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[41]),
	.I2(rgb_data[42]),
	.I3(n2054_14),
	.F(n1778_14)
);
defparam n1778_s9.INIT=16'hF888;
LUT4 n1780_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[40]),
	.I2(rgb_data[41]),
	.I3(n2054_14),
	.F(n1780_14)
);
defparam n1780_s9.INIT=16'hF888;
LUT4 n1782_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[39]),
	.I2(rgb_data[40]),
	.I3(n2054_14),
	.F(n1782_14)
);
defparam n1782_s9.INIT=16'hF888;
LUT4 n1784_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[38]),
	.I2(rgb_data[39]),
	.I3(n2054_14),
	.F(n1784_14)
);
defparam n1784_s9.INIT=16'hF888;
LUT4 n1786_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[37]),
	.I2(rgb_data[38]),
	.I3(n2054_14),
	.F(n1786_14)
);
defparam n1786_s9.INIT=16'hF888;
LUT4 n1788_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[36]),
	.I2(rgb_data[37]),
	.I3(n2054_14),
	.F(n1788_14)
);
defparam n1788_s9.INIT=16'hF888;
LUT4 n1790_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[35]),
	.I2(rgb_data[36]),
	.I3(n2054_14),
	.F(n1790_14)
);
defparam n1790_s9.INIT=16'hF888;
LUT4 n1792_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[34]),
	.I2(rgb_data[35]),
	.I3(n2054_14),
	.F(n1792_14)
);
defparam n1792_s9.INIT=16'hF888;
LUT4 n1794_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[33]),
	.I2(rgb_data[34]),
	.I3(n2054_14),
	.F(n1794_14)
);
defparam n1794_s9.INIT=16'hF888;
LUT4 n1796_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[32]),
	.I2(rgb_data[33]),
	.I3(n2054_14),
	.F(n1796_14)
);
defparam n1796_s9.INIT=16'hF888;
LUT4 n1798_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[31]),
	.I2(rgb_data[32]),
	.I3(n2054_14),
	.F(n1798_14)
);
defparam n1798_s9.INIT=16'hF888;
LUT4 n1800_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[30]),
	.I2(rgb_data[31]),
	.I3(n2054_14),
	.F(n1800_14)
);
defparam n1800_s9.INIT=16'hF888;
LUT4 n1802_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[29]),
	.I2(rgb_data[30]),
	.I3(n2054_14),
	.F(n1802_14)
);
defparam n1802_s9.INIT=16'hF888;
LUT4 n1804_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[28]),
	.I2(rgb_data[29]),
	.I3(n2054_14),
	.F(n1804_14)
);
defparam n1804_s9.INIT=16'hF888;
LUT4 n1806_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[27]),
	.I2(rgb_data[28]),
	.I3(n2054_14),
	.F(n1806_14)
);
defparam n1806_s9.INIT=16'hF888;
LUT4 n1808_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[26]),
	.I2(rgb_data[27]),
	.I3(n2054_14),
	.F(n1808_14)
);
defparam n1808_s9.INIT=16'hF888;
LUT4 n1810_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[25]),
	.I2(rgb_data[26]),
	.I3(n2054_14),
	.F(n1810_14)
);
defparam n1810_s9.INIT=16'hF888;
LUT4 n1812_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[24]),
	.I2(rgb_data[25]),
	.I3(n2054_14),
	.F(n1812_14)
);
defparam n1812_s9.INIT=16'hF888;
LUT4 n1814_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[23]),
	.I2(rgb_data[24]),
	.I3(n2054_14),
	.F(n1814_14)
);
defparam n1814_s9.INIT=16'hF888;
LUT4 n1816_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[22]),
	.I2(rgb_data[23]),
	.I3(n2054_14),
	.F(n1816_14)
);
defparam n1816_s9.INIT=16'hF888;
LUT4 n1818_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[21]),
	.I2(rgb_data[22]),
	.I3(n2054_14),
	.F(n1818_14)
);
defparam n1818_s9.INIT=16'hF888;
LUT4 n1820_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[20]),
	.I2(rgb_data[21]),
	.I3(n2054_14),
	.F(n1820_14)
);
defparam n1820_s9.INIT=16'hF888;
LUT4 n1822_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[19]),
	.I2(rgb_data[20]),
	.I3(n2054_14),
	.F(n1822_14)
);
defparam n1822_s9.INIT=16'hF888;
LUT4 n1824_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[18]),
	.I2(rgb_data[19]),
	.I3(n2054_14),
	.F(n1824_14)
);
defparam n1824_s9.INIT=16'hF888;
LUT4 n1826_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[17]),
	.I2(rgb_data[18]),
	.I3(n2054_14),
	.F(n1826_14)
);
defparam n1826_s9.INIT=16'hF888;
LUT4 n1828_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[16]),
	.I2(rgb_data[17]),
	.I3(n2054_14),
	.F(n1828_14)
);
defparam n1828_s9.INIT=16'hF888;
LUT4 n1830_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[15]),
	.I2(rgb_data[16]),
	.I3(n2054_14),
	.F(n1830_14)
);
defparam n1830_s9.INIT=16'hF888;
LUT4 n1832_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[14]),
	.I2(rgb_data[15]),
	.I3(n2054_14),
	.F(n1832_14)
);
defparam n1832_s9.INIT=16'hF888;
LUT4 n1834_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[13]),
	.I2(rgb_data[14]),
	.I3(n2054_14),
	.F(n1834_14)
);
defparam n1834_s9.INIT=16'hF888;
LUT4 n1836_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[12]),
	.I2(rgb_data[13]),
	.I3(n2054_14),
	.F(n1836_14)
);
defparam n1836_s9.INIT=16'hF888;
LUT4 n1838_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[11]),
	.I2(rgb_data[12]),
	.I3(n2054_14),
	.F(n1838_14)
);
defparam n1838_s9.INIT=16'hF888;
LUT4 n1840_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[10]),
	.I2(rgb_data[11]),
	.I3(n2054_14),
	.F(n1840_14)
);
defparam n1840_s9.INIT=16'hF888;
LUT4 n1842_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[9]),
	.I2(rgb_data[10]),
	.I3(n2054_14),
	.F(n1842_14)
);
defparam n1842_s9.INIT=16'hF888;
LUT4 n1844_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[8]),
	.I2(rgb_data[9]),
	.I3(n2054_14),
	.F(n1844_14)
);
defparam n1844_s9.INIT=16'hF888;
LUT4 n1846_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[7]),
	.I2(rgb_data[8]),
	.I3(n2054_14),
	.F(n1846_14)
);
defparam n1846_s9.INIT=16'hF888;
LUT4 n1848_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[6]),
	.I2(rgb_data[7]),
	.I3(n2054_14),
	.F(n1848_14)
);
defparam n1848_s9.INIT=16'hF888;
LUT4 n1850_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[5]),
	.I2(rgb_data[6]),
	.I3(n2054_14),
	.F(n1850_14)
);
defparam n1850_s9.INIT=16'hF888;
LUT4 n1852_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[4]),
	.I2(rgb_data[5]),
	.I3(n2054_14),
	.F(n1852_14)
);
defparam n1852_s9.INIT=16'hF888;
LUT4 n1854_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[3]),
	.I2(rgb_data[4]),
	.I3(n2054_14),
	.F(n1854_14)
);
defparam n1854_s9.INIT=16'hF888;
LUT4 n1856_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[2]),
	.I2(rgb_data[3]),
	.I3(n2054_14),
	.F(n1856_14)
);
defparam n1856_s9.INIT=16'hF888;
LUT4 n1858_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[1]),
	.I2(rgb_data[2]),
	.I3(n2054_14),
	.F(n1858_14)
);
defparam n1858_s9.INIT=16'hF888;
LUT4 n1860_s9 (
	.I0(data96_reg_95_9),
	.I1(data96_reg[0]),
	.I2(rgb_data[1]),
	.I3(n2054_14),
	.F(n1860_14)
);
defparam n1860_s9.INIT=16'hF888;
LUT4 n3437_s2 (
	.I0(cnt_GCLK_9_9),
	.I1(cnt_GCLK[9]),
	.I2(cnt_scan[1]),
	.I3(cnt_scan[0]),
	.F(n3437_6)
);
defparam n3437_s2.INIT=16'h0BB0;
LUT4 n3436_s2 (
	.I0(n3436_7),
	.I1(cnt_GCLK[9]),
	.I2(n3436_8),
	.I3(cnt_GCLK_9_9),
	.F(n3436_6)
);
defparam n3436_s2.INIT=16'h5030;
LUT3 n3266_s3 (
	.I0(cnt_GCLK_9_19),
	.I1(cnt_GCLK[0]),
	.I2(n3202_9),
	.F(n3266_7)
);
defparam n3266_s3.INIT=8'h0B;
LUT4 n3265_s3 (
	.I0(cnt_GCLK_9_19),
	.I1(cnt_GCLK[0]),
	.I2(cnt_GCLK[1]),
	.I3(n3202_9),
	.F(n3265_7)
);
defparam n3265_s3.INIT=16'h00BE;
LUT4 n3264_s3 (
	.I0(cnt_GCLK_9_19),
	.I1(cnt_GCLK[2]),
	.I2(n3264_8),
	.I3(n3202_9),
	.F(n3264_7)
);
defparam n3264_s3.INIT=16'h00BE;
LUT3 n3263_s3 (
	.I0(n3263_10),
	.I1(cnt_GCLK_9_19),
	.I2(n3202_9),
	.F(n3263_7)
);
defparam n3263_s3.INIT=8'h0E;
LUT4 n3262_s3 (
	.I0(cnt_GCLK_9_19),
	.I1(cnt_GCLK[4]),
	.I2(n3262_8),
	.I3(n3202_9),
	.F(n3262_7)
);
defparam n3262_s3.INIT=16'h00BE;
LUT3 n3261_s3 (
	.I0(n3261_8),
	.I1(cnt_GCLK_9_19),
	.I2(n3202_9),
	.F(n3261_7)
);
defparam n3261_s3.INIT=8'h0E;
LUT3 n3260_s3 (
	.I0(n3260_8),
	.I1(cnt_GCLK_9_19),
	.I2(n3202_9),
	.F(n3260_7)
);
defparam n3260_s3.INIT=8'h0E;
LUT4 n3259_s3 (
	.I0(cnt_GCLK_9_19),
	.I1(cnt_GCLK[7]),
	.I2(n3259_8),
	.I3(n3202_9),
	.F(n3259_7)
);
defparam n3259_s3.INIT=16'h00BE;
LUT3 n3258_s3 (
	.I0(n3258_8),
	.I1(cnt_GCLK_9_19),
	.I2(n3202_9),
	.F(n3258_7)
);
defparam n3258_s3.INIT=8'h0E;
LUT3 n3257_s4 (
	.I0(n3202_9),
	.I1(cnt_GCLK[9]),
	.I2(n3257_9),
	.F(n3257_8)
);
defparam n3257_s4.INIT=8'h14;
LUT4 n26_s2 (
	.I0(cnt_scanwire[11]),
	.I1(n26_7),
	.I2(cnt_scanwire[12]),
	.I3(n25_15),
	.F(n26_6)
);
defparam n26_s2.INIT=16'h7800;
LUT4 n28_s2 (
	.I0(n28_7),
	.I1(n28_8),
	.I2(cnt_scanwire[10]),
	.I3(n25_15),
	.F(n28_6)
);
defparam n28_s2.INIT=16'h7800;
LUT4 n29_s2 (
	.I0(cnt_scanwire[8]),
	.I1(n28_8),
	.I2(cnt_scanwire[9]),
	.I3(n25_15),
	.F(n29_6)
);
defparam n29_s2.INIT=16'h7800;
LUT4 n31_s2 (
	.I0(cnt_scanwire[6]),
	.I1(n31_7),
	.I2(cnt_scanwire[7]),
	.I3(n25_15),
	.F(n31_6)
);
defparam n31_s2.INIT=16'h7800;
LUT4 n33_s2 (
	.I0(cnt_scanwire[4]),
	.I1(n33_9),
	.I2(cnt_scanwire[5]),
	.I3(n25_15),
	.F(n33_6)
);
defparam n33_s2.INIT=16'h7800;
LUT4 n35_s2 (
	.I0(cnt_scanwire[2]),
	.I1(n35_7),
	.I2(cnt_scanwire[3]),
	.I3(n25_15),
	.F(n35_6)
);
defparam n35_s2.INIT=16'h7800;
LUT4 n3346_s1 (
	.I0(GCLK_cnt[8]),
	.I1(n3346_6),
	.I2(GCLK_cnt[9]),
	.I3(n3346_10),
	.F(n3346_5)
);
defparam n3346_s1.INIT=16'hF800;
LUT3 n3347_s1 (
	.I0(GCLK_cnt[8]),
	.I1(n3346_6),
	.I2(n3346_10),
	.F(n3347_5)
);
defparam n3347_s1.INIT=8'h60;
LUT4 n3348_s1 (
	.I0(GCLK_cnt[6]),
	.I1(n3348_6),
	.I2(GCLK_cnt[7]),
	.I3(n3346_10),
	.F(n3348_5)
);
defparam n3348_s1.INIT=16'h7800;
LUT3 n3349_s1 (
	.I0(GCLK_cnt[6]),
	.I1(n3348_6),
	.I2(n3346_10),
	.F(n3349_5)
);
defparam n3349_s1.INIT=8'h60;
LUT4 n3350_s1 (
	.I0(GCLK_cnt[4]),
	.I1(n3350_8),
	.I2(GCLK_cnt[5]),
	.I3(n3346_10),
	.F(n3350_5)
);
defparam n3350_s1.INIT=16'h7800;
LUT3 n3351_s1 (
	.I0(GCLK_cnt[4]),
	.I1(n3350_8),
	.I2(n3346_10),
	.F(n3351_5)
);
defparam n3351_s1.INIT=8'h60;
LUT4 n3352_s1 (
	.I0(GCLK_cnt[2]),
	.I1(n3352_6),
	.I2(GCLK_cnt[3]),
	.I3(n3346_10),
	.F(n3352_5)
);
defparam n3352_s1.INIT=16'h7800;
LUT3 n3354_s1 (
	.I0(GCLK_cnt[0]),
	.I1(GCLK_cnt[1]),
	.I2(n3346_10),
	.F(n3354_5)
);
defparam n3354_s1.INIT=8'h60;
LUT4 n3463_s2 (
	.I0(cnt_scan[1]),
	.I1(cnt_scan[2]),
	.I2(cnt_scan[0]),
	.I3(n3463_14),
	.F(n3463_6)
);
defparam n3463_s2.INIT=16'hEFFF;
LUT4 n3464_s2 (
	.I0(cnt_scan[0]),
	.I1(cnt_scan[2]),
	.I2(cnt_scan[1]),
	.I3(n3463_14),
	.F(n3464_6)
);
defparam n3464_s2.INIT=16'hEFFF;
LUT4 n3465_s2 (
	.I0(cnt_scan[2]),
	.I1(cnt_scan[1]),
	.I2(cnt_scan[0]),
	.I3(n3463_14),
	.F(n3465_6)
);
defparam n3465_s2.INIT=16'hBFFF;
LUT4 n2182_s14 (
	.I0(n2182_21),
	.I1(data96_reg[95]),
	.I2(n2179_13),
	.I3(n2182_22),
	.F(n2182_20)
);
defparam n2182_s14.INIT=16'hFFF8;
LUT4 n4557_s2 (
	.I0(state_s_id[3]),
	.I1(state_s_id[2]),
	.I2(state_s_id[1]),
	.I3(state_s_id[0]),
	.F(n4557_5)
);
defparam n4557_s2.INIT=16'h0001;
LUT4 n3202_s1 (
	.I0(state_cnt[1]),
	.I1(state_cnt[2]),
	.I2(state_cnt[3]),
	.I3(state_cnt[4]),
	.F(n3202_4)
);
defparam n3202_s1.INIT=16'h0100;
LUT3 n3202_s3 (
	.I0(state_cnt[5]),
	.I1(state_cnt[6]),
	.I2(state_cnt[7]),
	.F(n3202_6)
);
defparam n3202_s3.INIT=8'h01;
LUT4 n3416_s1 (
	.I0(GCLK_cnt[4]),
	.I1(n3416_7),
	.I2(n3202_9),
	.I3(n3416_8),
	.F(n3416_4)
);
defparam n3416_s1.INIT=16'h00BF;
LUT2 cnt_GCLK_9_s4 (
	.I0(GCLK_rr),
	.I1(GCLK_r),
	.F(cnt_GCLK_9_9)
);
defparam cnt_GCLK_9_s4.INIT=4'h4;
LUT2 le48_reg_47_s4 (
	.I0(state_s_id[3]),
	.I1(state_s_id[2]),
	.F(le48_reg_47_8)
);
defparam le48_reg_47_s4.INIT=4'h1;
LUT2 le48_reg_47_s5 (
	.I0(state_m_id[0]),
	.I1(state_m_id[1]),
	.F(le48_reg_47_9)
);
defparam le48_reg_47_s5.INIT=4'h4;
LUT4 data48_reg_47_s5 (
	.I0(SDI_8),
	.I1(n2179_15),
	.I2(n2069_23),
	.I3(n2069_18),
	.F(data48_reg_47_9)
);
defparam data48_reg_47_s5.INIT=16'h7077;
LUT3 data48_reg_47_s6 (
	.I0(state_m_id[1]),
	.I1(data48_reg_47_11),
	.I2(rst_n),
	.F(data48_reg_47_10)
);
defparam data48_reg_47_s6.INIT=8'h10;
LUT4 le48_reg_46_s5 (
	.I0(n1450_16),
	.I1(n3202_7),
	.I2(n4557_8),
	.I3(n4557_5),
	.F(le48_reg_46_9)
);
defparam le48_reg_46_s5.INIT=16'hB0BB;
LUT3 latch_cnt_6_s5 (
	.I0(latch_cnt_6_10),
	.I1(data96_reg_95_10),
	.I2(latch_cnt_6_11),
	.F(latch_cnt_6_9)
);
defparam latch_cnt_6_s5.INIT=8'h4E;
LUT3 data96_reg_95_s5 (
	.I0(state_cnt[7]),
	.I1(data96_reg_95_11),
	.I2(data96_reg_95_15),
	.F(data96_reg_95_9)
);
defparam data96_reg_95_s5.INIT=8'h10;
LUT4 data96_reg_95_s6 (
	.I0(frame_p),
	.I1(DCLK),
	.I2(rgb_p),
	.I3(n4557_5),
	.F(data96_reg_95_10)
);
defparam data96_reg_95_s6.INIT=16'h4000;
LUT4 n2069_s14 (
	.I0(state_cnt[0]),
	.I1(n3202_4),
	.I2(n2069_20),
	.I3(n2069_21),
	.F(n2069_18)
);
defparam n2069_s14.INIT=16'h8000;
LUT2 n2071_s10 (
	.I0(state_cnt[0]),
	.I1(state_cnt[1]),
	.F(n2071_14)
);
defparam n2071_s10.INIT=4'h8;
LUT4 n2071_s11 (
	.I0(state_cnt[2]),
	.I1(state_cnt[3]),
	.I2(state_cnt[4]),
	.I3(DCLK),
	.F(n2071_15)
);
defparam n2071_s11.INIT=16'h1000;
LUT2 n2071_s12 (
	.I0(state_m_id[0]),
	.I1(state_m_id[1]),
	.F(n2071_16)
);
defparam n2071_s12.INIT=4'h1;
LUT2 n2072_s18 (
	.I0(data48_reg_47_11),
	.I1(n2095_14),
	.F(n2072_23)
);
defparam n2072_s18.INIT=4'h1;
LUT4 n2074_s13 (
	.I0(state_s_id[2]),
	.I1(state_s_id[3]),
	.I2(state_s_id[1]),
	.I3(state_s_id[0]),
	.F(n2074_17)
);
defparam n2074_s13.INIT=16'hF8CF;
LUT4 n2074_s15 (
	.I0(n2075_17),
	.I1(n2054_14),
	.I2(latch_cnt_6_11),
	.I3(le48_reg_47_9),
	.F(n2074_19)
);
defparam n2074_s15.INIT=16'hFE00;
LUT4 n2075_s13 (
	.I0(data96_reg_95_11),
	.I1(state_cnt[7]),
	.I2(latch_cnt[6]),
	.I3(data96_reg_95_15),
	.F(n2075_17)
);
defparam n2075_s13.INIT=16'hE000;
LUT3 n2075_s14 (
	.I0(state_s_id[0]),
	.I1(n2069_23),
	.I2(n2069_18),
	.F(n2075_18)
);
defparam n2075_s14.INIT=8'h10;
LUT4 n2075_s15 (
	.I0(n2072_23),
	.I1(state_s_id[0]),
	.I2(n4557_10),
	.I3(n2075_22),
	.F(n2075_19)
);
defparam n2075_s15.INIT=16'h000B;
LUT3 n2077_s17 (
	.I0(SDI_8),
	.I1(n2182_21),
	.I2(n2075_22),
	.F(n2077_21)
);
defparam n2077_s17.INIT=8'h01;
LUT4 n2079_s16 (
	.I0(n3202_6),
	.I1(state_cnt[4]),
	.I2(data48_reg_47_11),
	.I3(n2079_25),
	.F(n2079_20)
);
defparam n2079_s16.INIT=16'hEEE0;
LUT4 n2080_s15 (
	.I0(n2079_25),
	.I1(n2080_23),
	.I2(data48_reg_47_11),
	.I3(state_cnt[3]),
	.F(n2080_19)
);
defparam n2080_s15.INIT=16'h453F;
LUT3 n2080_s16 (
	.I0(state_cnt[0]),
	.I1(state_cnt[1]),
	.I2(state_cnt[2]),
	.F(n2080_20)
);
defparam n2080_s16.INIT=8'h80;
LUT4 n2081_s15 (
	.I0(n2079_25),
	.I1(n2081_22),
	.I2(data48_reg_47_11),
	.I3(state_cnt[2]),
	.F(n2081_19)
);
defparam n2081_s15.INIT=16'h453F;
LUT3 n2082_s15 (
	.I0(n2082_21),
	.I1(data48_reg_47_11),
	.I2(n2079_25),
	.F(n2082_19)
);
defparam n2082_s15.INIT=8'h0B;
LUT3 n2082_s16 (
	.I0(n2182_21),
	.I1(n2075_22),
	.I2(n2082_22),
	.F(n2082_20)
);
defparam n2082_s16.INIT=8'h10;
LUT4 n2085_s13 (
	.I0(state_s_id[1]),
	.I1(state_s_id[0]),
	.I2(state_s_id[2]),
	.I3(state_s_id[3]),
	.F(n2085_17)
);
defparam n2085_s13.INIT=16'hFB4F;
LUT3 n2087_s10 (
	.I0(state_s_id[0]),
	.I1(state_s_id[2]),
	.I2(state_s_id[1]),
	.F(n2087_14)
);
defparam n2087_s10.INIT=8'hD0;
LUT4 n2095_s10 (
	.I0(n3202_4),
	.I1(state_cnt[0]),
	.I2(n2069_21),
	.I3(n2069_20),
	.F(n2095_14)
);
defparam n2095_s10.INIT=16'h7F00;
LUT4 n2117_s10 (
	.I0(state_s_id[1]),
	.I1(state_s_id[2]),
	.I2(state_s_id[0]),
	.I3(n2069_18),
	.F(n2117_14)
);
defparam n2117_s10.INIT=16'h0D00;
LUT3 n2119_s10 (
	.I0(state_s_id[0]),
	.I1(n2072_25),
	.I2(n2069_18),
	.F(n2119_14)
);
defparam n2119_s10.INIT=8'h10;
LUT2 n2137_s10 (
	.I0(n3202_7),
	.I1(n2069_18),
	.F(n2137_14)
);
defparam n2137_s10.INIT=4'h8;
LUT4 n2147_s10 (
	.I0(state_s_id[1]),
	.I1(state_s_id[0]),
	.I2(state_s_id[2]),
	.I3(n2073_18),
	.F(n2147_14)
);
defparam n2147_s10.INIT=16'hCA00;
LUT4 n2151_s10 (
	.I0(state_s_id[3]),
	.I1(state_s_id[1]),
	.I2(state_s_id[2]),
	.I3(state_s_id[0]),
	.F(n2151_14)
);
defparam n2151_s10.INIT=16'h0110;
LUT4 n2157_s10 (
	.I0(state_s_id[3]),
	.I1(state_s_id[0]),
	.I2(data48_reg[10]),
	.I3(n2069_18),
	.F(n2157_14)
);
defparam n2157_s10.INIT=16'hBB0F;
LUT3 n2163_s10 (
	.I0(state_s_id[2]),
	.I1(state_s_id[3]),
	.I2(state_s_id[0]),
	.F(n2163_14)
);
defparam n2163_s10.INIT=8'h3E;
LUT4 n2171_s10 (
	.I0(data48_reg_47_9),
	.I1(state_s_id[0]),
	.I2(n2069_18),
	.I3(state_s_id[3]),
	.F(n2171_14)
);
defparam n2171_s10.INIT=16'h4000;
LUT3 n2179_s10 (
	.I0(state_cnt[7]),
	.I1(state_m_id[1]),
	.I2(state_m_id[0]),
	.F(n2179_14)
);
defparam n2179_s10.INIT=8'h10;
LUT3 n2179_s11 (
	.I0(state_cnt[5]),
	.I1(state_cnt[6]),
	.I2(n2179_16),
	.F(n2179_15)
);
defparam n2179_s11.INIT=8'hE7;
LUT4 n2180_s13 (
	.I0(n2180_20),
	.I1(latch_cnt_6_10),
	.I2(n2180_21),
	.I3(n2180_22),
	.F(n2180_17)
);
defparam n2180_s13.INIT=16'h0007;
LUT3 n2180_s14 (
	.I0(n2180_23),
	.I1(n2180_24),
	.I2(state_m_id[1]),
	.F(n2180_18)
);
defparam n2180_s14.INIT=8'h0B;
LUT4 n2180_s15 (
	.I0(n2075_17),
	.I1(n4557_5),
	.I2(le48_reg_47_9),
	.I3(LE),
	.F(n2180_19)
);
defparam n2180_s15.INIT=16'hE000;
LUT3 n1658_s9 (
	.I0(latch_cnt[3]),
	.I1(latch_cnt[4]),
	.I2(n1662_13),
	.F(n1658_13)
);
defparam n1658_s9.INIT=8'h80;
LUT3 n1662_s9 (
	.I0(latch_cnt[0]),
	.I1(latch_cnt[1]),
	.I2(latch_cnt[2]),
	.F(n1662_13)
);
defparam n1662_s9.INIT=8'h80;
LUT4 scan1_wire_d_s0 (
	.I0(cnt_scanwire[10]),
	.I1(cnt_scanwire[9]),
	.I2(scan1_wire_d_6),
	.I3(cnt_scanwire[11]),
	.F(scan1_wire_d_5)
);
defparam scan1_wire_d_s0.INIT=16'hFE00;
LUT3 n2089_s11 (
	.I0(n2089_17),
	.I1(data48_reg[44]),
	.I2(n2095_14),
	.F(n2089_16)
);
defparam n2089_s11.INIT=8'hCA;
LUT3 n2091_s11 (
	.I0(n2091_19),
	.I1(n2069_18),
	.I2(n2071_13),
	.F(n2091_16)
);
defparam n2091_s11.INIT=8'h0B;
LUT2 n2107_s11 (
	.I0(data48_reg[35]),
	.I1(n2095_14),
	.F(n2107_16)
);
defparam n2107_s11.INIT=4'h8;
LUT3 n2109_s11 (
	.I0(data96_reg_95_15),
	.I1(data48_reg[34]),
	.I2(n2095_14),
	.F(n2109_16)
);
defparam n2109_s11.INIT=8'hCA;
LUT4 n2111_s11 (
	.I0(state_s_id[0]),
	.I1(n2091_19),
	.I2(data48_reg[33]),
	.I3(n2069_18),
	.F(n2111_16)
);
defparam n2111_s11.INIT=16'hEE0F;
LUT3 n2113_s11 (
	.I0(data96_reg_95_15),
	.I1(data48_reg[32]),
	.I2(n2095_14),
	.F(n2113_16)
);
defparam n2113_s11.INIT=8'hCA;
LUT2 n2115_s11 (
	.I0(data48_reg[31]),
	.I1(n2095_14),
	.F(n2115_16)
);
defparam n2115_s11.INIT=4'h8;
LUT2 n2129_s11 (
	.I0(data48_reg[24]),
	.I1(n2095_14),
	.F(n2129_16)
);
defparam n2129_s11.INIT=4'h8;
LUT3 n2161_s11 (
	.I0(data48_reg[8]),
	.I1(state_s_id[0]),
	.I2(n2069_18),
	.F(n2161_16)
);
defparam n2161_s11.INIT=8'hCA;
LUT4 n2173_s11 (
	.I0(n2069_19),
	.I1(state_s_id[0]),
	.I2(data48_reg[2]),
	.I3(n2069_18),
	.F(n2173_16)
);
defparam n2173_s11.INIT=16'hBB0F;
LUT4 n1448_s8 (
	.I0(le48_reg[46]),
	.I1(n1450_16),
	.I2(DCLK),
	.I3(n4557_10),
	.F(n1448_13)
);
defparam n1448_s8.INIT=16'h7077;
LUT4 n1450_s11 (
	.I0(n1450_17),
	.I1(n2077_22),
	.I2(n1450_18),
	.I3(n3202_7),
	.F(n1450_16)
);
defparam n1450_s11.INIT=16'hB000;
LUT2 n3436_s3 (
	.I0(cnt_scan[0]),
	.I1(cnt_scan[1]),
	.F(n3436_7)
);
defparam n3436_s3.INIT=4'h1;
LUT3 n3436_s4 (
	.I0(cnt_scan[0]),
	.I1(cnt_scan[1]),
	.I2(cnt_scan[2]),
	.F(n3436_8)
);
defparam n3436_s4.INIT=8'h78;
LUT2 n3264_s4 (
	.I0(cnt_GCLK[0]),
	.I1(cnt_GCLK[1]),
	.F(n3264_8)
);
defparam n3264_s4.INIT=4'h8;
LUT4 n3262_s4 (
	.I0(cnt_GCLK[0]),
	.I1(cnt_GCLK[1]),
	.I2(cnt_GCLK[2]),
	.I3(cnt_GCLK[3]),
	.F(n3262_8)
);
defparam n3262_s4.INIT=16'h8000;
LUT3 n3261_s4 (
	.I0(cnt_GCLK[4]),
	.I1(n3262_8),
	.I2(cnt_GCLK[5]),
	.F(n3261_8)
);
defparam n3261_s4.INIT=8'h78;
LUT4 n3260_s4 (
	.I0(cnt_GCLK[4]),
	.I1(cnt_GCLK[5]),
	.I2(n3262_8),
	.I3(cnt_GCLK[6]),
	.F(n3260_8)
);
defparam n3260_s4.INIT=16'h7F80;
LUT4 n3259_s4 (
	.I0(cnt_GCLK[4]),
	.I1(cnt_GCLK[5]),
	.I2(cnt_GCLK[6]),
	.I3(n3262_8),
	.F(n3259_8)
);
defparam n3259_s4.INIT=16'h8000;
LUT3 n3258_s4 (
	.I0(cnt_GCLK[7]),
	.I1(n3259_8),
	.I2(cnt_GCLK[8]),
	.F(n3258_8)
);
defparam n3258_s4.INIT=8'h78;
LUT3 n3257_s5 (
	.I0(cnt_GCLK[7]),
	.I1(cnt_GCLK[8]),
	.I2(n3259_8),
	.F(n3257_9)
);
defparam n3257_s5.INIT=8'h80;
LUT4 n25_s3 (
	.I0(cnt_scanwire[12]),
	.I1(cnt_scanwire[11]),
	.I2(n26_7),
	.I3(cnt_scanwire[13]),
	.F(n25_7)
);
defparam n25_s3.INIT=16'h007F;
LUT3 n26_s3 (
	.I0(n26_11),
	.I1(n33_9),
	.I2(n26_9),
	.F(n26_7)
);
defparam n26_s3.INIT=8'h80;
LUT2 n28_s3 (
	.I0(cnt_scanwire[8]),
	.I1(cnt_scanwire[9]),
	.F(n28_7)
);
defparam n28_s3.INIT=4'h8;
LUT3 n28_s4 (
	.I0(cnt_scanwire[6]),
	.I1(cnt_scanwire[7]),
	.I2(n31_7),
	.F(n28_8)
);
defparam n28_s4.INIT=8'h80;
LUT3 n31_s3 (
	.I0(cnt_scanwire[4]),
	.I1(cnt_scanwire[5]),
	.I2(n33_9),
	.F(n31_7)
);
defparam n31_s3.INIT=8'h80;
LUT2 n35_s3 (
	.I0(cnt_scanwire[1]),
	.I1(cnt_scanwire[0]),
	.F(n35_7)
);
defparam n35_s3.INIT=4'h8;
LUT3 n3346_s2 (
	.I0(GCLK_cnt[6]),
	.I1(GCLK_cnt[7]),
	.I2(n3348_6),
	.F(n3346_6)
);
defparam n3346_s2.INIT=8'h80;
LUT3 n3348_s2 (
	.I0(GCLK_cnt[4]),
	.I1(GCLK_cnt[5]),
	.I2(n3350_8),
	.F(n3348_6)
);
defparam n3348_s2.INIT=8'h80;
LUT2 n3352_s2 (
	.I0(GCLK_cnt[0]),
	.I1(GCLK_cnt[1]),
	.F(n3352_6)
);
defparam n3352_s2.INIT=4'h8;
LUT3 SDI_s6 (
	.I0(SDI_9),
	.I1(SDI_10),
	.I2(n2179_14),
	.F(SDI_8)
);
defparam SDI_s6.INIT=8'hD0;
LUT4 n2182_s15 (
	.I0(state_cnt[7]),
	.I1(data96_reg_95_11),
	.I2(le48_reg_47_9),
	.I3(data96_reg_95_15),
	.F(n2182_21)
);
defparam n2182_s15.INIT=16'h1000;
LUT4 n2182_s16 (
	.I0(n2075_17),
	.I1(latch_cnt_6_11),
	.I2(n4557_5),
	.I3(n2182_25),
	.F(n2182_22)
);
defparam n2182_s16.INIT=16'hFE00;
LUT4 n3202_s4 (
	.I0(state_s_id[3]),
	.I1(state_s_id[2]),
	.I2(state_s_id[1]),
	.I3(state_s_id[0]),
	.F(n3202_7)
);
defparam n3202_s4.INIT=16'h0100;
LUT3 n3416_s4 (
	.I0(GCLK_cnt[2]),
	.I1(GCLK_cnt[3]),
	.I2(n3416_13),
	.F(n3416_7)
);
defparam n3416_s4.INIT=8'hE7;
LUT3 n3416_s5 (
	.I0(n3416_14),
	.I1(n3416_15),
	.I2(n3416_16),
	.F(n3416_8)
);
defparam n3416_s5.INIT=8'h40;
LUT2 n3416_s6 (
	.I0(GCLK_cnt[6]),
	.I1(GCLK_cnt[7]),
	.F(n3416_9)
);
defparam n3416_s6.INIT=4'h1;
LUT4 cnt_GCLK_9_s6 (
	.I0(n3416_9),
	.I1(n3463_8),
	.I2(cnt_GCLK_9_12),
	.I3(cnt_GCLK_9_13),
	.F(cnt_GCLK_9_11)
);
defparam cnt_GCLK_9_s6.INIT=16'h8000;
LUT4 data48_reg_47_s7 (
	.I0(n2071_14),
	.I1(n2071_15),
	.I2(n3202_6),
	.I3(n2071_16),
	.F(data48_reg_47_11)
);
defparam data48_reg_47_s7.INIT=16'h7F00;
LUT4 latch_cnt_6_s6 (
	.I0(state_s_id[3]),
	.I1(state_s_id[2]),
	.I2(state_s_id[1]),
	.I3(state_s_id[0]),
	.F(latch_cnt_6_10)
);
defparam latch_cnt_6_s6.INIT=16'h1000;
LUT4 latch_cnt_6_s7 (
	.I0(n2078_20),
	.I1(latch_cnt_6_12),
	.I2(latch_cnt_6_10),
	.I3(n3202_6),
	.F(latch_cnt_6_11)
);
defparam latch_cnt_6_s7.INIT=16'h1000;
LUT3 data96_reg_95_s7 (
	.I0(data96_reg_95_13),
	.I1(state_cnt[4]),
	.I2(n2069_21),
	.F(data96_reg_95_11)
);
defparam data96_reg_95_s7.INIT=8'hE0;
LUT2 n2069_s15 (
	.I0(state_s_id[2]),
	.I1(state_s_id[1]),
	.F(n2069_19)
);
defparam n2069_s15.INIT=4'h1;
LUT2 n2069_s16 (
	.I0(state_m_id[1]),
	.I1(state_m_id[0]),
	.F(n2069_20)
);
defparam n2069_s16.INIT=4'h4;
LUT3 n2069_s17 (
	.I0(state_cnt[7]),
	.I1(state_cnt[6]),
	.I2(state_cnt[5]),
	.F(n2069_21)
);
defparam n2069_s17.INIT=8'h40;
LUT3 n2072_s20 (
	.I0(state_s_id[1]),
	.I1(state_s_id[2]),
	.I2(state_s_id[3]),
	.F(n2072_25)
);
defparam n2072_s20.INIT=8'hE3;
LUT2 n2073_s14 (
	.I0(state_s_id[3]),
	.I1(n2069_18),
	.F(n2073_18)
);
defparam n2073_s14.INIT=4'h4;
LUT3 n2077_s18 (
	.I0(state_cnt[3]),
	.I1(state_cnt[4]),
	.I2(state_cnt[5]),
	.F(n2077_22)
);
defparam n2077_s18.INIT=8'h80;
LUT2 n2078_s16 (
	.I0(state_cnt[3]),
	.I1(state_cnt[4]),
	.F(n2078_20)
);
defparam n2078_s16.INIT=4'h8;
LUT4 n2082_s17 (
	.I0(n2071_14),
	.I1(n2082_23),
	.I2(state_cnt[4]),
	.I3(n3202_6),
	.F(n2082_21)
);
defparam n2082_s17.INIT=16'h4F00;
LUT3 n2082_s18 (
	.I0(n2082_21),
	.I1(data48_reg_47_11),
	.I2(SDI_8),
	.F(n2082_22)
);
defparam n2082_s18.INIT=8'h07;
LUT4 n2121_s11 (
	.I0(state_s_id[2]),
	.I1(state_s_id[1]),
	.I2(state_s_id[0]),
	.I3(state_s_id[3]),
	.F(n2121_15)
);
defparam n2121_s11.INIT=16'hFE15;
LUT4 n2179_s12 (
	.I0(state_cnt[2]),
	.I1(state_cnt[3]),
	.I2(state_cnt[1]),
	.I3(state_cnt[4]),
	.F(n2179_16)
);
defparam n2179_s12.INIT=16'h007F;
LUT4 n2180_s16 (
	.I0(state_cnt[4]),
	.I1(SDI_10),
	.I2(n2180_25),
	.I3(n3202_6),
	.F(n2180_20)
);
defparam n2180_s16.INIT=16'h0100;
LUT2 n2180_s17 (
	.I0(le48_reg[47]),
	.I1(n1450_16),
	.F(n2180_21)
);
defparam n2180_s17.INIT=4'h8;
LUT4 n2180_s18 (
	.I0(state_cnt[7]),
	.I1(data96_reg_95_11),
	.I2(le96_reg[95]),
	.I3(data96_reg_95_15),
	.F(n2180_22)
);
defparam n2180_s18.INIT=16'h1000;
LUT4 n2180_s19 (
	.I0(data96_reg_95_11),
	.I1(n3202_6),
	.I2(n2179_16),
	.I3(state_m_id[0]),
	.F(n2180_23)
);
defparam n2180_s19.INIT=16'hE000;
LUT4 n2180_s20 (
	.I0(SDI_8),
	.I1(n2082_21),
	.I2(LE),
	.I3(n2180_20),
	.F(n2180_24)
);
defparam n2180_s20.INIT=16'h00EF;
LUT4 scan1_wire_d_s1 (
	.I0(scan1_wire_d_7),
	.I1(cnt_scanwire[7]),
	.I2(cnt_scanwire[8]),
	.I3(cnt_scanwire[6]),
	.F(scan1_wire_d_6)
);
defparam scan1_wire_d_s1.INIT=16'h4000;
LUT4 n2089_s12 (
	.I0(state_s_id[0]),
	.I1(state_s_id[2]),
	.I2(state_s_id[3]),
	.I3(state_s_id[1]),
	.F(n2089_17)
);
defparam n2089_s12.INIT=16'h0E03;
LUT3 n1450_s12 (
	.I0(state_cnt[1]),
	.I1(state_cnt[0]),
	.I2(state_cnt[2]),
	.F(n1450_17)
);
defparam n1450_s12.INIT=8'h07;
LUT2 n1450_s13 (
	.I0(state_cnt[6]),
	.I1(state_cnt[7]),
	.F(n1450_18)
);
defparam n1450_s13.INIT=4'h1;
LUT4 n25_s5 (
	.I0(n33_9),
	.I1(n25_10),
	.I2(n26_11),
	.I3(n25_11),
	.F(n25_9)
);
defparam n25_s5.INIT=16'h4F00;
LUT4 n26_s5 (
	.I0(cnt_scanwire[4]),
	.I1(cnt_scanwire[5]),
	.I2(cnt_scanwire[6]),
	.I3(cnt_scanwire[7]),
	.F(n26_9)
);
defparam n26_s5.INIT=16'h8000;
LUT4 n3346_s4 (
	.I0(n3416_16),
	.I1(GCLK_cnt[5]),
	.I2(n3416_9),
	.I3(n3463_8),
	.F(n3346_8)
);
defparam n3346_s4.INIT=16'h4F00;
LUT2 n3463_s4 (
	.I0(GCLK_cnt[8]),
	.I1(GCLK_cnt[9]),
	.F(n3463_8)
);
defparam n3463_s4.INIT=4'h8;
LUT4 n3463_s5 (
	.I0(n3463_10),
	.I1(n3416_16),
	.I2(GCLK_cnt[7]),
	.I3(GCLK_cnt[9]),
	.F(n3463_9)
);
defparam n3463_s5.INIT=16'h7000;
LUT3 SDI_s7 (
	.I0(state_cnt[4]),
	.I1(state_cnt[5]),
	.I2(state_cnt[6]),
	.F(SDI_9)
);
defparam SDI_s7.INIT=8'h80;
LUT4 SDI_s8 (
	.I0(state_cnt[0]),
	.I1(state_cnt[1]),
	.I2(state_cnt[2]),
	.I3(state_cnt[3]),
	.F(SDI_10)
);
defparam SDI_s8.INIT=16'h0001;
LUT3 n3416_s10 (
	.I0(time_flag),
	.I1(GCLK_cnt[0]),
	.I2(GCLK_cnt[1]),
	.F(n3416_13)
);
defparam n3416_s10.INIT=8'h0B;
LUT3 n3416_s11 (
	.I0(GCLK_cnt[0]),
	.I1(GCLK_cnt[1]),
	.I2(GCLK_cnt[2]),
	.F(n3416_14)
);
defparam n3416_s11.INIT=8'h01;
LUT4 n3416_s12 (
	.I0(state_s_id[0]),
	.I1(cnt_GCLK[9]),
	.I2(le48_reg_47_8),
	.I3(le48_reg_47_9),
	.F(n3416_15)
);
defparam n3416_s12.INIT=16'h1000;
LUT3 n3416_s13 (
	.I0(GCLK_cnt[3]),
	.I1(GCLK_cnt[4]),
	.I2(n3416_17),
	.F(n3416_16)
);
defparam n3416_s13.INIT=8'h01;
LUT4 cnt_GCLK_9_s7 (
	.I0(cnt_GCLK[9]),
	.I1(GCLK_cnt[3]),
	.I2(GCLK_cnt[4]),
	.I3(GCLK_cnt[0]),
	.F(cnt_GCLK_9_12)
);
defparam cnt_GCLK_9_s7.INIT=16'h0100;
LUT3 cnt_GCLK_9_s8 (
	.I0(GCLK_cnt[1]),
	.I1(GCLK_cnt[2]),
	.I2(GCLK_cnt[5]),
	.F(cnt_GCLK_9_13)
);
defparam cnt_GCLK_9_s8.INIT=8'h40;
LUT4 latch_cnt_6_s8 (
	.I0(state_cnt[1]),
	.I1(state_cnt[0]),
	.I2(state_cnt[2]),
	.I3(state_cnt[4]),
	.F(latch_cnt_6_12)
);
defparam latch_cnt_6_s8.INIT=16'hE000;
LUT4 data96_reg_95_s9 (
	.I0(state_cnt[1]),
	.I1(state_cnt[2]),
	.I2(state_cnt[0]),
	.I3(state_cnt[3]),
	.F(data96_reg_95_13)
);
defparam data96_reg_95_s9.INIT=16'hFE00;
LUT2 n2082_s19 (
	.I0(state_cnt[2]),
	.I1(state_cnt[3]),
	.F(n2082_23)
);
defparam n2082_s19.INIT=4'h1;
LUT2 n2180_s21 (
	.I0(state_cnt[2]),
	.I1(state_cnt[3]),
	.F(n2180_25)
);
defparam n2180_s21.INIT=4'h8;
LUT4 scan1_wire_d_s2 (
	.I0(cnt_scanwire[4]),
	.I1(cnt_scanwire[5]),
	.I2(n35_7),
	.I3(scan1_wire_d_8),
	.F(scan1_wire_d_7)
);
defparam scan1_wire_d_s2.INIT=16'h0100;
LUT4 n25_s6 (
	.I0(cnt_scanwire[4]),
	.I1(cnt_scanwire[5]),
	.I2(cnt_scanwire[6]),
	.I3(cnt_scanwire[7]),
	.F(n25_10)
);
defparam n25_s6.INIT=16'h0001;
LUT2 n25_s7 (
	.I0(cnt_scanwire[11]),
	.I1(cnt_scanwire[12]),
	.F(n25_11)
);
defparam n25_s7.INIT=4'h1;
LUT2 n3463_s6 (
	.I0(GCLK_cnt[5]),
	.I1(GCLK_cnt[6]),
	.F(n3463_10)
);
defparam n3463_s6.INIT=4'h1;
LUT3 n3416_s14 (
	.I0(GCLK_cnt[1]),
	.I1(GCLK_cnt[0]),
	.I2(GCLK_cnt[2]),
	.F(n3416_17)
);
defparam n3416_s14.INIT=8'hE0;
LUT2 scan1_wire_d_s3 (
	.I0(cnt_scanwire[2]),
	.I1(cnt_scanwire[3]),
	.F(scan1_wire_d_8)
);
defparam scan1_wire_d_s3.INIT=4'h1;
LUT4 n2073_s15 (
	.I0(state_s_id[2]),
	.I1(state_s_id[1]),
	.I2(state_s_id[0]),
	.I3(n2073_18),
	.F(n2073_20)
);
defparam n2073_s15.INIT=16'h6A00;
LUT4 n2072_s21 (
	.I0(state_s_id[1]),
	.I1(state_s_id[0]),
	.I2(state_s_id[3]),
	.I3(n2072_25),
	.F(n2072_27)
);
defparam n2072_s21.INIT=16'h00F8;
LUT4 n2077_s19 (
	.I0(state_cnt[3]),
	.I1(state_cnt[4]),
	.I2(state_cnt[5]),
	.I3(n2080_20),
	.F(n2077_24)
);
defparam n2077_s19.INIT=16'h8000;
LUT3 n2078_s17 (
	.I0(state_cnt[3]),
	.I1(state_cnt[4]),
	.I2(n2080_20),
	.F(n2078_22)
);
defparam n2078_s17.INIT=8'h80;
LUT3 n26_s6 (
	.I0(cnt_scanwire[10]),
	.I1(cnt_scanwire[8]),
	.I2(cnt_scanwire[9]),
	.F(n26_11)
);
defparam n26_s6.INIT=8'h80;
LUT4 n3263_s5 (
	.I0(cnt_GCLK[2]),
	.I1(cnt_GCLK[0]),
	.I2(cnt_GCLK[1]),
	.I3(cnt_GCLK[3]),
	.F(n3263_10)
);
defparam n3263_s5.INIT=16'h7F80;
LUT4 n3466_s3 (
	.I0(cnt_scan[2]),
	.I1(cnt_scan[0]),
	.I2(cnt_scan[1]),
	.I3(n3463_14),
	.F(n3466_8)
);
defparam n3466_s3.INIT=16'hFDFF;
LUT4 data96_reg_95_s10 (
	.I0(state_s_id[0]),
	.I1(state_s_id[1]),
	.I2(state_s_id[3]),
	.I3(state_s_id[2]),
	.F(data96_reg_95_15)
);
defparam data96_reg_95_s10.INIT=16'h0004;
LUT3 n2077_s20 (
	.I0(state_m_id[0]),
	.I1(state_m_id[1]),
	.I2(n2095_14),
	.F(n2077_26)
);
defparam n2077_s20.INIT=8'h0E;
LUT4 n2165_s11 (
	.I0(state_s_id[0]),
	.I1(n2069_19),
	.I2(state_s_id[3]),
	.I3(n2069_18),
	.F(n2165_16)
);
defparam n2165_s11.INIT=16'h0600;
LUT4 n2167_s10 (
	.I0(n2099_16),
	.I1(data48_reg[5]),
	.I2(n2121_15),
	.I3(n2069_18),
	.F(n2167_15)
);
defparam n2167_s10.INIT=16'h8F88;
LUT4 n2125_s10 (
	.I0(n2099_16),
	.I1(data48_reg[26]),
	.I2(n2121_15),
	.I3(n2069_18),
	.F(n2125_15)
);
defparam n2125_s10.INIT=16'h8F88;
LUT4 n2121_s12 (
	.I0(n2099_16),
	.I1(data48_reg[28]),
	.I2(n2121_15),
	.I3(n2069_18),
	.F(n2121_17)
);
defparam n2121_s12.INIT=16'h8F88;
LUT4 n2099_s11 (
	.I0(SDI_8),
	.I1(state_cnt[5]),
	.I2(state_cnt[6]),
	.I3(n2179_16),
	.F(n2099_16)
);
defparam n2099_s11.INIT=16'hA82A;
LUT4 n3350_s3 (
	.I0(GCLK_cnt[2]),
	.I1(GCLK_cnt[3]),
	.I2(GCLK_cnt[0]),
	.I3(GCLK_cnt[1]),
	.F(n3350_8)
);
defparam n3350_s3.INIT=16'h8000;
LUT4 n3353_s2 (
	.I0(GCLK_cnt[2]),
	.I1(GCLK_cnt[0]),
	.I2(GCLK_cnt[1]),
	.I3(n3346_10),
	.F(n3353_7)
);
defparam n3353_s2.INIT=16'h6A00;
LUT4 n2129_s13 (
	.I0(n2071_13),
	.I1(state_s_id[0]),
	.I2(n2072_25),
	.I3(n2069_18),
	.F(n2129_19)
);
defparam n2129_s13.INIT=16'h5455;
LUT4 n2159_s10 (
	.I0(n2099_16),
	.I1(data48_reg[9]),
	.I2(n3202_7),
	.I3(n2069_18),
	.F(n2159_15)
);
defparam n2159_s10.INIT=16'hF888;
LUT4 n2153_s10 (
	.I0(n2099_16),
	.I1(data48_reg[12]),
	.I2(n3202_7),
	.I3(n2069_18),
	.F(n2153_15)
);
defparam n2153_s10.INIT=16'hF888;
LUT4 n2137_s11 (
	.I0(n2099_16),
	.I1(data48_reg[20]),
	.I2(n3202_7),
	.I3(n2069_18),
	.F(n2137_16)
);
defparam n2137_s11.INIT=16'hF888;
LUT4 n33_s4 (
	.I0(cnt_scanwire[2]),
	.I1(cnt_scanwire[3]),
	.I2(cnt_scanwire[1]),
	.I3(cnt_scanwire[0]),
	.F(n33_9)
);
defparam n33_s4.INIT=16'h8000;
LUT4 n36_s3 (
	.I0(cnt_scanwire[2]),
	.I1(cnt_scanwire[1]),
	.I2(cnt_scanwire[0]),
	.I3(n25_15),
	.F(n36_8)
);
defparam n36_s3.INIT=16'h6A00;
LUT4 cnt_GCLK_9_s9 (
	.I0(n3202_9),
	.I1(GCLK_rr),
	.I2(GCLK_r),
	.I3(cnt_GCLK_9_19),
	.F(cnt_GCLK_9_15)
);
defparam cnt_GCLK_9_s9.INIT=16'hFFBA;
LUT3 n2091_s13 (
	.I0(state_s_id[3]),
	.I1(state_s_id[2]),
	.I2(state_s_id[1]),
	.F(n2091_19)
);
defparam n2091_s13.INIT=8'hA9;
LUT4 n2139_s11 (
	.I0(state_s_id[3]),
	.I1(state_s_id[2]),
	.I2(state_s_id[1]),
	.I3(state_s_id[0]),
	.F(n2139_16)
);
defparam n2139_s11.INIT=16'h0157;
LUT3 n2069_s18 (
	.I0(state_s_id[2]),
	.I1(state_s_id[1]),
	.I2(state_s_id[3]),
	.F(n2069_23)
);
defparam n2069_s18.INIT=8'hE0;
LUT3 n2081_s17 (
	.I0(state_cnt[0]),
	.I1(state_cnt[1]),
	.I2(n2082_21),
	.F(n2081_22)
);
defparam n2081_s17.INIT=8'h80;
LUT4 n2074_s16 (
	.I0(n2182_21),
	.I1(data48_reg_47_11),
	.I2(n2095_14),
	.I3(state_s_id[1]),
	.F(n2074_21)
);
defparam n2074_s16.INIT=16'hFE00;
LUT4 n2073_s16 (
	.I0(data48_reg_47_11),
	.I1(n2095_14),
	.I2(state_s_id[2]),
	.I3(n2073_20),
	.F(n2073_22)
);
defparam n2073_s16.INIT=16'hFFE0;
LUT4 n2080_s18 (
	.I0(state_cnt[0]),
	.I1(state_cnt[1]),
	.I2(state_cnt[2]),
	.I3(n2082_21),
	.F(n2080_23)
);
defparam n2080_s18.INIT=16'h8000;
LUT4 n2079_s18 (
	.I0(state_cnt[3]),
	.I1(state_cnt[0]),
	.I2(state_cnt[1]),
	.I3(state_cnt[2]),
	.F(n2079_23)
);
defparam n2079_s18.INIT=16'h8000;
LUT4 n2079_s19 (
	.I0(SDI_9),
	.I1(SDI_10),
	.I2(n2179_14),
	.I3(n2095_14),
	.F(n2079_25)
);
defparam n2079_s19.INIT=16'h2F00;
LUT3 LE_s5 (
	.I0(rst_n),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.F(LE_8)
);
defparam LE_s5.INIT=8'h2A;
LUT3 n2182_s18 (
	.I0(SDI),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.F(n2182_25)
);
defparam n2182_s18.INIT=8'h20;
LUT4 n2075_s17 (
	.I0(latch_cnt_6_11),
	.I1(n1450_16),
	.I2(state_m_id[0]),
	.I3(state_m_id[1]),
	.F(n2075_22)
);
defparam n2075_s17.INIT=16'h0E00;
LUT3 n3202_s5 (
	.I0(state_m_id[0]),
	.I1(state_m_id[1]),
	.I2(n3202_7),
	.F(n3202_9)
);
defparam n3202_s5.INIT=8'h40;
LUT3 n4557_s4 (
	.I0(frame_p),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.F(n4557_8)
);
defparam n4557_s4.INIT=8'h20;
LUT4 SDI_s9 (
	.I0(SDI_8),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.I3(rst_n),
	.F(SDI_12)
);
defparam SDI_s9.INIT=16'hBA00;
LUT3 n2054_s9 (
	.I0(state_m_id[0]),
	.I1(state_m_id[1]),
	.I2(data96_reg_95_10),
	.F(n2054_14)
);
defparam n2054_s9.INIT=8'h40;
LUT4 latch_cnt_6_s9 (
	.I0(latch_cnt_6_9),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.I3(rst_n),
	.F(latch_cnt_6_14)
);
defparam latch_cnt_6_s9.INIT=16'h2000;
LUT4 n2052_s9 (
	.I0(le96_reg[0]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2052_14)
);
defparam n2052_s9.INIT=16'h0200;
LUT4 n2050_s9 (
	.I0(le96_reg[1]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2050_14)
);
defparam n2050_s9.INIT=16'h0200;
LUT4 n2048_s9 (
	.I0(le96_reg[2]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2048_14)
);
defparam n2048_s9.INIT=16'h0200;
LUT4 n2046_s9 (
	.I0(le96_reg[3]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2046_14)
);
defparam n2046_s9.INIT=16'h0200;
LUT4 n2044_s9 (
	.I0(le96_reg[4]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2044_14)
);
defparam n2044_s9.INIT=16'h0200;
LUT4 n2042_s9 (
	.I0(le96_reg[5]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2042_14)
);
defparam n2042_s9.INIT=16'h0200;
LUT4 n2040_s9 (
	.I0(le96_reg[6]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2040_14)
);
defparam n2040_s9.INIT=16'h0200;
LUT4 n2038_s9 (
	.I0(le96_reg[7]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2038_14)
);
defparam n2038_s9.INIT=16'h0200;
LUT4 n2036_s9 (
	.I0(le96_reg[8]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2036_14)
);
defparam n2036_s9.INIT=16'h0200;
LUT4 n2034_s9 (
	.I0(le96_reg[9]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2034_14)
);
defparam n2034_s9.INIT=16'h0200;
LUT4 n2032_s9 (
	.I0(le96_reg[10]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2032_14)
);
defparam n2032_s9.INIT=16'h0200;
LUT4 n2030_s9 (
	.I0(le96_reg[11]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2030_14)
);
defparam n2030_s9.INIT=16'h0200;
LUT4 n2028_s9 (
	.I0(le96_reg[12]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2028_14)
);
defparam n2028_s9.INIT=16'h0200;
LUT4 n2026_s9 (
	.I0(le96_reg[13]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2026_14)
);
defparam n2026_s9.INIT=16'h0200;
LUT4 n2024_s9 (
	.I0(le96_reg[14]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2024_14)
);
defparam n2024_s9.INIT=16'h0200;
LUT4 n2022_s9 (
	.I0(le96_reg[15]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2022_14)
);
defparam n2022_s9.INIT=16'h0200;
LUT4 n2020_s9 (
	.I0(le96_reg[16]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2020_14)
);
defparam n2020_s9.INIT=16'h0200;
LUT4 n2018_s9 (
	.I0(le96_reg[17]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2018_14)
);
defparam n2018_s9.INIT=16'h0200;
LUT4 n2016_s9 (
	.I0(le96_reg[18]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2016_14)
);
defparam n2016_s9.INIT=16'h0200;
LUT4 n2014_s9 (
	.I0(le96_reg[19]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2014_14)
);
defparam n2014_s9.INIT=16'h0200;
LUT4 n2012_s9 (
	.I0(le96_reg[20]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2012_14)
);
defparam n2012_s9.INIT=16'h0200;
LUT4 n2010_s9 (
	.I0(le96_reg[21]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2010_14)
);
defparam n2010_s9.INIT=16'h0200;
LUT4 n2008_s9 (
	.I0(le96_reg[22]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2008_14)
);
defparam n2008_s9.INIT=16'h0200;
LUT4 n2006_s9 (
	.I0(le96_reg[23]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2006_14)
);
defparam n2006_s9.INIT=16'h0200;
LUT4 n2004_s9 (
	.I0(le96_reg[24]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2004_14)
);
defparam n2004_s9.INIT=16'h0200;
LUT4 n2002_s9 (
	.I0(le96_reg[25]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2002_14)
);
defparam n2002_s9.INIT=16'h0200;
LUT4 n2000_s9 (
	.I0(le96_reg[26]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n2000_14)
);
defparam n2000_s9.INIT=16'h0200;
LUT4 n1998_s9 (
	.I0(le96_reg[27]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1998_14)
);
defparam n1998_s9.INIT=16'h0200;
LUT4 n1996_s9 (
	.I0(le96_reg[28]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1996_14)
);
defparam n1996_s9.INIT=16'h0200;
LUT4 n1994_s9 (
	.I0(le96_reg[29]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1994_14)
);
defparam n1994_s9.INIT=16'h0200;
LUT4 n1992_s9 (
	.I0(le96_reg[30]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1992_14)
);
defparam n1992_s9.INIT=16'h0200;
LUT4 n1990_s9 (
	.I0(le96_reg[31]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1990_14)
);
defparam n1990_s9.INIT=16'h0200;
LUT4 n1988_s9 (
	.I0(le96_reg[32]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1988_14)
);
defparam n1988_s9.INIT=16'h0200;
LUT4 n1986_s9 (
	.I0(le96_reg[33]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1986_14)
);
defparam n1986_s9.INIT=16'h0200;
LUT4 n1984_s9 (
	.I0(le96_reg[34]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1984_14)
);
defparam n1984_s9.INIT=16'h0200;
LUT4 n1982_s9 (
	.I0(le96_reg[35]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1982_14)
);
defparam n1982_s9.INIT=16'h0200;
LUT4 n1980_s9 (
	.I0(le96_reg[36]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1980_14)
);
defparam n1980_s9.INIT=16'h0200;
LUT4 n1978_s9 (
	.I0(le96_reg[37]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1978_14)
);
defparam n1978_s9.INIT=16'h0200;
LUT4 n1976_s9 (
	.I0(le96_reg[38]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1976_14)
);
defparam n1976_s9.INIT=16'h0200;
LUT4 n1974_s9 (
	.I0(le96_reg[39]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1974_14)
);
defparam n1974_s9.INIT=16'h0200;
LUT4 n1972_s9 (
	.I0(le96_reg[40]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1972_14)
);
defparam n1972_s9.INIT=16'h0200;
LUT4 n1970_s9 (
	.I0(le96_reg[41]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1970_14)
);
defparam n1970_s9.INIT=16'h0200;
LUT4 n1968_s9 (
	.I0(le96_reg[42]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1968_14)
);
defparam n1968_s9.INIT=16'h0200;
LUT4 n1966_s9 (
	.I0(le96_reg[43]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1966_14)
);
defparam n1966_s9.INIT=16'h0200;
LUT4 n1964_s9 (
	.I0(le96_reg[44]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1964_14)
);
defparam n1964_s9.INIT=16'h0200;
LUT4 n1962_s9 (
	.I0(le96_reg[45]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1962_14)
);
defparam n1962_s9.INIT=16'h0200;
LUT4 n1960_s9 (
	.I0(le96_reg[46]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1960_14)
);
defparam n1960_s9.INIT=16'h0200;
LUT4 n1958_s9 (
	.I0(le96_reg[47]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1958_14)
);
defparam n1958_s9.INIT=16'h0200;
LUT4 n1956_s9 (
	.I0(le96_reg[48]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1956_14)
);
defparam n1956_s9.INIT=16'h0200;
LUT4 n1954_s9 (
	.I0(le96_reg[49]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1954_14)
);
defparam n1954_s9.INIT=16'h0200;
LUT4 n1952_s9 (
	.I0(le96_reg[50]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1952_14)
);
defparam n1952_s9.INIT=16'h0200;
LUT4 n1950_s9 (
	.I0(le96_reg[51]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1950_14)
);
defparam n1950_s9.INIT=16'h0200;
LUT4 n1948_s9 (
	.I0(le96_reg[52]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1948_14)
);
defparam n1948_s9.INIT=16'h0200;
LUT4 n1946_s9 (
	.I0(le96_reg[53]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1946_14)
);
defparam n1946_s9.INIT=16'h0200;
LUT4 n1944_s9 (
	.I0(le96_reg[54]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1944_14)
);
defparam n1944_s9.INIT=16'h0200;
LUT4 n1942_s9 (
	.I0(le96_reg[55]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1942_14)
);
defparam n1942_s9.INIT=16'h0200;
LUT4 n1940_s9 (
	.I0(le96_reg[56]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1940_14)
);
defparam n1940_s9.INIT=16'h0200;
LUT4 n1938_s9 (
	.I0(le96_reg[57]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1938_14)
);
defparam n1938_s9.INIT=16'h0200;
LUT4 n1936_s9 (
	.I0(le96_reg[58]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1936_14)
);
defparam n1936_s9.INIT=16'h0200;
LUT4 n1934_s9 (
	.I0(le96_reg[59]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1934_14)
);
defparam n1934_s9.INIT=16'h0200;
LUT4 n1932_s9 (
	.I0(le96_reg[60]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1932_14)
);
defparam n1932_s9.INIT=16'h0200;
LUT4 n1930_s9 (
	.I0(le96_reg[61]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1930_14)
);
defparam n1930_s9.INIT=16'h0200;
LUT4 n1928_s9 (
	.I0(le96_reg[62]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1928_14)
);
defparam n1928_s9.INIT=16'h0200;
LUT4 n1926_s9 (
	.I0(le96_reg[63]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1926_14)
);
defparam n1926_s9.INIT=16'h0200;
LUT4 n1924_s9 (
	.I0(le96_reg[64]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1924_14)
);
defparam n1924_s9.INIT=16'h0200;
LUT4 n1922_s9 (
	.I0(le96_reg[65]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1922_14)
);
defparam n1922_s9.INIT=16'h0200;
LUT4 n1920_s9 (
	.I0(le96_reg[66]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1920_14)
);
defparam n1920_s9.INIT=16'h0200;
LUT4 n1918_s9 (
	.I0(le96_reg[67]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1918_14)
);
defparam n1918_s9.INIT=16'h0200;
LUT4 n1916_s9 (
	.I0(le96_reg[68]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1916_14)
);
defparam n1916_s9.INIT=16'h0200;
LUT4 n1914_s9 (
	.I0(le96_reg[69]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1914_14)
);
defparam n1914_s9.INIT=16'h0200;
LUT4 n1912_s9 (
	.I0(le96_reg[70]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1912_14)
);
defparam n1912_s9.INIT=16'h0200;
LUT4 n1910_s9 (
	.I0(le96_reg[71]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1910_14)
);
defparam n1910_s9.INIT=16'h0200;
LUT4 n1908_s9 (
	.I0(le96_reg[72]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1908_14)
);
defparam n1908_s9.INIT=16'h0200;
LUT4 n1906_s9 (
	.I0(le96_reg[73]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1906_14)
);
defparam n1906_s9.INIT=16'h0200;
LUT4 n1904_s9 (
	.I0(le96_reg[74]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1904_14)
);
defparam n1904_s9.INIT=16'h0200;
LUT4 n1902_s9 (
	.I0(le96_reg[75]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1902_14)
);
defparam n1902_s9.INIT=16'h0200;
LUT4 n1900_s9 (
	.I0(le96_reg[76]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1900_14)
);
defparam n1900_s9.INIT=16'h0200;
LUT4 n1898_s9 (
	.I0(le96_reg[77]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1898_14)
);
defparam n1898_s9.INIT=16'h0200;
LUT4 n1896_s9 (
	.I0(le96_reg[78]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1896_14)
);
defparam n1896_s9.INIT=16'h0200;
LUT4 n1894_s9 (
	.I0(le96_reg[79]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1894_14)
);
defparam n1894_s9.INIT=16'h0200;
LUT4 n1892_s9 (
	.I0(le96_reg[80]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1892_14)
);
defparam n1892_s9.INIT=16'h0200;
LUT4 n1890_s9 (
	.I0(le96_reg[81]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1890_14)
);
defparam n1890_s9.INIT=16'h0200;
LUT4 n1888_s9 (
	.I0(le96_reg[82]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1888_14)
);
defparam n1888_s9.INIT=16'h0200;
LUT4 n1886_s9 (
	.I0(le96_reg[83]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1886_14)
);
defparam n1886_s9.INIT=16'h0200;
LUT4 n1884_s9 (
	.I0(le96_reg[84]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1884_14)
);
defparam n1884_s9.INIT=16'h0200;
LUT4 n1882_s9 (
	.I0(le96_reg[85]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1882_14)
);
defparam n1882_s9.INIT=16'h0200;
LUT4 n1880_s9 (
	.I0(le96_reg[86]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1880_14)
);
defparam n1880_s9.INIT=16'h0200;
LUT4 n1878_s9 (
	.I0(le96_reg[87]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1878_14)
);
defparam n1878_s9.INIT=16'h0200;
LUT4 n1876_s9 (
	.I0(le96_reg[88]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1876_14)
);
defparam n1876_s9.INIT=16'h0200;
LUT4 n1874_s9 (
	.I0(le96_reg[89]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1874_14)
);
defparam n1874_s9.INIT=16'h0200;
LUT4 n1872_s9 (
	.I0(le96_reg[90]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1872_14)
);
defparam n1872_s9.INIT=16'h0200;
LUT4 n1870_s9 (
	.I0(le96_reg[91]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1870_14)
);
defparam n1870_s9.INIT=16'h0200;
LUT4 n1868_s9 (
	.I0(le96_reg[92]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1868_14)
);
defparam n1868_s9.INIT=16'h0200;
LUT4 n1866_s9 (
	.I0(le96_reg[93]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1866_14)
);
defparam n1866_s9.INIT=16'h0200;
LUT4 n1864_s9 (
	.I0(le96_reg[94]),
	.I1(state_cnt[7]),
	.I2(data96_reg_95_11),
	.I3(data96_reg_95_15),
	.F(n1864_14)
);
defparam n1864_s9.INIT=16'h0200;
LUT4 n3435_s4 (
	.I0(cnt_scan[0]),
	.I1(GCLK_rr),
	.I2(GCLK_r),
	.I3(cnt_GCLK[9]),
	.F(n3435_13)
);
defparam n3435_s4.INIT=16'h109A;
LUT3 cnt_scan_0_s5 (
	.I0(GCLK_rr),
	.I1(GCLK_r),
	.I2(cnt_GCLK[9]),
	.F(cnt_scan_0_13)
);
defparam cnt_scan_0_s5.INIT=8'hF4;
LUT3 n2076_s16 (
	.I0(state_cnt[7]),
	.I1(state_m_id[1]),
	.I2(state_m_id[0]),
	.F(n2076_21)
);
defparam n2076_s16.INIT=8'hA2;
LUT2 n2072_s22 (
	.I0(state_m_id[1]),
	.I1(state_m_id[0]),
	.F(n2072_29)
);
defparam n2072_s22.INIT=4'h7;
LUT3 scan1_wire_d_s4 (
	.I0(cnt_scanwire[12]),
	.I1(cnt_scanwire[13]),
	.I2(scan1_wire_d_5),
	.F(scan1_wire)
);
defparam scan1_wire_d_s4.INIT=8'hFE;
LUT2 n25_s9 (
	.I0(cnt_scanwire[13]),
	.I1(n25_9),
	.F(n25_15)
);
defparam n25_s9.INIT=4'hD;
LUT3 n38_s4 (
	.I0(cnt_scanwire[13]),
	.I1(n25_9),
	.I2(cnt_scanwire[0]),
	.F(n38_10)
);
defparam n38_s4.INIT=8'h0D;
LUT3 n25_s10 (
	.I0(cnt_scanwire[13]),
	.I1(n25_9),
	.I2(n25_7),
	.F(n25_17)
);
defparam n25_s10.INIT=8'h0D;
LUT3 n3416_s16 (
	.I0(GCLK_cnt[5]),
	.I1(n3416_4),
	.I2(n3416_26),
	.F(n3416_22)
);
defparam n3416_s16.INIT=8'h10;
LUT3 n3346_s5 (
	.I0(n4557_8),
	.I1(n3346_8),
	.I2(GCLK_flag),
	.F(n3346_10)
);
defparam n3346_s5.INIT=8'h10;
LUT4 cnt_GCLK_9_s11 (
	.I0(cnt_GCLK[7]),
	.I1(cnt_GCLK[8]),
	.I2(n3259_8),
	.I3(cnt_GCLK_9_11),
	.F(cnt_GCLK_9_19)
);
defparam cnt_GCLK_9_s11.INIT=16'h8000;
LUT4 n2069_s19 (
	.I0(state_s_id[2]),
	.I1(state_s_id[1]),
	.I2(state_s_id[3]),
	.I3(n2069_18),
	.F(n2069_25)
);
defparam n2069_s19.INIT=16'hE000;
LUT4 n3416_s18 (
	.I0(GCLK_cnt[6]),
	.I1(GCLK_cnt[7]),
	.I2(GCLK_cnt[8]),
	.I3(GCLK_cnt[9]),
	.F(n3416_26)
);
defparam n3416_s18.INIT=16'h0001;
LUT4 n3463_s8 (
	.I0(n3416_26),
	.I1(GCLK_cnt[8]),
	.I2(GCLK_cnt[9]),
	.I3(n3463_9),
	.F(n3463_14)
);
defparam n3463_s8.INIT=16'h0015;
LUT4 n4557_s5 (
	.I0(n4557_5),
	.I1(frame_p),
	.I2(state_m_id[0]),
	.I3(state_m_id[1]),
	.F(n4557_10)
);
defparam n4557_s5.INIT=16'h0800;
LUT4 GCLK_flag_s4 (
	.I0(frame_p),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.I3(n3202_3),
	.F(GCLK_flag_10)
);
defparam GCLK_flag_s4.INIT=16'hFF20;
LUT4 n3355_s3 (
	.I0(GCLK_cnt[0]),
	.I1(n4557_8),
	.I2(n3346_8),
	.I3(GCLK_flag),
	.F(n3355_8)
);
defparam n3355_s3.INIT=16'h0100;
LUT4 n27_s3 (
	.I0(cnt_scanwire[11]),
	.I1(n26_7),
	.I2(cnt_scanwire[13]),
	.I3(n25_9),
	.F(n27_8)
);
defparam n27_s3.INIT=16'h6606;
LUT4 n30_s3 (
	.I0(cnt_scanwire[8]),
	.I1(n28_8),
	.I2(cnt_scanwire[13]),
	.I3(n25_9),
	.F(n30_8)
);
defparam n30_s3.INIT=16'h6606;
LUT4 n32_s3 (
	.I0(cnt_scanwire[6]),
	.I1(n31_7),
	.I2(cnt_scanwire[13]),
	.I3(n25_9),
	.F(n32_8)
);
defparam n32_s3.INIT=16'h6606;
LUT4 n34_s3 (
	.I0(cnt_scanwire[4]),
	.I1(n33_9),
	.I2(cnt_scanwire[13]),
	.I3(n25_9),
	.F(n34_8)
);
defparam n34_s3.INIT=16'h6606;
LUT4 n37_s3 (
	.I0(cnt_scanwire[1]),
	.I1(cnt_scanwire[0]),
	.I2(cnt_scanwire[13]),
	.I3(n25_9),
	.F(n37_8)
);
defparam n37_s3.INIT=16'h6606;
LUT4 n1670_s9 (
	.I0(latch_cnt[0]),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.I3(data96_reg_95_10),
	.F(n1670_14)
);
defparam n1670_s9.INIT=16'h1000;
LUT4 n1862_s9 (
	.I0(rgb_data[0]),
	.I1(state_m_id[0]),
	.I2(state_m_id[1]),
	.I3(data96_reg_95_10),
	.F(n1862_14)
);
defparam n1862_s9.INIT=16'h2000;
DFFC cnt_scanwire_13_s0 (
	.D(n25_17),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[13])
);
defparam cnt_scanwire_13_s0.INIT=1'b0;
DFFC cnt_scanwire_12_s0 (
	.D(n26_6),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[12])
);
defparam cnt_scanwire_12_s0.INIT=1'b0;
DFFC cnt_scanwire_11_s0 (
	.D(n27_8),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[11])
);
defparam cnt_scanwire_11_s0.INIT=1'b0;
DFFC cnt_scanwire_10_s0 (
	.D(n28_6),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[10])
);
defparam cnt_scanwire_10_s0.INIT=1'b0;
DFFC cnt_scanwire_9_s0 (
	.D(n29_6),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[9])
);
defparam cnt_scanwire_9_s0.INIT=1'b0;
DFFC cnt_scanwire_8_s0 (
	.D(n30_8),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[8])
);
defparam cnt_scanwire_8_s0.INIT=1'b0;
DFFC cnt_scanwire_7_s0 (
	.D(n31_6),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[7])
);
defparam cnt_scanwire_7_s0.INIT=1'b0;
DFFC cnt_scanwire_6_s0 (
	.D(n32_8),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[6])
);
defparam cnt_scanwire_6_s0.INIT=1'b0;
DFFC cnt_scanwire_5_s0 (
	.D(n33_6),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[5])
);
defparam cnt_scanwire_5_s0.INIT=1'b0;
DFFC cnt_scanwire_4_s0 (
	.D(n34_8),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[4])
);
defparam cnt_scanwire_4_s0.INIT=1'b0;
DFFC cnt_scanwire_3_s0 (
	.D(n35_6),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[3])
);
defparam cnt_scanwire_3_s0.INIT=1'b0;
DFFC cnt_scanwire_2_s0 (
	.D(n36_8),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[2])
);
defparam cnt_scanwire_2_s0.INIT=1'b0;
DFFC cnt_scanwire_1_s0 (
	.D(n37_8),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[1])
);
defparam cnt_scanwire_1_s0.INIT=1'b0;
DFFC cnt_scanwire_0_s0 (
	.D(n38_10),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scanwire[0])
);
defparam cnt_scanwire_0_s0.INIT=1'b0;
DFFC DCLK_s2 (
	.D(n60_6),
	.CLK(n56_6),
	.CLEAR(n79_6),
	.Q(DCLK)
);
defparam DCLK_s2.INIT=1'b0;
DFFC frame_r_s0 (
	.D(frame_f),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(frame_r)
);
defparam frame_r_s0.INIT=1'b0;
DFFC frame_rr_s0 (
	.D(frame_r),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(frame_rr)
);
defparam frame_rr_s0.INIT=1'b0;
DFFC frame_p_s0 (
	.D(n66_4),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(frame_p)
);
defparam frame_p_s0.INIT=1'b0;
DFFC rgb_r_s0 (
	.D(rgb_f),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(rgb_r)
);
defparam rgb_r_s0.INIT=1'b0;
DFFC rgb_rr_s0 (
	.D(rgb_r),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(rgb_rr)
);
defparam rgb_rr_s0.INIT=1'b0;
DFFC rgb_p_s0 (
	.D(n68_3),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(rgb_p)
);
defparam rgb_p_s0.INIT=1'b0;
DFFE rgb_rrr_s0 (
	.D(rgb_rr),
	.CLK(clock),
	.CE(rst_n),
	.Q(rgb_rrr)
);
defparam rgb_rrr_s0.INIT=1'b0;
DFFCE time_flag_s0 (
	.D(DCLK),
	.CLK(clock),
	.CE(n4557_10),
	.CLEAR(n79_6),
	.Q(time_flag)
);
defparam time_flag_s0.INIT=1'b0;
DFFE data48_reg_47_s0 (
	.D(n2085_16),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[47])
);
defparam data48_reg_47_s0.INIT=1'b0;
DFFE data48_reg_46_s0 (
	.D(n2087_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[46])
);
defparam data48_reg_46_s0.INIT=1'b0;
DFFE data48_reg_45_s0 (
	.D(n2089_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[45])
);
defparam data48_reg_45_s0.INIT=1'b0;
DFFE data48_reg_44_s0 (
	.D(n2091_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[44])
);
defparam data48_reg_44_s0.INIT=1'b0;
DFFE data48_reg_43_s0 (
	.D(n2093_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[43])
);
defparam data48_reg_43_s0.INIT=1'b0;
DFFE data48_reg_42_s0 (
	.D(n2095_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[42])
);
defparam data48_reg_42_s0.INIT=1'b0;
DFFE data48_reg_41_s0 (
	.D(n2097_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[41])
);
defparam data48_reg_41_s0.INIT=1'b0;
DFFE data48_reg_40_s0 (
	.D(n2099_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[40])
);
defparam data48_reg_40_s0.INIT=1'b0;
DFFE data48_reg_39_s0 (
	.D(n2101_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[39])
);
defparam data48_reg_39_s0.INIT=1'b0;
DFFE data48_reg_38_s0 (
	.D(n2103_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[38])
);
defparam data48_reg_38_s0.INIT=1'b0;
DFFE data48_reg_37_s0 (
	.D(n2105_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[37])
);
defparam data48_reg_37_s0.INIT=1'b0;
DFFE data48_reg_36_s0 (
	.D(n2107_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[36])
);
defparam data48_reg_36_s0.INIT=1'b0;
DFFE data48_reg_35_s0 (
	.D(n2109_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[35])
);
defparam data48_reg_35_s0.INIT=1'b0;
DFFE data48_reg_34_s0 (
	.D(n2111_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[34])
);
defparam data48_reg_34_s0.INIT=1'b0;
DFFE data48_reg_33_s0 (
	.D(n2113_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[33])
);
defparam data48_reg_33_s0.INIT=1'b0;
DFFE data48_reg_32_s0 (
	.D(n2115_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[32])
);
defparam data48_reg_32_s0.INIT=1'b0;
DFFE data48_reg_31_s0 (
	.D(n2117_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[31])
);
defparam data48_reg_31_s0.INIT=1'b0;
DFFE data48_reg_30_s0 (
	.D(n2119_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[30])
);
defparam data48_reg_30_s0.INIT=1'b0;
DFFE data48_reg_29_s0 (
	.D(n2121_17),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[29])
);
defparam data48_reg_29_s0.INIT=1'b0;
DFFE data48_reg_28_s0 (
	.D(n2123_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[28])
);
defparam data48_reg_28_s0.INIT=1'b0;
DFFE data48_reg_27_s0 (
	.D(n2125_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[27])
);
defparam data48_reg_27_s0.INIT=1'b0;
DFFE data48_reg_26_s0 (
	.D(n2127_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[26])
);
defparam data48_reg_26_s0.INIT=1'b0;
DFFE data48_reg_25_s0 (
	.D(n2129_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[25])
);
defparam data48_reg_25_s0.INIT=1'b0;
DFFE data48_reg_24_s0 (
	.D(n2131_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[24])
);
defparam data48_reg_24_s0.INIT=1'b0;
DFFE data48_reg_23_s0 (
	.D(n2133_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[23])
);
defparam data48_reg_23_s0.INIT=1'b0;
DFFE data48_reg_22_s0 (
	.D(n2135_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[22])
);
defparam data48_reg_22_s0.INIT=1'b0;
DFFE data48_reg_21_s0 (
	.D(n2137_16),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[21])
);
defparam data48_reg_21_s0.INIT=1'b0;
DFFE data48_reg_20_s0 (
	.D(n2139_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[20])
);
defparam data48_reg_20_s0.INIT=1'b0;
DFFE data48_reg_19_s0 (
	.D(n2141_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[19])
);
defparam data48_reg_19_s0.INIT=1'b0;
DFFE data48_reg_18_s0 (
	.D(n2143_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[18])
);
defparam data48_reg_18_s0.INIT=1'b0;
DFFE data48_reg_17_s0 (
	.D(n2145_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[17])
);
defparam data48_reg_17_s0.INIT=1'b0;
DFFE data48_reg_16_s0 (
	.D(n2147_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[16])
);
defparam data48_reg_16_s0.INIT=1'b0;
DFFE data48_reg_15_s0 (
	.D(n2149_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[15])
);
defparam data48_reg_15_s0.INIT=1'b0;
DFFE data48_reg_14_s0 (
	.D(n2151_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[14])
);
defparam data48_reg_14_s0.INIT=1'b0;
DFFE data48_reg_13_s0 (
	.D(n2153_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[13])
);
defparam data48_reg_13_s0.INIT=1'b0;
DFFE data48_reg_12_s0 (
	.D(n2155_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[12])
);
defparam data48_reg_12_s0.INIT=1'b0;
DFFE data48_reg_11_s0 (
	.D(n2157_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[11])
);
defparam data48_reg_11_s0.INIT=1'b0;
DFFE data48_reg_10_s0 (
	.D(n2159_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[10])
);
defparam data48_reg_10_s0.INIT=1'b0;
DFFE data48_reg_9_s0 (
	.D(n2161_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[9])
);
defparam data48_reg_9_s0.INIT=1'b0;
DFFE data48_reg_8_s0 (
	.D(n2163_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[8])
);
defparam data48_reg_8_s0.INIT=1'b0;
DFFE data48_reg_7_s0 (
	.D(n2165_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[7])
);
defparam data48_reg_7_s0.INIT=1'b0;
DFFE data48_reg_6_s0 (
	.D(n2167_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[6])
);
defparam data48_reg_6_s0.INIT=1'b0;
DFFE data48_reg_5_s0 (
	.D(n2169_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[5])
);
defparam data48_reg_5_s0.INIT=1'b0;
DFFE data48_reg_4_s0 (
	.D(n2171_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[4])
);
defparam data48_reg_4_s0.INIT=1'b0;
DFFE data48_reg_3_s0 (
	.D(n2173_15),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[3])
);
defparam data48_reg_3_s0.INIT=1'b0;
DFFE data48_reg_2_s0 (
	.D(n2175_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[2])
);
defparam data48_reg_2_s0.INIT=1'b0;
DFFE data48_reg_1_s0 (
	.D(n2177_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[1])
);
defparam data48_reg_1_s0.INIT=1'b0;
DFFE data48_reg_0_s0 (
	.D(n2179_13),
	.CLK(clock),
	.CE(data48_reg_47_8),
	.Q(data48_reg[0])
);
defparam data48_reg_0_s0.INIT=1'b0;
DFFE LE_s2 (
	.D(n2180_16),
	.CLK(clock),
	.CE(LE_8),
	.Q(LE)
);
defparam LE_s2.INIT=1'b0;
DFFE SDI_s2 (
	.D(n2182_20),
	.CLK(clock),
	.CE(SDI_12),
	.Q(SDI)
);
defparam SDI_s2.INIT=1'b0;
DFFE le48_reg_47_s0 (
	.D(n1448_12),
	.CLK(clock),
	.CE(le48_reg_47_7),
	.Q(le48_reg[47])
);
defparam le48_reg_47_s0.INIT=1'b0;
DFFE le48_reg_46_s0 (
	.D(n1450_15),
	.CLK(clock),
	.CE(le48_reg_46_8),
	.Q(le48_reg[46])
);
defparam le48_reg_46_s0.INIT=1'b0;
DFFE le48_reg_45_s0 (
	.D(n1452_14),
	.CLK(clock),
	.CE(le48_reg_46_8),
	.Q(le48_reg[45])
);
defparam le48_reg_45_s0.INIT=1'b0;
DFFE le48_reg_44_s0 (
	.D(n1454_12),
	.CLK(clock),
	.CE(le48_reg_46_8),
	.Q(le48_reg[44])
);
defparam le48_reg_44_s0.INIT=1'b0;
DFFE latch_cnt_6_s0 (
	.D(n1658_12),
	.CLK(clock),
	.CE(latch_cnt_6_14),
	.Q(latch_cnt[6])
);
defparam latch_cnt_6_s0.INIT=1'b0;
DFFE latch_cnt_5_s0 (
	.D(n1660_12),
	.CLK(clock),
	.CE(latch_cnt_6_14),
	.Q(latch_cnt[5])
);
defparam latch_cnt_5_s0.INIT=1'b0;
DFFE latch_cnt_4_s0 (
	.D(n1662_12),
	.CLK(clock),
	.CE(latch_cnt_6_14),
	.Q(latch_cnt[4])
);
defparam latch_cnt_4_s0.INIT=1'b0;
DFFE latch_cnt_3_s0 (
	.D(n1664_12),
	.CLK(clock),
	.CE(latch_cnt_6_14),
	.Q(latch_cnt[3])
);
defparam latch_cnt_3_s0.INIT=1'b0;
DFFE latch_cnt_2_s0 (
	.D(n1666_12),
	.CLK(clock),
	.CE(latch_cnt_6_14),
	.Q(latch_cnt[2])
);
defparam latch_cnt_2_s0.INIT=1'b0;
DFFE latch_cnt_1_s0 (
	.D(n1668_12),
	.CLK(clock),
	.CE(latch_cnt_6_14),
	.Q(latch_cnt[1])
);
defparam latch_cnt_1_s0.INIT=1'b0;
DFFE latch_cnt_0_s0 (
	.D(n1670_14),
	.CLK(clock),
	.CE(latch_cnt_6_14),
	.Q(latch_cnt[0])
);
defparam latch_cnt_0_s0.INIT=1'b0;
DFFE data96_reg_95_s0 (
	.D(n1672_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[95])
);
defparam data96_reg_95_s0.INIT=1'b0;
DFFE data96_reg_94_s0 (
	.D(n1674_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[94])
);
defparam data96_reg_94_s0.INIT=1'b0;
DFFE data96_reg_93_s0 (
	.D(n1676_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[93])
);
defparam data96_reg_93_s0.INIT=1'b0;
DFFE data96_reg_92_s0 (
	.D(n1678_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[92])
);
defparam data96_reg_92_s0.INIT=1'b0;
DFFE data96_reg_91_s0 (
	.D(n1680_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[91])
);
defparam data96_reg_91_s0.INIT=1'b0;
DFFE data96_reg_90_s0 (
	.D(n1682_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[90])
);
defparam data96_reg_90_s0.INIT=1'b0;
DFFE data96_reg_89_s0 (
	.D(n1684_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[89])
);
defparam data96_reg_89_s0.INIT=1'b0;
DFFE data96_reg_88_s0 (
	.D(n1686_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[88])
);
defparam data96_reg_88_s0.INIT=1'b0;
DFFE data96_reg_87_s0 (
	.D(n1688_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[87])
);
defparam data96_reg_87_s0.INIT=1'b0;
DFFE data96_reg_86_s0 (
	.D(n1690_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[86])
);
defparam data96_reg_86_s0.INIT=1'b0;
DFFE data96_reg_85_s0 (
	.D(n1692_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[85])
);
defparam data96_reg_85_s0.INIT=1'b0;
DFFE data96_reg_84_s0 (
	.D(n1694_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[84])
);
defparam data96_reg_84_s0.INIT=1'b0;
DFFE data96_reg_83_s0 (
	.D(n1696_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[83])
);
defparam data96_reg_83_s0.INIT=1'b0;
DFFE data96_reg_82_s0 (
	.D(n1698_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[82])
);
defparam data96_reg_82_s0.INIT=1'b0;
DFFE data96_reg_81_s0 (
	.D(n1700_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[81])
);
defparam data96_reg_81_s0.INIT=1'b0;
DFFE data96_reg_80_s0 (
	.D(n1702_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[80])
);
defparam data96_reg_80_s0.INIT=1'b0;
DFFE data96_reg_79_s0 (
	.D(n1704_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[79])
);
defparam data96_reg_79_s0.INIT=1'b0;
DFFE data96_reg_78_s0 (
	.D(n1706_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[78])
);
defparam data96_reg_78_s0.INIT=1'b0;
DFFE data96_reg_77_s0 (
	.D(n1708_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[77])
);
defparam data96_reg_77_s0.INIT=1'b0;
DFFE data96_reg_76_s0 (
	.D(n1710_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[76])
);
defparam data96_reg_76_s0.INIT=1'b0;
DFFE data96_reg_75_s0 (
	.D(n1712_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[75])
);
defparam data96_reg_75_s0.INIT=1'b0;
DFFE data96_reg_74_s0 (
	.D(n1714_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[74])
);
defparam data96_reg_74_s0.INIT=1'b0;
DFFE data96_reg_73_s0 (
	.D(n1716_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[73])
);
defparam data96_reg_73_s0.INIT=1'b0;
DFFE data96_reg_72_s0 (
	.D(n1718_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[72])
);
defparam data96_reg_72_s0.INIT=1'b0;
DFFE data96_reg_71_s0 (
	.D(n1720_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[71])
);
defparam data96_reg_71_s0.INIT=1'b0;
DFFE data96_reg_70_s0 (
	.D(n1722_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[70])
);
defparam data96_reg_70_s0.INIT=1'b0;
DFFE data96_reg_69_s0 (
	.D(n1724_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[69])
);
defparam data96_reg_69_s0.INIT=1'b0;
DFFE data96_reg_68_s0 (
	.D(n1726_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[68])
);
defparam data96_reg_68_s0.INIT=1'b0;
DFFE data96_reg_67_s0 (
	.D(n1728_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[67])
);
defparam data96_reg_67_s0.INIT=1'b0;
DFFE data96_reg_66_s0 (
	.D(n1730_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[66])
);
defparam data96_reg_66_s0.INIT=1'b0;
DFFE data96_reg_65_s0 (
	.D(n1732_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[65])
);
defparam data96_reg_65_s0.INIT=1'b0;
DFFE data96_reg_64_s0 (
	.D(n1734_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[64])
);
defparam data96_reg_64_s0.INIT=1'b0;
DFFE data96_reg_63_s0 (
	.D(n1736_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[63])
);
defparam data96_reg_63_s0.INIT=1'b0;
DFFE data96_reg_62_s0 (
	.D(n1738_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[62])
);
defparam data96_reg_62_s0.INIT=1'b0;
DFFE data96_reg_61_s0 (
	.D(n1740_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[61])
);
defparam data96_reg_61_s0.INIT=1'b0;
DFFE data96_reg_60_s0 (
	.D(n1742_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[60])
);
defparam data96_reg_60_s0.INIT=1'b0;
DFFE data96_reg_59_s0 (
	.D(n1744_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[59])
);
defparam data96_reg_59_s0.INIT=1'b0;
DFFE data96_reg_58_s0 (
	.D(n1746_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[58])
);
defparam data96_reg_58_s0.INIT=1'b0;
DFFE data96_reg_57_s0 (
	.D(n1748_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[57])
);
defparam data96_reg_57_s0.INIT=1'b0;
DFFE data96_reg_56_s0 (
	.D(n1750_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[56])
);
defparam data96_reg_56_s0.INIT=1'b0;
DFFE data96_reg_55_s0 (
	.D(n1752_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[55])
);
defparam data96_reg_55_s0.INIT=1'b0;
DFFE data96_reg_54_s0 (
	.D(n1754_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[54])
);
defparam data96_reg_54_s0.INIT=1'b0;
DFFE data96_reg_53_s0 (
	.D(n1756_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[53])
);
defparam data96_reg_53_s0.INIT=1'b0;
DFFE data96_reg_52_s0 (
	.D(n1758_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[52])
);
defparam data96_reg_52_s0.INIT=1'b0;
DFFE data96_reg_51_s0 (
	.D(n1760_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[51])
);
defparam data96_reg_51_s0.INIT=1'b0;
DFFE data96_reg_50_s0 (
	.D(n1762_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[50])
);
defparam data96_reg_50_s0.INIT=1'b0;
DFFE data96_reg_49_s0 (
	.D(n1764_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[49])
);
defparam data96_reg_49_s0.INIT=1'b0;
DFFE data96_reg_48_s0 (
	.D(n1766_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[48])
);
defparam data96_reg_48_s0.INIT=1'b0;
DFFE data96_reg_47_s0 (
	.D(n1768_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[47])
);
defparam data96_reg_47_s0.INIT=1'b0;
DFFE data96_reg_46_s0 (
	.D(n1770_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[46])
);
defparam data96_reg_46_s0.INIT=1'b0;
DFFE data96_reg_45_s0 (
	.D(n1772_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[45])
);
defparam data96_reg_45_s0.INIT=1'b0;
DFFE data96_reg_44_s0 (
	.D(n1774_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[44])
);
defparam data96_reg_44_s0.INIT=1'b0;
DFFE data96_reg_43_s0 (
	.D(n1776_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[43])
);
defparam data96_reg_43_s0.INIT=1'b0;
DFFE data96_reg_42_s0 (
	.D(n1778_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[42])
);
defparam data96_reg_42_s0.INIT=1'b0;
DFFE data96_reg_41_s0 (
	.D(n1780_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[41])
);
defparam data96_reg_41_s0.INIT=1'b0;
DFFE data96_reg_40_s0 (
	.D(n1782_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[40])
);
defparam data96_reg_40_s0.INIT=1'b0;
DFFE data96_reg_39_s0 (
	.D(n1784_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[39])
);
defparam data96_reg_39_s0.INIT=1'b0;
DFFE data96_reg_38_s0 (
	.D(n1786_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[38])
);
defparam data96_reg_38_s0.INIT=1'b0;
DFFE data96_reg_37_s0 (
	.D(n1788_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[37])
);
defparam data96_reg_37_s0.INIT=1'b0;
DFFE data96_reg_36_s0 (
	.D(n1790_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[36])
);
defparam data96_reg_36_s0.INIT=1'b0;
DFFE data96_reg_35_s0 (
	.D(n1792_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[35])
);
defparam data96_reg_35_s0.INIT=1'b0;
DFFE data96_reg_34_s0 (
	.D(n1794_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[34])
);
defparam data96_reg_34_s0.INIT=1'b0;
DFFE data96_reg_33_s0 (
	.D(n1796_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[33])
);
defparam data96_reg_33_s0.INIT=1'b0;
DFFE data96_reg_32_s0 (
	.D(n1798_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[32])
);
defparam data96_reg_32_s0.INIT=1'b0;
DFFE data96_reg_31_s0 (
	.D(n1800_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[31])
);
defparam data96_reg_31_s0.INIT=1'b0;
DFFE data96_reg_30_s0 (
	.D(n1802_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[30])
);
defparam data96_reg_30_s0.INIT=1'b0;
DFFE data96_reg_29_s0 (
	.D(n1804_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[29])
);
defparam data96_reg_29_s0.INIT=1'b0;
DFFE data96_reg_28_s0 (
	.D(n1806_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[28])
);
defparam data96_reg_28_s0.INIT=1'b0;
DFFE data96_reg_27_s0 (
	.D(n1808_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[27])
);
defparam data96_reg_27_s0.INIT=1'b0;
DFFE data96_reg_26_s0 (
	.D(n1810_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[26])
);
defparam data96_reg_26_s0.INIT=1'b0;
DFFE data96_reg_25_s0 (
	.D(n1812_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[25])
);
defparam data96_reg_25_s0.INIT=1'b0;
DFFE data96_reg_24_s0 (
	.D(n1814_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[24])
);
defparam data96_reg_24_s0.INIT=1'b0;
DFFE data96_reg_23_s0 (
	.D(n1816_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[23])
);
defparam data96_reg_23_s0.INIT=1'b0;
DFFE data96_reg_22_s0 (
	.D(n1818_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[22])
);
defparam data96_reg_22_s0.INIT=1'b0;
DFFE data96_reg_21_s0 (
	.D(n1820_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[21])
);
defparam data96_reg_21_s0.INIT=1'b0;
DFFE data96_reg_20_s0 (
	.D(n1822_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[20])
);
defparam data96_reg_20_s0.INIT=1'b0;
DFFE data96_reg_19_s0 (
	.D(n1824_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[19])
);
defparam data96_reg_19_s0.INIT=1'b0;
DFFE data96_reg_18_s0 (
	.D(n1826_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[18])
);
defparam data96_reg_18_s0.INIT=1'b0;
DFFE data96_reg_17_s0 (
	.D(n1828_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[17])
);
defparam data96_reg_17_s0.INIT=1'b0;
DFFE data96_reg_16_s0 (
	.D(n1830_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[16])
);
defparam data96_reg_16_s0.INIT=1'b0;
DFFE data96_reg_15_s0 (
	.D(n1832_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[15])
);
defparam data96_reg_15_s0.INIT=1'b0;
DFFE data96_reg_14_s0 (
	.D(n1834_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[14])
);
defparam data96_reg_14_s0.INIT=1'b0;
DFFE data96_reg_13_s0 (
	.D(n1836_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[13])
);
defparam data96_reg_13_s0.INIT=1'b0;
DFFE data96_reg_12_s0 (
	.D(n1838_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[12])
);
defparam data96_reg_12_s0.INIT=1'b0;
DFFE data96_reg_11_s0 (
	.D(n1840_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[11])
);
defparam data96_reg_11_s0.INIT=1'b0;
DFFE data96_reg_10_s0 (
	.D(n1842_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[10])
);
defparam data96_reg_10_s0.INIT=1'b0;
DFFE data96_reg_9_s0 (
	.D(n1844_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[9])
);
defparam data96_reg_9_s0.INIT=1'b0;
DFFE data96_reg_8_s0 (
	.D(n1846_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[8])
);
defparam data96_reg_8_s0.INIT=1'b0;
DFFE data96_reg_7_s0 (
	.D(n1848_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[7])
);
defparam data96_reg_7_s0.INIT=1'b0;
DFFE data96_reg_6_s0 (
	.D(n1850_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[6])
);
defparam data96_reg_6_s0.INIT=1'b0;
DFFE data96_reg_5_s0 (
	.D(n1852_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[5])
);
defparam data96_reg_5_s0.INIT=1'b0;
DFFE data96_reg_4_s0 (
	.D(n1854_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[4])
);
defparam data96_reg_4_s0.INIT=1'b0;
DFFE data96_reg_3_s0 (
	.D(n1856_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[3])
);
defparam data96_reg_3_s0.INIT=1'b0;
DFFE data96_reg_2_s0 (
	.D(n1858_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[2])
);
defparam data96_reg_2_s0.INIT=1'b0;
DFFE data96_reg_1_s0 (
	.D(n1860_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[1])
);
defparam data96_reg_1_s0.INIT=1'b0;
DFFE data96_reg_0_s0 (
	.D(n1862_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(data96_reg[0])
);
defparam data96_reg_0_s0.INIT=1'b0;
DFFE le96_reg_95_s0 (
	.D(n1864_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[95])
);
defparam le96_reg_95_s0.INIT=1'b0;
DFFE le96_reg_94_s0 (
	.D(n1866_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[94])
);
defparam le96_reg_94_s0.INIT=1'b0;
DFFE le96_reg_93_s0 (
	.D(n1868_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[93])
);
defparam le96_reg_93_s0.INIT=1'b0;
DFFE le96_reg_92_s0 (
	.D(n1870_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[92])
);
defparam le96_reg_92_s0.INIT=1'b0;
DFFE le96_reg_91_s0 (
	.D(n1872_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[91])
);
defparam le96_reg_91_s0.INIT=1'b0;
DFFE le96_reg_90_s0 (
	.D(n1874_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[90])
);
defparam le96_reg_90_s0.INIT=1'b0;
DFFE le96_reg_89_s0 (
	.D(n1876_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[89])
);
defparam le96_reg_89_s0.INIT=1'b0;
DFFE le96_reg_88_s0 (
	.D(n1878_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[88])
);
defparam le96_reg_88_s0.INIT=1'b0;
DFFE le96_reg_87_s0 (
	.D(n1880_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[87])
);
defparam le96_reg_87_s0.INIT=1'b0;
DFFE le96_reg_86_s0 (
	.D(n1882_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[86])
);
defparam le96_reg_86_s0.INIT=1'b0;
DFFE le96_reg_85_s0 (
	.D(n1884_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[85])
);
defparam le96_reg_85_s0.INIT=1'b0;
DFFE le96_reg_84_s0 (
	.D(n1886_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[84])
);
defparam le96_reg_84_s0.INIT=1'b0;
DFFE le96_reg_83_s0 (
	.D(n1888_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[83])
);
defparam le96_reg_83_s0.INIT=1'b0;
DFFE le96_reg_82_s0 (
	.D(n1890_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[82])
);
defparam le96_reg_82_s0.INIT=1'b0;
DFFE le96_reg_81_s0 (
	.D(n1892_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[81])
);
defparam le96_reg_81_s0.INIT=1'b0;
DFFE le96_reg_80_s0 (
	.D(n1894_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[80])
);
defparam le96_reg_80_s0.INIT=1'b0;
DFFE le96_reg_79_s0 (
	.D(n1896_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[79])
);
defparam le96_reg_79_s0.INIT=1'b0;
DFFE le96_reg_78_s0 (
	.D(n1898_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[78])
);
defparam le96_reg_78_s0.INIT=1'b0;
DFFE le96_reg_77_s0 (
	.D(n1900_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[77])
);
defparam le96_reg_77_s0.INIT=1'b0;
DFFE le96_reg_76_s0 (
	.D(n1902_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[76])
);
defparam le96_reg_76_s0.INIT=1'b0;
DFFE le96_reg_75_s0 (
	.D(n1904_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[75])
);
defparam le96_reg_75_s0.INIT=1'b0;
DFFE le96_reg_74_s0 (
	.D(n1906_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[74])
);
defparam le96_reg_74_s0.INIT=1'b0;
DFFE le96_reg_73_s0 (
	.D(n1908_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[73])
);
defparam le96_reg_73_s0.INIT=1'b0;
DFFE le96_reg_72_s0 (
	.D(n1910_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[72])
);
defparam le96_reg_72_s0.INIT=1'b0;
DFFE le96_reg_71_s0 (
	.D(n1912_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[71])
);
defparam le96_reg_71_s0.INIT=1'b0;
DFFE le96_reg_70_s0 (
	.D(n1914_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[70])
);
defparam le96_reg_70_s0.INIT=1'b0;
DFFE le96_reg_69_s0 (
	.D(n1916_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[69])
);
defparam le96_reg_69_s0.INIT=1'b0;
DFFE le96_reg_68_s0 (
	.D(n1918_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[68])
);
defparam le96_reg_68_s0.INIT=1'b0;
DFFE le96_reg_67_s0 (
	.D(n1920_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[67])
);
defparam le96_reg_67_s0.INIT=1'b0;
DFFE le96_reg_66_s0 (
	.D(n1922_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[66])
);
defparam le96_reg_66_s0.INIT=1'b0;
DFFE le96_reg_65_s0 (
	.D(n1924_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[65])
);
defparam le96_reg_65_s0.INIT=1'b0;
DFFE le96_reg_64_s0 (
	.D(n1926_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[64])
);
defparam le96_reg_64_s0.INIT=1'b0;
DFFE le96_reg_63_s0 (
	.D(n1928_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[63])
);
defparam le96_reg_63_s0.INIT=1'b0;
DFFE le96_reg_62_s0 (
	.D(n1930_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[62])
);
defparam le96_reg_62_s0.INIT=1'b0;
DFFE le96_reg_61_s0 (
	.D(n1932_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[61])
);
defparam le96_reg_61_s0.INIT=1'b0;
DFFE le96_reg_60_s0 (
	.D(n1934_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[60])
);
defparam le96_reg_60_s0.INIT=1'b0;
DFFE le96_reg_59_s0 (
	.D(n1936_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[59])
);
defparam le96_reg_59_s0.INIT=1'b0;
DFFE le96_reg_58_s0 (
	.D(n1938_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[58])
);
defparam le96_reg_58_s0.INIT=1'b0;
DFFE le96_reg_57_s0 (
	.D(n1940_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[57])
);
defparam le96_reg_57_s0.INIT=1'b0;
DFFE le96_reg_56_s0 (
	.D(n1942_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[56])
);
defparam le96_reg_56_s0.INIT=1'b0;
DFFE le96_reg_55_s0 (
	.D(n1944_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[55])
);
defparam le96_reg_55_s0.INIT=1'b0;
DFFE le96_reg_54_s0 (
	.D(n1946_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[54])
);
defparam le96_reg_54_s0.INIT=1'b0;
DFFE le96_reg_53_s0 (
	.D(n1948_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[53])
);
defparam le96_reg_53_s0.INIT=1'b0;
DFFE le96_reg_52_s0 (
	.D(n1950_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[52])
);
defparam le96_reg_52_s0.INIT=1'b0;
DFFE le96_reg_51_s0 (
	.D(n1952_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[51])
);
defparam le96_reg_51_s0.INIT=1'b0;
DFFE le96_reg_50_s0 (
	.D(n1954_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[50])
);
defparam le96_reg_50_s0.INIT=1'b0;
DFFE le96_reg_49_s0 (
	.D(n1956_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[49])
);
defparam le96_reg_49_s0.INIT=1'b0;
DFFE le96_reg_48_s0 (
	.D(n1958_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[48])
);
defparam le96_reg_48_s0.INIT=1'b0;
DFFE le96_reg_47_s0 (
	.D(n1960_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[47])
);
defparam le96_reg_47_s0.INIT=1'b0;
DFFE le96_reg_46_s0 (
	.D(n1962_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[46])
);
defparam le96_reg_46_s0.INIT=1'b0;
DFFE le96_reg_45_s0 (
	.D(n1964_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[45])
);
defparam le96_reg_45_s0.INIT=1'b0;
DFFE le96_reg_44_s0 (
	.D(n1966_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[44])
);
defparam le96_reg_44_s0.INIT=1'b0;
DFFE le96_reg_43_s0 (
	.D(n1968_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[43])
);
defparam le96_reg_43_s0.INIT=1'b0;
DFFE le96_reg_42_s0 (
	.D(n1970_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[42])
);
defparam le96_reg_42_s0.INIT=1'b0;
DFFE le96_reg_41_s0 (
	.D(n1972_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[41])
);
defparam le96_reg_41_s0.INIT=1'b0;
DFFE le96_reg_40_s0 (
	.D(n1974_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[40])
);
defparam le96_reg_40_s0.INIT=1'b0;
DFFE le96_reg_39_s0 (
	.D(n1976_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[39])
);
defparam le96_reg_39_s0.INIT=1'b0;
DFFE le96_reg_38_s0 (
	.D(n1978_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[38])
);
defparam le96_reg_38_s0.INIT=1'b0;
DFFE le96_reg_37_s0 (
	.D(n1980_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[37])
);
defparam le96_reg_37_s0.INIT=1'b0;
DFFE le96_reg_36_s0 (
	.D(n1982_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[36])
);
defparam le96_reg_36_s0.INIT=1'b0;
DFFE le96_reg_35_s0 (
	.D(n1984_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[35])
);
defparam le96_reg_35_s0.INIT=1'b0;
DFFE le96_reg_34_s0 (
	.D(n1986_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[34])
);
defparam le96_reg_34_s0.INIT=1'b0;
DFFE le96_reg_33_s0 (
	.D(n1988_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[33])
);
defparam le96_reg_33_s0.INIT=1'b0;
DFFE le96_reg_32_s0 (
	.D(n1990_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[32])
);
defparam le96_reg_32_s0.INIT=1'b0;
DFFE le96_reg_31_s0 (
	.D(n1992_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[31])
);
defparam le96_reg_31_s0.INIT=1'b0;
DFFE le96_reg_30_s0 (
	.D(n1994_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[30])
);
defparam le96_reg_30_s0.INIT=1'b0;
DFFE le96_reg_29_s0 (
	.D(n1996_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[29])
);
defparam le96_reg_29_s0.INIT=1'b0;
DFFE le96_reg_28_s0 (
	.D(n1998_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[28])
);
defparam le96_reg_28_s0.INIT=1'b0;
DFFE le96_reg_27_s0 (
	.D(n2000_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[27])
);
defparam le96_reg_27_s0.INIT=1'b0;
DFFE le96_reg_26_s0 (
	.D(n2002_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[26])
);
defparam le96_reg_26_s0.INIT=1'b0;
DFFE le96_reg_25_s0 (
	.D(n2004_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[25])
);
defparam le96_reg_25_s0.INIT=1'b0;
DFFE le96_reg_24_s0 (
	.D(n2006_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[24])
);
defparam le96_reg_24_s0.INIT=1'b0;
DFFE le96_reg_23_s0 (
	.D(n2008_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[23])
);
defparam le96_reg_23_s0.INIT=1'b0;
DFFE le96_reg_22_s0 (
	.D(n2010_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[22])
);
defparam le96_reg_22_s0.INIT=1'b0;
DFFE le96_reg_21_s0 (
	.D(n2012_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[21])
);
defparam le96_reg_21_s0.INIT=1'b0;
DFFE le96_reg_20_s0 (
	.D(n2014_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[20])
);
defparam le96_reg_20_s0.INIT=1'b0;
DFFE le96_reg_19_s0 (
	.D(n2016_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[19])
);
defparam le96_reg_19_s0.INIT=1'b0;
DFFE le96_reg_18_s0 (
	.D(n2018_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[18])
);
defparam le96_reg_18_s0.INIT=1'b0;
DFFE le96_reg_17_s0 (
	.D(n2020_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[17])
);
defparam le96_reg_17_s0.INIT=1'b0;
DFFE le96_reg_16_s0 (
	.D(n2022_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[16])
);
defparam le96_reg_16_s0.INIT=1'b0;
DFFE le96_reg_15_s0 (
	.D(n2024_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[15])
);
defparam le96_reg_15_s0.INIT=1'b0;
DFFE le96_reg_14_s0 (
	.D(n2026_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[14])
);
defparam le96_reg_14_s0.INIT=1'b0;
DFFE le96_reg_13_s0 (
	.D(n2028_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[13])
);
defparam le96_reg_13_s0.INIT=1'b0;
DFFE le96_reg_12_s0 (
	.D(n2030_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[12])
);
defparam le96_reg_12_s0.INIT=1'b0;
DFFE le96_reg_11_s0 (
	.D(n2032_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[11])
);
defparam le96_reg_11_s0.INIT=1'b0;
DFFE le96_reg_10_s0 (
	.D(n2034_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[10])
);
defparam le96_reg_10_s0.INIT=1'b0;
DFFE le96_reg_9_s0 (
	.D(n2036_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[9])
);
defparam le96_reg_9_s0.INIT=1'b0;
DFFE le96_reg_8_s0 (
	.D(n2038_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[8])
);
defparam le96_reg_8_s0.INIT=1'b0;
DFFE le96_reg_7_s0 (
	.D(n2040_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[7])
);
defparam le96_reg_7_s0.INIT=1'b0;
DFFE le96_reg_6_s0 (
	.D(n2042_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[6])
);
defparam le96_reg_6_s0.INIT=1'b0;
DFFE le96_reg_5_s0 (
	.D(n2044_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[5])
);
defparam le96_reg_5_s0.INIT=1'b0;
DFFE le96_reg_4_s0 (
	.D(n2046_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[4])
);
defparam le96_reg_4_s0.INIT=1'b0;
DFFE le96_reg_3_s0 (
	.D(n2048_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[3])
);
defparam le96_reg_3_s0.INIT=1'b0;
DFFE le96_reg_2_s0 (
	.D(n2050_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[2])
);
defparam le96_reg_2_s0.INIT=1'b0;
DFFE le96_reg_1_s0 (
	.D(n2052_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[1])
);
defparam le96_reg_1_s0.INIT=1'b0;
DFFE le96_reg_0_s0 (
	.D(n2054_14),
	.CLK(clock),
	.CE(data96_reg_95_8),
	.Q(le96_reg[0])
);
defparam le96_reg_0_s0.INIT=1'b0;
DFFC GCLK_r_s0 (
	.D(GCLK),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_r)
);
defparam GCLK_r_s0.INIT=1'b0;
DFFC GCLK_rr_s0 (
	.D(GCLK_r),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_rr)
);
defparam GCLK_rr_s0.INIT=1'b0;
DFFC GCLK_cnt_9_s0 (
	.D(n3346_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[9])
);
defparam GCLK_cnt_9_s0.INIT=1'b0;
DFFC GCLK_cnt_8_s0 (
	.D(n3347_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[8])
);
defparam GCLK_cnt_8_s0.INIT=1'b0;
DFFC GCLK_cnt_7_s0 (
	.D(n3348_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[7])
);
defparam GCLK_cnt_7_s0.INIT=1'b0;
DFFC GCLK_cnt_6_s0 (
	.D(n3349_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[6])
);
defparam GCLK_cnt_6_s0.INIT=1'b0;
DFFC GCLK_cnt_5_s0 (
	.D(n3350_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[5])
);
defparam GCLK_cnt_5_s0.INIT=1'b0;
DFFC GCLK_cnt_4_s0 (
	.D(n3351_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[4])
);
defparam GCLK_cnt_4_s0.INIT=1'b0;
DFFC GCLK_cnt_3_s0 (
	.D(n3352_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[3])
);
defparam GCLK_cnt_3_s0.INIT=1'b0;
DFFC GCLK_cnt_2_s0 (
	.D(n3353_7),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[2])
);
defparam GCLK_cnt_2_s0.INIT=1'b0;
DFFC GCLK_cnt_1_s0 (
	.D(n3354_5),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[1])
);
defparam GCLK_cnt_1_s0.INIT=1'b0;
DFFC GCLK_cnt_0_s0 (
	.D(n3355_8),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK_cnt[0])
);
defparam GCLK_cnt_0_s0.INIT=1'b0;
DFFC GCLK_s2 (
	.D(n3416_22),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(GCLK)
);
defparam GCLK_s2.INIT=1'b0;
DFFP scan2_s2 (
	.D(n3464_6),
	.CLK(clock),
	.PRESET(n79_6),
	.Q(scan2)
);
defparam scan2_s2.INIT=1'b1;
DFFP scan3_s2 (
	.D(n3465_6),
	.CLK(clock),
	.PRESET(n79_6),
	.Q(scan3)
);
defparam scan3_s2.INIT=1'b1;
DFFP scan4_s2 (
	.D(n3466_8),
	.CLK(clock),
	.PRESET(n79_6),
	.Q(scan4)
);
defparam scan4_s2.INIT=1'b1;
DFFP scan1_s2 (
	.D(n3463_6),
	.CLK(clock),
	.PRESET(n79_6),
	.Q(scan1)
);
defparam scan1_s2.INIT=1'b1;
DFFCE GCLK_flag_s1 (
	.D(n3202_3),
	.CLK(clock),
	.CE(GCLK_flag_10),
	.CLEAR(n79_6),
	.Q(GCLK_flag)
);
defparam GCLK_flag_s1.INIT=1'b0;
DFFCE cnt_GCLK_9_s1 (
	.D(n3257_8),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[9])
);
defparam cnt_GCLK_9_s1.INIT=1'b0;
DFFCE cnt_GCLK_8_s1 (
	.D(n3258_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[8])
);
defparam cnt_GCLK_8_s1.INIT=1'b0;
DFFCE cnt_GCLK_7_s1 (
	.D(n3259_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[7])
);
defparam cnt_GCLK_7_s1.INIT=1'b0;
DFFCE cnt_GCLK_6_s1 (
	.D(n3260_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[6])
);
defparam cnt_GCLK_6_s1.INIT=1'b0;
DFFCE cnt_GCLK_5_s1 (
	.D(n3261_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[5])
);
defparam cnt_GCLK_5_s1.INIT=1'b0;
DFFCE cnt_GCLK_4_s1 (
	.D(n3262_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[4])
);
defparam cnt_GCLK_4_s1.INIT=1'b0;
DFFCE cnt_GCLK_3_s1 (
	.D(n3263_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[3])
);
defparam cnt_GCLK_3_s1.INIT=1'b0;
DFFCE cnt_GCLK_2_s1 (
	.D(n3264_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[2])
);
defparam cnt_GCLK_2_s1.INIT=1'b0;
DFFCE cnt_GCLK_1_s1 (
	.D(n3265_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[1])
);
defparam cnt_GCLK_1_s1.INIT=1'b0;
DFFCE cnt_GCLK_0_s1 (
	.D(n3266_7),
	.CLK(clock),
	.CE(cnt_GCLK_9_15),
	.CLEAR(n79_6),
	.Q(cnt_GCLK[0])
);
defparam cnt_GCLK_0_s1.INIT=1'b0;
DFFCE cnt_scan_2_s1 (
	.D(n3436_6),
	.CLK(clock),
	.CE(cnt_scan_0_13),
	.CLEAR(n79_6),
	.Q(cnt_scan[2])
);
defparam cnt_scan_2_s1.INIT=1'b0;
DFFCE cnt_scan_1_s1 (
	.D(n3437_6),
	.CLK(clock),
	.CE(cnt_scan_0_13),
	.CLEAR(n79_6),
	.Q(cnt_scan[1])
);
defparam cnt_scan_1_s1.INIT=1'b0;
DFFCE state_m_id_1_s2 (
	.D(n2069_25),
	.CLK(clock),
	.CE(state_m_id_1_9),
	.CLEAR(n79_6),
	.Q(state_m_id[1])
);
defparam state_m_id_1_s2.INIT=1'b0;
DFFCE state_m_id_0_s2 (
	.D(n2071_13),
	.CLK(clock),
	.CE(state_m_id_1_9),
	.CLEAR(n79_6),
	.Q(state_m_id[0])
);
defparam state_m_id_0_s2.INIT=1'b0;
DFFCE state_s_id_3_s1 (
	.D(n2072_21),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_s_id[3])
);
defparam state_s_id_3_s1.INIT=1'b0;
DFFCE state_s_id_2_s1 (
	.D(n2073_22),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_s_id[2])
);
defparam state_s_id_2_s1.INIT=1'b0;
DFFCE state_s_id_1_s1 (
	.D(n2074_16),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_s_id[1])
);
defparam state_s_id_1_s1.INIT=1'b0;
DFFCE state_s_id_0_s1 (
	.D(n2075_16),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_s_id[0])
);
defparam state_s_id_0_s1.INIT=1'b0;
DFFCE state_cnt_6_s1 (
	.D(n2077_18),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_cnt[6])
);
defparam state_cnt_6_s1.INIT=1'b0;
DFFCE state_cnt_5_s1 (
	.D(n2078_18),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_cnt[5])
);
defparam state_cnt_5_s1.INIT=1'b0;
DFFCE state_cnt_4_s1 (
	.D(n2079_18),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_cnt[4])
);
defparam state_cnt_4_s1.INIT=1'b0;
DFFCE state_cnt_3_s1 (
	.D(n2080_18),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_cnt[3])
);
defparam state_cnt_3_s1.INIT=1'b0;
DFFCE state_cnt_2_s1 (
	.D(n2081_18),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_cnt[2])
);
defparam state_cnt_2_s1.INIT=1'b0;
DFFCE state_cnt_1_s1 (
	.D(n2082_18),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_cnt[1])
);
defparam state_cnt_1_s1.INIT=1'b0;
DFFCE state_cnt_0_s1 (
	.D(n2083_18),
	.CLK(clock),
	.CE(n2072_29),
	.CLEAR(n79_6),
	.Q(state_cnt[0])
);
defparam state_cnt_0_s1.INIT=1'b0;
DFFC cnt_scan_0_s4 (
	.D(n3435_13),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(cnt_scan[0])
);
defparam cnt_scan_0_s4.INIT=1'b0;
DFFC state_cnt_7_s2 (
	.D(n2076_21),
	.CLK(clock),
	.CLEAR(n79_6),
	.Q(state_cnt[7])
);
defparam state_cnt_7_s2.INIT=1'b0;
INV n79_s2 (
	.I(rst_n),
	.O(n79_6)
);
INV n56_s2 (
	.I(clock),
	.O(n56_6)
);
LUT1 n60_s2 (
	.I0(DCLK),
	.F(n60_6)
);
defparam n60_s2.INIT=2'h1;
endmodule
