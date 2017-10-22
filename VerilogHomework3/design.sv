module counter_999(
    input   clock, reset,
    output  logic[3:0] d2, d1, d0
	);

    
  always @(posedge clock)
    begin
      if(reset)
        begin
          d0 = '0;
          d1 = '0;
          d2 = '0;
        end
      else 
        d0 = d0 + 3'b001;
      
      if(d0 > 9)
        begin
          d0 = '0;
          d1 = d1 + 3'b001;
        end
      
      if(d1 > 9)
        begin
          d1 = '0;
          d2 = d2 + 3'b001;
        end
      
      if(d2 > 9)
        d2 = '0;
    end

endmodule