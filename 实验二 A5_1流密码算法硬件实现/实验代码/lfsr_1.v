`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/02 13:42:20
// Design Name: 
// Module Name: lfsr_1
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


module lfsr_1(
 input shift_bit,
   input trigger,
   input clk,
   input reset_n,
   output [0:18] X
   );
   
reg [0:18] X_reg=0;
wire taps;
   
   assign taps = X_reg[13]^X_reg[16]^X_reg[17]^X_reg[18];
   always @(posedge clk,negedge reset_n)
   begin
       if(~reset_n)
           X_reg <= 'b0;
       else if (trigger)
           X_reg <= {taps^shift_bit,X_reg[0:17]};
   end
   
assign X = X_reg;  
    
endmodule