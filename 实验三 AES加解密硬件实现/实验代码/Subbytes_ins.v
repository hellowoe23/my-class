`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/04 12:31:21
// Design Name: 
// Module Name: Subbytes_ins
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


module Subbytes_ins(
input  [127:0] i_Din,// Data input
	output [127:0] o_Dout
	); 
Sbox_ins 	S0(.i_Din(i_Din[07:00]),.o_Dout(o_Dout[07:00]));
Sbox_ins 	S1(.i_Din(i_Din[15:08]),.o_Dout(o_Dout[15:08]));
Sbox_ins	S2(.i_Din(i_Din[23:16]),.o_Dout(o_Dout[23:16]));
Sbox_ins 	S3(.i_Din(i_Din[31:24]),.o_Dout(o_Dout[31:24]));
Sbox_ins 	S4(.i_Din(i_Din[39:32]),.o_Dout(o_Dout[39:32]));
Sbox_ins 	S5(.i_Din(i_Din[47:40]),.o_Dout(o_Dout[47:40]));
Sbox_ins	S6(.i_Din(i_Din[55:48]),.o_Dout(o_Dout[55:48]));
Sbox_ins 	S7(.i_Din(i_Din[63:56]),.o_Dout(o_Dout[63:56]));
Sbox_ins 	S8(.i_Din(i_Din[71:64]),.o_Dout(o_Dout[71:64]));
Sbox_ins 	S9(.i_Din(i_Din[79:72]),.o_Dout(o_Dout[79:72]));
Sbox_ins 	S10(.i_Din(i_Din[87:80]),.o_Dout(o_Dout[87:80]));
Sbox_ins 	S11(.i_Din(i_Din[95:88]),.o_Dout(o_Dout[95:88]));
Sbox_ins 	S12(.i_Din(i_Din[103:096]),.o_Dout(o_Dout[103:096]));
Sbox_ins 	S13(.i_Din(i_Din[111:104]),.o_Dout(o_Dout[111:104]));
Sbox_ins 	S14(.i_Din(i_Din[119:112]),.o_Dout(o_Dout[119:112]));
Sbox_ins 	S15(.i_Din(i_Din[127:120]),.o_Dout(o_Dout[127:120]));
endmodule