module shift_4b_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;

  reg [3:0] x;
  reg [3:0] y;
  initial begin

      x = 4'b1000;
      y = 4'b0001;

      //shift bit in x by 1 to right, y by 1 left every 10 seconds 4 times
      for (integer i = 0; i < 3; i = i + 1) begin
         # 10 x = ( x >> 1);
         y = ( y << 1);
      end
     # 10 $finish;
  end

  wire o;
  wire out;
  shift_4b a0 (x, y);
  
  initial begin
     $dumpfile("shift_4b.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,y);
  end
  
  initial
     $monitor("At time %t, x(%b) + y(%b)",
              $time, x, y);
endmodule // test
