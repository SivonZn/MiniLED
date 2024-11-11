# MiniLED

[中文](README.md) | 英文

## introduction

This project is based on the Gowin MiniLED zonal backlight development kit, which adopts the zonal backlight algorithm to statistically calculate the grayscale typical values of the input video signal to derive the grayscale typical values of the 360 backlight zones, and then transmits the 360 typical values to the backlight version through the SPI to realize the control of the zonal backlight on the LCD screen in order to improve the contrast of the display and energy saving.

The zoned backlight development kit used in this project consists of development board, LCD (1280x800@60Hz), and backlight board (24x15 lamp beads).

The structure of this project is as follows:
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