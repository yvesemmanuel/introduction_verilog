`timescale 1ns/1ps
module buffer(enable, out);
  input wire enable;
  output wire out;
  wire in;

  assign #3 in = enable && out;
  assign #2 out = !in;
endmodule
