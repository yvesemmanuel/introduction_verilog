`timescale 1ns / 1ps
module Q3_b (A, B, C, D, F);
  output wire F;
  input wire A, B, C, D;
  always @(A, B, C, D)
  begin
    if ((C == 0) && (D == 0)) #10 F = ~A; 
    else if ((C == 0) && (D == 1)) #10 F = B; 
    else if ((C == 1) && (D == 0)) #10 F = ~B; 
    else #10 F = 0; 
  end 
endmodule