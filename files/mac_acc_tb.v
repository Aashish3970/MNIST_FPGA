`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 04:21:04 PM
// Design Name: 
// Module Name: mac_acc_tb
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


module mac_acc_tb();
    parameter half_cycle=20;
    
    reg [127:0] data_p[39:0];
    reg [127:0] data_w[39:0];
    wire [21:0] dout;
    
    reg [127:0] p,w;
    reg [7:0]b;
    
    reg [7:0] count;
   reg clk, rst1, rst2;
   wire clk2;
   
   integer outfile, outfile2;
   assign #2 clk2 = clk; //delayed clock
   mac_acc mac_acc_Insta(clk2, rst2, p, w, b, dout);
   
   initial
   begin
   
   $readmemh("/opt/Xilinx/AsicProject/AsicProject.srcs/sources_1/new/digits_hex.txt",data_p);
   $readmemh("/opt/Xilinx/AsicProject/AsicProject.srcs/sources_1/new/weights_hex.txt",data_w);
   outfile= $fopen("simout.txt","w");
   outfile2= $fopen("macout.txt","w");
   clk=0;
   count=0;
   rst1=1; 
   rst2=1;
   b=11;
   #145 rst1=0;
   end
   
   always #half_cycle clk= !clk;
   
   //write acc output to file
   always@(posedge clk)
   if((count >7) &(count[1:0] ==2'b00))
    $fdisplay(outfile,"%h",dout);
   
   //write mac output to file
   always@(posedge clk)
   if(count >3) 
    $fdisplay(outfile2,"%h",mac_acc_Insta.out);
   
   always @(posedge clk2) begin
   p=data_p[count];
   w=data_w[count];
   
   if (!rst1) begin
   count= count+1;
   
   if (count==4)
   #half_cycle rst2= 0;
   
   if (count==45) begin
   $fclose(outfile);
   $fclose(outfile2);
   $finish;
   end
   end
   end
   
   
   
endmodule
