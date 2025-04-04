// Code your testbench here
// or browse Examples
module test_fsm_MOORE;
  reg clkt, resett;
  reg [1:0] intt;
  wire [1:0] outt;
  
  fsm_MOORE fsm_MOORE_inst(.clk(clkt), .reset(resett), .in(intt), .out(outt));
  
  initial
    begin 
      #0 clkt = 1'b0;
      forever #5 clkt = ~clkt;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, fsm_MOORE_inst);
    end
  
  initial
    begin
      #0 resett = 1'b1; intt = 2'b00;
      #10 resett = 1'b0;
      #10 intt = 2'b00;
      #10 intt = 2'b01;
      #10 intt = 2'b01;
      #10 intt = 2'b11;
      #10 intt = 2'b00;
      #10 intt = 2'b10;
      #10 intt = 2'b11;
      #10 intt = 2'b00;
      #10 intt = 2'b11;
      #10 intt = 2'b10;
      #10 resett = 1'b1;
      #10 resett = 1'b0;
      #10 intt = 2'b10;
      #10 intt = 2'b11;
      #10 intt = 2'b11;
    end
  
  initial
    #200 $finish;
endmodule