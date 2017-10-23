module sequence_detector_11011(
    input clk, rst, din,
    output logic dout);

  enum logic [2:0] {
    S0 = 3'b000,
    S1 = 3'b001,
    S11 = 3'b010,
    S110 = 3'b011,
    S1101 = 3'b100,
    S11011 = 3'b101
  } state, state_next;

  always_ff @(posedge clk, posedge rst)
    if (rst) state <= S0;
    else state <= state_next;
  
  always_comb begin
	state_next = 'x;
    dout = '0;
    case(state)
      S0:
          if (din) state_next = S1;
          else state_next = S0;
      S1:
          if (din) state_next = S11;
          else state_next = S0;
      S11:
          if (~din) state_next = S110;
          else state_next = S11;
      S110:
          if (din) state_next = S1101;
          else state_next = S0;
      S1101:
          if (din) state_next = S11011;
          else state_next = S0;
      S11011:
        begin
          dout = '1;
          if (~din) state_next = S0;
          else state_next = S11;
        end
    endcase
  end
endmodule