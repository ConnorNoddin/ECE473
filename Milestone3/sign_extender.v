module sign_extender(
	input wire [31:0] imm_in, //32 bit instruction from instruction memory
	output reg [31:0] imm_ext); //Output string
	
always begin
	
if ((imm_in & 32'b00000000000000000000100000000000) == 32'b00000000000000000000100000000000)
	begin
		imm_ext = imm_in | 32'b11111111111111111111000000000000;
	end
else
	begin
		imm_ext = imm_in & 32'b00000000000000000000111111111111;
	end
	
end
	
endmodule

