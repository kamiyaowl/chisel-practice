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
  input  [31:0] io_rate // @[:@6.4]
);
  reg  is_negative; // @[Distortion.scala 15:28:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] abs_in; // @[Distortion.scala 16:23:@9.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_34; // @[Distortion.scala 25:22:@35.6]
  reg [31:0] _RAND_2;
  wire  _T_11; // @[Distortion.scala 17:24:@10.4]
  wire [32:0] _T_13; // @[Distortion.scala 18:30:@12.4]
  wire [31:0] _T_14; // @[Distortion.scala 18:30:@13.4]
  wire [31:0] _T_15; // @[Distortion.scala 18:30:@14.4]
  wire [31:0] _T_16; // @[Distortion.scala 18:16:@15.4]
  wire  _T_17; // @[Distortion.scala 20:16:@17.4]
  wire  _T_19; // @[Distortion.scala 20:40:@18.4]
  wire  _T_20; // @[Distortion.scala 20:28:@19.4]
  wire [32:0] _T_21; // @[Distortion.scala 21:24:@21.6]
  wire [31:0] _T_22; // @[Distortion.scala 21:24:@22.6]
  wire [31:0] _T_23; // @[Distortion.scala 21:24:@23.6]
  wire [32:0] _T_24; // @[Distortion.scala 21:36:@24.6]
  wire [32:0] _GEN_1; // @[Distortion.scala 22:25:@25.6]
  wire [33:0] _T_25; // @[Distortion.scala 22:25:@25.6]
  wire [32:0] _T_26; // @[Distortion.scala 22:25:@26.6]
  wire [32:0] _T_27; // @[Distortion.scala 22:25:@27.6]
  wire [33:0] _T_29; // @[Distortion.scala 23:32:@28.6]
  wire [32:0] _T_30; // @[Distortion.scala 23:32:@29.6]
  wire [32:0] _T_31; // @[Distortion.scala 23:32:@30.6]
  wire [32:0] _T_32; // @[Distortion.scala 23:18:@31.6]
  wire [32:0] _GEN_0; // @[Distortion.scala 20:48:@20.4]
  wire [31:0] _GEN_2;
  assign _T_11 = $signed(io_in) < $signed(32'sh0); // @[Distortion.scala 17:24:@10.4]
  assign _T_13 = $signed(32'sh0) - $signed(io_in); // @[Distortion.scala 18:30:@12.4]
  assign _T_14 = _T_13[31:0]; // @[Distortion.scala 18:30:@13.4]
  assign _T_15 = $signed(_T_14); // @[Distortion.scala 18:30:@14.4]
  assign _T_16 = is_negative ? $signed(_T_15) : $signed(io_in); // @[Distortion.scala 18:16:@15.4]
  assign _T_17 = $signed(abs_in) > $signed(io_point); // @[Distortion.scala 20:16:@17.4]
  assign _T_19 = $signed(io_rate) > $signed(32'sh0); // @[Distortion.scala 20:40:@18.4]
  assign _T_20 = _T_17 & _T_19; // @[Distortion.scala 20:28:@19.4]
  assign _T_21 = $signed(abs_in) - $signed(io_point); // @[Distortion.scala 21:24:@21.6]
  assign _T_22 = _T_21[31:0]; // @[Distortion.scala 21:24:@22.6]
  assign _T_23 = $signed(_T_22); // @[Distortion.scala 21:24:@23.6]
  assign _T_24 = $signed(_T_23) / $signed(io_rate); // @[Distortion.scala 21:36:@24.6]
  assign _GEN_1 = {{1{io_point[31]}},io_point}; // @[Distortion.scala 22:25:@25.6]
  assign _T_25 = $signed(_GEN_1) + $signed(_T_24); // @[Distortion.scala 22:25:@25.6]
  assign _T_26 = _T_25[32:0]; // @[Distortion.scala 22:25:@26.6]
  assign _T_27 = $signed(_T_26); // @[Distortion.scala 22:25:@27.6]
  assign _T_29 = $signed(33'sh0) - $signed(_T_27); // @[Distortion.scala 23:32:@28.6]
  assign _T_30 = _T_29[32:0]; // @[Distortion.scala 23:32:@29.6]
  assign _T_31 = $signed(_T_30); // @[Distortion.scala 23:32:@30.6]
  assign _T_32 = is_negative ? $signed(_T_31) : $signed(_T_27); // @[Distortion.scala 23:18:@31.6]
  assign _GEN_0 = _T_20 ? $signed(_T_32) : $signed({{1{_T_34[31]}},_T_34}); // @[Distortion.scala 20:48:@20.4]
  assign _GEN_2 = _GEN_0[31:0];
  assign io_out = $signed(_GEN_2);
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  is_negative = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  abs_in = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_34 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      is_negative <= 1'h0;
    end else begin
      is_negative <= _T_11;
    end
    if (reset) begin
      abs_in <= 32'sh0;
    end else begin
      if (is_negative) begin
        abs_in <= _T_15;
      end else begin
        abs_in <= io_in;
      end
    end
    _T_34 <= io_in;
  end
endmodule
