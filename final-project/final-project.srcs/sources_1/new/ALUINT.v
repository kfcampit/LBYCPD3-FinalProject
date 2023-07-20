`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2022 16:46:03
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire [7:0] ACC,
    input wire[7:0] BREG,
    input wire [7:0] LIT,
    input wire [3:0] OP,
    output reg [7:0] ALOUT,
    output reg [7:0] ALUSHOW,
    input clk
    );
    
always@(posedge clk)
    begin
        case(OP)
            4'h0:  ALOUT=ALOUT; 
            4'h1:  ALOUT=ACC+BREG; //ADDAB
            4'h2:  ALOUT=ACC-BREG; //SUBAB
            4'h3:  ALOUT=~ACC; //NOT A
            4'h4:  ALOUT=ACC&BREG; // ANDAB
            4'h5:  ALOUT=ACC|BREG; //ORLAB
            4'h6:  ALOUT=ACC^BREG; //XORAB
            4'h7:  ALOUT=ACC+LIT; //ADDAL
            4'h8:  ALOUT=ACC-LIT; //SUBAL
            4'h9:  ALOUT=~LIT; //NOT LIT
            4'hA:  ALOUT=ACC&LIT; // ANDAL
            4'hB:  ALOUT=ACC|LIT; //ORLAL
            4'hC:  ALOUT=ACC^LIT; //XORABL
//            ALOUT=ACC;
        endcase
     ALUSHOW=ALOUT;
end
    
endmodule