module bcd_digit_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output reg[3:0] s,
    output reg cout
    );

  always @ (a, b, cin)
    begin
      s = (a + b + cin) % 10;
      if ((a + b + cin) > 9)
        cout = 1'b1;
       else
        cout = 1'b0;
    end
endmodule