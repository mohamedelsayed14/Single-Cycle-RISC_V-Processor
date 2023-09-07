//main_controller
module control_path (input  [6:0] op,
							input  [2:0] funct3,
							input  funct7_b5,
							input  Zero,
                     output [2:0] alu_control,
							output [1:0] ext_imm_sel,
							output Mem_Write,Reg_Write,
							output [1:0] res_rd,
							output alu_src2, pc_jalr, pc_src);

wire [1:0] ALUOp;
wire pc_jal, branch, beq, bne;
assign beq=~funct3[0];
assign bne= funct3[0];

assign pc_src = pc_jal | pc_jalr | (branch & (beq & Zero| bne & ~Zero));

main_decoder m1 (op, ALUOp, ext_imm_sel, Mem_Write, Reg_Write,
						res_rd, alu_src2, pc_jalr, pc_jal, branch);

alu_decoder m2 (op[5], funct3, funct7_b5, ALUOp, alu_control);

endmodule 