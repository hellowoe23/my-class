`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/04 17:48:14
// Design Name: 
// Module Name: DE_AES_top
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


module DE_AES_top(
input clk,
input[127:0] entxt,
input reset,
input [127:0]key,
output reg done,
output reg [127:0] ptxt
    );
reg[127:0] rout;
wire[127:0]rout_new;
wire[127:0] rk[0:10];
reg[127:0] round_key;
reg[3:0]rc=0;
reg init=0;
gen_key GK(.key(key),.key_r0(rk[0]),.key_r1(rk[1]),.key_r2(rk[2]),.key_r3(rk[3]),.key_r4(rk[4]),.key_r5(rk[5]),.key_r6(rk[6]),.key_r7(rk[7]),.key_r8(rk[8]),.key_r9(rk[9]),.key_r10(rk[10]));
round_ins RI(.rk(round_key),.rc(rc),.din(rout),.dout(rout_new));
always@(posedge clk,posedge reset)
begin
if(reset)begin
 rc<=0;
 init<=0;
 end
 else if(init==0)begin
 rout<=entxt^rk[10];
 round_key<=rk[9];
 init<=1;
 rc<=1;
 done<=0;
 end
 else if(done==1)begin
 rc<=11;
 end
 else if(rc<=9)begin
 rout<=rout_new;
 round_key<=rk[9-rc];
 rc<=rc+1;
 end
 else if(rc==10)begin
 done<=1;
 ptxt<=rout_new;
 end 
end
endmodule
