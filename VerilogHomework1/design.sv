module alu_74181_subset(
    input [3:0] A,  // Operand inputs
    input [3:0] B,  // Operand inputs
    input [3:0] S,  // Function selection inputs
    input M,        // Mode control input
    output reg[3:0] F   // Function outputs
    );

always @ (A, B, S, M)
  case(S)
    4'b0000 : F = M ? ~A : A;
    4'b0001 : F = M ? ~A | ~B : A | B;
    4'b0010 : F = M ? ~A & B : A | ~B;
    4'b0011 : F = M ? 0 : -1;
    4'b0100 : F = M ? ~(A&B) : A + (A & ~B);
  endcase
endmodule