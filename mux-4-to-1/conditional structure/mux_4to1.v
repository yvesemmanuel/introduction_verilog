`timescale 1ns/1ps
module mux_4to1(A, B, C, D, F);
  output wire F;
  input wire A, B, C, D;
  
  assign #10 F = (C == 0) ? ((D == 0) ? !A : B) : ((D == 0) ?
                                                   !B : 0);
endmodule
