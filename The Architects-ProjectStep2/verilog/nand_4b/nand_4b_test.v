module and_1b_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #10 clk = !clk;

  reg [3:0] x = 0;
  reg [3:0] y = 0;
  initial begin
     # 10 x = 4'b1000;
     # 10 y = 4'b1001;
     # 10 x = 4'b1101;
     # 10 y = 4'b0110;
     # 10 $finish;
  end

  wire [3:0] out;
  and_4b a0 (x, y, out);
  
  initial begin
     $dumpfile("nand_4b.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,y);
     $dumpvars(3,out);
  end
  
  initial
     $monitor("At time %t, x(%b) + y(%b) = out(%b)",
              $time, x, y, out);
endmodule // test
