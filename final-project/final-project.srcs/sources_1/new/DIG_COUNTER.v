`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2023 02:52:44 PM
// Design Name: 
// Module Name: DIG_COUNTER
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


module DIG_COUNTER_SIX(
    output wire overflow,
    output wire underflow,
    input wire rst_min,
    input wire rst_max,
    input wire inc,
    input wire count,
    input wire clk,
    output wire [6:0] seven_seg,
    output wire [2:0] num_tb
    );

reg over_reg;
reg under_reg;
reg [2:0] num;
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
        num = 3'd6;
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
                if (count && !inc && num == 3'd0)
                begin
                    over_reg = 0;
                    under_reg = 1;
                end
                else if (count && inc && num == 3'd6)
                begin
                    over_reg = 1;
                    under_reg = 0;
                end
                else if (count && !inc && num != 3'd0)
                    state = 3'd1;
                else if (count && inc && num != 3'd6)
                    state = 3'd2;
            end
            
            3'd1:
            begin
                num = num - 1;
                state = 3'd0;
            end
            
            3'd2:
            begin
                num = num + 1;
                state = 3'd0;
            end
        endcase
    end
end

assign num_tb = num;

assign overflow = over_reg;
assign underflow = under_reg;

assign seven_seg = sevseg_reg;

endmodule
