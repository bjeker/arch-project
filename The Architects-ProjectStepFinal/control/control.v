`include ".\add_4b\add_4b.v"
`include ".\and_4b\and_4b.v"
`include ".\mult_4b\mult_4b.v"
`include ".\nand_4b\nand_4b.v"
`include ".\nor_4b\nor_4b.v"
`include ".\or_4b\or_4b.v"
`include ".\shift_4b\shift_4b.v"
`include ".\sub_4b\sub_4b.v"
`include ".\xnor_4b\xnor_4b.v"
`include ".\xor_4b\xor_4b.v"
`include ".\not_4b\not_4b.v"

module control;

  output [3:0] Result;
  output CoutResult;
  input [3:0] x, y;
  input CinResult;
  input [4:0] Operation;

  wire x, y, Result, AddResult;


  //instantiations
  alu_add_4b add_4b(.x(x), .y(y), Cin(CinResult), out(AddResult), Cout(CoutResult));

  case(Operation)
    4'b 0000: Result = AddResult;
    default: Result = 4'b0000
  endcase

endmodule