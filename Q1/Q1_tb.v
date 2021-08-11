`timescale 1ns / 1ps
module Q1_tb();
  reg A;
  wire B, C;
  
  Q1 uut(A, B, C);
  initial
    begin
      $dumpfile("Q1_tb.vcd");
      $dumpvars(0, Q1_tb);
      
      A = 0;
      #5 A = 1;

      #30 $finish;
    end
endmodule