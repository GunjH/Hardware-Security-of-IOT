`include "casenaive.v"

module casetest();
reg [3:0]inp;
wire [3:0]out;

casenaive DUT(inp, out);

initial
begin
    $dumpfile("casenaive.vcd");
    $dumpvars(0,casetest);
	$monitor("input=%h,  out=%h",inp,out);
	assign inp=4'h0;
	#2 assign inp=4'h1;
	#2 assign inp=4'h2;
	#2 assign inp=4'h3;
	#2 assign inp=4'h4;
	#2 assign inp=4'h5;
	#2 assign inp=4'h6;
	#2 assign inp=4'h7;
	#2 assign inp=4'h8;
	#2 assign inp=4'h9;
	#2 assign inp=4'hA;
	#2 assign inp=4'hB;
	#2 assign inp=4'hC;
	#2 assign inp=4'hD;
	#2 assign inp=4'hE;
	#2 assign inp=4'hF;
	#200 $finish;
    
end
endmodule