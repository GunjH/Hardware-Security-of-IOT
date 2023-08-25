//Assignment 2 Question 1
//Extended Euclidean Algorithm

module extended_euclidean(a, b, d, clk, reset);
	input signed [31:0] a, b;
	input clk, reset;
	output reg signed [31:0] d; // d = a^(-1) mod b, d is the output
	
	reg signed [31:0] u, v, w, x, y, z;
	reg [3:0] state, nextstate;
	reg [31:0] temp, w_prev, x_prev, y_prev, z_prev;
	
	//states of Finite State Machine
	parameter S0 = 4'h0, S1 = 4'h1, S2 = 4'h2, S3 = 4'h3;
	parameter S4 = 4'h4, S5 = 4'h5, S6 = 4'h6, S7 = 4'h7;
	parameter S8 = 4'h8;
	
	always @ (posedge clk or posedge reset)
	begin
		if(reset)
		begin
			state <= S0;
			u <= a; v <= b;
			w <= 1; x <= 0; y <= 0; z <= 1;
		end
		else
			state = nextstate;
	end
	
	//Extended Euclidean Algorithm implemented as Finite State Machine
	always @ (*)
	begin
		case (state)
			S0:
				if(u != 0)
					nextstate = S1;
				else
					nextstate = S6;
			
			S1:
				begin
					if(u[0] == 1'b0) //check if 'u' is even number
						nextstate = S2;
					else
						nextstate = S3;
				end //end S1
				
			S2:
				begin
					u = u >>> 1; //Divide by 2
					if(w[0] == 1'b0 && x[0] == 1'b0) //check if 'w' and 'x' are even numbers
					begin
						w_prev = w;
						w = w >>> 1;
						x_prev = x;
						x = x >>> 1;
						if(w_prev == w) //w_prev will be equal to w only when w is equal to -1
							w = 0;
						else 
							w = w;
						if(x_prev == x) //x_prev will be equal to x only when x is equal to -1
							x = 0;
						else
							x = x;
					end
					else
					begin
						w_prev = w + b;
						w = (w + b) >>> 1;
						x_prev = x - a;
						x = (x - a) >>> 1;
						if(w_prev == w) //w_prev will be equal to w only when (w + b) is equal to -1
							w = 0;
						else 
							w = w;
						if(x_prev == x) //x_prev will be equal to x only when x is equal to -1
							x = 0;
						else
							x = x;
					end
					nextstate = S1;
				end //end S2
				
			S3:
				begin
					if(v[0] == 1'b0) //check if 'v' is even number
						nextstate = S4;
					else
						nextstate = S5;
				end //end S3
				
			S4:
				begin
					v = v >>> 1;
					if(y[0] == 1'b0 && z[0] == 1'b0) //check if 'y' and 'z' are even numbers
					begin
						y_prev = y;
						y = y >>> 1;
						z_prev = z;
						z = z >>> 1;
						if(y_prev == y) //y_prev will be equal to y only when w is equal to -1
							y = 0;
						else 
							y = y;
						if(z_prev == z) //z_prev will be equal to z only when z is equal to -1
							z = 0;
						else
							z = z;
					end
					else
					begin
						y_prev = y + b;
						y = (y + b) >>> 1;
						z_prev = z - a;
						z = (z - a) >>> 1;
						if(y_prev == y) //y_prev will be equal to y only when y is equal to -1
							y = 0;
						else
							y = y;
						if(z_prev == z) //z_prev will be equal to z only when z is equal to -1
							z = 0;
						else
							z = z;
					end
					nextstate = S3;
				end //end S4
				
			S5:
				begin
					if(u >= v)
					begin
						u = u - v;
						w = w - y;
						x = x - z;
					end
					else
					begin
						v = v - u;
						y = y - w;
						z = z - x;
					end
					nextstate = S0;
				end //end S5
				
			S6:
				begin
					if(y >= b) //Find y mod b
					begin
						y = y - b;
						nextstate = S6;
					end
					else
						nextstate = S7;
				end //end S6
						
			S7:
				begin
					if(y[31] == 1'b1) //For negative y
						d = y + b;
					else
						d = y;
					nextstate = S8;
				end //end S7
					
			S8: ; //do nothing
			
			default: nextstate = S0;
		endcase
	end //end always
	
endmodule