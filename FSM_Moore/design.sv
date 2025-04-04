// Code your design here
module fsm_MOORE(clk, reset, in, out);
  input clk, reset;
  input [1:0]in;
  output reg [1:0] out;
  reg [2:0] cs, ns;
  
  parameter s1 = 3'b000;
  parameter s2 = 3'b001;
  parameter s3 = 3'b010;
  parameter s4 = 3'b011;
  parameter s5 = 3'b100;
  parameter s6 = 3'b101;
  
  always @(posedge clk)
    if(reset)
      cs <= s1;
    else
      cs <= ns;
  
  always @(cs or in)
    casex({cs, in})
      5'b00000: ns = s1;
      5'b00001: ns = s3;
      5'b00010: ns = s5;
      5'b00011: ns = s2;
      5'b00100, 5'b00111: ns = s2;
      5'b00101: ns = s3;
      5'b00110: ns = s4;
      5'b0100x: ns = s3;
      5'b0101x: ns = s4;
      5'b011xx: ns = s5;
      5'b10001, 5'b10010: ns = s5;
      5'b10000: ns = s4;
      5'b10011: ns = s6;
      5'b101xx: ns = s1;
    endcase
  
  always @(cs or in)
    casex(cs)
      3'b000, 3'b01x: out = 2'b01;
      3'b001, 3'b100: out = 2'b10;
      3'b101: out = 2'b11;
    endcase
endmodule