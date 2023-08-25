`include "lfsr.v"
`timescale 1ns/1ns

module lfsrtest();
	reg clock, reset;
	reg [16:1] input_seed;
	wire [16:1] state, seed;
	
	integer i;
	
	assign seed = 16'b1010110011100001;
	
	// instantiate device under test
	lfsr dut(input_seed, clock, reset, state);
	
	// apply inputs one at a time
	// checking results
	
	initial 
	begin
	
	$dumpfile("lfsrdump.vcd");
	$dumpvars(0, lfsrtest);
	
	input_seed = seed; reset = 0;
	i = 1;
	
	forever //Run until 'state' becomes same as 'seed'
	begin
		clock = 1; #1; clock = ~clock; #1;
		$display("\nCase %d\nSeed: %b", i, input_seed); $display("Clock: %b", clock);
		$display("Reset: %b", reset); $display("State: %b", state);
		if(state == seed) //Exit from the loop if initial seed reached 
			$finish;
		input_seed = state;
		i = i+1;
	end
	end
endmodule