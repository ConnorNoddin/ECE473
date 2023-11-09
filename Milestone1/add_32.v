// Connor Noddin
// ECE 473
// Add Instruction
// 10/07/2023


module add_32(
	input wire [31:0] add_in1,
	input wire [31:0] add_in2,
	output reg [31:0] add_out);

always begin
	
	//No carry so this will loop back to 0
	add_out = add_in1 + add_in2; //Adds two numbers
	
end
	
endmodule
