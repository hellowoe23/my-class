`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/03 15:36:32
// Design Name: 
// Module Name: Subbytes
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


module Subbytes(
input [127:0] data,
output [127:0] sb
);
    S_box q0( .a(data[127:120]),.c(sb[127:120]) );
     S_box q1( .a(data[119:112]),.c(sb[119:112]) );
     S_box q2( .a(data[111:104]),.c(sb[111:104]) );
     S_box q3( .a(data[103:96]),.c(sb[103:96]) );
     
     S_box q4( .a(data[95:88]),.c(sb[95:88]) );
     S_box q5( .a(data[87:80]),.c(sb[87:80]) );
     S_box q6( .a(data[79:72]),.c(sb[79:72]) );
     S_box q7( .a(data[71:64]),.c(sb[71:64]) );
     
     S_box q8( .a(data[63:56]),.c(sb[63:56]) );
     S_box q9( .a(data[55:48]),.c(sb[55:48]) );
     S_box q10(.a(data[47:40]),.c(sb[47:40]) );
     S_box q11(.a(data[39:32]),.c(sb[39:32]) );
     
     S_box q12(.a(data[31:24]),.c(sb[31:24]) );
     S_box q13(.a(data[23:16]),.c(sb[23:16]) );
     S_box q14(.a(data[15:8]),.c(sb[15:8]) );
     S_box q16(.a(data[7:0]),.c(sb[7:0]) );
	  
endmodule