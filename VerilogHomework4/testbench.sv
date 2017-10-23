`timescale 1us / 1ns

module sequence_detector_11011_test;
 
logic clk, din, dout, rst;

sequence_detector_11011 uut (.*);

localparam T = 10;
initial begin  
   clk = 0;
   forever #(T/2) clk = ~clk;
end

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(1);
   din = 0;
   rst = 1;
   #T rst = 0;
   
   #(2*T);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
    
   $display("Test 1");
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);    
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);    
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);        
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b1) else $error("dout: expected=%b, actual=%b",1'b1,dout);    
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);    
   
   $display("Test 2");   
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);           
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);    
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);        
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b1) else $error("dout: expected=%b, actual=%b",1'b1,dout);    
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);    
 
   $display("Test 3");   
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);           
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);        

   $display("Test 4");   
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);         
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);        
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);        
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);    
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
   @(posedge clk) assert (dout == 1'b1) else $error("dout: expected=%b, actual=%b",1'b1,dout);    
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
   @(negedge clk) din = 0;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);    
   @(negedge clk) din = 1;
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout);
   @(posedge clk) assert (dout == 1'b0) else $error("dout: expected=%b, actual=%b",1'b0,dout); 
   @(posedge clk) assert (dout == 1'b1) else $error("dout: expected=%b, actual=%b",1'b1,dout); 
                       
   $finish; 
end

initial
    $display("din dout");
    
always @(posedge clk)
    $strobe(" %b    %b",din,dout);
    
endmodule