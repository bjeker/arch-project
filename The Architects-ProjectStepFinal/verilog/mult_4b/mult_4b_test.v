module mult_4b_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #10 clk = !clk;

  reg [3:0] x = 0;
  reg [3:0] y = 0;
  reg Cin = 1;
  initial begin
     # 10 x = 4'b1000;
     # 10 y = 4'b1001;
     # 10 Cin = 0;
     # 10 x = 4'b1101;
     # 10 y = 4'b0110;
     # 10 Cin = 1;
     # 10 x = 4'b1000;
     # 10 y = 4'b1001;
     # 10 $finish;
  end

  wire [7:0] out;
  wire Cout;
  mult_4b a0 (x, y, out, Cin, Cout);

  initial begin
    $dumpfile("mult_4b.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,y);
     $dumpvars(3,out);
    $dumpvars (4, Cout);
    $dumpvars (5, Cin);
  end

  initial
     $monitor("At time %t, x(%b) * y(%b) *Cin(%b) = out(%b) with Cout(%b)",
              $time, x, y, out, Cout, Cin);
endmodule // test