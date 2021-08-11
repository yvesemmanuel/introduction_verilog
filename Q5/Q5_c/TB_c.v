`timescale 1ns / 1ps
module TB_c();
  reg LT_IN, EQ_IN, GT_IN;
  wire LT_OUT, EQ_OUT, GT_OUT;
  reg [3:0] A, B;
  
  comparator_4bit uut(LT_IN, EQ_IN, GT_IN, LT_OUT, EQ_OUT, GT_OUT, A, B);
  
  initial
    begin // A == B
      $dumpfile("TB_c.vcd");
      $dumpvars(0, TB_c);

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