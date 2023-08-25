`include "onebitaddsub.v"

module eightbitaddsub(Data0, Data1, mode, final_sum, final_carry_out, overflow);

	input [7:0] Data0, Data1;
	input mode;
	output final_sum, final_carry_out, overflow;
	
	wire [6:0] carry, sum; //To hold intermediate values of carry and sum
	
	//mode=1 => Addition, mode=0 => Subtraction
	onebitaddsub addsub1(Data0[0], Data1[0], 1'b0, mode, sum[0], carry[0]);
	onebitaddsub addsub2(Data0[1], Data1[1], carry[0], mode, sum[1], carry[1]);
	onebitaddsub addsub3(Data0[2], Data1[2], carry[1], mode, sum[2], carry[2]);
	onebitaddsub addsub4(Data0[3], Data1[3], carry[2], mode, sum[3], carry[3]);
	onebitaddsub addsub5(Data0[4], Data1[4], carry[3], mode, sum[4], carry[4]);
	onebitaddsub addsub6(Data0[5], Data1[5], carry[4], mode, sum[5], carry[5]);
	onebitaddsub addsub7(Data0[6], Data1[6], carry[5], mode, sum[6], carry[6]);
	onebitaddsub addsub8(Data0[7], Data1[7], carry[6], mode, final_sum, final_carry_out);
	
	assign overflow = mode? ((carry[6] ^ final_carry_out)? 1 : 0) : 0;
endmodule