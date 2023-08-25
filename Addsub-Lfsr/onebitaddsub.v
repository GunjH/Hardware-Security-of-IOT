module onebitaddsub(I0, I1, carry_in, mode, sum, carry_out);

	input I0, I1, carry_in, mode;
	output sum, carry_out;
	
	//mode=1 => Addition, mode=0 => Subtraction
	assign {carry_out, sum} = mode? I0 + I1 + carry_in : I0 - I1 - carry_in;

endmodule