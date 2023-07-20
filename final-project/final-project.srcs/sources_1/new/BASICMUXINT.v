`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2022 05:23:11
// Design Name: 
// Module Name: basicmux
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


module basicmux(
    input [7:0] ACCTRIB,
    input [7:0] ALUIN,
    input ALUPSEL,
    input clk,
    output reg [7:0] ACCAGP
    );
    
always@(posedge clk)
begin 
if(!ALUPSEL) ACCAGP=ALUIN;
if(ALUPSEL) ACCAGP=ACCTRIB;
end
    
endmodule