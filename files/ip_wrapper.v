`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 10:36:10 PM
// Design Name: 
// Module Name: ip_wrapper
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


module ip_wrapper(out9,sign,ovf, inp);
    output  ovf, sign;
    output [8:0] out9;
    input [21:0] inp;
    
    reg ovf;
    assign sign= inp[21];
    assign out9= inp[13:5];
    
    always @(*)
    begin
        if(!inp[21])
            ovf<= |inp[20:14];
        else if (inp[21])
            ovf<= ~(&inp[21:14]) || (~(|inp[13:5]));
    end
         
endmodule
