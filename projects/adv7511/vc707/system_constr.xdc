
# hdmi

set_property -dict  {PACKAGE_PIN  AU23  IOSTANDARD  LVCMOS18} [get_ports hdmi_out_clk]
set_property -dict  {PACKAGE_PIN  AU22  IOSTANDARD  LVCMOS18} [get_ports hdmi_hsync]
set_property -dict  {PACKAGE_PIN  AT22  IOSTANDARD  LVCMOS18} [get_ports hdmi_vsync]
set_property -dict  {PACKAGE_PIN  AP21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data_e]
set_property -dict  {PACKAGE_PIN  AM22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[0]]
set_property -dict  {PACKAGE_PIN  AL22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[1]]
set_property -dict  {PACKAGE_PIN  AJ20  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[2]]
set_property -dict  {PACKAGE_PIN  AJ21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[3]]
set_property -dict  {PACKAGE_PIN  AM21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[4]]
set_property -dict  {PACKAGE_PIN  AL21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[5]]
set_property -dict  {PACKAGE_PIN  AK22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[6]]
set_property -dict  {PACKAGE_PIN  AJ22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[7]]
set_property -dict  {PACKAGE_PIN  AL20  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[8]]
set_property -dict  {PACKAGE_PIN  AK20  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[9]]
set_property -dict  {PACKAGE_PIN  AK23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[10]]
set_property -dict  {PACKAGE_PIN  AJ23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[11]]
set_property -dict  {PACKAGE_PIN  AN21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[12]]
set_property -dict  {PACKAGE_PIN  AP22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[13]]
set_property -dict  {PACKAGE_PIN  AP23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[14]]
set_property -dict  {PACKAGE_PIN  AN23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[15]]
set_property -dict  {PACKAGE_PIN  AM23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[16]]
set_property -dict  {PACKAGE_PIN  AN24  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[17]]
set_property -dict  {PACKAGE_PIN  AY24  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[18]]
set_property -dict  {PACKAGE_PIN  BB22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[19]]
set_property -dict  {PACKAGE_PIN  BA22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[20]]
set_property -dict  {PACKAGE_PIN  BA25  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[21]]
set_property -dict  {PACKAGE_PIN  AY25  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[22]]
set_property -dict  {PACKAGE_PIN  AY22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[23]]
set_property -dict  {PACKAGE_PIN  AY23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[24]]
set_property -dict  {PACKAGE_PIN  AV24  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[25]]
set_property -dict  {PACKAGE_PIN  AU24  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[26]]
set_property -dict  {PACKAGE_PIN  AW21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[27]]
set_property -dict  {PACKAGE_PIN  AV21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[28]]
set_property -dict  {PACKAGE_PIN  AT24  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[29]]
set_property -dict  {PACKAGE_PIN  AR24  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[30]]
set_property -dict  {PACKAGE_PIN  AU21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[31]]
set_property -dict  {PACKAGE_PIN  AT21  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[32]]
set_property -dict  {PACKAGE_PIN  AW22  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[33]]
set_property -dict  {PACKAGE_PIN  AW23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[34]]
set_property -dict  {PACKAGE_PIN  AV23  IOSTANDARD  LVCMOS18} [get_ports hdmi_data[35]]

# spdif

set_property -dict  {PACKAGE_PIN  AR23  IOSTANDARD  LVCMOS18} [get_ports spdif]

# spi -- because the interface is not used, the leaf registers of the output lines
# should be set to IOB FALSE to prevent a CRITICAL WARNING

set_property IOB FALSE [get_cells i_system_wrapper/system_i/axi_spi/U0/NO_DUAL_QUAD_MODE.QSPI_NORMAL/IO0_I_REG]
set_property IOB FALSE [get_cells i_system_wrapper/system_i/axi_spi/U0/NO_DUAL_QUAD_MODE.QSPI_NORMAL/IO1_I_REG]

