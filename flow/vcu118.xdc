#	vcu118.xdc
#	extracted from various sources

#	this is a 125 MHz clock -- adjusted to evaluate timing closure ((Anon))
create_clock -period 4.000 -name ref_clk [get_ports ref_clk_p]

#set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN [get_nets ref_clk]
#create_clock -period 3.333 -name sys_clk [get_ports sys_clk_p]

# reset signal
set_false_path -from [get_ports pad_reset]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pad_reset_IBUF_inst/O]

set_property -dict {PACKAGE_PIN AY23 IOSTANDARD LVDS} [get_ports ref_clk_n]
set_property -dict {PACKAGE_PIN AY24 IOSTANDARD LVDS} [get_ports ref_clk_p]

##	
#set_property -dict {PACKAGE_PIN G31 IOSTANDARD LVDS} [get_ports sys_clk_p]
#set_property -dict {PACKAGE_PIN F31 IOSTANDARD LVDS} [get_ports sys_clk_n]

## Reset
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS12} [get_ports pad_reset]

## Buttons
#set_property -dict {PACKAGE_PIN BF22 IOSTANDARD LVCMOS18} [get_ports btn0_i]
#set_property -dict {PACKAGE_PIN BD23 IOSTANDARD LVCMOS18} [get_ports btn1_i]
#set_property -dict {PACKAGE_PIN BE23 IOSTANDARD LVCMOS18} [get_ports btn2_i]
#set_property -dict {PACKAGE_PIN BB24 IOSTANDARD LVCMOS18} [get_ports btn3_i]

## UART
######################################################################
# UART mapping
######################################################################
set_property -dict {PACKAGE_PIN AW25  IOSTANDARD LVCMOS18} [get_ports pad_uart_rx]
set_property -dict {PACKAGE_PIN BB21  IOSTANDARD LVCMOS18} [get_ports pad_uart_tx]
set_property -dict {PACKAGE_PIN BB22  IOSTANDARD LVCMOS18} [get_ports pad_uart_rts]
set_property -dict {PACKAGE_PIN AY25  IOSTANDARD LVCMOS18} [get_ports pad_uart_cts]

## LEDs
#set_property -dict {PACKAGE_PIN AT32 IOSTANDARD LVCMOS12} [get_ports led0_o]
set_property -dict {PACKAGE_PIN AT32 IOSTANDARD LVCMOS12} [get_ports trap_led]
#set_property -dict {PACKAGE_PIN AV34 IOSTANDARD LVCMOS12} [get_ports led1_o]
#set_property -dict {PACKAGE_PIN AY30 IOSTANDARD LVCMOS12} [get_ports led2_o]
#set_property -dict {PACKAGE_PIN BB32 IOSTANDARD LVCMOS12} [get_ports led3_o]

## Switches
#set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS12} [get_ports switch0_i]
#set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS12} [get_ports switch1_i]
#set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS12} [get_ports switch2_i]
#set_property -dict {PACKAGE_PIN D21 IOSTANDARD LVCMOS12} [get_ports switch3_i]

## I2C Bus
#set_property -dict {PACKAGE_PIN J10 IOSTANDARD LVCMOS33} [get_ports pad_i2c0_scl]
#set_property -dict {PACKAGE_PIN J11 IOSTANDARD LVCMOS33} [get_ports pad_i2c0_sda]

## HDMI CTL
#set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports pad_hdmi_scl]
#set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports pad_hdmi_sda]

#LED
#set_property PACKAGE_PIN AG14 [get_ports LED]
#set_property IOSTANDARD LVCMOS33 [get_ports LED]

