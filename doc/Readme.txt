________________________________________________________________________
	  Example LVDS_71_RX Design Read Me
-------------------------------------------------------------------------
Object device:GW2A-18-PBGA256
---------------------------------------------------------------------------
File List:
---------------------------------------------------------------------------
.
|-- doc
|   `-- Readme.txt                              -->  Read Me file (this file)
|-- tb 
|   `-- tb.v                                    -->  TestBench for example design
|   `-- prim_sim.v                              -->  Gowin Simulation lib
|   |-- driver                                  -->  BMP picture driver
|   |-- monitor                                 -->  BMP picture monitor
|   |-- pic                                     -->  BMP picture for test
|-- project
|   `-- lvds_video.gprj          	            -->  GowinYunYuan Project File for Example Design
|   `-- lvds_video.gprj.user                    -->  GowinYunYuan Project File for Example Design
|   |-- impl
|   |   `-- project_process_config.json
|   |   |-- temp                                   
|   |-- src                          
|       `-- lvds_video_top.v                    -->  File for GowinYunYuan Project
|       `-- lvds_video.cst                      -->  File for GowinYunYuan Project
|       `-- lvds_video.sdc                      -->  File for GowinYunYuan Project 
|       |-- lvds_7to1_rx           
|       |   `-- bit_align_ctl.v                 -->  File for GowinYunYuan Project
|       |   `-- lvds_7to1_rx_defines.v          -->  File for GowinYunYuan Project
|       |   `-- lvds_7to1_rx_top.v              -->  File for GowinYunYuan Project
|       |   `-- LVDS71RX_1CLK8DATA.v            -->  File for GowinYunYuan Project
|       |   `-- word_align_ctl.v                -->  File for GowinYunYuan Project
|       |   |-- gowin_pllvr
|       |   |   `-- LVDS_RX_PLLVR.v             -->  File for GowinYunYuan Project
|       |   |   `-- LVDS_RX_PLLVR_tmp.v         -->  File for GowinYunYuan Project
|       |   |   `-- LVDS_RX_PLLVR.mod           -->  File for GowinYunYuan Project
|       |   |   `-- LVDS_RX_PLLVR.ipc           -->  File for GowinYunYuan Project    
|       |   |-- gowin_rpll  
|       |       `-- LVDS_RX_rPLL.v              -->  File for GowinYunYuan Project
|       |       `-- LVDS_RX_rPLL_tmp.v          -->  File for GowinYunYuan Project
|       |       `-- LVDS_RX_rPLL.mod            -->  File for GowinYunYuan Project
|       |       `-- LVDS_RX_rPLL.ipc            -->  File for GowinYunYuan Project 
|       |-- lvds_7to1_tx          
|           `-- ip_gddr71tx.v                   -->  File for GowinYunYuan Project
|           `-- lvds_7to1_tx_defines.v          -->  File for GowinYunYuan Project
|           `-- lvds_7to1_tx_top.v              -->  File for GowinYunYuan Project
|           |-- gowin_pllvr
|           |   `-- LVDS_TX_PLLVR.v             -->  File for GowinYunYuan Project
|           |   `-- LVDS_TX_PLLVR_tmp.v         -->  File for GowinYunYuan Project
|           |   `-- LVDS_TX_PLLVR.mod           -->  File for GowinYunYuan Project
|           |   `-- LVDS_TX_PLLVR.ipc           -->  File for GowinYunYuan Project    
|           |-- gowin_rpll  
|               `-- LVDS_TX_rPLL.v              -->  File for GowinYunYuan Project
|               `-- LVDS_TX_rPLL_tmp.v          -->  File for GowinYunYuan Project
|               `-- LVDS_TX_rPLL.mod            -->  File for GowinYunYuan Project
|               `-- LVDS_TX_rPLL.ipc            -->  File for GowinYunYuan Project 
|-- simulation                                  -->  Simulation Environment
|   |-- modelsim_sim
|   |   `-- readme.txt                          -->  Read Me file for modelsim simulation
|   |   `-- tb.do                               -->  File for Simulation run command
|   |   `-- tb_wave.do                          -->  File for Simulation
|   |-- vcs_sim
|       `-- readme.txt                          -->  Read Me file for modelsim simulation
|       `-- makefile                            -->  File for Simulation run command

---------------------------------------------------------------------------------------------------------------
HOW TO OPEN A PROJECT IN GowinYunYuan:
---------------------------------------------------------------------------------------------------------------
1. Unzip the respective design files.
2. Launch GowinYunYuan and select "File -> Open -> Project"
3. In the Open Project dialog, enter the Project location -- "project",select the project"lvds_video.gprj".
4. Click Finish. Now the project is successfully loaded. 

---------------------------------------------------------------------------------------------------------------
HOW TO RUN SYNTHESIZE, PLACE AND ROUTE, IP CORE GENERATION, AND TIMING ANALYSIS IN GowinYunYuan:
---------------------------------------------------------------------------------------------------------------

1. Click the Process tab in the process panel of the GowinYunYuan dashboard. 
   Double click on Synthsize. This will bring the design through synthesis.
2. Click the Process tab in the process panel of the GowinYunYuan dashboard. 
   Double click on Place & Route. This will bring the design through mapping, place and route.
3. Once Place & Route is done, user can double click on Timing Analysis Report to get 
   the timing analysis result.
4. Click on "Project -> Configuration -> Place & Route" to configurate the Post-Place File 
   and SDF File of the design.
----------------------------------------------------------------------------------------------------------------

HOW TO RUN SIMULATION
1. User can run functional simulation by software VCS. 
2. User can check waveform by software Verdi.
----------------------------------------------------------------------------------------------------------------


