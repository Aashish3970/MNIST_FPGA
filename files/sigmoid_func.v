`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 11:22:18 PM
// Design Name: 
// Module Name: sigmoid_func
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


module sigmoid_func( data_out,in22);
    
    output [7:0] data_out;
    input [21:0] in22;
    
    wire sign,ovf;
    wire [8:0] out9;
    
    
    ip_wrapper ipInsta(out9, sign, ovf, in22);
    sigmoid_0 inst01(out9,sign,ovf,data_out); 
endmodule
