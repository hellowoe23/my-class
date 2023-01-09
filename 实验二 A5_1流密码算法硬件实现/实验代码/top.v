`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/02 14:15:25
// Design Name: 
// Module Name: top
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


module top(
input clk,
input [0:63]secret,
input rst,
output  init_ok,
output keystream
    );
 reg [21:0]public=22'b1101001110000110010001;
 reg init=0;
 reg shift_bit;
 reg [2:0] trigger=3'b111;
 wire [2:0]temp;
 wire [0:18]LFSR_1;
 wire [0:21]LFSR_2;
 wire [0:22]LFSR_3;
 reg [8:0]counter=8'b0;
 reg [2:0]reset=0;
 lfsr_1 l1(.shift_bit(shift_bit) ,.trigger(trigger[0]),.clk(clk),.reset_n(reset[0]),.X(LFSR_1));
 lfsr_2 l2(.shift_bit(shift_bit) ,.trigger(trigger[1]),.clk(clk),.reset_n(reset[1]),.Y(LFSR_2));
 lfsr_3 l3(.shift_bit(shift_bit) ,.trigger(trigger[2]),.clk(clk),.reset_n(reset[2]),.Z(LFSR_3));
 majority mj(.X(LFSR_1[8]),.Y(LFSR_2[10]),.Z(LFSR_3[10]),.triggers(temp));
 always@(posedge clk)
 begin
 if(~rst)begin
 counter<=0;
 reset<=3'b000;
 init<=0;
 end
 end
always@(posedge clk)begin
if(counter==0)begin
shift_bit<=secret[0];
end
else if(counter<=63)begin
 reset<=3'b111;
 shift_bit<=secret[counter];
 trigger<=3'b111;
 end
else if(counter<=85) begin
shift_bit<=public[counter-64];
trigger<=3'b111;
end
else if(counter<=185)begin
shift_bit<=0;
trigger<=temp;
end
else   init<=1;
if(init==1)begin
shift_bit<=0;
trigger<=temp;
counter<=1;
end
counter<=counter+1;
 end
 assign keystream=LFSR_1[18]^LFSR_2[21]^LFSR_3[22];
 assign init_ok=init;
endmodule
