// Code your design here
module reg4(clk, reset, pl, di, do);

	input clk, reset, pl;
	input [3:0] di;
	output reg [3:0] do;

	always @(posedge clk)
		if(reset)
			do <= 4'b0;
		else
			if(pl)
				do <= di;

endmodule

module reg8(clk, reset, pl, di, do);

	input clk, reset, pl;
	input [7:0] di;
	output reg [7:0] do;

	always @(posedge clk)
		if(reset)
			do <= 8'b0;
		else
			if(pl)
				do <= di;

endmodule

module mux_1_2_4b(a, b, sel, z);

	input [3:0] a, b;
	input sel;
	output [3:0] z;

	assign z = sel ? b : a;

endmodule

module mux_1_2_8b(a, b, sel, z);

	input [7:0] a, b;
	input sel;
	output [7:0] z;

	assign z = sel ? b : a;

endmodule

module counter4(clk, reset, q);

	input clk, reset;
	output reg [3:0] q;

	always @(posedge clk)
		if(reset)
			q <= 4'b0;
		else
			q <= q + 1;

endmodule

module counter4_pl_enable(clk, reset, pl, enable, d, q);

	input clk, reset, pl, enable;
	input [3:0] d;
	output reg [3:0] q;

	always @(posedge clk)
		if(reset)
			q <= 4'b0;
		else
			if(pl)
				q <= d;
			else
				if(enable)
					q <= q + 1;

endmodule 
                  
module s1(clk, reset, pla, plb, sel, datain, dataout);

	input clk, reset, pla, plb, sel;
	input [7:0] datain;
	output [3:0] dataout;

	wire [3:0] neta, netb;

	reg4 reg4a( .clk(clk), .reset(reset), .pl(pla), .di(datain[3:0]), .do(neta));
	reg4 reg4b( .clk(clk), .reset(reset), .pl(plb), .di(datain[7:4]), .do(netb));
	mux_1_2_4b mux_inst( .a(neta), .b(netb), .sel(sel), .z(dataout));

endmodule
      
module s2(clk, reset, pl, plr, sel, datain, dataout);
  
  input clk, reset, pl, plr, sel;
  input [15:0] datain;
  output [7:0] dataout;
  
  wire [7:0] neta, netb;
  wire [7:0] netc;
  
  reg8 reg8a( .clk(clk), .reset(reset), .pl(pl), .di(datain[7:0]), .do(neta));
  reg8 reg8b( .clk(clk), .reset(reset), .pl(pl), .di(datain[15:8]), .do(netb));
  mux_1_2_8b mux_inst( .a(neta), .b(netb), .sel(sel), .z(netc));
  reg8 reg8c( .clk(clk), .reset(reset), .pl(plr), .di(netc), .do(dataout));
  
endmodule