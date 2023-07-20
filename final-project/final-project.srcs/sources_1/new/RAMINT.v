module RAMINT(addr, data_in, data_out, wr_en, clk);

input [7:0] addr;
input [7:0] data_in;
output [7:0] data_out;
input wr_en, clk;

reg [7:0] Mem[0:1023];
reg [7:0] internal_bus;

initial internal_bus = Mem[addr];	// initialize what's at the output

always @addr internal_bus = Mem[addr];	// update what's at the output

always @(posedge clk)
   if (wr_en == 1) 
	begin
	Mem[addr] = data_in;		// load value into memory
	//internal_bus = Mem[addr]; 	// update what's at the output
	end
    else
    begin
    internal_bus = Mem[addr];
    end

assign data_out = internal_bus;

endmodule