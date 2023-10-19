//Inputs and outputs as defined in the lab manual
module control(input wire reset,
					input wire one,
					input wire x0,
					input wire clk,
					output reg wen,
					output reg sel,
					output reg fs1,
					output reg fs0);
					 
// 3 bits is required for 5 states
reg[2:0] current, next; //Current and next states

//Assigns integers to state names
parameter s0 = 0,
			 s1 = 1,
		  	 s2 = 2,
			 s3 = 3,
			 s4 = 4;
				
//Logic for determining next state and outputs		
always @ (clk) //Every clock cycle

	begin : state_logic
	
		case(current)
		
			// State 0 activities... default state
			s0: begin
				if (reset == 1'b1) begin //Only begins on reset
					sel = 1'b0; // sel is 0 in all cases
					if (one == 1'b1) begin	//We started as one
						fs1 = 1'b0;
						fs0 = 1'b0;
						wen = 1'b0;
						next = s1;
					//Odd case
					end else if (x0 == 1'b1) begin
						fs1=1'b1;
						fs0=1'b1;
						wen = 1'b1; // Write enable is only on when going to state 2
						next = s2;
					//Even case
					end else begin
						fs1=1'b1;
						fs0=1'b0;
						wen = 1'b0;
						next = s4;
					end
				end

			end
				
				
			// State 1 activities
			//Final reached 1... all values 0. Have to reset
			s1: begin
				fs1 = 1'b0;
				fs0 = 1'b0;
				wen = 1'b0;
				sel = 1'b1;
				if (reset == 1'b0) begin
					next = s1; // Always loops to s0
				end else begin
					next = s0; // Goes back to state 0 on reset
				end
			end
			
			
			// State 2 activities
			s2: begin
				fs1 = 1'b0;
				fs0 = 1'b1;
				wen = 1'b0;
				sel = 1'b1;
				next = s3; // Always goes to state 3
			end
			
			
			// State 3 activities
			s3: begin
				fs1 = 1'b1;
				fs0 = 1'b0;
				wen = 1'b0;
				next = s4; // Always goes to state 4
				sel = 1'b1;
			end
			
			// State 4 activities
			s4: begin
				sel = 1'b1; //Sel is 1 in all cases
				if (one == 1'b1) begin //We reached one!		
					fs1 = 1'b0;
					fs0 = 1'b0;
					wen = 1'b0;
					next = s1;
				// Checks if even
				end else if (x0 == 1'b0) begin
					fs1 = 1'b1;
					fs0 = 1'b0;
					wen = 1'b0;
					next = s4; // Loops back to self
				//Checks if odd
				end else begin
					fs1 = 1'b1;
					fs0 = 1'b1;
					wen = 1'b1;
					next = s2;
				end
			end
			
			default: next=s0; //Initial entry point (always state at state 0)
			
		endcase
	
		//Current will be 0 for first iteration
		//current = next; //Sets current state to next for next clk
	
	end
	
	always @ (posedge clk)
		begin : procede
			current = next;
		end
		

endmodule
