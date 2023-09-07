//soc risc_v and data_memory and instructer_memory
//integration module
module RISC_V_SOC (input clk,reset);
 
wire [31:0] instr, pc;
wire Mem_Write;
wire [31:0] a_data_mem, w_data_mem;
wire [31:0] r_data_mem;

RISC_V    risc_v (clk, reset, instr, pc, Mem_Write, a_data_mem, w_data_mem, r_data_mem);				
inst_mem  i_m    (pc, instr);					 
data_mem  d_m    (clk, Mem_Write, a_data_mem, w_data_mem, r_data_mem);
 
endmodule  