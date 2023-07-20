`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2022 05:42:56
// Design Name: 
// Module Name: PC
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


module PC(
    input [7:0] PCIN, // Input Register
    input clk, // Clock
    input [2:0] pcopsel, // Selector Control Line
    input rst, // Reset pin
    output reg [7:0] PCOUT // Output Port
    );

reg [7:0] stack;
reg inc;
    
always@(posedge clk)
begin
if(!rst)begin
    PCOUT=8'h00; inc = 0;
end; // resets  counter position
if(rst) 
        begin
        case(pcopsel) 
        3'h0: PCOUT=PCOUT; // refresh
        3'h1: PCOUT=PCOUT+1'b1; // increment
        3'h2: PCOUT=PCIN; // load new value for PC
        3'h3: stack=PCOUT;
        3'h4: 
            begin
                PCOUT = stack;
                inc = 1;
            end
        3'h5: PCOUT=PCOUT; // refresh
        endcase
        
        case (inc)
        1'b1:
        begin
            PCOUT = PCOUT + 1'b1;
            inc = 0;
        end
        endcase
        
        
        end
end
endmodule