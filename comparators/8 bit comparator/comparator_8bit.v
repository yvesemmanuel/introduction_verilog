module comparator_4bit(LTin, EQin, GTin,
                       LTout, EQout, GTout, A, B);
  input EQin, GTin, LTin;
  input [3:0] A, B;
  output reg EQout, GTout, LTout;
  
  initial // initializing output values to zero
    begin
      LTout = 0; EQout = 0; GTout = 0;
    end

  always @(A, B, EQin, GTin, LTin) // sensible list
    begin
    
      if (A < B)
        begin
          LTout = 1; EQout = 0; GTout = 0;
        end
      else if (A > B)
        begin
          LTout = 0; EQout = 0; GTout = 1;
        end
      // we don't need to compare equality
      
      // output
      else if (GTin == 1)
        begin
          LTout = 0; EQout = 0; GTout = 1;
        end
      else if (LTin == 1)
        begin
          LTout = 1; EQout = 0; GTout = 0;
        end
      else
        begin
          LTout = 0; EQout = 1; GTout = 0;
        end
        
    end
endmodule


module comparator_8bit(LTin, EQin, GTin,
                       LTout, EQout, GTout, A, B);
  input EQin, GTin, LTin;
  input [7:0] A, B;
  
  // 0-3 bits
  wire LT1, EQ1, GT1;
  
  // 4-7 bits
  output LTout, EQout, GTout;
  
  // cascade
  comparator_4bit C1(LTin, EQin, GTin, LT1, EQ1,
                     GT1, A[3:0], B[3:0]);
  comparator_4bit C2(LT1, EQ1, GT1, LTout, EQout,
                     GTout, A[7:4], B[7:4]);
endmodule
