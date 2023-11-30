module mult_4b(x, y, out, Cin, Cout);

  output [7:0] out;
  output Cout;
  input [3:0] x, y;
  input Cin;

  wire x, y, out;

  assign {Cout, out} = (x * y) * Cin;
 

endmodule