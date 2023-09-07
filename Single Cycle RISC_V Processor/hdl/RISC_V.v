//single cycle risc_v 32_bit archteciter
//control_path & data_path 
//top module of risc_v
module RISC_V (input  clk, reset,
               input  [31:0] instr,
					output [31:0] pc,
					output Mem_Write,
					output [31:0] a_data_mem,w_data_mem,
				   input  [31:0] r_data_mem);
 
wire Zero, Reg_Write, alu_src2, pc_jalr, pc_src;
wire [2:0] alu_control;
wire [1:0] ext_imm_sel, res_rd;

control_path cu (instr[6:0], instr[14:12], instr[30], Zero, alu_control,ext_imm_sel,
                 Mem_Write, Reg_Write, res_rd,alu_src2, pc_jalr, pc_src);
  
data_path du (clk, reset, pc, instr[31:7], w_data_mem,a_data_mem,r_data_mem,Zero,
               alu_control,ext_imm_sel,Reg_Write,res_rd,alu_src2, pc_jalr, pc_src);
 
endmodule 