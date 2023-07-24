`timescale 1ns / 1ps

module ROM(
    input wire [1:0] address,
    output reg [7:0] data,
    input wire clk,
    input wire rst
    );
    
always@(posedge clk)
begin
    if(rst) data = 8'h00;
    else
    begin
        case (address)
            2'b00:  data = 8'h00;
            2'b01:  data = 8'h00;
            2'b10:  data = 8'h00;
            2'b11:  data = 8'h00;
        endcase
    end
end
    
endmodule
