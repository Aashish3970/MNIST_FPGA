`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2020 02:07:10 PM
// Design Name: 
// Module Name: mac_tb
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


module mac_tb();
    parameter half_cycle = 20;
    reg [127:0] data_pixels[39:0]; //40 data_pixels each pixel with 128 bitwdith
    reg [127:0] data_weights[39:0];
    wire [19:0] sum;
    
    reg [127:0] p,w; 
    reg [7:0] count;
    reg clk;
    wire clk2;
    
    integer outFile1;
    
    assign #2 clk2 = clk;
    
    mac macInsta(sum,clk,p,w);
    
    initial
    begin
        $readmemh("/opt/Xilinx/AsicProject/AsicProject.srcs/sources_1/new/digits_hex.txt",data_pixels);
        $readmemh("/opt/Xilinx/AsicProject/AsicProject.srcs/sources_1/new/weights_hex.txt",data_weights);
        outFile1 = $fopen("simout.txt","w");
        clk=0;
        count=0;
    end
    
    always #half_cycle clk= !clk;
    
    //write to file
    always @(posedge clk)
    if (count >0)
        $fdisplay(outFile1, "%h",sum);
        
    always @(posedge clk2)
    begin
        p= data_pixels[count];
        w= data_weights[count];
        count = count+1;
        if (count==41)
        begin
            $fclose(outFile1);
            $finish;
        end
    end
endmodule
