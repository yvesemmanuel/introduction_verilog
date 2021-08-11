`timescale 1ns / 1ps
module Q2_tb();
  reg A, B, C, D;
  wire Z;
  
  Q2 uut(A, B, C, D, Z);
  initial
    begin
      $dumpfile("Q2_tb.vcd");
      $dumpvars(0, Q2_tb);
      A = 0; B = 0; C = 0; D = 0;
      #1 D = 1;
      #20 A = 1;
      #23 B = 1;
      #60 $finish;
    end
endmodule