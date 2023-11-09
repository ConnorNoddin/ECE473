`include "riscv_defs.v"

//Preprocessor statements for extracting immediate bits
`define UIMM20 {inst[31:12], 12'b0}
`define IIMM12 {{20{inst[31]}}, inst[31:20]}
`define BIMM   {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0}
`define JIMM20 {{12{inst[31]}}, inst[19:12], inst[20], inst[30:25], inst[24:21], 1'b0}
`define STIMM  {{20{inst[31]}}, inst[31:25], inst[11:7]}
`define SHAMT  inst[24:20] 


module decoder(
	input wire [31:0] inst, //32 bit instruction from instruction memory
	output reg [6:0] opcode,
	output reg [4:0] rd,
	output reg [4:0] rs1,
	output reg [4:0] rs2,
	output reg [31:0] imm,
	output reg[2:0] funct3,
	output reg[6:0] funct7); //Output string
	
always begin

	reg [2:0] instruction_class;

	begin
	
	//First decode R type instructions
	if((inst & `INST_ADD_MASK) == `INST_ADD)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_SUB_MASK) == `INST_SUB)
	begin 
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_XOR_MASK) == `INST_XOR)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_OR_MASK) == `INST_OR)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_AND_MASK) == `INST_AND)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_SLL_MASK) == `INST_SLL)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_SRL_MASK) == `INST_SRL)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_SRA_MASK) == `INST_SRA)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_SLT_MASK) == `INST_SLT)
	begin
		instruction_class = 3'd0;
	end
	else if ((inst & `INST_SLTU_MASK) == `INST_SLTU)
	begin
		instruction_class = 3'd0;
	end
	
	//I type instructions
	else if ((inst & `INST_ADDI_MASK) == `INST_ADDI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_XORI_MASK) == `INST_XORI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_ORI_MASK) == `INST_ORI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_ANDI_MASK) == `INST_ANDI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_SLLI_MASK) == `INST_SLLI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_SRLI_MASK) == `INST_SRLI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_SRAI_MASK) == `INST_SRAI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_SLTI_MASK) == `INST_SLTI)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_SLTIU_MASK) == `INST_SLTIU)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_LB_MASK) == `INST_LB)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_LH_MASK) == `INST_LH)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_LW_MASK) == `INST_LW)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_LBU_MASK) == `INST_LBU)
	begin
		instruction_class = 3'd1;
	end
	else if ((inst & `INST_LHU_MASK) == `INST_LHU)
	begin
		instruction_class = 3'd1;
	end
	
	//S type instructions
	else if ((inst & `INST_SB_MASK) == `INST_SB)
	begin
		instruction_class = 3'd2;
	end
	else if ((inst & `INST_SH_MASK) == `INST_SH)
	begin
		instruction_class = 3'd2;
	end
	else if ((inst & `INST_SW_MASK) == `INST_SW)
	begin
		instruction_class = 3'd2;
	end
	
	//B type Instructions
	else if ((inst & `INST_BEQ_MASK) == `INST_BEQ)
	begin
		instruction_class = 3'd3;
	end
	else if ((inst & `INST_BNE_MASK) == `INST_BNE)
	begin
		instruction_class = 3'd3;
	end
	else if ((inst & `INST_BLT_MASK) == `INST_BLT)
	begin
		instruction_class = 3'd3;
	end
	else if ((inst & `INST_BGE_MASK) == `INST_BGE)
	begin
		instruction_class = 3'd3;
	end
	else if ((inst & `INST_BLTU_MASK) == `INST_BLTU)
	begin
		instruction_class = 3'd3;
	end
	else if ((inst & `INST_BGEU_MASK) == `INST_BGEU)
	begin
		instruction_class = 3'd3;
	end
	
	//J type instructions
	else if ((inst & `INST_JAL_MASK) == `INST_JAL)
	begin
		instruction_class = 3'd5;
	end
	
	//I type instructions
	else if ((inst & `INST_JALR_MASK) == `INST_JALR)
	begin
		instruction_class = 3'd1;
	end
	
	//U type instructions
	else if ((inst & `INST_LUI_MASK) == `INST_LUI)
	begin
		instruction_class = 3'd4;
	end
	else if ((inst & `INST_AUIPC_MASK) == `INST_AUIPC)
	begin
		instruction_class = 3'd4;
	end
	end
	
	//Initial Values
	opcode = 7'b0;
	rd = 5'b0;
	rs1 = 5'b0;
	rs2 = 5'b0;
	funct3 = 3'b0;
	funct7 = 7'b0;
	imm = 32'b0;
	
	//Set outputs based on type of instruction
	case (instruction_class)

			//R
			3'd0:	begin
					opcode[6:0] = inst[6:0];
					rd[4:0] = inst[11:7];
					rs1[4:0] = inst[19:15];
					rs2[4:0] = inst[24:20];
					funct3[2:0] = inst[14:12];
					funct7[6:0] = inst[31:25];
					imm[31:0] = 32'b0;
					end
			
			//I
			3'd1: begin
					opcode[6:0] = inst[6:0];
					rd[4:0] = inst[11:7];
					rs1[4:0] = inst[19:15];
					rs2[4:0] = 5'b0;
					funct3[2:0] = inst[14:12];
					funct7[6:0] = 7'b0;
					imm[11:0] = inst[31:20];
					end
			
			//S
			3'd2: begin
					opcode[6:0] = inst[6:0];
					rd[4:0] = inst[11:7];
					rs1[4:0] = inst[19:15];
					rs2[4:0] = inst[24:20];
					funct3[2:0] = inst[14:12];
					funct7[6:0] = 7'b0;
					imm[4:0] = inst[11:7];
					imm[11:5] = inst[31:25];
					end
				
			//B	
			3'd3: begin
					opcode[6:0] = inst[6:0];
					rd[4:0] = inst[11:7];
					rs1[4:0] = inst[19:15];
					rs2[4:0] = inst[24:20];
					funct3[2:0] = inst[14:12];
					funct7[6:0] = 7'b0;
					imm[4:0] = inst[11:7];
					imm[11:5] = inst[31:25];
					end
			
			//U
			3'd4: begin
					opcode[6:0] = inst[6:0];
					rd[4:0] = inst[11:7];
					rs1[4:0] = 5'b0;
					rs2[4:0] = 5'b0;
					funct3[2:0] = 3'b0;
					funct7[6:0] = 7'b0;
					imm[19:0] = inst[31:12];
					end
			//J		
			3'd5: begin
					opcode[6:0] = inst[6:0];
					rd[4:0] = inst[11:7];
					rs1[4:0] = 5'b0;
					rs2[4:0] = 5'b0;
					funct3[2:0] = 3'b0;
					funct7[6:0] = 7'b0;
					imm[19:0] = inst[31:12];
					end
					
			default: begin
					opcode[6:0] = inst[6:0];
					rd[4:0] = inst[11:7];
					rs1[4:0] = inst[19:15];
					rs2[4:0] = inst[24:20];
					funct3[2:0] = inst[14:12];
					funct7[6:0] = inst[31:25];
					imm[31:0] = 32'b0;
					end
					
				
	endcase
	
	end
	
endmodule

