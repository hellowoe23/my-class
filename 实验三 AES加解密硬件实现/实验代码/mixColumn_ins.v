`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/04 12:54:16
// Design Name: 
// Module Name: mixColumn_ins
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


module mixColumn_ins(
input [127:0]din,
output [127:0]dout
    );
assign dout[127:120]=Mult_ebd9(din[127:120],din[119:112],din[111:104],din[103:96]); 
assign dout[119:112]=Mult_ebd9(din[119:112],din[111:104],din[103:96],din[127:120]);
assign dout[111:104]=Mult_ebd9(din[111:104],din[103:96],din[127:120],din[119:112]);
assign dout[103:96]=Mult_ebd9(din[103:96],din[127:120],din[119:112],din[111:104]);


assign dout[95:88]=Mult_ebd9(din[95:88],din[87:80],din[79:72],din[71:64]);
assign dout[87:80]=Mult_ebd9(din[87:80],din[79:72],din[71:64],din[95:88]);
assign dout[79:72]=Mult_ebd9(din[79:72],din[71:64],din[95:88],din[87:80]);
assign dout[71:64]=Mult_ebd9(din[71:64],din[95:88],din[87:80],din[79:72]);

assign dout[63:56]=Mult_ebd9(din[63:56],din[55:48],din[47:40],din[39:32]);
assign dout[55:48]=Mult_ebd9(din[55:48],din[47:40],din[39:32],din[63:56]);
assign dout[47:40]=Mult_ebd9(din[47:40],din[39:32],din[63:56],din[55:48]);
assign dout[39:32]=Mult_ebd9(din[39:32],din[63:56],din[55:48],din[47:40]);

assign dout[31:24]=Mult_ebd9(din[31:24],din[23:16],din[15:8],din[7:0]);
assign dout[23:16]=Mult_ebd9(din[23:16],din[15:8],din[7:0],din[31:24]);
assign dout[15:8]=Mult_ebd9(din[15:8],din[7:0],din[31:24],din[23:16]);
assign dout[7:0]=Mult_ebd9(din[7:0],din[31:24],din[23:16],din[15:8]);

function[7:0]Mult_ebd9(input[7:0]d1,input[7:0]d2,input[7:0]d3,input[7:0]d4);
begin  
Mult_ebd9= Mult_e(d1)^Mult_b(d2)^Mult_d(d3)^Mult_9(d4);
end
endfunction

 function [7:0] Mult2 (input [7:0] i_Din);
        begin
            Mult2 = {i_Din[6:0],1'b0}^(8'h1b&{8{i_Din[7]}});
        end
 endfunction
 
 function [7:0]Mult_e(input [7:0]i_Din);
 begin
        Mult_e=Mult2(Mult2(Mult2(i_Din)))^Mult2(Mult2(i_Din))^Mult2(i_Din);//8+4+2=e
 end
 endfunction
 
 function [7:0]Mult_d(input [7:0]i_Din);
 begin
        Mult_d=Mult2(Mult2(Mult2(i_Din)))^Mult2(Mult2(i_Din))^i_Din;//8+4+1=d
 end
 endfunction
 
 function [7:0]Mult_9(input [7:0]i_Din);
  begin
         Mult_9=Mult2(Mult2(Mult2(i_Din)))^i_Din;//8+1=9
  end
  endfunction
  function [7:0]Mult_b(input [7:0]i_Din);
   begin
          Mult_b=Mult2(Mult2(Mult2(i_Din)))^Mult2(i_Din)^i_Din;//8+2+1=b
   end
   endfunction
   
endmodule
