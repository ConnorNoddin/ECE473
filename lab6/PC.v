// Connor Noddin
// ECE 473
// Program Counter
// 10/07/2023

module PC(
	input wire clock,
	input wire reset,
	input wire [31:0] next, //PC takes 32 bit input from add four
	output reg [31:0] PC); //Output is PC
	
	// Positive clock PC saves new input
	always @(posedge clock or posedge reset) begin
		if(reset == 1'b1) begin
			PC <= 32'd0; //Reset back to 0
		end else begin
			PC <= next;
		end
	end	
endmodule
