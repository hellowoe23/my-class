`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/02 11:37:16
// Design Name: 
// Module Name: majority
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


module majority(
input X,
    input Y,
    input Z,
    output reg [0:2]triggers
    );
    
wire maj_logic;
assign maj_logic = (X&Y) | (X&Z) | (Y&Z);// 根据真值表得出
    always @(X,Y,Z)
    begin
        if(maj_logic == X)
            triggers[0] <= 1'b1;
        else 
            triggers[0] <= 1'b0;
        if(maj_logic == Y)
            triggers[1] <= 1'b1;
        else
            triggers[1] <= 1'b0;
        if(maj_logic == Z)
            triggers[2] <= 1'b1;
        else
            triggers[2] <= 1'b0;
    end
endmodule