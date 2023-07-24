`timescale 1ns / 1ps

module IRDEC(
        input wire inc_button,
        input wire dec_button,
        input wire hr_mn_button,
        input wire change_button,
        
        input wire [7:0] config_code,
        output reg [1:0] address,
        
        input wire [3:0] overflow,
        input wire [3:0] underflow,
        output reg [3:0] rst_min,
        output reg [3:0] rst_max,
        output reg [3:0] inc,
        output reg [3:0] count,
        
        input wire clk,
        input wire rst
    );
endmodule
