`timescale 1ns / 1ps


module DIG_COUNTER_TEN(
    output wire overflow,
    output wire underflow,
    input wire rst_min,
    input wire rst_max,
    input wire inc,
    input wire count,
    input wire clk,
    output wire [6:0] seven_seg,
    output wire [3:0] num_tb
    );

reg over_reg;
reg under_reg;
reg [3:0] num;
reg [2:0] state;
reg [6:0] sevseg_reg;

always@(posedge clk)
begin
    if (rst_min)
    begin
        num = 0;
        state = 0;
        over_reg = 0;
        under_reg = 0;
        sevseg_reg = 0;
    end
    else if (rst_max)
    begin
        num = 4'd9;
        state = 0;
        over_reg = 0;
        under_reg = 0;
        sevseg_reg = 0;
     end
     else
     begin
         case (state)
            3'd0:
            begin
                if (count && !inc && num == 4'd0)
                begin
                    over_reg = 0;
                    under_reg = 1;
                end
                else if (count && inc && num == 4'd9)
                begin
                    over_reg = 1;
                    under_reg = 0;
                end
                else if (count && !inc && num != 4'd0)
                    state = 3'd1;
                else if (count && inc && num != 4'd9)
                    state = 3'd2;
            end
            
            3'd1:
            begin
                num = num - 1;
                state = 4'd0;
            end
            
            3'd2:
            begin
                num = num + 1;
                state = 4'd0;
            end
        endcase
        
        case (num)
            4'd0: sevseg_reg = 7'h3f;
            4'd1: sevseg_reg = 7'h06;
            4'd2: sevseg_reg = 7'h5b;
            4'd3: sevseg_reg = 7'h4f;
            4'd4: sevseg_reg = 7'h66;
            4'd5: sevseg_reg = 7'h6d;
            4'd6: sevseg_reg = 7'h7d;
            4'd7: sevseg_reg = 7'h07;
            4'd8: sevseg_reg = 7'h7f;
            4'd9: sevseg_reg = 7'h4f;
        endcase
    end
end

assign num_tb = num;

assign overflow = over_reg;
assign underflow = under_reg;

assign seven_seg = sevseg_reg;

endmodule
