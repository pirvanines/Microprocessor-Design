// Code your testbench here
// or browse Examples
module test_mul;
  reg clktt;
  reg [15:0] att;
  reg [15:0] btt;
  wire[31:0] outt;
  
  mul_16b mul_16b_inst(clktt, att, btt, outt);
  
  initial
    begin 
      #0 clktt = 1'b0;
      forever #5 clktt = ~clktt;
    end
  initial
    begin
      #0 att = 16'h0012; btt = 16'h0002;
      #20 att = 16'h0023; btt = 16'h0012;
      #20 att = 16'h0000; btt = 16'h1234;
    end
  initial
    #100 $finish;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,mul_16b_inst);
    end  
  
endmodule
