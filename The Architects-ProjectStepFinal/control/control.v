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

  output [3:0] AndResult, NandResult, OrResult, NorResult, XorResult, XnorResult, NotResult, ShiftResult, AddResult, SubResult;
  output [7:0] MultResult;
  output CoutResult;
  input [3:0] x, y, operation;
  input CinResult;

  wire x, y, AndResult, NandResult, OrResult, NorResult, XorResult, XnorResult, NotResult, ShiftResult, AddResult, SubResult, MultResult;

endmodule