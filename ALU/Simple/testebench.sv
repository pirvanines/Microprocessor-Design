// Code your testbench here
// or browse Examples
module test_ALU;
  reg [3:0] at;
  reg [3:0] bt;
  reg [2:0] opert;
  wire [3:0] outt;
  
  ALU ALU_inst(at,bt,opert,outt);
  initial
    begin
      #0 opert=3'b000; at=4'b0011; bt=4'b0001;
      #10 opert=3'b001; at=4'b0011; bt=4'b0001;
      #10 opert=3'b010; at=4'b0011; bt=4'b1111;
      #10 opert=3'b011; at=4'b1011; bt=4'b1001;
      #10 opert=3'b111; at=4'b0011; bt=4'b1001;
    end
  initial
    #60 $finish;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, ALU_inst);
    end
endmodule   