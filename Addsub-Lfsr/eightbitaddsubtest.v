`include "eightbitaddsub.v"
`timescale 1ns/1ns
module eightbitaddsubtest();
	reg [7:0] Data0, Data1;
	reg mode;
	wire final_sum, final_carry_out, overflow;
	
	// instantiate device under test
	eightbitaddsub dut(Data0, Data1, mode, final_sum, final_carry_out, overflow);
	
	// apply inputs one at a time
	// checking results
	
	initial 
	begin
	
	$dumpfile("eightbitaddsubdump.vcd");
	$dumpvars(0, eightbitaddsubtest);
	
	Data0 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; 
	Data1 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; 
	mode = 1; #5;
	$display("\nCase 1\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; 
	Data1 = {1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; 
	mode = 1; #5;
	$display("\nCase 2\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}; 
	Data1 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; 
	mode = 1; #5;
	$display("\nCase 3\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0}; 
	Data1 = {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1}; 
	mode = 1; #5;
	$display("\nCase 4\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}; 
	Data1 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}; 
	mode = 1; #5;
	$display("\nCase 5\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0}; 
	Data1 = {1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0}; 
	mode = 1; #5;
	$display("\nCase 6\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; 
	Data1 = {1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}; 
	mode = 1; #5;
	$display("\nCase 7\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; 
	Data1 = {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1}; 
	mode = 1; #5;
	$display("\nCase 8\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}; 
	Data1 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}; 
	mode = 0; #5;
	$display("\nCase 9\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0}; 
	Data1 = {1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1}; 
	mode = 0; #5;
	$display("\nCase 10\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1}; 
	Data1 = {1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1}; 
	mode = 0; #5;
	$display("\nCase 11\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1}; 
	Data1 = {1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}; 
	mode = 0; #5;
	$display("\nCase 12\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; 
	Data1 = {1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}; 
	mode = 0; #5;
	$display("\nCase 13\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; 
	Data1 = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1}; 
	mode = 0; #5;
	$display("\nCase 14\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	Data0 = {1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1}; 
	Data1 = {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1}; 
	mode = 0; #5;
	$display("\nCase 15\nInput 1: %b", Data0); $display("Input 2: %b", Data1);
	$display("Mode: %b", mode); $display("Final Sum: %b", final_sum); 
	$display("Carry Out: %b", final_carry_out); $display("Overflow: %b", overflow);
	
	end
endmodule