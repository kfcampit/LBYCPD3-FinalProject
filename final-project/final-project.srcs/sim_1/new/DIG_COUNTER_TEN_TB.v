`timescale 1us / 1ps

module DIG_COUNTER_TEN_TB();

    reg rst_min, rst_max, inc, count, clk;
    wire overflow, underflow;
    wire [6:0] seven_seg;
    wire [3:0] num_tb;
    
    DIG_COUNTER_TEN U1 (
        .overflow(overflow),
        .underflow(underflow),
        .rst_min(rst_min),
        .rst_max(rst_max),
        .inc(inc),
        .count(count),
        .clk(clk),
        .seven_seg(seven_seg),
        .num_tb(num_tb)
    );
    
    always #1 clk = ~clk;
    initial
    begin
        rst_min = 1; rst_max = 0; inc = 1; count = 0; clk = 0;
        
        #2 rst_min = 0;
        #2 count = 1;
        #50;
        
        #2 rst_min = 1;
        #2 rst_min = 0;
        #2 count = 1;
        #50;
        
        #2 rst_min = 0; rst_max = 1; inc = 0;
        #2 rst_max = 0;
        #2 count = 1;
        #50;
        
        #2 rst_max = 1;
        #2 rst_max = 0;
        #2 count = 1;
        #24;
        
    end
    
    

endmodule
