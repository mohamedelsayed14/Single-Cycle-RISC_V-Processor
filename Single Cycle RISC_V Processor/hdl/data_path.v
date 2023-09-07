//data_path
module data_path  (input  clk, reset,
						 output [31:0] pc,
						 input  [31:7]instr,
						 output [31:0]w_data_mem,a_data_mem,
						 input  [31:0]r_data_mem,
						 output  Zero,
                   input  [2:0] alu_control,
						 input  [1:0] ext_imm_sel,
						 input   Reg_Write,
						 input  [1:0] res_rd,
						 input   alu_src2, pc_jalr, pc_src);

wire[31:0] pc_next,pc_plus4,pc_target_addr,pc_sr1,imm_ext,wd3,rd1, rd2,alu_b,alu_result;

//data mem
assign w_data_mem=rd2;
assign a_data_mem=alu_result;

//program counter
pc_flip u1_ff1 (clk, reset, pc_next, pc);
mux2 u3_m1 (pc_plus4, pc_target_addr, pc_src, pc_next);
adder u2_add1 (pc,32'd4,pc_plus4);
adder u4_add2 (pc_sr1,imm_ext ,pc_target_addr);
mux2 u5_m2 (pc,rd1 , pc_jalr, pc_sr1);

//extend
imm_extend u6_imm1 (instr[31:7],ext_imm_sel, imm_ext);

//reg_file
reg_file u7_regf1(clk,Reg_Write, instr[19:15], instr[24:20],instr[11:7], wd3,rd1, rd2);

mux2 u8_m3 (rd2,imm_ext ,alu_src2, alu_b);

//alu
alu u9_alu1 (alu_control,rd1,alu_b,alu_result, Zero);

mux4 u10_m4(alu_result,r_data_mem,pc_plus4, ,res_rd,wd3);

endmodule 