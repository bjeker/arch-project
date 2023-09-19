module nand_1b(x, y, ci, out);

  output o, out;
  input x, y, ci;

  wire x, y, ci, out;

  assign out = ~((x & y) | (x & ci) | (y & ci));

endmodule
