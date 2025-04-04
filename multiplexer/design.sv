// Code your design here
module mux_1_4_en_S4(en, sel, in, out);

  input en;
  input [1:0] sel;
  input [3:0] in;
  output reg out;

  always @(en or sel or in)
    casex({en,sel})

      3'b0_xx: out = 1'b0;

      3'b1_00: out = in[0];
      3'b1_01: out = in[1];
      3'b1_10: out = in[2];
      3'b1_11: out = in[3];

    endcase

endmodule