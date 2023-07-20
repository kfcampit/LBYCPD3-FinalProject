`timescale 1ns / 1ps


module SAP(
     input wire [7:0] INR,
     input wire INT,
     input wire rst,
     input wire clk,
     output wire [7:0] OUTR,
     output wire[7:0] PC,   // PC
     output wire [7:0] PCA,
     output wire [2:0] state,
     output wire [7:0] IR,
     output wire [3:0] aluopsel,
     output wire [2:0] pcopsel,
     output wire [3:0] seldst,
     output wire [3:0] selsrc,
     output wire [7:0] ALUREsult, // Primitive Chipscope
     output wire [7:0] AYE,
     output wire [7:0] BEE,
     output wire [7:0] MAR
    );
    
  wire [15:0] ROMDATA; 
  //  wire [3:0] aluopsel;
  //  wire [1:0] pcopsel;
  //  wire [3:0] seldst;
  //  wire [3:0] selsrc;
    wire dstoe;
    wire srcoe;
    wire [7:0] IRJUMP;
    wire IRREF;
    wire SELJUMP;
    wire wren;
    wire [7:0] MBROUT;
    wire [7:0] MBRA;

ROMBasic U1 (PC,ROMDATA,clk,rst); 
IRDECODER U2 (INT,ROMDATA[15:8],IRJUMP,IRREF,SELJUMP,aluopsel,pcopsel,seldst,selsrc,state, IR, dstoe, srcoe, wren, clk, rst);
/*module IRDECODER(
    input wire INT,
    input wire [7:0] OPCODE,
    output reg [7:0] IRJUMP,
    output reg IRREF,
    output reg SELJUMP,
    output reg [3:0] aluopsel,
    output reg [1:0] pcopsel,
    output reg [3:0] seldst,
    output reg [3:0] selsrc,
    output reg [2:0] state,
    output reg [7:0] IR,
    output reg dstoe,
    output reg srcoe,
    input wire clk,
    input wire rst
    )
*/
datapath U3 (INR,OUTR,PC,ALUREsult,seldst,selsrc,IRJUMP,IRREF,SELJUMP,dstoe,srcoe,clk,aluopsel,pcopsel,rst,AYE,BEE,MAR,PCA, MBROUT, MBRA,ROMDATA[7:0]);

RAMINT U4 (ROMDATA[7:0], MBROUT, MBRA, wren, clk);        
endmodule