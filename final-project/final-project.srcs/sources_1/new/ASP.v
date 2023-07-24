`timescale 1ns / 1ps

module ASP(
        input wire inc_button,
        input wire dec_button,
        input wire hr_mn_button,
        input wire change_button,
        
        output wire [6:0] seven_seg_A,
        output wire [6:0] seven_seg_B,
        output wire [6:0] seven_seg_C,
        output wire [6:0] seven_seg_D,
        
        input wire clk,
        input wire rst
    );
    
wire [7:0] config_code;
wire [1:0] address;

wire [3:0] overflow;
wire [3:0] underflow;
wire [3:0] rst_min;
wire [3:0] rst_max;
wire [3:0] inc;
wire [3:0] count;

IRDEC U1(
    inc_button,
    dec_button,
    hr_mn_button,
    change_button,
    
    config_code,
    address,
    
    overflow,
    underflow,
    rst_min,
    rst_max,
    inc,
    count,
    
    clk,
    rst
);

ROM U2(
    address,
    config_code,
    clk,
    rst
);


DATAPATH_DIG U3(
    overflow,
    underflow,
    rst_min,
    rst_max,
    inc,
    count,  
    clk,
    
    seven_seg_A,
    seven_seg_B,
    seven_seg_C,
    seven_seg_D
);

endmodule
