module half_adder(output logic Cout, S, input logic A, B);
  wire n;
  assign Cout = A & B;
  assign n = A & B;
  assign S = (A | B) & ~n;
endmodule
