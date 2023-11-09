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
	input wire [31:0] imm_in,
	input wire AluSrc_in,
	input wire DataRead_in,
	input wire MemWrite_in,
	input wire RegWrite_in,
	input wire [6:0] opcode_in,
	input wire [2:0] funct3_in,
	input wire [6:0] funct7_in,
	output reg AluSrc_EX,
	output reg [31:0] D1,
	output reg [31:0] D2,
	output reg [4:0] RD_EX,
	output reg [31:0] imm_EX,
	output reg DataRead_EX,
	output reg MemWrite_EX,
	output reg RegWrite_EX,
	output reg [6:0] opcode_EX,
	output reg [2:0] funct3_EX,
	output reg [6:0] funct7_EX);
	
	// Write data on positive edge or reset
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			D1 <= 32'd0;
			D2 <= 32'd0;
			RD_EX <= 5'd0;
			AluSrc_EX <= 1'd0;
			imm_EX <= 32'd0;
			DataRead_EX <= 1'd0;
			MemWrite_EX <= 1'd0;
			RegWrite_EX <= 1'd0;
			opcode_EX <= 7'd0;
			funct3_EX <= 3'd0;
			funct7_EX <= 7'd0;
		end else begin
			D1 <= data_in_1;
			D2 <= data_in_2;
			RD_EX <= RD;
			AluSrc_EX <= AluSrc_in;
			imm_EX <= imm_in;
			DataRead_EX <= DataRead_in;
			MemWrite_EX <= MemWrite_in;
			RegWrite_EX <= RegWrite_in;
			opcode_EX <= opcode_in;
			funct3_EX <= funct3_in;
			funct7_EX <= funct7_in;
		end
	end
	
endmodule

