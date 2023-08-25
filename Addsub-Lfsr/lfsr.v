`include "D_FF.v"

module lfsr(seed, clock, reset, state);
	
	input [16:1] seed;
	input clock, reset;
	output [16:1] state;
	
	assign state[11] = seed[1] ^ seed[12];
	assign state[13] = seed[1] ^ seed[14];
	assign state[14] = seed[1] ^ seed[15];
	D_FF dff1(state[16], seed[1], clock, reset);
	D_FF dff2(state[15], seed[16], clock, reset);
	D_FF dff3(state[12], seed[13], clock, reset);
	D_FF dff4[10:1](state[10:1], seed[11:2], clock, reset);
	
endmodule