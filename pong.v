`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 12:14:36 PM
// Design Name: 
// Module Name: pong
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


module pong(
input clk,
input reset,
input l_up,
input l_down,
input r_up,
input r_down,
output reg [9:0] l_pos,
output reg [9:0] r_pos,
output reg [9:0] x_ball_pos,
output reg [9:0] y_ball_pos
    );
    initial x_ball_pos=395;
    initial y_ball_pos=295;
    initial l_pos=225;
    initial r_pos=225;
    reg [16:0] l_up_c, l_down_c, r_up_c, r_down_c, ball_c;
    initial ball_c=0;
    reg move_x, move_y;
    always @(posedge clk) begin
        if(reset) begin
            l_up_c <= 0;
            l_down_c <= 0;
            r_up_c <= 0;
            r_down_c <= 0;
            ball_c <= 0;
            l_pos <= 225;
            r_pos <= 225;
            x_ball_pos <= 395;
            y_ball_pos <= 295;
        end else begin
            if(l_down&&~l_up)
                l_down_c <= l_down_c + 1;
            else if(l_up&&~l_down)
                l_up_c <= l_up_c + 1;
            if(r_down&&~r_up)
                r_down_c <= r_down_c + 1;
            else if(r_up&&~r_down)
                r_up_c <= r_up_c + 1;
            if(&l_up_c)
                l_pos <= l_pos == 0 ? 0 : l_pos - 1;
            if(&l_down_c)
                l_pos <= l_pos == 449 ? 449 : l_pos + 1;
            if(&r_up_c)
                r_pos <= r_pos == 0 ? 0 : r_pos - 1;
            if(&r_down_c)
                r_pos <= r_pos == 449 ? 449 : r_pos + 1;
            ball_c = ball_c + 1;
            if(&ball_c) begin
                if(x_ball_pos == 20 || x_ball_pos == 769)
                    move_x=~move_x;
                if(y_ball_pos == 0 || y_ball_pos == 589)
                    move_y=~move_y;
                if(x_ball_pos == 20 && (y_ball_pos >= l_pos + 160 || y_ball_pos + 10 < l_pos)) begin
                    x_ball_pos <= 395;
                    y_ball_pos <= 295;
                end else if(x_ball_pos == 769 && (y_ball_pos >= r_pos + 160 || y_ball_pos + 10 < r_pos)) begin
                    x_ball_pos <= 395;
                    y_ball_pos <= 295;
                end else begin
                    x_ball_pos = x_ball_pos + (move_x ? 1 : -1);
                    y_ball_pos = y_ball_pos + (move_y ? 1 : -1);
                end
            end
        end
    end
endmodule
