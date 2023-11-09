module forwarding(
	input wire [4:0] rs1_e, //32 bit instruction from instruction memory
	input wire [4:0] rs2_e,
	input wire [4:0] rs1_m,
	input wire [4:0] rs2_m,
	input wire [4:0] rs1_w,
	input wire [4:0] rs2_w,
	output reg [1:0] forward_sig); //Output string
	
always begin
	
// R Type Opcodes
if(rs1_e == rs1_m) begin
	forward_sig = 2'b10;
	end
	
else if (rs1_e == rs1_w) begin
	forward_sig = 2'b01;
end
	
else begin
	forward_sig = 2'b00;
end

end
	
endmodule
