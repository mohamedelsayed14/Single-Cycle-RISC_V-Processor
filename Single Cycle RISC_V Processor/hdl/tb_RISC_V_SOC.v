//testbench module
//soc risc_v and data_memory and instructer_memory
`timescale 1ns/1ps
module tb_RISC_V_SOC ();

//*********soc***************************************************
//reg clk,reset;
//RISC_V_SOC dft(clk,reset); 
//***************************************************************

reg clk,reset;
wire [31:0] instr,pc;
wire Mem_Write;
wire [31:0] a_data_mem, w_data_mem;
wire [31:0] r_data_mem;

RISC_V     risc_v (clk, reset, instr, pc, Mem_Write, a_data_mem, w_data_mem, r_data_mem);			
inst_mem   i_m    (pc, instr);				 
data_mem   d_m    (clk, Mem_Write, a_data_mem, w_data_mem, r_data_mem);
/////////////////////////////////////////////////////////////////

// initialize reset
  initial
    begin
       reset = 1;
	#5; reset = 0;
    end
	 
// generate clock
  always
    begin
   clk = 1;
	#5; 
	clk = 0;
	#5;
    end
 
endmodule  