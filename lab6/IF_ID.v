// Connor Noddin
// ECE 473
// IF_ID Block
// 10/07/2023

module IF_ID(
	input wire clock,
	input wire reset,
	input wire [31:0] INSTR_IN, //Instruction out from instruction memory
	output reg [31:0] INSTR);
	
	// Saves value only on rising edge
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			INSTR <= 32'd0; //Back to 0 upon reset
		end else begin
			INSTR <= INSTR_IN;
		end
	end
	
	
endmodule
