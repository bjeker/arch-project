module control_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #10 clk = !clk;

  reg [3:0] x = 0;
  reg [3:0] y = 0;
  reg [3:0] operation = 0;
  reg [3:0] Result = 0;
  reg CinResult = 0;

  initial begin
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b0000;
     #10;
     x = 4'b1000;
     y = 4'b1000;
     CinResult = 0;
     operation = 4'b0001;
     #10;
     x = 4'b1010;
     y = 4'b1001;
     CinResult = 1;
     operation = 4'b0010;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b0011;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b0100;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b0101;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b0110;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b0111;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b1000;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b1001;
     #10;
     x = 4'b1101;
     y = 4'b1110;
     CinResult = 1;
     operation = 4'b1010;
     #10;
     $finish;
  end

  wire [3:0] AndResult, NandResult, OrResult, NorResult, XorResult, XnorResult, NotResult, ShiftResult, AddResult, SubResult;
  wire [7:0] MultResult;
  wire CoutResult;
  
  //instantiations
  and_4b and4(.x(x), .y(y), .out(AndResult));
  nand_4b nand4(.x(x), .y(y), .out(NandResult));
  or_4b or4(.x(x), .y(y), .out(OrResult));
  nor_4b nor4(.x(x), .y(y), .out(NorResult));
  xor_4b xor4(.x(x), .y(y), .out(XorResult));
  xnor_4b xnor4(.x(x), .y(y), .out(XnorResult));
  not_4b not4(.x(x), .out(NotResult));
  //shift_4b shift4(.x(x), .y(y), .out(ShiftResult));
  add_4b add4(.x(x), .y(y), .out(AddResult), .Cin(CinResult), .Cout(CoutResult));
  sub_4b sub4(.x(x), .y(y), .out(SubResult), .Cin(CinResult), .Cout(CoutResult));
  mult_4b mult4(.x(x), .y(y), .out(MultResult), .Cin(CinResult), .Cout(CoutResult));


//switch case
always @* begin
   case (operation)
      4'b0000: Result = AndResult;
      4'b0001: Result = NandResult;
      4'b0010: Result = OrResult;
      4'b0011: Result = NorResult;
      4'b0100: Result = XorResult;
      4'b0101: Result = XnorResult;
      4'b0110: Result = NotResult;
      4'b0111: Result = ShiftResult;
      4'b1000: Result = AddResult;
      4'b1001: Result = SubResult;
      4'b1010: Result = MultResult;
   endcase
end

  initial begin
     $dumpfile("control.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,y);
     $dumpvars (3, CoutResult);
     $dumpvars (4, CinResult);
     $dumpvars (5, Result);
  end
  
  initial
      $monitor("At time %t, x(%b) and y(%b) with CinResult(%b)= Result(%b) with CoutResult(%b)",
      $time, x, y, CinResult, Result, CoutResult);
endmodule