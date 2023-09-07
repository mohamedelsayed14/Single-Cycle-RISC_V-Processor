//alu decoder
module alu_decoder(input op_b5,
						input [2:0] funct3,
						input  funct7_b5, 
						input  [1:0] ALUOp,
						output reg [2:0] alu_control);

  always@(*)
    case(ALUOp)
	   //I-TYPE(LW), S-TYPE(SW), I_TYPE(JALR),J-TYPE(JAL)
      //OP= 3     , 35		   ,  103        , 111   
      2'b00:alu_control = 3'd0;   // addition
		
		//B-TYPE(BEQ, BNE)
		//OP = 99
      2'b01:alu_control = 3'd1;  // subtraction
		
		//R-TYPE(ALL), I-TYPE(ALU)
		//OP = 51(0110011) ,19(0010011) 
      2'b10: case(funct3)
		
                 3'b000:  if (op_b5 & funct7_b5) 
                            alu_control = 3'd1;    // R-TYPE (SUB)
                          else          
                            alu_control = 3'd0;    // add, addi
									 
					  3'b111:    alu_control = 3'd2;    // and, andi	
					  3'b110:    alu_control = 3'd3;    // or, ori
					  3'b100:    alu_control = 3'd4;    // xor, xori   
            3'b001:    alu_control = 3'd6;    // sll, slli
					  3'b101:    alu_control = 3'd7;    // srl, srli
					  3'b010:    alu_control = 3'd5;    // slt, slti
           default:    alu_control = 3'bxxx;  // ???
               endcase
		default:alu_control = 3'bxxx;  // ???			
    endcase
endmodule 