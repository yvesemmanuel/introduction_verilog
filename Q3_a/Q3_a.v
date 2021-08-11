`timescale 1ns / 1ps
module Q3_a(A, B, C, D, F);
  output wire F;
  input wire A, B, C, D;
  assign #10 F = (C == 0) ? ((D == 0) ? !A : B) : ((D == 0) ?
                                                   !B : 0);
endmodule