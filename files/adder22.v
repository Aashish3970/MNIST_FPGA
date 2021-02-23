`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2020 01:32:34 PM
// Design Name: 
// Module Name: adder22
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


module adder22(
    sum,a,b
    );
    output signed [21:0]sum;
    input signed [19:0] a;
    input signed [21:0] b;
    
    assign sum= a+b;
endmodule
