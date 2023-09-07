//immediat sign extend unit
module imm_extend(input [31:7] instr,
                  input [1:0]  imm_ext_cont,
                  output reg [31:0] imm_ext);
 
  always@(*)
  begin
    case(imm_ext_cont) 
                
      2'd0: imm_ext = {{20{instr[31]}}, instr[31:20]}; // I-type  
               
      2'd1: imm_ext = {{20{instr[31]}}, instr[31:25], instr[11:7]};  // S-type (sw)
               
      2'd2: imm_ext = {{19{instr[31]}}, instr[31],instr[7], instr[30:25], instr[11:8], 1'b0}; // B-type (beq,bne)
              
      2'd3: imm_ext = {{11{instr[31]}}, instr[31],instr[19:12], instr[20], instr[30:21], 1'b0};  // J-type (jal)
    
	 default:imm_ext = 32'bx;
    endcase 
   end	 
endmodule 