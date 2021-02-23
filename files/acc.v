`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2020 07:39:11 PM
// Design Name: 
// Module Name: acc
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


module acc(
OUT, clk, rst, din, b
    );
    
  output [21:0] OUT;
  input [19:0] din;
  input [7:0] b; //bias 
  input clk, rst;
  
  reg [21:0] accReg, muxOut;
  reg [21:0] OUT;
  
  wire sel, en;
  wire [21:0] b_ext, sum;
  
  adder22 instaAdd22(sum,din, muxOut);
  acc_ctrl instaAccCtrl(en, sel, clk, rst);
  
  
  assign b_ext = {{14{b[7]}},b}; //Sign extension because b needs to add to 22 bit
  
  always @(posedge clk) begin
    if (rst) OUT<= 0;
     else if (en)
        OUT <= sum;
  end
  
  always @(posedge clk)
    accReg <= sum;
    
  always @(*) begin
      if (sel)
          muxOut = b_ext;
      else
          muxOut = accReg;
      end
 endmodule
    

