`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 06:15:12 PM
// Design Name: 
// Module Name: Top
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


module Top(
input clk,
input reset,
input l_down,
input l_up,
input r_down,
input r_up,
output hsync,
output vsync,
output red0,
output red1,
output red2,
output red3,
output grn0,
output grn1,
output grn2,
output grn3,
output blu0,
output blu1,
output blu2,
output blu3
    );
    wire [11:0] out;
    assign out[0]=red0;
    assign out[1]=red1;
    assign out[2]=red2;
    assign out[3]=red3;
    
    assign out[4]=grn0;
    assign out[5]=grn1;
    assign out[6]=grn2;
    assign out[7]=grn3;
    
    assign out[8]=blu0;
    assign out[9]=blu1;
    assign out[10]=blu2;
    assign out[11]=blu3;
    
    wire [9:0] l_pos, r_pos, x_ball_pos, y_ball_pos;
    
    vga vga_inst(
    .clk(clk),
    .reset(reset),
    .l_pos(l_pos),
    .r_pos(r_pos),
    .x_ball_pos(x_ball_pos),
    .y_ball_pos(y_ball_pos),
    .hsync(hsync),
    .vsync(vsync),
    .out(out)
    );
    
    pong pong_inst(
    .clk(clk),
    .reset(reset),
    .l_up(l_up),
    .l_down(l_down),
    .r_up(r_up),
    .r_down(r_down),
    .x_ball_pos(x_ball_pos),
    .y_ball_pos(y_ball_pos),
    .l_pos(l_pos),
    .r_pos(r_pos)
    );
    
endmodule
