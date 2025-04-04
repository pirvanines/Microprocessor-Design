// Code your testbench here
// or browse Examples
module test_cnt8;

  reg clkt, resett, plt;
  reg [3:0] intt;
  wire [3:0] outt;
 
  cnt8 cnt8_inst( .clk(clkt), .reset(resett), .pl(plt), .in(intt), .out(outt));

  initial
    begin
      #0 clkt = 1'b1;
      forever #5 clkt =~clkt;
    end

  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, cnt8_inst);
    end

  initial
    #420 $finish;

  initial
    begin
      #0 resett = 1'b1; plt = 1'b0; intt = 4'b1010;
      #10 resett = 1'b0;
      #200 plt = 1'b1;
      #10 plt = 1'b0;
      #100 resett = 1'b1;
      #10 resett = 1'b0;
    end

endmodule 