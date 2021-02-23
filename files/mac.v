`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2020 09:44:54 AM
// Design Name: 
// Module Name: mac
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


module mac(sumOut,clk, pixelsIn, weightsIn);

    output [19:0] sumOut;
    input [127:0] pixelsIn;
    input [127:0] weightsIn;
    input clk;
    
    reg [127:0] pixels, weights;
    reg [19:0] sumOut;
    reg [135:0] s1reg;     
    wire [19:0] sum;
    wire [255:0]p; 
    wire [135:0] s1; //Outputs of 8 adders each of 17 bit: 8*17 
    wire [71:0] s2; //Outputs of 4 adders each of 18 bit: 4*18
    wire [37:0] s3; //Outputs of 2 adders each of 19 bit: 2*19
    
    always @(posedge clk)
    begin
        pixels<= pixelsIn;
        weights<= weightsIn;
//        pr <= p;
        s1reg <= s1;
        sumOut <= sum;
        
    end
    
    genvar multGen, addGen;
    generate
       for(multGen=0; multGen<=15 ;multGen=multGen+1)
        multiplier #(.OUT_WIDTH(16), .INP_WIDTH(8)) multInsta( p[(255-16*multGen):(255-16*multGen-15)],
                             pixels[(127-8*multGen):(127-8*multGen-7)],
                             weights[(127-8*multGen):(127-8*multGen-7)]
                            );      
    endgenerate
    
    generate
        for(addGen=0; addGen<=7; addGen=addGen+1)
        adder #(.OUT_WIDTH(17), .INP_WIDTH(16)) addInsta(s1[(135-17*addGen):(135-17*addGen-16)]  ,p[(255-2*16*addGen):(255-16*2*addGen-15)],p[(255-16*(2*addGen+1)):(255-16*(2*addGen+1)-15)]); 
    endgenerate
    
    adder #(.OUT_WIDTH(18), .INP_WIDTH(17)) adderInsta1(s2[71:54],s1reg[135:119],s1reg[118:102]);
    adder #(.OUT_WIDTH(18), .INP_WIDTH(17)) adderInsta2(s2[53:36],s1reg[101:85],s1reg[84:68]);
    adder #(.OUT_WIDTH(18), .INP_WIDTH(17)) adderInsta3(s2[35:18],s1reg[67:51],s1reg[50:34]);
    adder #(.OUT_WIDTH(18), .INP_WIDTH(17)) adderInsta4(s2[17:0],s1reg[33:17],s1reg[16:0]);

    adder #(.OUT_WIDTH(19), .INP_WIDTH(18)) adderInsta5(s3[37:19],s2[71:54],s2[53:36]);
    adder #(.OUT_WIDTH(19), .INP_WIDTH(18)) adderInsta6(s3[18:0],s2[35:18],s2[17:0]);

    adder #(.OUT_WIDTH(20), .INP_WIDTH(19)) adderInsta7(sum,s3[37:19],s3[18:0]);
    

endmodule
