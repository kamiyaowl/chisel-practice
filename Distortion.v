`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif

module Distortion( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_in, // @[:@6.4]
  output [31:0] io_out, // @[:@6.4]
  input  [31:0] io_point, // @[:@6.4]
  input  [31:0] io_shift // @[:@6.4]
);
  reg [31:0] abs_in; // @[Distortion.scala 15:23:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] _T_16; // @[Distortion.scala 17:20:@15.4]
  reg [31:0] _RAND_1;
  wire  _T_9; // @[Distortion.scala 16:23:@9.4]
  wire [32:0] _T_11; // @[Distortion.scala 16:30:@10.4]
  wire [31:0] _T_12; // @[Distortion.scala 16:30:@11.4]
  wire [31:0] _T_13; // @[Distortion.scala 16:30:@12.4]
  wire [31:0] _T_14; // @[Distortion.scala 16:16:@13.4]
  assign _T_9 = $signed(io_in) < $signed(32'sh0); // @[Distortion.scala 16:23:@9.4]
  assign _T_11 = $signed(32'sh0) - $signed(io_in); // @[Distortion.scala 16:30:@10.4]
  assign _T_12 = _T_11[31:0]; // @[Distortion.scala 16:30:@11.4]
  assign _T_13 = $signed(_T_12); // @[Distortion.scala 16:30:@12.4]
  assign _T_14 = _T_9 ? $signed(_T_13) : $signed(io_in); // @[Distortion.scala 16:16:@13.4]
  assign io_out = _T_16;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  abs_in = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_16 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      abs_in <= 32'sh0;
    end else begin
      if (_T_9) begin
        abs_in <= _T_13;
      end else begin
        abs_in <= io_in;
      end
    end
    _T_16 <= abs_in;
  end
endmodule
