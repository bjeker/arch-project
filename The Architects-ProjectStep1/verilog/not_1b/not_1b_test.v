module not_1b_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;

  reg x = 0;
  initial begin
     # 10 x = 1;
     # 10 x = 0;
     # 10 x = 1;
     # 10 x = 1;
     # 10 $finish;
  end

  wire out;
  not_1b a0 (x, out);
  
  initial begin
     $dumpfile("not_1b.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,out);
  end
  
  initial
     $monitor("At time %t, x(%b) = out(%b)",
              $time, x, out);
endmodule // test
