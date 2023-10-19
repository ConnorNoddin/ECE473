// Connor Noddin
// ECE 473
// Register File
// 10/07/2023


module register_file(
	// Inputs and outputs exactly as shown in lab handout
	input wire [4:0] read_address_1,
	input wire [4:0] read_address_2,
	input wire [31:0] write_data_in,
	input wire [4:0] write_address,
	input wire WriteEnable,
	input wire reset,
	input wire clock,
	input wire [4:0] read_address_debug,
	input wire clock_debug,
	output reg [31:0] data_out_1,
	output reg [31:0] data_out_2,
	output reg [31:0] data_out_debug);
	
	reg [31:0] reg_array [0:31]; //32x32 bit array of reg_array
		
	/* Main loop for setting registers */
	always @(posedge clock or posedge reset) begin
		// First checks if reset enabled
		if (reset == 1'b1) begin
			/* Lab specifies reg_array[i] = i */
			reg_array[0] <= 32'd0;
			reg_array[1] <= 32'd1;
			reg_array[2] <= 32'd2;
			reg_array[3] <= 32'd3;
			reg_array[4] <= 32'd4;
			reg_array[5] <= 32'd5;
			reg_array[6] <= 32'd6;
			reg_array[7] <= 32'd7;
			reg_array[8] <= 32'd8;
			reg_array[9] <= 32'd9;
			reg_array[10] <= 32'd10;
			reg_array[11] <= 32'd11;
			reg_array[12] <= 32'd12;
			reg_array[13] <= 32'd13;
			reg_array[14] <= 32'd14;
			reg_array[15] <= 32'd15;
			reg_array[16] <= 32'd16;
			reg_array[17] <= 32'd17;
			reg_array[18] <= 32'd18;
			reg_array[19] <= 32'd19;
			reg_array[20] <= 32'd20;
			reg_array[21] <= 32'd21;
			reg_array[22] <= 32'd22;
			reg_array[23] <= 32'd23;
			reg_array[24] <= 32'd24;
			reg_array[25] <= 32'd25;
			reg_array[26] <= 32'd26;
			reg_array[27] <= 32'd27;
			reg_array[28] <= 32'd28;
			reg_array[29] <= 32'd29;
			reg_array[30] <= 32'd30;
			reg_array[31] <= 32'd31;
	
		//Reset 0 and writeenable enabled
		end else if (WriteEnable == 1'b1) begin
			reg_array[write_address] <= write_data_in;
		end
	end
	
	// Does reading only on falling edge of clock
	always @(negedge clock) begin
		// Reads registers from input addresses
		data_out_1 <= reg_array[read_address_1];
		data_out_2 <= reg_array[read_address_2];
	end
	
	//Debugging mode
	always @(posedge clock_debug) begin
		data_out_debug <= reg_array[read_address_debug];
	end	
	
endmodule
