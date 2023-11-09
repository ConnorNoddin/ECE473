// Connor Noddin
// ECE 473
// Add Instruction
// 10/07/2023


module ALU(
	input wire [31:0] add_in1,
	input wire [31:0] add_in2,
	input wire [6:0] opcode,
	input wire [2:0] funct3,
	input wire [6:0] funct7,
	output reg [31:0] add_out,
	output reg branchtaken);

always begin
	
	//No carry so this will loop back to 0
	branchtaken = 1'b0;
	add_out = 32'd0; //Adds two numbers
		
if (opcode == 7'b0110011) // R type
	begin
		if (funct3 == 3'b000) begin
			add_out = add_in1 + add_in2; //Adds two numbers
		end
		else if (funct3 == 3'b110) begin
			add_out = add_in1 | add_in2; //Ors two numbers
		end
	end
	
else if (opcode == 7'b0010011) // I type
	begin
		if (funct3 == 3'b000) begin
			add_out = add_in1 + add_in2; //Adds two numbers
		end
		else if (funct3 == 3'b110) begin
			add_out = add_in1 | add_in2; //Ors two numbers
		end
	end
	
else if (opcode == 7'b0000011) // Loads
	begin
		add_out = add_in1 + add_in2; //Adds two numbers
	end
	
else if (opcode == 7'b0100011) // Stores
	begin
		add_out = add_in1 + add_in2; //Adds two numbers
	end
	
else if (opcode == 7'b1100011) // Branches
	begin
		if (funct3== 3'b000) begin
			if (add_in1 == add_in2) begin
				branchtaken = 1'b1;
				add_out = 32'd0; //Adds two numbers
			end
		end
	end
	
else begin
	add_out = 32'd0; //Adds two numbers
end
	
end
	
endmodule
