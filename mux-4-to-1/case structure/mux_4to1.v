`timescale 1ns/1ps
module mux_4to1(A, B, Sel, F);
  output wire F;
  input wire A, B;
  input wire [1:0] Sel;
  
  always @(A, B, Sel)
  begin
    case(Sel)
      0: #10 F = ~A;
      1: #10 F = B;
      2: #10 F = ~B;
      3: #10 F = 0;
    endcase
  end
endmodule
