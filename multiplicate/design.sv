// Code your design here

module mul_pipe_4b(clk, a, b, p);
  input clk;
  input [3:0] a;
  input [3:0] b;
  output [7:0] p;

  reg [3:0] p1;
  reg [5:0] p2;
  reg [6:0] p3;
  reg [7:0] p4;
  
  reg [7:0] ab1;
  reg [7:0] ab2;
  reg [7:0] ab3;
  
  always @(posedge clk)
    begin
      p1 <= a & {4{b[0]}};
      ab1 <= {a,b};
    end
  
  wire [4:0] s1 = {1'b0, p1[3:1]} + (ab1[7:4] & {4{ab1[1]}}); 
 
  always @(posedge clk)
    begin
      p2 <= {s1,p1[0]};
      ab2 <= ab1;
    end
  
  wire [4:0] s2 = p2[5:2] + (ab2[7:4] & {4{ab2[2]}});
  
  always @(posedge clk)
    begin
      p3 <= {s2, p2[1:0]};
      ab3 <= ab2;
    end
  
  wire [4:0] s3 = p3[6:3] + (ab3[7:4] & {4{ab3[3]}});
  
  always @(posedge clk)
    begin
      p4 <= {s3, p3[2:0]};
    end
  
  assign p = p4;
endmodule

//a*b = (a1 * 2^4 + a0) * (b1 * 2^4 + b0)
module mul_8b(clk, a, b, p);
  input clk;
  input [7:0] a;
  input [7:0] b;
  output [15:0] p;
  
  wire [7:0] p1;
  wire [7:0] p2_1;
  wire [7:0] p2_2;
  wire [7:0] p3;
  
  mul_pipe_4b m11(clk, a[7:4], b[7:4], p1);
  mul_pipe_4b m12(clk, a[7:4], b[3:0], p2_1);
  mul_pipe_4b m13(clk, a[3:0], b[7:4], p2_2);
  mul_pipe_4b m14(clk, a[3:0], b[3:0], p3);
  
  assign p = {p1, 8'b0} + {(p2_1 + p2_2), 4'b0} + p3;
endmodule

//a*b = (a1 * 2^8 + a0) * (b1 * 2^8 + b0)
module mul_16b(clkt, at, bt, pt);
  input clkt;
  input [15:0] at;
  input [15:0] bt;
  output [31:0] pt;
  
  wire [15:0] p1t;
  wire [15:0] p2_1t;
  wire [15:0] p2_2t;
  wire [15:0] p3t;
  
  mul_8b m21(clkt, at[15:8], bt[15:8], p1t);
  mul_8b m22(clkt, at[15:8], bt[7:0], p2_1t);
  mul_8b m23(clkt, at[7:0], bt[15:8], p2_2t);
  mul_8b m24(clkt, at[7:0], bt[7:0], p3t);
  
  assign p = {p1t, 16'b0} + {(p2_1t + p2_2t), 8'b0} + p3t;
endmodule
  
  