`timescale 1ns/1ps
module combinational_delay_tb();
  reg A, B, C, D;
  wire Z;
  
  combinational_delay uut(A, B, C, D, Z);
  initial
    begin
      $dumpfile("testbench.vcd");
      $dumpvars(0, combinational_delay_tb);
      
      A = 0; B = 0; C = 0; D = 0;
      #1 D = 1;
      #20 A = 1;
      #23 B = 1;
      #60 $finish;
    end
endmodule
