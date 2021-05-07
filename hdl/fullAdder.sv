module full_adder(output logic Cout, S, input logic A, B , Cin);
  wire toOr1, toOr2, aNext;
  half_adder first(toOr1, aNext, A, B);
  half_adder second(toOr2, S, aNext, Cin);
  assign Cout = toOr1 | toOr2;
endmodule
