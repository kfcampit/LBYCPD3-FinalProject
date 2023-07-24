`timescale 1ns / 1ps

//module DIG_COUNTER_SIX(
//    output wire overflow,
//    output wire underflow,
//    input wire rst_min,
//    input wire rst_max,
//    input wire inc,
//    input wire count,
//    input wire clk,
//    output wire [6:0] seven_seg,
//    output wire [2:0] num_tb
//    );

module DATAPATH_DIG(
        output wire [3:0] overflow,
        output wire [3:0] underflow,
        input wire [3:0] rst_min,
        input wire [3:0] rst_max,
        input wire [3:0] inc,
        input wire [3:0] count,
        input wire clk,
        output wire [6:0] digA,
        output wire [6:0] digB,
        output wire [6:0] digC,
        output wire [6:0] digD
    );

// 00:0X
DIG_COUNTER_TEN digit_A(
    overflow[0],
    underflow[0],
    rst_min[0],
    rst_max[0],
    inc[0],
    count[0],
    clk,
    digA
);

// 00:X0
DIG_COUNTER_SIX digit_B(
    overflow[1],
    underflow[1],
    rst_min[1],
    rst_max[1],
    inc[1],
    count[1],
    clk,
    digB
);

// 0X:00
DIG_COUNTER_TEN digit_C(
    overflow[2],
    underflow[2],
    rst_min[2],
    rst_max[2],
    inc[2],
    count[2],
    clk,
    digC
);

// X0:00
DIG_COUNTER_SIX digit_D(
    overflow[3],
    underflow[3],
    rst_min[3],
    rst_max[3],
    inc[3],
    count[3],
    clk,
    digD
);

endmodule
