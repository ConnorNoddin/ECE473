// Connor Noddin
// ECE 473
// Add Instruction
// 10/07/2023


module add_32(
	input wire [31:0] add_in1,
	input wire [31:0] add_in2,
	output wire [31:0] add_out);
	
	//No carry so this will loop back to 0
	wire [31:0] sum = add_in1 + add_in2; //Add four to input register
   assign      add_out = sum[31:0]; //Assign output register to new value
	
endmodule
