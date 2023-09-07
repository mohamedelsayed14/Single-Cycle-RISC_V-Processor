//register file 
//three ported
//async two ports for read [a1/rd1  ,  a2/rd2]
//sync one port for write [a3,wd3,we3]
//if read_address==0  >> output=0  (X0=0)

module reg_file (input   clk,we3, 
                 input   [4:0]  a1, a2, a3, 
                 input   [31:0] wd3, 
                 output  [31:0] rd1, rd2);

reg [31:0] reg_f [31:0];

//write operation
  always@(posedge clk)
    if (we3) reg_f[a3] <= wd3;	
//read operation
//if read address == 0 then rd=0 ,   else rd=reg_f[a]
  assign rd1 = (a1 != 0) ? reg_f[a1] : 32'd0;
  assign rd2 = (a2 != 0) ? reg_f[a2] : 32'd0;
endmodule 