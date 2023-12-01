module shift_4b_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;

  reg [3:0] x;
  reg [3:0] y;
  initial begin

      x = 4'b1111;
      y = 4'b0100; // shift left fill 0
    # 10
    y = 4'b1110; // shift right fill 0
    # 10
    y = 4'b0101; // shift left fill 1
    # 10
    y = 4'b1101; // shift right fill 1

      //shift bit in x by 1 to right, y by 1 left every 10 seconds 4 times
      /*for (integer i = 0; i < 3; i = i + 1) begin
         # 10 x = ( x >> 1);
         y = ( y << 1);
      end*/
     # 10 $finish;
  end

  wire o;
  wire [3:0] out, Cout;
  shift_4b a0 (x, y, Cout, out);
  
  initial begin
     $dumpfile("shift_4b.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,y);
    $dumpvars(3,Cout);
    $dumpvars(4, out);
  end
  
  initial
    $monitor("At time %t, x(%b) shifted by y(%b) = out(%b) with overflow Cout(%b)",
              $time, x, y, out, Cout);
endmodule // test