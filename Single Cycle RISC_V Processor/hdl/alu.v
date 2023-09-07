//alu unit
//support add,sub,and,or,xor,slt,sll,srl
module alu(input [2:0] alu_control,
			  input signed [31:0] a, b,
           output reg signed [31:0] result,
           output zero);

  wire signed [31:0] b_invb, sum;
  assign b_invb = alu_control[0] ? ~b : b;    
  assign sum = a + b_invb + alu_control[0];     
 //  alu_control[0]=0 in add ,alu_control[0]=1 in sub  
 
  always@(*)
  begin
    case (alu_control)
      3'd0:  result = sum;         			// add
      3'd1:  result = sum;         			// subtract
      3'd2:  result = a & b;       			// and
      3'd3:  result = a | b;          	// or
		  3'd4:  result = a ^ b;            // xor
		  3'd5:  result = {31'd0,sum[31]};  // slt
      3'd6:  result = a << b[4:0]; 			// sll
      3'd7:  result = a >> b[4:0]; 			// srl
      default: result = 32'bx;
    endcase
  end
  assign zero = ~ (| result);
endmodule 