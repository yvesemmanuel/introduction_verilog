`timescale 1ns / 1ps
module Q1(A, B, C);
  input wire A;
  output wire B, C;

  assign #3 B = A && C;
  assign #2 C = !B;
endmodule