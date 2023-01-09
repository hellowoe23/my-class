`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/03 15:59:31
// Design Name: 
// Module Name: round
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


module round(
input [3:0]rc,//��ǰ��������
input [127:0]ctx,//��������
input [127:0]key,//���ֵ���Կ
output [127:0]ret//���ּ��ܽ��
    );
wire[127:0] sb,sr,mc;
reg [127:0]final;  
Subbytes SUB(.data(ctx),.sb(sb));
shiftRaw SR(.sb(sb),.sr(sr));
mixColumn MC(.a(sr),.mcl(mc));
always@(*)begin
if(rc==10)
final<=key^sr;
else
final<=key^mc;
end
assign ret=final;
endmodule
