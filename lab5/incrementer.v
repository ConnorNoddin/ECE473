// Connor Noddin
// ECE 473
// Program Counter Incrementer
// 10/07/2023


module incrementer(
	input wire [31:0] add_in,
	output wire [31:0] add_out);
	
	//No carry so this will loop back to 0
	assign add_out  = (add_in + 32'd1);

endmodule
