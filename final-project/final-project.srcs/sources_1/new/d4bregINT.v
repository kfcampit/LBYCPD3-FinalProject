`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 10:28:31
// Design Name: 
// Module Name: d4breg
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


module d4breg( 
            input wire [7:0] INna,
            input wire clk,
            output reg [7:0] Outna,
            input wire CE
            );

always@(posedge clk)
begin
            if(!CE) 
                      begin 
                      Outna=Outna;
                      end
            if(CE)
                      begin
                      Outna=INna;
                      end
end

endmodule