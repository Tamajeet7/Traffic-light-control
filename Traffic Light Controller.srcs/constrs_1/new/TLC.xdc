set_property -dict { PACKAGE_PIN "N11"    IOSTANDARD LVCMOS33       SLEW FAST} [get_ports { i_CLK }]     ;    

####################################################################################################################
#                                               Push Buttons                                                       #
####################################################################################################################
set_property -dict { PACKAGE_PIN "F5"   IOSTANDARD LVCMOS15    SLEW FAST} [get_ports { NS_vehicle_detect }];                     # IO_L13P_T2_MRCC_35            Sch = SW1
set_property -dict { PACKAGE_PIN "J4"   IOSTANDARD LVCMOS15    SLEW FAST} [get_ports { EW_vehicle_detect }];                     # IO_L19N_T3_VREF_35            Sch = SW2

####################################################################################################################
#                                               LEDs                                                               #
####################################################################################################################
set_property -dict { PACKAGE_PIN "K12"   IOSTANDARD LVCMOS33    SLEW FAST} [get_ports { NS_red }];                      # IO_0_14                       Sch = LED0
set_property -dict { PACKAGE_PIN "K13"   IOSTANDARD LVCMOS33    SLEW FAST} [get_ports { NS_yellow }];                      # IO_L5P_T0_D06_14              Sch = LED1
set_property -dict { PACKAGE_PIN "R10"   IOSTANDARD LVCMOS33    SLEW FAST} [get_ports { NS_green }];                      # IO_L17P_T2_A14_D30_14         Sch = LED2

set_property -dict { PACKAGE_PIN "R12"   IOSTANDARD LVCMOS33    SLEW FAST} [get_ports { EW_red    }];                      # IO_L15P_T2_DQS_RDWR_B_14      Sch = LED5
set_property -dict { PACKAGE_PIN "T12"   IOSTANDARD LVCMOS33    SLEW FAST} [get_ports { EW_yellow }];                      # IO_L15N_T2_DQS_DOUT_CSO_B_14  Sch = LED6
set_property -dict { PACKAGE_PIN "R11"   IOSTANDARD LVCMOS33    SLEW FAST} [get_ports { EW_green  }];                      # IO_L17N_T2_A13_D29_14         Sch = LED7
