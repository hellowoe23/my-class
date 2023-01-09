`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/03 15:57:47
// Design Name: 
// Module Name: top_aes
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


module top_aes(
input clk,
input [127:0]din,
input [127:0]key,
input reset,
output reg [127:0]ctxt,
output reg done
    );
wire[127:0] rk[0:10];
reg[3:0]  rc;
reg init=0;
reg[127:0]ctx,rkey;
wire[127:0]ctx_new;
round R(.rc(rc),.ctx(ctx),.key(rkey),.ret(ctx_new)); 
gen_key GK(.key(key),.key_r0(rk[0]),.key_r1(rk[1]),.key_r2(rk[2]),.key_r3(rk[3]),.key_r4(rk[4]),.key_r5(rk[5]),.key_r6(rk[6]),.key_r7(rk[7]),.key_r8(rk[8]),.key_r9(rk[9]),.key_r10(rk[10])); 
always@(posedge clk,posedge reset)begin
if(reset)begin
 rc<=0;
 init<=0;
 end
else if(init==0)begin
ctx<=din^rk[0];
rkey<=rk[1];
done<=0;
init<=1;
rc<=1;
end
else if(done==1)begin
    rc<=11;
    end
else if(rc<=9)begin
ctx<=ctx_new;
rkey<=rk[rc+1];
rc<=rc+1;
end
else if(rc==10) begin
    done<=1; 
    ctxt<=ctx_new;
end
end
endmodule
