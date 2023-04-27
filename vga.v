`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 06:49:45 PM
// Design Name: 
// Module Name: vga
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga(
input clk,
input reset,
input [9:0] l_pos,
input [9:0] r_pos,
input [9:0] x_ball_pos,
input [9:0] y_ball_pos,
output reg hsync,
output reg vsync,
output reg [11:0] out
    );
    reg [20:0] counter;
    always @(posedge clk) begin
        if(reset) begin
            counter <= 0;
            hsync <= 0;
            vsync <= 0;
            out <= 0;
        end else begin
            if(counter[0]==0) begin
                hsync <= counter%(1040*2) >= 1712 && counter%(1040*2) < 1952;
                vsync <= counter >= 1324960 && counter < 1337440;
                if(counter%(1040*2) >= 112 && counter%(1040*2) < 1712
                && counter >= 76960 && counter < 1324960) begin
                    //sel_x <= (counter%(1040*2)-112)/2;
                    //sel_y <= (counter-76960)/(1040*2);
                    out <= /* left bar */
                    ((counter%(1040*2)-112)/2 < 20)&&((counter-76960)/(1040*2)>=l_pos)&&
                    ((counter-76960)/(1040*2)<l_pos+150) ||
                    /* right bar */
                    ((counter%(1040*2)-112)/2 >= 780)&&((counter-76960)/(1040*2)>=r_pos)&&
                    ((counter-76960)/(1040*2)<r_pos+150) ||
                    /* dividing line */
                    counter%(1040*2) == 912 && ((counter-76960)/(1040*2*8))%2 ||
                    /* ball */
                    (counter%(1040*2)/2-56 >= x_ball_pos && counter%(1040*2)/2-56 < x_ball_pos + 10 &&
                    (counter-76960)/(1040*2) >= y_ball_pos && (counter-76960)/(1040*2) < y_ball_pos + 10)
                    ?8191:0;
                end else begin
                    out <= 0;
                end
            end
            counter <= (counter + 1)%(1040*666*2);
        end
    end
endmodule
