`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 04:17:34 PM
// Design Name: 
// Module Name: mac_acc
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


module mac_acc(
clk, rst, p,w,b,dout
    );
    input clk, rst;
    output [21:0] dout;
    input [7:0] b;
    input [127:0] p;
    input [127:0] w;
    
    wire [19:0]out;
    
    mac macInsta(out, clk, p,w);
    acc accInsta(dout, clk, rst, out, b);
    
    
endmodule
