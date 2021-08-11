module Q4_a1(B1, B2, B3, C, A);
  output wire A;
  input integer C;
  input wire B1, B2, B3;
  assign A = (C == 1) ? B1 : ((C == 2) ? B2 : ((C == 3) ?
                                               B3 : 0));
endmodule