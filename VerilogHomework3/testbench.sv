`timescale 1ns / 1ps

module counter_999_test;

logic clock, reset;
logic [3:0] d0, d1, d2;

counter_999 uut(.*);

parameter period = 100;

initial begin  
   clock = 0;
   forever #(period/2) clock = ~clock;
end
 
initial begin
	#100;
	reset = 1;
	#period reset = 0;

	for( int i2=0; i2<10; i2++)
		for( int i1=0; i1<10; i1++)
			for( int i0=0; i0<10; i0++)    begin
				@(negedge clock);
				assert (d0 == i0) else $error("d0: expected=%1d, actual=%1d",i0,d0);
				assert (d1 == i1) else $error("d1: expected=%1d, actual=%1d",i1,d1);
				assert (d2 == i2) else $error("d2: expected=%1d, actual=%1d",i2,d2);				end                
	@(negedge clock);
	assert (d0 == 0) else $error("d0: expected=%1d, actual=%1d",0,d0);
	assert (d1 == 0) else $error("d1: expected=%1d, actual=%1d",0,d1);
	assert (d2 == 0) else $error("d2: expected=%1d, actual=%1d",0,d2);        
	$finish; 
end

initial begin
   $monitor("%1d%1d%1d",d2,d1,d0);   
end
endmodule