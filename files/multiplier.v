`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2020 10:56:43 PM
// Design Name: 
// Module Name: multiplier
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


 module multiplier ( out, a,b );
    
    parameter OUT_WIDTH= 1;
    parameter INP_WIDTH= 1;
    output signed [OUT_WIDTH-1:0] out; 
    input signed [INP_WIDTH-1:0] a;
    input signed [INP_WIDTH-1:0] b;
    
    assign out= a*b;
endmodule
