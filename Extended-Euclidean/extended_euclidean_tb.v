`include "extended_euclidean.v"
`timescale 1ns/1ns

module extended_euclidean_tb();
	reg signed [31:0] a, b;
	reg clk, reset;
	wire signed [31:0] d; // d = a^(-1) mod b, d is the output
	
	integer i;
	
	// instantiate device under test
	extended_euclidean dut(a, b, d, clk, reset);
	
	initial
	begin
		a = 2;
		b = 94849;
		
		clk = 0; reset = 0; #5;
		
		for(i=1; i<=500; i=i+1)
		begin
			if(i == 1)
				reset = 1;
			else
				reset = 0;
			clk = 1; #5; clk = ~clk; #5;
			if(d != 0)
			begin
				$display(d);
				$finish;
			end
		end
	end
	
endmodule