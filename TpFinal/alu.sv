module alu(input logic [31:0] SrcA, SrcB,
           input logic [1:0] ALUControl,
           output logic [31:0] ALUResult,
           output logic [3:0] ALUFlags);

  logic neg, zero, carry, overflow, aux;
  logic [31:0] condinvb;
  logic [31:0] sum;
  
  assign condinvb = ALUControl[0] ? ~SrcB : SrcB;
  assign {aux,sum} = SrcA + condinvb + ALUControl[0];
  
  always_comb
    casex (ALUControl[1:0])
      2'b0?: ALUResult = sum;
      2'b10: ALUResult = SrcA & SrcB;
      2'b11: ALUResult = SrcA | SrcB;
    endcase

  assign neg = ALUResult[31];
  assign zero = (ALUResult == 32'b0);
  assign carry = (ALUControl[1] == 1'b0) & aux;
  assign overflow = (ALUControl[1] == 1'b0) &
                    ~(SrcA[31] ^ SrcB[31] ^ ALUControl[0]) &
                    (SrcA[31] ^ sum[31]);
  assign ALUFlags = {neg, zero, carry, overflow};
endmodule
