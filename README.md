# MiniLED

中文 | [英文](README_EN.md)

## 简介

本项目基于高云MIniLED分区背光开发套件，采用分区背光算法对输入的视频信号进行灰度典型值的统计计算，得出360个背光分区的灰度典型值，再将360个典型值通过SPI传输到背光灯版，实现对LCD屏幕的分区背光控制，以提高显示的对比度和节能。

本项目采用的分区背光开发套件由开发板，LCD（1280x800@60Hz），背光灯板（24x15个灯珠）组成。

本项目结构如下：
```
MINILED
│   .gitignore
│   lvds_video.gprj
│   lvds_video.gprj.user
│   README.md
└───src
    │   lvds_video.cst
    │   lvds_video.sdc
    │   lvds_video_top.v
    │   MiniLED_driver.v
    │   ramflag_In.v
    │   SPI7001_gowin.vp
    │   SPI7001_sim.v
    │   sram_top_gowin_top_sim.v
    ├───algorithm
    │       block_360_pro.v
    │       rgb_to_gray.v
    ├───gowin_rpll
    │       gowin_rpll.ipc
    │       gowin_rpll.mod
    │       gowin_rpll.v
    │       gowin_rpll_tmp.v
    ├───i2c
    │       AP3216_driver.v
    │       i2c_controller.v
    │       i2c_top.v
    ├───lvds_7to1_rx
    │   │   bit_align_ctl.v
    │   │   LVDS71RX_1CLK8DATA.v
    │   │   lvds_7to1_rx_defines.v
    │   │   lvds_7to1_rx_top.v
    │   │   word_align_ctl.v
    │   └───gowin_rpll2
    │           LVDS_RX_rPLL2.ipc
    │           LVDS_RX_rPLL2.mod
    │           LVDS_RX_rPLL2.v
    │           LVDS_RX_rPLL2_tmp.v
    ├───lvds_7to1_tx
    │   │   ip_gddr71tx.v
    │   │   lvds_7to1_tx_defines.v
    │   │   lvds_7to1_tx_top.v
    │   └───gowin_rpll2
    │           LVDS_TX_rPLL2.ipc
    │           LVDS_TX_rPLL2.mod
    │           LVDS_TX_rPLL2.v
    │           LVDS_TX_rPLL2_tmp.v
    └───────────────────────────────
```