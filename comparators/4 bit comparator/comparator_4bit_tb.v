`timescale 1ns/1ps
module comparator_4bit_tb();
  reg LTin, EQIn, GTin;
  wire LTout, EQout, GTout;
  reg [3:0] A, B;
  
  comparator_4bit uut(LTin, EQIn, GTin, LTout, EQout, GTout, A, B);
  
  initial
    begin // A == B
      $dumpfile("testbench.vcd");
      $dumpvars(0, comparator_4bit_tb);

      A = 4'b0000; B = 4'b0000;

      #10 A = 4'b1100; B = 4'b1100;

          
          // A < B
      #10 A = 4'b0100; B = 4'b1100;
 
          // A > B
      #10 A = 4'b1111; B = 4'b1100;
 
          // A = B
      #10 A = 4'b0000; B = 4'b0000;

	  // A > B
      #10 A = 4'b1111; B = 4'b0111;

  	  // A < B
      #10 A = 4'b0101; B = 4'b1000;      

      #120 $finish;
    end
endmodule
