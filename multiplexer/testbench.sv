// Code your testbench here
// or browse Examples
module test_mux_1_4_en_S4;

  reg ent;
  reg [1:0] selt;
  reg [3:0] intt;
  wire outt;
 
  mux_1_4_en_S4 mux_1_4_en_S4_inst( .en(ent), .sel(selt), .in(intt), .out(outt));

  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, mux_1_4_en_S4_inst);
    end

  initial
    #80 $finish;

  initial
    begin
      #0 ent = 1'b0; selt = 2'b00; intt = 4'b1010;
      #10 selt = 2'b01;
      #10 selt = 2'b10;
      #10 selt = 2'b11;
      #10 selt = 2'b00; ent = 1'b1;
      #10 selt = 2'b01;
      #10 selt = 2'b10;
      #10 selt = 2'b11;
    end

endmodule 