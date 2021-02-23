`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 11:27:56 PM
// Design Name: 
// Module Name: nodeFunc
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


module nodeFunc(OUTPUT, clk,rst,p,w,b);
 output [7:0] OUTPUT;
 input clk,rst;
 input [127:0]p;
 input [127:0]w;
 input [19:0]b;
 
 wire [21:0] cncn;
 wire [21:0] b_ext;
 
 assign b_ext = {{14{b[7]}},b};
 
 mac_acc mac_acc1(clk, rst, p,w,b_ext,cncn);
 
 sigmoid_func sigmoidFunc1(OUTPUT,cncn);
 
 endmodule
