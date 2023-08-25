`include "comb.v"

module testbench();
reg [3:0] i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,sel;
wire [3:0] out;
comb DUT(i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,sel,out);
initial 
begin
    $dumpfile("comb.vcd");
    $dumpvars(0,testbench);
     $monitor("input=%h, out=%h",sel,out[3:0]);
 assign i0 =4'hC;
 assign i1 =4'h5;
assign i2=4'h6;
assign i3=4'hB;
assign i4=4'h9; 
assign i5=4'h0; 
assign i6=4'hA;
assign i7=4'hD;
assign i8=4'h3;
assign i9=4'hE;
assign i10=4'hF;
 assign i11=4'h8;
 assign i12=4'h4;
 assign i13=4'h7;
 assign i14=4'h1;
 assign i15=4'h2;
 sel=4'h0;
 #2 sel=4'h1;
 #2 sel=4'h2;
 #2 sel=4'h3;
 #2 sel=4'h4;
 #2 sel=4'h5;
 #2 sel=4'h6;
 #2 sel=4'h7;
 #2 sel=4'h8;
 #2 sel=4'h9;
 #2 sel=4'hA;
 #2 sel=4'hB;
 #2 sel=4'hC;
 #2 sel=4'hD;
 #2 sel=4'hE;
 #2 sel=4'hF;
 #200 $finish;

end
endmodule
