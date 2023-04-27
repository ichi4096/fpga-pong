# fpga-pong
It's a poorly coded version of pong for the Basys 3 board. To run it on yours, import the Verilog and constraint files into a new project for the bord part "xc7a35tcpg236-1", generate a bitstream and load it onto the fpga. The controls are the buttons on the board and the output is via the VGA port (resolution is 800 x 600 @ 72 Hz).
