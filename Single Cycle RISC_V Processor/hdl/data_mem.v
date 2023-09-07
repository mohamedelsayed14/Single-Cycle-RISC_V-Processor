//data memory
module data_mem (input   clk, we,
                 input   [31:0] addrs,
					  input   [31:0] wd,
                 output  [31:0] rd);

  reg [31:0] RAM [0:255];  //memory size = 1k_byte
 
//write operation
  always@(posedge clk)
    if (we) RAM[{24'd0,addrs[9:2]}] <= wd;
//{addrs[9:2]} to make each 4-bytes make a word (word access) 
//read opertaion	 
	 assign rd = RAM[{24'd0,addrs[9:2]}];
endmodule 