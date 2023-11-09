module controller(
	input wire [2:0] funct3, //32 bit instruction from instruction memory
	input wire [6:0] funct7,
	input wire [6:0] opcode,
	output reg AluSrc,
	output reg DataRead,
	output reg MemWrite,
	output reg RegWrite); //Output string
	
always begin
	
// R Type Opcodes
if(opcode == 7'b0110011) begin
		AluSrc = 1'b0;
		DataRead = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
	end
	
// I Type Opcodes
else if(opcode == 7'b0010011) begin
		AluSrc = 1'b1;
		DataRead = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
	end
	
	// I Type Opcodes Loads
else if(opcode == 7'b0000011) begin
		AluSrc = 1'b1;
		DataRead = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
	end
	
	// S Type Opcodes Loads
else if(opcode == 7'b0100011) begin
		AluSrc = 1'b1;
		DataRead = 1'b0; // Doesnt Matter
		MemWrite = 1'b1;
		RegWrite = 1'b0;
	end
	
end
	
endmodule

