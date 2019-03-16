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

module Compressor( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_in, // @[:@6.4]
  output [31:0] io_out, // @[:@6.4]
  input  [31:0] io_point, // @[:@6.4]
  input  [31:0] io_rate // @[:@6.4]
);
  reg [32:0] dst; // @[Compressor.scala 15:20:@8.4]
  reg [63:0] _RAND_0;
  reg [32:0] _T_30; // @[Compressor.scala 24:19:@31.6]
  reg [63:0] _RAND_1;
  reg [31:0] _T_32; // @[Compressor.scala 26:19:@36.6]
  reg [31:0] _RAND_2;
  wire  is_negative; // @[Compressor.scala 18:27:@10.4]
  wire [32:0] _T_10; // @[Compressor.scala 19:33:@11.4]
  wire [31:0] _T_11; // @[Compressor.scala 19:33:@12.4]
  wire [31:0] _T_12; // @[Compressor.scala 19:33:@13.4]
  wire [31:0] abs_in; // @[Compressor.scala 19:19:@14.4]
  wire  is_valid; // @[Compressor.scala 20:26:@15.4]
  wire  _T_14; // @[Compressor.scala 21:16:@16.4]
  wire  _T_15; // @[Compressor.scala 21:28:@17.4]
  wire [32:0] _T_16; // @[Compressor.scala 22:24:@19.6]
  wire [31:0] _T_17; // @[Compressor.scala 22:24:@20.6]
  wire [31:0] _T_18; // @[Compressor.scala 22:24:@21.6]
  wire [32:0] _T_19; // @[Compressor.scala 22:36:@22.6]
  wire [32:0] _GEN_1; // @[Compressor.scala 23:25:@23.6]
  wire [33:0] _T_20; // @[Compressor.scala 23:25:@23.6]
  wire [32:0] _T_21; // @[Compressor.scala 23:25:@24.6]
  wire [32:0] _T_22; // @[Compressor.scala 23:25:@25.6]
  wire [33:0] _T_24; // @[Compressor.scala 24:51:@26.6]
  wire [32:0] _T_25; // @[Compressor.scala 24:51:@27.6]
  wire [32:0] _T_26; // @[Compressor.scala 24:51:@28.6]
  wire [32:0] _T_27; // @[Compressor.scala 24:37:@29.6]
  wire [32:0] _T_28; // @[Compressor.scala 24:23:@30.6]
  wire [32:0] _GEN_0; // @[Compressor.scala 21:41:@18.4]
  wire [31:0] _GEN_2;
  assign is_negative = $signed(io_in) < $signed(32'sh0); // @[Compressor.scala 18:27:@10.4]
  assign _T_10 = $signed(32'sh0) - $signed(io_in); // @[Compressor.scala 19:33:@11.4]
  assign _T_11 = _T_10[31:0]; // @[Compressor.scala 19:33:@12.4]
  assign _T_12 = $signed(_T_11); // @[Compressor.scala 19:33:@13.4]
  assign abs_in = is_negative ? $signed(_T_12) : $signed(io_in); // @[Compressor.scala 19:19:@14.4]
  assign is_valid = $signed(io_rate) > $signed(32'sh0); // @[Compressor.scala 20:26:@15.4]
  assign _T_14 = $signed(abs_in) > $signed(io_point); // @[Compressor.scala 21:16:@16.4]
  assign _T_15 = _T_14 & is_valid; // @[Compressor.scala 21:28:@17.4]
  assign _T_16 = $signed(abs_in) - $signed(io_point); // @[Compressor.scala 22:24:@19.6]
  assign _T_17 = _T_16[31:0]; // @[Compressor.scala 22:24:@20.6]
  assign _T_18 = $signed(_T_17); // @[Compressor.scala 22:24:@21.6]
  assign _T_19 = $signed(_T_18) / $signed(io_rate); // @[Compressor.scala 22:36:@22.6]
  assign _GEN_1 = {{1{io_point[31]}},io_point}; // @[Compressor.scala 23:25:@23.6]
  assign _T_20 = $signed(_GEN_1) + $signed(_T_19); // @[Compressor.scala 23:25:@23.6]
  assign _T_21 = _T_20[32:0]; // @[Compressor.scala 23:25:@24.6]
  assign _T_22 = $signed(_T_21); // @[Compressor.scala 23:25:@25.6]
  assign _T_24 = $signed(33'sh0) - $signed(_T_22); // @[Compressor.scala 24:51:@26.6]
  assign _T_25 = _T_24[32:0]; // @[Compressor.scala 24:51:@27.6]
  assign _T_26 = $signed(_T_25); // @[Compressor.scala 24:51:@28.6]
  assign _T_27 = is_negative ? $signed(_T_26) : $signed(_T_22); // @[Compressor.scala 24:37:@29.6]
  assign _T_28 = is_valid ? $signed(_T_27) : $signed({{1{io_in[31]}},io_in}); // @[Compressor.scala 24:23:@30.6]
  assign _GEN_0 = _T_15 ? $signed(_T_30) : $signed({{1{_T_32[31]}},_T_32}); // @[Compressor.scala 21:41:@18.4]
  assign _GEN_2 = dst[31:0];
  assign io_out = $signed(_GEN_2);
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{$random}};
  dst = _RAND_0[32:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{$random}};
  _T_30 = _RAND_1[32:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_32 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      dst <= 33'sh0;
    end else begin
      if (_T_15) begin
        dst <= _T_30;
      end else begin
        dst <= {{1{_T_32[31]}},_T_32};
      end
    end
    if (is_valid) begin
      if (is_negative) begin
        _T_30 <= _T_26;
      end else begin
        _T_30 <= _T_22;
      end
    end else begin
      _T_30 <= {{1{io_in[31]}},io_in};
    end
    _T_32 <= io_in;
  end
endmodule
