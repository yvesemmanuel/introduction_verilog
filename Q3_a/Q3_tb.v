`timescale 1ns / 1ps
module Q3_tb();
  wire F;
  reg A, B, C, D;
  
  Q3_a uut(A, B, C, D, F);
  initial
    begin
      $dumpfile("Q3_tb.vcd");
      $dumpvars(0, Q3_tb);
      
      A = 1; B = 0; C = 0; D = 0;
      #2 A = 0; B = 0; C = 0; D = 0;
      #10 A = 0; B = 1; C = 0; D = 1;
      #20 A = 0; B = 1; C = 1; D = 0;

      #80 $finish;
    end
endmodule