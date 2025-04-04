// Code your design here
module ALU(a, b, oper, out);

	input [3:0] a, b;
	input [2:0] oper;
	output reg [3:0] out;

	always @(a or b or oper)
		casex(oper)
			3'b000: out = a + b;
			3'b001: out = a - b;
			3'b010: out = a | b;
			3'b011, 3'b100: out = a & b;
			3'b101, 3'b11x: out = a ^ b;
		endcase

endmodule