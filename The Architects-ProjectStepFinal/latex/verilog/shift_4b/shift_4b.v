module shift_4b(x, y, Cout, out);

  output [3:0] Cout, out;
  input [3:0] x, y;

  wire [3:0] x, y, Cout, out;

  assign {Cout, out} = x << y[2:1];

endmodule