module control_test;

/* Make a regular pulsing clock. */
reg clk = 0;
always #20 clk = !clk;

reg [3:0] x = 0;
reg [3:0] y = 0;
reg [3:0] operation = 0;
reg [3:0] Result = 0;
reg Cout = CoutResult 0;
reg CinResult = 0;

initial begin
   //and
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h0;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //nand
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h1;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //or
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h2;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //nor
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h3;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //xor
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h4;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //xnor
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h5;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //not
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h6;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //shift
   x = 4'b1101;
   y = 4'b1110;
   operation = 4'h7;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   #10;
   //add
   x = 4'b1101;
   y = 4'b1110;
   CinResult = 1;
   operation = 4'h8;
   Cout = CoutResult;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   Cout = CoutResult;
   #10;
   //sub
   x = 4'b1101;
   y = 4'b1110;
   CinResult = 1;
   operation = 4'h9;
   Cout = CoutResult;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   Cout = CoutResult;
   #10;
   //mult
   x = 4'b1101;
   y = 4'b1110;
   CinResult = 1;
   operation = 4'hA;
   Cout = CoutResult;
   #10;
   x = 4'b1001;
   y = 4'b0101;
   Cout = CoutResult;
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
shift_4b shift4(.x(x), .y(y));
add_4b add4(.x(x), .y(y), .out(AddResult), .Cin(CinResult), .Cout(CoutResult));
sub_4b sub4(.x(x), .y(y), .out(SubResult), .Cin(CinResult), .Cout(CoutResult));
mult_4b mult4(.x(x), .y(y), .out(MultResult), .Cin(CinResult), .Cout(CoutResult));

//switch case
always @* begin
case (operation)
   4'h0: Result = AndResult;
   4'h1: Result = NandResult;
   4'h2: Result = OrResult;
   4'h3: Result = NorResult;
   4'h4: Result = XorResult;
   4'h5: Result = XnorResult;
   4'h6: Result = NotResult;
   4'h7: Result = ShiftResult;
   4'h8: Result = AddResult;
   4'h9: Result = SubResult;
   4'hA: Result = MultResult;
endcase
end

initial begin
   $dumpfile("control.vcd");
   $dumpvars(0,clk);
   $dumpvars(1,x);
   $dumpvars(2,y);
   $dumpvars (3, Cout);
   $dumpvars (4, CinResult);
   $dumpvars (5, Result);
end

initial
   $monitor("At time %t, x(%b) and y(%b) with CinResult(%b)= Result(%b) with Cout(%b)",
   $time, x, y, CinResult, Result, Cout);
endmodule