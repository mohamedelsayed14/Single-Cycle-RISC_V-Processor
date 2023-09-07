//main decoder
module main_decoder(input   [6:0] op,
							output [1:0] ALUOp,
							output [1:0] ext_imm_sel,
							output Mem_Write,Reg_Write,
							output [1:0] res_rd,
							output alu_src2,pc_jalr,pc_jal,branch);

  reg [11:0] signals;

  assign {ALUOp,ext_imm_sel,Mem_Write,Reg_Write,res_rd,alu_src2,pc_jalr,pc_jal,branch} = signals;
	
  always@(*)
    case(op)
//ALUOp, ext_imm_sel, Mem_Write, Reg_Write ,res_rd, alu_src2, pc_jalr, pc_jal, branch
	 7'd51	:signals = 12'b_10_xx_0_1_00_0_0_0_0; //R-TYPE
	 7'd19	:signals = 12'b_10_00_0_1_00_1_0_0_0; //I-TYPE(ALU)
	 7'd3	  :signals = 12'b_00_00_0_1_01_1_0_0_0; //I-TYPE(LW)
	 7'd103	:signals = 12'b_00_00_0_1_10_1_1_0_0; //I-TYPE(JALR)
	 7'd35	:signals = 12'b_00_01_1_0_00_1_0_0_0; //S-TYPE(SW)
	 7'd99	:signals = 12'b_01_10_0_0_00_0_0_0_1; //B-TYPE(BEQ,BNE)
	 7'd111	:signals = 12'b_00_11_0_1_10_0_0_1_0; //J-TYPE(JAL)
   default:signals = 12'b_xx_xx_x_x_xx_x_x_x_x; // non-implemented instruction
    endcase
endmodule 