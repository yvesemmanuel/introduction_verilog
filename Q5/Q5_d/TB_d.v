`timescale 1ns / 1ps
module TB_d();
  reg LT_IN, EQ_IN, GT_IN;
  wire LT_OUT, EQ_OUT, GT_OUT;
  reg [7:0] A, B;
  
  comparator_8bit uut(LT_IN, EQ_IN, GT_IN, LT_OUT, EQ_OUT, GT_OUT, A, B);
  
  initial
    begin // A == B
      $dumpfile("TB_d.vcd");
      $dumpvars(0, TB_d);

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