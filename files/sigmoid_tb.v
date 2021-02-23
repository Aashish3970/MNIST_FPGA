`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 11:00:58 PM
// Design Name: 
// Module Name: sigmoid_tb
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


module sigmoid_tb();

parameter half_cycle= 20;

reg signed [21:0] count;
reg clk;
wire clk2;
wire [7:0] data_out;
integer outfile;

assign #2 clk2=clk;

sigmoid_func u1(data_out,count);

initial begin
    outfile= $fopen("simout.txt","w");
    clk=0;
    count= -16640;
    
end

always #half_cycle clk= !clk;

 always @(posedge clk) begin
     $fdisplay(outfile, "%h",data_out);
 end
 
 always @(posedge clk2) begin
     count= count+32;
     if(count>=16640) begin
         $fclose(outfile);
         $finish;
     end
 end
 
endmodule
