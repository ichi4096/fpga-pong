# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

# vga output
# sync
set_property PACKAGE_PIN P19 [get_ports hsync]
set_property PACKAGE_PIN R19 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports {hsync vsync}]

# red
set_property PACKAGE_PIN G19 [get_ports red0]
set_property PACKAGE_PIN H19 [get_ports red1]
set_property PACKAGE_PIN J19 [get_ports red2]
set_property PACKAGE_PIN N19 [get_ports red3]
set_property IOSTANDARD LVCMOS33 [get_ports {red0 red1 red2 red3}]

# green
set_property PACKAGE_PIN J17 [get_ports grn0]
set_property PACKAGE_PIN H17 [get_ports grn1]
set_property PACKAGE_PIN G17 [get_ports grn2]
set_property PACKAGE_PIN D17 [get_ports grn3]
set_property IOSTANDARD LVCMOS33 [get_ports {grn0 grn1 grn2 grn3}]

# blue
set_property PACKAGE_PIN N18 [get_ports blu0]
set_property PACKAGE_PIN L18 [get_ports blu1]
set_property PACKAGE_PIN K18 [get_ports blu2]
set_property PACKAGE_PIN J18 [get_ports blu3]
set_property IOSTANDARD LVCMOS33 [get_ports {blu0 blu1 blu2 blu3}]

# Buttons
set_property PACKAGE_PIN W19 [get_ports l_down]
set_property PACKAGE_PIN T18 [get_ports l_up]
set_property PACKAGE_PIN T17 [get_ports r_up]
set_property PACKAGE_PIN U17 [get_ports r_down]
set_property PACKAGE_PIN U18 [get_ports reset]

set_property IOSTANDARD LVCMOS33 [get_ports {l_down l_up r_down r_up reset}]