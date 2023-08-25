//Assignment 2 Question 2 (b)
//4:1 Multiplexer

module mux_4_1(i0, i1, i2, i3, s0, s1, y);
	input [3:0] i0, i1, i2, i3; //inputs
	input s0, s1; //Selection lines
	output [3:0] y; //Output

	assign y = s1? (s0? i3:i2) : (s0? i1:i0);
	
endmodule