// Connor Noddin
// ECE 473
// MEM_WB block
// 10/07/2023

module MEM_WB(
	input wire clock,
	input wire reset,
	input wire [31:0] D2,
	input wire [4:0] RD,
	input wire RegWrite_in,
	input wire [31:0] IMM_IN,
	input wire branchtaken,
	output reg [31:0] D2_WB,
	output reg [4:0] RD_WB,
	output reg RegWrite_WB,
	output reg [31:0] IMM_WB,
	output reg branchtaken_WB);
	
	// Write data on positive edge or reset
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			D2_WB <= 32'd0;
			RD_WB <= 5'd0;
			RegWrite_WB <= 1'd0;
				branchtaken_WB <= 1'd0;
			IMM_WB <= 32'd0;
		end else begin
			D2_WB <= D2;
			RD_WB <= RD;
			RegWrite_WB <= RegWrite_in;
			branchtaken_WB <= branchtaken;
			IMM_WB <= IMM_IN;
		end
	end
	
endmodule

