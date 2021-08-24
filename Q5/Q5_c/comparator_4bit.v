module comparator_4bit(LTin, EQ_in, GTin,
                       LTout, EQout, GTout, A, B);
  input EQ_in, GTin, LTin;
  input [3:0] A, B;
  output reg EQout, GTout, LTout;
  
  initial // initializing output values to zero
    begin
      LTout = 0; EQout = 0; GTout = 0;
    end

  always @(A, B, EQ_in, GTin, LTin) // sensible list
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
