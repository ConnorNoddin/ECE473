// Connor Noddin
// ECE 473
// MEM_WB block
// 10/07/2023

module MEM_WB(
	input wire clock,
	input wire reset,
	input wire [31:0] D2,
	input wire [4:0] RD,
	output reg [31:0] D2_WB,
	output reg [4:0] RD_WB);
	
	// Write data on positive edge or reset
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			D2_WB <= 32'd0;
			RD_WB <= 5'd0;
		end else begin
			D2_WB <= D2;
			RD_WB <= RD;
		end
	end
	
endmodule

