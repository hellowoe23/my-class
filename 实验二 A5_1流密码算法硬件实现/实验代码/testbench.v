`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/02 19:06:06
// Design Name: 
// Module Name: testbench
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


module testbench();
 reg clk=2'b0;
 wire init_ok;
 wire [0:63]secret;
 wire ks;
 reg rst=1;
 assign secret = 64'b0100111000101111010011010111110000011110101110001000101100111010;
 top tb(clk,secret,rst, init_ok,ks);
 initial begin
 forever #0.005 clk=~clk;
 end
endmodule
