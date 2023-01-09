`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/02 13:44:45
// Design Name: 
// Module Name: lfsr_3
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


module lfsr_3(
 input shift_bit,
    input trigger,
    input clk,
    input reset_n,
    output [0:22] Z
    );
    
reg [0:22] Z_reg=0;
wire taps;

    assign taps = Z_reg[7]^Z_reg[20]^Z_reg[21]^Z_reg[22];
    always @(posedge clk,negedge reset_n)
    begin
        if(~reset_n)
            Z_reg <= 'b0;
        else if (trigger)
            Z_reg <= {taps^shift_bit,Z_reg[0:21]};
    end
        
assign Z = Z_reg; 
     
endmodule