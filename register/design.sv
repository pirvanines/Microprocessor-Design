// Code your design here
module reg8_S5(clk, reset, pl, in, out);

  input clk, reset, pl;
  input [7:0] in;
  output reg [7:0] out;

  always @(negedge clk)
    if(reset)
      out = 8'b0;
    else
      if(pl)
        out = in;

endmodule