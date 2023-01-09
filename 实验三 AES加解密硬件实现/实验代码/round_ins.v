`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/04 17:49:01
// Design Name: 
// Module Name: round_ins
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


module round_ins(
input[127:0] rk,
input[3:0]rc,
input[127:0]din,
output[127:0]dout
    );
 wire[127:0] sb,sr,mc,rkxor;
 shiftRaw_ins ShR(.i_Din(din),.o_Dout(sr));
 Subbytes_ins SBI(.i_Din(sr),.o_Dout(sb));
assign rkxor=rk^sb;
mixColumn_ins MC(.din(rkxor),.dout(mc));
assign dout=(rc==10)? rkxor:mc;
endmodule
