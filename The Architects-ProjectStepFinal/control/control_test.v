`include ".\and_4b\and_4b_test.v"
`include ".\mult_4b\mult_4b_test.v"
`include ".\nand_4b\nand_4b_test.v"
`include ".\nor_4b\nor_4b_test.v"
`include ".\or_4b\or_4b_test.v"
`include ".\shift_4b\shift_4b_test.v"
`include ".\sub_4b\sub_4b_test.v"
`include ".\xnor_4b\xnor_4b_test.v"
`include ".\xor_4b\xor_4b_test.v"
`include ".\not_4b\not_4b_test.v"

module control_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #10 clk = !clk;

  reg [3:0] x = 0;
  reg [3:0] y = 0;
  reg Cin = 0;
  initial begin
     
     # 1000000
     # 10 x = 4'b1000;
     # 10 y = 4'b1001;
     # 10 Cin = 1;
     # 10 x = 4'b1101;
     # 10 y = 4'b0110;
     # 10 Cin = 0;
     # 10 x = 4'b1000;
     # 10 y = 4'b1001;
     # 10 $finish;
  end

  wire [3:0] out;
  wire Cout;
  add_4b a0 (x, y, out, Cin, Cout);
  
  initial begin
     $dumpfile("control.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,y);
     $dumpvars(3,out);
    $dumpvars (4, Cout);
    $dumpvars (5, Cin);
  end
  
  initial
     $monitor("At time %t, x(%b) and y(%b) with Cin(%b)= out(%b) with Cout(%b)",
              $time, x, y, Cin, out, Cout);

endmodule