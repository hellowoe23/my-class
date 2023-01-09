`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/03 16:30:16
// Design Name: 
// Module Name: aes_tb
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


module aes_tb();
reg clk=0;
reg [127:0]din=128'h3243f6a8885a308d313198a2e0370734;
reg [127:0]key=128'h2b7e151628aed2a6abf7158809cf4f3c;
reg [127:0]citxt=128'h3925841D02DC09FBDC118597196A0B32;
wire [127:0]ctxt,ptxt;
wire f,DEf;
top_aes a(.clk(clk),.din(din),.key(key),.reset(1'b0),.ctxt(ctxt),.done(f));
DE_AES_top b(.clk(clk),.entxt(citxt),.reset(1'b0),.key(key),.done(DEf),.ptxt(ptxt));
  initial begin
      #9000
      $finish;
  end
  always @(*)
    #10 clk <= ~clk; 
  initial begin
      $dumpfile("aes_tb.vcd");
      $dumpvars(0,aes_tb);
  end
endmodule
