// Connor Noddin
// ECE 473
// Program Counter
// 10/07/2023

module PC(
	input wire clock,
	input wire reset,
	input wire [31:0] next, //PC takes 32 bit input from add four
	input wire [31:0] IMM,
	input wire branchtaken,
	output reg [31:0] PC); //Output is PC
	
	integer count = 32'd0;
		
	// Positive clock PC saves new input
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			PC <= 32'd0; //Reset back to 0
			count = 0;
		end else if (count != 0) begin
			if (branchtaken == 1'b1) begin
				PC <= PC + IMM - 2;
			end else begin
				PC <= next;
			end
		end else begin
			count = count + 1;
		end

	end
	
endmodule
