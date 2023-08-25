//Assignment 2 Question 2 (b)

`include "mux_4_1.v"

module comb(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, sel, out);
	input [3:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15;
	input [3:0] sel;
	output [3:0] out;
	
	wire [3:0] mux1op, mux2op, mux3op, mux4op;
	
	mux_4_1 mux1(i0, i1, i2, i3, sel[0], sel[1], mux1op);
	mux_4_1 mux2(i4, i5, i6, i7, sel[0], sel[1], mux2op);
	mux_4_1 mux3(i8, i9, i10, i11, sel[0], sel[1], mux3op);
	mux_4_1 mux4(i12, i13, i14, i15, sel[0], sel[1], mux4op);
	
	mux_4_1 mux5(mux1op, mux2op, mux3op, mux4op, sel[2], sel[3], out);
	
endmodule