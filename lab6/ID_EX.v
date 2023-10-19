// Connor Noddin
// ECE 473
// ID_EX Block
// 10/07/2023

module ID_EX(
	input wire clock,
	input wire reset,
	input wire [31:0] data_in_1,
	input wire [31:0] data_in_2,
	input wire [4:0] RD,
	output reg [31:0] D1,
	output reg [31:0] D2,
	output reg [4:0] RD_EX);
	
	// Write data on positive edge or reset
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			D1 <= 32'd0;
			D2 <= 32'd0;
			RD_EX <= 5'd0;
		end else begin
			D1 <= data_in_1;
			D2 <= data_in_2;
			RD_EX <= RD;
		end
	end
	
endmodule

