//instruction memory
module inst_mem #(parameter WIDTH=32,parameter DEPTH=32 )
							(input   [DEPTH-1:0] addrs,
							 output  [WIDTH-1:0] rd);

reg [WIDTH-1:0] ROM [0:255]; //memory size = 1k_byte

  initial
      $readmemh("riscv_test.txt",ROM);

assign rd = ROM[{24'd0,addrs[9:2]}];
//addrs[9:2] to make each 4-bytes make a word (word access)
endmodule 