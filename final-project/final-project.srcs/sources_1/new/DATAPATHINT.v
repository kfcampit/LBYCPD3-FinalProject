`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 11:21:09
// Design Name: 
// Module Name: datapath
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
module datapath(
    input wire [7:0] PortIN, // INR
    output wire [7:0] PortOUT, // OUTR
    output wire [7:0] PCOUT,   // PC
    output wire [7:0] ALUREsult, // Primitive Chipscope
    input wire [2:0] seldst, // demux control
    input wire [2:0] selsrc, // sourcemux control
    input wire [7:0] IRJUMP,
    input wire IRREF,
    input wire SELJUMP,
    input wire dsten, // on or off demux
    input wire srcen, // on or off mux
    input wire clk, // clock
    input wire [7:0] op,  // alu operations selector
    input wire [2:0] pcopsel, // selects the operation of the PC
    input wire rst,
    output wire [7:0] AYEQ,
    output wire [7:0] BEEQ,
    output wire [7:0] MARQ,
    output wire [7:0] ACCAGP,
    output wire [7:0] MBROUT,
    input wire [7:0] MBRA,
    input wire [7:0] LIT
    );

wire [7:0] INA;
wire [7:0] INQ;
wire [7:0] OUTA;
wire [7:0] OUTQ;
wire [7:0] AYEA;
//wire [7:0] AYEQ;
wire [7:0] BEEA;
//wire [7:0] BEEQ;
wire [7:0] nulling;
wire [7:0] buswires;
wire [7:0] accagp;
//wire [7:0] PCA;
wire [7:0] pcjmp;
wire [7:0] MARA;
//wire [7:0] MBRA;
wire [7:0] MBRQ; 

wire [7:0] MBRQ5; 
wire [7:0] MBRQ4; 
wire [7:0] MBRQ3; 
wire [7:0] MBRQ2; 
wire [7:0] MBRQ1; 

wire [7:0] MBROUTA;

wire [7:0] STKA;
wire [7:0] STKQ; 


demux U1(AYEA,BEEA,PortOUT,pcjmp,MARA,MBROUTA,seldst,clk,buswires,dsten);
sourcemux U2(AYEQ,BEEQ,INQ,accagp,MBRQ,STKQ,selsrc,clk,buswires,srcen);

regbasic U3(INQ,PortIN,rst,clk);  // INR 
regbasic U4(AYEQ,AYEA,rst,clk);   // ACC
regbasic U5(BEEQ,BEEA,rst,clk);   // BREG
regbasic U8(MARQ,MARA,rst,clk);   // MAR
regbasic U17(MBROUT,MBROUTA,rst,clk);   // MAR

regbasic U9(MBRQ,MBRA,rst,clk); // MBR 
regbasic U12(MBRQ1,LIT,rst,clk); // MBR 
regbasic U13(MBRQ2,MBRQ1,rst,clk); // MBR 
regbasic U14(MBRQ3,MBRQ2,rst,clk); // MBR 
regbasic U15(MBRQ4,MBRQ3,rst,clk); // MBR 
regbasic U16(MBRQ5,MBRQ4,rst,clk); // MBR 

//RAMINT U17(MARQ, MBRQ, MBRA, ,rst, clk);
d4breg U10(PCOUT,clk,STKQ,IRREF); // Stack
//basicmux U6(AYEA,alutrib,alupsel,clk,accagp);
ALU U6(AYEQ,BEEQ, MBRQ5, op, accagp,ALUREsult,clk);
PC U7(MBRQ1,clk,pcopsel,rst,PCOUT);
basicmux U11 (IRJUMP,MARQ,SELJUMP,clk,ACCAGP);
    

    
endmodule
