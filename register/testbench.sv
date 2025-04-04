// Code your testbench here
// or browse Examples
module test_reg8_S5;

  reg clkt, resett, plt;
  reg [7:0] intt;
  wire [7:0] outt;
 
  reg8_S5 reg8_S5_inst( .clk(clkt), .reset(resett), .pl(plt), .in(intt), .out(outt));

  initial
    begin
      #0 clkt = 1'b1;
      forever #5 clkt =~clkt;
    end

  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, reg8_S5_inst);
    end

  initial
    #120 $finish;

  initial
    begin
      #0 resett = 1'b1; intt = 8'haa; plt = 1'b0;
      #10 resett = 1'b0;
      #10 plt = 1'b1;
      #10 intt = 8'h55;
      #10 plt = 1'b0; intt = 8'h3b;
      #20 plt = 1'b1;
      #10 resett = 1'b1;
      #10 resett = 1'b0; plt = 1'b0; intt = 8'hd4;
      #20 plt = 1'b1;
    end

endmodule 