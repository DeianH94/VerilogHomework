`timescale 1ns / 1ps

module bcd_digit_adder_test;
   // Inputs
	reg [3:0] a, b;
	reg cin;

	// Outputs
	wire [3:0] s;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
      bcd_digit_adder uut(.*);

	initial begin
	$display("cin  a  b => cout  s");
	for (integer i=0; i <= 1; i=i+1)
		for (integer j=0; j < 10; j=j+1)
			for (integer k=0; k < 10; k=k+1)
				begin
				cin = i; a = j; b = k;
				#100;
				$display(" %d %d %d =>    %d %d",cin,a,b,cout,s);
				end
	$finish; 
	end
endmodule