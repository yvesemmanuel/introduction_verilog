`timescale 1ns/1ps
module Q2(A, B, C, D, Z);
  input wire A, B, C, D;
  output wire Z;
  wire E, F, S1, S2, S3;
  assign #5 S1 = A & B & C;
  assign #5 E = S1 | D;
  assign #5 S2 = B ~| C;
  assign #5 F = S2 ~& A;
  assign #2 S3 = ~F;
  assign #5 Z = E ^ S3;
endmodule