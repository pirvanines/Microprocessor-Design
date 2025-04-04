// Code your testbench here
// or browse Examples
module tb_s2;
  reg clkt, resett,selt,plt,plrt;
  reg [15:0] dit;
  wire [7:0] dot;
  
  s2 s2_inst(clkt,resett,plt,plrt,selt,dit,dot);
  
  initial
    begin
      #0 clkt=1'b0;
      forever #5 clkt = ~clkt;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, s2_inst);
    end

  initial
    #50 $finish;
    
  initial
    begin
      #0 resett=1'b1; selt=1'b0; plt=1'b0;plrt=1'b0;dit=16'hac5;
      #10 plt=1'b1; plrt=1'b1; resett=1'b0;
      #10 plt=1'b0; plrt=1'b0;
      #10 selt=1'b1;
    end
  
endmodule