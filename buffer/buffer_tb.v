`timescale 1ns/1ps
module buffer_tb();
  reg enable;
  wire out;
  
  buffer uut(enable, out);
  initial
    begin
      $dumpfile("testbench.vcd");
      $dumpvars(0, buffer_tb);
      
      enable = 0;
      #5 enable = 1;

      #30 $finish;
    end
endmodule
