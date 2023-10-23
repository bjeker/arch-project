module not_1b_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #10 clk = !clk;

  reg [3:0] x = 0;
  initial begin
     # 10 x = 4'b1000;
     # 10 x = 4'b1101;
     # 10 x = 4'b0101;
     # 10 $finish;
  end

  wire [3:0] out;
  not_4b a0 (x, out);
  
  initial begin
     $dumpfile("not_4b.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(3,out);
  end
  
  initial
     $monitor("At time %t, x(%b) = out(%b)",
              $time, x, out);
endmodule // test
