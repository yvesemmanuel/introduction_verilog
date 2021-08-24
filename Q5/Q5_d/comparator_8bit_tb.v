`timescale 1ns / 1ps
module comparator_8bit_tb();
  reg LTin, EQin, GTin;
  wire LTout, EQout, GTout;
  reg [7:0] A, B;
  
  comparator_8bit uut(LTin, EQin, GTin, LTout, EQout, GTout, A, B);
  
  initial
    begin // A == B
      $dumpfile("testbench.vcd");
      $dumpvars(0, comparator_8bit_tb);

      A = 8'b00000000; B = 8'b00000000;

      #10 A = 8'b11000000; B = 8'b11000000;

          
          // A < B
      #10 A = 8'b01000000; B = 8'b11000000;
 
          // A > B
      #10 A = 8'b11110000; B = 8'b11000000;
 
          // A = B
      #10 A = 8'b00000000; B = 8'b00000000;

	  // A > B
      #10 A = 8'b11110000; B = 8'b01110000;

  	  // A < B
      #10 A = 8'b01010000; B = 8'b10000000;      

      #120 $finish;
    end
endmodule
