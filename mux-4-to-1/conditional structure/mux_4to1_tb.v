`timescale 1ns / 1ps
module mux_4to1_tb();
  wire F;
  reg A, B, C, D;
  
  mux_4to1 uut(A, B, C, D, F);
  initial
    begin
      $dumpfile("testbench.vcd");
      $dumpvars(0, mux_4to1_tb);
      
      A = 1; B = 0; C = 0; D = 0;
      #2 A = 0; B = 0; C = 0; D = 0;
      #10 A = 0; B = 1; C = 0; D = 1;
      #20 A = 0; B = 1; C = 1; D = 0;

      #80 $finish;
    end
endmodule
