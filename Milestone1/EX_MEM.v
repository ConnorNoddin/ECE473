// Connor Noddin
// ECE 473
// ID_EX Block
// 10/07/2023

module EX_MEM(
	input wire clock,
	input wire reset,
	input wire [31:0] D1_IN,
	input wire [31:0] D2_IN,
	input wire [4:0] RD_IN,
	input wire DataRead_IN,
	input wire MemWrite_IN,
	input wire RegWrite_IN,
	input wire [31:0] IMM_IN,
	input wire branchtaken,
	output reg [31:0] D1_MEM,
	output reg [31:0] D2_MEM,
	output reg [4:0] RD_MEM,
	output reg DataRead_MEM,
	output reg MemWrite_MEM,
	output reg RegWrite_MEM,
	output reg [31:0] IMM_MEM,
	output reg branchtaken_out);
	
	// Write data on positive edge or reset
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			D1_MEM <= 32'd0;
			D2_MEM <= 32'd0;
			RD_MEM <= 5'd0;
			DataRead_MEM <= 1'd0;
			MemWrite_MEM <= 1'd0;
			RegWrite_MEM <= 1'd0;
			branchtaken_out <= 1'd0;
			IMM_MEM <= 32'd0;
		end else begin
			D1_MEM <= D1_IN;
			D2_MEM <= D2_IN;
			RD_MEM <= RD_IN;
			DataRead_MEM <= DataRead_IN;
			MemWrite_MEM <= MemWrite_IN;
			RegWrite_MEM <= RegWrite_IN;
			branchtaken_out <= branchtaken;
			IMM_MEM <= IMM_IN;
		end
	end
	
endmodule

