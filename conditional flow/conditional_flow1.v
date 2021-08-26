module conditional_flow(B1, B2, B3, C, A); 
  output wire A;
  input integer C;
  input B1, B2, B3;
    
  always @(B1, B2, B3, C)
    begin
      if (C == 1) A = B1;
      else if (C == 2) A = B2;
      else if (C == 3) A = B3;
      else A = 0;
    end
endmodule
