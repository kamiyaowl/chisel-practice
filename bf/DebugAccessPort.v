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

module UartTxRx( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input        io_rx, // @[:@6.4]
  output       io_tx, // @[:@6.4]
  output [7:0] io_rxData, // @[:@6.4]
  output       io_rxValid, // @[:@6.4]
  input        io_rxAck, // @[:@6.4]
  input  [7:0] io_txData, // @[:@6.4]
  input        io_txValid, // @[:@6.4]
  output       io_txAck // @[:@6.4]
);
  reg  tx; // @[UartTxRx.scala 30:19:@8.4]
  reg [31:0] _RAND_0;
  reg [7:0] rxData; // @[UartTxRx.scala 31:23:@9.4]
  reg [31:0] _RAND_1;
  reg  rxValid; // @[UartTxRx.scala 32:24:@10.4]
  reg [31:0] _RAND_2;
  reg  txAck; // @[UartTxRx.scala 34:22:@12.4]
  reg [31:0] _RAND_3;
  reg  rxActive; // @[UartTxRx.scala 48:25:@18.4]
  reg [31:0] _RAND_4;
  reg  rxTrigger; // @[UartTxRx.scala 50:26:@20.4]
  reg [31:0] _RAND_5;
  reg [9:0] rxDurationCounter; // @[UartTxRx.scala 51:34:@21.4]
  reg [31:0] _RAND_6;
  reg  rx1; // @[UartTxRx.scala 52:20:@22.4]
  reg [31:0] _RAND_7;
  reg  rx2; // @[UartTxRx.scala 53:20:@23.4]
  reg [31:0] _RAND_8;
  reg [7:0] rxBuf; // @[UartTxRx.scala 76:22:@57.4]
  reg [31:0] _RAND_9;
  reg [3:0] rxCounter; // @[UartTxRx.scala 78:26:@59.4]
  reg [31:0] _RAND_10;
  reg  txActive; // @[UartTxRx.scala 103:25:@87.4]
  reg [31:0] _RAND_11;
  reg  txTrigger; // @[UartTxRx.scala 105:26:@89.4]
  reg [31:0] _RAND_12;
  reg [9:0] txDurationCounter; // @[UartTxRx.scala 106:34:@90.4]
  reg [31:0] _RAND_13;
  reg [7:0] txBuf; // @[UartTxRx.scala 107:22:@91.4]
  reg [31:0] _RAND_14;
  reg [3:0] txCounter; // @[UartTxRx.scala 109:26:@93.4]
  reg [31:0] _RAND_15;
  wire  _T_37; // @[UartTxRx.scala 56:8:@26.4]
  wire  _T_39; // @[UartTxRx.scala 57:17:@28.6]
  wire  _T_40; // @[UartTxRx.scala 57:14:@29.6]
  wire [9:0] _T_45; // @[UartTxRx.scala 61:28:@33.8]
  wire [8:0] _T_46; // @[UartTxRx.scala 61:28:@34.8]
  wire [8:0] _T_47; // @[UartTxRx.scala 61:28:@35.8]
  wire [9:0] _GEN_2; // @[UartTxRx.scala 57:23:@30.6]
  wire  _T_51; // @[UartTxRx.scala 67:28:@44.6]
  wire [10:0] _T_53; // @[UartTxRx.scala 68:46:@46.8]
  wire [9:0] _T_54; // @[UartTxRx.scala 68:46:@47.8]
  wire [9:0] _T_55; // @[UartTxRx.scala 68:46:@48.8]
  wire [9:0] _GEN_3; // @[UartTxRx.scala 67:42:@45.6]
  wire  _GEN_4; // @[UartTxRx.scala 67:42:@45.6]
  wire  _GEN_5; // @[UartTxRx.scala 56:19:@27.4]
  wire  _GEN_6; // @[UartTxRx.scala 56:19:@27.4]
  wire [9:0] _GEN_7; // @[UartTxRx.scala 56:19:@27.4]
  wire [4:0] _T_64; // @[UartTxRx.scala 81:30:@62.8]
  wire [3:0] _T_65; // @[UartTxRx.scala 81:30:@63.8]
  wire [6:0] _T_66; // @[UartTxRx.scala 82:23:@65.8]
  wire [7:0] _T_69; // @[UartTxRx.scala 82:41:@66.8]
  wire [7:0] _GEN_49; // @[UartTxRx.scala 82:36:@67.8]
  wire [8:0] _T_70; // @[UartTxRx.scala 82:36:@67.8]
  wire [7:0] _T_71; // @[UartTxRx.scala 82:36:@68.8]
  wire  _T_73; // @[UartTxRx.scala 85:22:@70.8]
  wire  _GEN_8; // @[UartTxRx.scala 85:29:@71.8]
  wire [7:0] _GEN_9; // @[UartTxRx.scala 85:29:@71.8]
  wire  _GEN_10; // @[UartTxRx.scala 85:29:@71.8]
  wire [3:0] _GEN_11; // @[UartTxRx.scala 80:21:@61.6]
  wire [7:0] _GEN_12; // @[UartTxRx.scala 80:21:@61.6]
  wire  _GEN_13; // @[UartTxRx.scala 80:21:@61.6]
  wire [7:0] _GEN_14; // @[UartTxRx.scala 80:21:@61.6]
  wire  _GEN_15; // @[UartTxRx.scala 80:21:@61.6]
  wire [3:0] _GEN_16; // @[UartTxRx.scala 79:18:@60.4]
  wire [7:0] _GEN_17; // @[UartTxRx.scala 79:18:@60.4]
  wire  _GEN_18; // @[UartTxRx.scala 79:18:@60.4]
  wire [7:0] _GEN_19; // @[UartTxRx.scala 79:18:@60.4]
  wire  _GEN_20; // @[UartTxRx.scala 79:18:@60.4]
  wire  _T_78; // @[UartTxRx.scala 97:16:@82.4]
  wire [7:0] _GEN_21; // @[UartTxRx.scala 97:28:@83.4]
  wire  _GEN_22; // @[UartTxRx.scala 97:28:@83.4]
  wire  _T_92; // @[UartTxRx.scala 110:8:@94.4]
  wire  _GEN_23; // @[UartTxRx.scala 111:23:@96.6]
  wire [7:0] _GEN_24; // @[UartTxRx.scala 111:23:@96.6]
  wire [9:0] _GEN_26; // @[UartTxRx.scala 111:23:@96.6]
  wire  _T_99; // @[UartTxRx.scala 123:29:@108.6]
  wire [10:0] _T_101; // @[UartTxRx.scala 124:46:@110.8]
  wire [9:0] _T_102; // @[UartTxRx.scala 124:46:@111.8]
  wire [9:0] _T_103; // @[UartTxRx.scala 124:46:@112.8]
  wire [9:0] _GEN_27; // @[UartTxRx.scala 123:43:@109.6]
  wire  _GEN_28; // @[UartTxRx.scala 123:43:@109.6]
  wire  _GEN_29; // @[UartTxRx.scala 110:19:@95.4]
  wire [7:0] _GEN_30; // @[UartTxRx.scala 110:19:@95.4]
  wire  _GEN_31; // @[UartTxRx.scala 110:19:@95.4]
  wire [9:0] _GEN_32; // @[UartTxRx.scala 110:19:@95.4]
  wire  _GEN_33; // @[UartTxRx.scala 110:19:@95.4]
  wire  _T_108; // @[UartTxRx.scala 136:22:@123.8]
  wire [4:0] _T_111; // @[UartTxRx.scala 139:32:@126.10]
  wire [3:0] _T_112; // @[UartTxRx.scala 139:32:@127.10]
  wire  _T_114; // @[UartTxRx.scala 140:29:@131.10]
  wire [4:0] _T_116; // @[UartTxRx.scala 143:31:@133.12]
  wire [4:0] _T_117; // @[UartTxRx.scala 143:31:@134.12]
  wire [3:0] _T_118; // @[UartTxRx.scala 143:31:@135.12]
  wire [7:0] _T_119; // @[UartTxRx.scala 143:20:@136.12]
  wire  _T_120; // @[UartTxRx.scala 143:20:@137.12]
  wire  _T_125; // @[UartTxRx.scala 145:29:@144.12]
  wire  _T_128; // @[UartTxRx.scala 147:15:@147.14]
  wire [3:0] _GEN_35; // @[UartTxRx.scala 145:37:@145.12]
  wire  _GEN_36; // @[UartTxRx.scala 145:37:@145.12]
  wire  _GEN_37; // @[UartTxRx.scala 140:36:@132.10]
  wire [3:0] _GEN_38; // @[UartTxRx.scala 140:36:@132.10]
  wire  _GEN_39; // @[UartTxRx.scala 140:36:@132.10]
  wire  _GEN_40; // @[UartTxRx.scala 136:31:@124.8]
  wire [3:0] _GEN_41; // @[UartTxRx.scala 136:31:@124.8]
  wire  _GEN_42; // @[UartTxRx.scala 136:31:@124.8]
  wire  _GEN_43; // @[UartTxRx.scala 134:21:@122.6]
  wire [3:0] _GEN_44; // @[UartTxRx.scala 134:21:@122.6]
  wire  _GEN_45; // @[UartTxRx.scala 134:21:@122.6]
  wire  _GEN_46; // @[UartTxRx.scala 133:18:@121.4]
  wire [3:0] _GEN_47; // @[UartTxRx.scala 133:18:@121.4]
  wire  _GEN_48; // @[UartTxRx.scala 133:18:@121.4]
  wire  _GEN_50; // @[UartTxRx.scala 147:15:@149.16]
  wire  _GEN_51; // @[UartTxRx.scala 147:15:@149.16]
  wire  _GEN_52; // @[UartTxRx.scala 147:15:@149.16]
  wire  _GEN_53; // @[UartTxRx.scala 147:15:@149.16]
  wire  _GEN_54; // @[UartTxRx.scala 147:15:@149.16]
  wire  _GEN_55; // @[UartTxRx.scala 147:15:@149.16]
  assign _T_37 = rxActive == 1'h0; // @[UartTxRx.scala 56:8:@26.4]
  assign _T_39 = rx1 == 1'h0; // @[UartTxRx.scala 57:17:@28.6]
  assign _T_40 = rx2 & _T_39; // @[UartTxRx.scala 57:14:@29.6]
  assign _T_45 = $signed(9'sh0) - $signed(9'shd9); // @[UartTxRx.scala 61:28:@33.8]
  assign _T_46 = _T_45[8:0]; // @[UartTxRx.scala 61:28:@34.8]
  assign _T_47 = $signed(_T_46); // @[UartTxRx.scala 61:28:@35.8]
  assign _GEN_2 = _T_40 ? $signed({{1{_T_47[8]}},_T_47}) : $signed(rxDurationCounter); // @[UartTxRx.scala 57:23:@30.6]
  assign _T_51 = $signed(rxDurationCounter) < $signed(10'sh1b2); // @[UartTxRx.scala 67:28:@44.6]
  assign _T_53 = $signed(rxDurationCounter) + $signed(10'sh1); // @[UartTxRx.scala 68:46:@46.8]
  assign _T_54 = _T_53[9:0]; // @[UartTxRx.scala 68:46:@47.8]
  assign _T_55 = $signed(_T_54); // @[UartTxRx.scala 68:46:@48.8]
  assign _GEN_3 = _T_51 ? $signed(_T_55) : $signed(10'sh0); // @[UartTxRx.scala 67:42:@45.6]
  assign _GEN_4 = _T_51 ? 1'h0 : 1'h1; // @[UartTxRx.scala 67:42:@45.6]
  assign _GEN_5 = _T_37 ? _T_40 : rxActive; // @[UartTxRx.scala 56:19:@27.4]
  assign _GEN_6 = _T_37 ? 1'h0 : _GEN_4; // @[UartTxRx.scala 56:19:@27.4]
  assign _GEN_7 = _T_37 ? $signed(_GEN_2) : $signed(_GEN_3); // @[UartTxRx.scala 56:19:@27.4]
  assign _T_64 = rxCounter + 4'h1; // @[UartTxRx.scala 81:30:@62.8]
  assign _T_65 = _T_64[3:0]; // @[UartTxRx.scala 81:30:@63.8]
  assign _T_66 = rxBuf[7:1]; // @[UartTxRx.scala 82:23:@65.8]
  assign _T_69 = io_rx ? 8'h80 : 8'h0; // @[UartTxRx.scala 82:41:@66.8]
  assign _GEN_49 = {{1'd0}, _T_66}; // @[UartTxRx.scala 82:36:@67.8]
  assign _T_70 = _GEN_49 + _T_69; // @[UartTxRx.scala 82:36:@67.8]
  assign _T_71 = _T_70[7:0]; // @[UartTxRx.scala 82:36:@68.8]
  assign _T_73 = rxCounter > 4'h7; // @[UartTxRx.scala 85:22:@70.8]
  assign _GEN_8 = _T_73 ? 1'h0 : _GEN_5; // @[UartTxRx.scala 85:29:@71.8]
  assign _GEN_9 = _T_73 ? rxBuf : rxData; // @[UartTxRx.scala 85:29:@71.8]
  assign _GEN_10 = _T_73 ? 1'h1 : rxValid; // @[UartTxRx.scala 85:29:@71.8]
  assign _GEN_11 = rxTrigger ? _T_65 : rxCounter; // @[UartTxRx.scala 80:21:@61.6]
  assign _GEN_12 = rxTrigger ? _T_71 : rxBuf; // @[UartTxRx.scala 80:21:@61.6]
  assign _GEN_13 = rxTrigger ? _GEN_8 : _GEN_5; // @[UartTxRx.scala 80:21:@61.6]
  assign _GEN_14 = rxTrigger ? _GEN_9 : rxData; // @[UartTxRx.scala 80:21:@61.6]
  assign _GEN_15 = rxTrigger ? _GEN_10 : rxValid; // @[UartTxRx.scala 80:21:@61.6]
  assign _GEN_16 = rxActive ? _GEN_11 : 4'h0; // @[UartTxRx.scala 79:18:@60.4]
  assign _GEN_17 = rxActive ? _GEN_12 : 8'h0; // @[UartTxRx.scala 79:18:@60.4]
  assign _GEN_18 = rxActive ? _GEN_13 : _GEN_5; // @[UartTxRx.scala 79:18:@60.4]
  assign _GEN_19 = rxActive ? _GEN_14 : rxData; // @[UartTxRx.scala 79:18:@60.4]
  assign _GEN_20 = rxActive ? _GEN_15 : rxValid; // @[UartTxRx.scala 79:18:@60.4]
  assign _T_78 = rxValid & io_rxAck; // @[UartTxRx.scala 97:16:@82.4]
  assign _GEN_21 = _T_78 ? 8'h0 : _GEN_19; // @[UartTxRx.scala 97:28:@83.4]
  assign _GEN_22 = _T_78 ? 1'h0 : _GEN_20; // @[UartTxRx.scala 97:28:@83.4]
  assign _T_92 = txActive == 1'h0; // @[UartTxRx.scala 110:8:@94.4]
  assign _GEN_23 = io_txValid ? 1'h1 : txActive; // @[UartTxRx.scala 111:23:@96.6]
  assign _GEN_24 = io_txValid ? io_txData : txBuf; // @[UartTxRx.scala 111:23:@96.6]
  assign _GEN_26 = io_txValid ? $signed(10'sh0) : $signed(txDurationCounter); // @[UartTxRx.scala 111:23:@96.6]
  assign _T_99 = $signed(txDurationCounter) < $signed(10'sh1b2); // @[UartTxRx.scala 123:29:@108.6]
  assign _T_101 = $signed(txDurationCounter) + $signed(10'sh1); // @[UartTxRx.scala 124:46:@110.8]
  assign _T_102 = _T_101[9:0]; // @[UartTxRx.scala 124:46:@111.8]
  assign _T_103 = $signed(_T_102); // @[UartTxRx.scala 124:46:@112.8]
  assign _GEN_27 = _T_99 ? $signed(_T_103) : $signed(10'sh0); // @[UartTxRx.scala 123:43:@109.6]
  assign _GEN_28 = _T_99 ? 1'h0 : 1'h1; // @[UartTxRx.scala 123:43:@109.6]
  assign _GEN_29 = _T_92 ? _GEN_23 : txActive; // @[UartTxRx.scala 110:19:@95.4]
  assign _GEN_30 = _T_92 ? _GEN_24 : txBuf; // @[UartTxRx.scala 110:19:@95.4]
  assign _GEN_31 = _T_92 ? io_txValid : 1'h0; // @[UartTxRx.scala 110:19:@95.4]
  assign _GEN_32 = _T_92 ? $signed(_GEN_26) : $signed(_GEN_27); // @[UartTxRx.scala 110:19:@95.4]
  assign _GEN_33 = _T_92 ? txTrigger : _GEN_28; // @[UartTxRx.scala 110:19:@95.4]
  assign _T_108 = txCounter == 4'h0; // @[UartTxRx.scala 136:22:@123.8]
  assign _T_111 = txCounter + 4'h1; // @[UartTxRx.scala 139:32:@126.10]
  assign _T_112 = _T_111[3:0]; // @[UartTxRx.scala 139:32:@127.10]
  assign _T_114 = txCounter < 4'h9; // @[UartTxRx.scala 140:29:@131.10]
  assign _T_116 = txCounter - 4'h1; // @[UartTxRx.scala 143:31:@133.12]
  assign _T_117 = $unsigned(_T_116); // @[UartTxRx.scala 143:31:@134.12]
  assign _T_118 = _T_117[3:0]; // @[UartTxRx.scala 143:31:@135.12]
  assign _T_119 = txBuf >> _T_118; // @[UartTxRx.scala 143:20:@136.12]
  assign _T_120 = _T_119[0]; // @[UartTxRx.scala 143:20:@137.12]
  assign _T_125 = txCounter < 4'ha; // @[UartTxRx.scala 145:29:@144.12]
  assign _T_128 = reset == 1'h0; // @[UartTxRx.scala 147:15:@147.14]
  assign _GEN_35 = _T_125 ? _T_112 : 4'h0; // @[UartTxRx.scala 145:37:@145.12]
  assign _GEN_36 = _T_125 ? _GEN_29 : 1'h0; // @[UartTxRx.scala 145:37:@145.12]
  assign _GEN_37 = _T_114 ? _T_120 : 1'h1; // @[UartTxRx.scala 140:36:@132.10]
  assign _GEN_38 = _T_114 ? _T_112 : _GEN_35; // @[UartTxRx.scala 140:36:@132.10]
  assign _GEN_39 = _T_114 ? _GEN_29 : _GEN_36; // @[UartTxRx.scala 140:36:@132.10]
  assign _GEN_40 = _T_108 ? 1'h0 : _GEN_37; // @[UartTxRx.scala 136:31:@124.8]
  assign _GEN_41 = _T_108 ? _T_112 : _GEN_38; // @[UartTxRx.scala 136:31:@124.8]
  assign _GEN_42 = _T_108 ? _GEN_29 : _GEN_39; // @[UartTxRx.scala 136:31:@124.8]
  assign _GEN_43 = txTrigger ? _GEN_40 : tx; // @[UartTxRx.scala 134:21:@122.6]
  assign _GEN_44 = txTrigger ? _GEN_41 : txCounter; // @[UartTxRx.scala 134:21:@122.6]
  assign _GEN_45 = txTrigger ? _GEN_42 : _GEN_29; // @[UartTxRx.scala 134:21:@122.6]
  assign _GEN_46 = txActive ? _GEN_43 : 1'h1; // @[UartTxRx.scala 133:18:@121.4]
  assign _GEN_47 = txActive ? _GEN_44 : 4'h0; // @[UartTxRx.scala 133:18:@121.4]
  assign _GEN_48 = txActive ? _GEN_45 : _GEN_29; // @[UartTxRx.scala 133:18:@121.4]
  assign io_tx = tx;
  assign io_rxData = rxData;
  assign io_rxValid = rxValid;
  assign io_txAck = txAck;
  assign _GEN_50 = txActive & txTrigger; // @[UartTxRx.scala 147:15:@149.16]
  assign _GEN_51 = _T_108 == 1'h0; // @[UartTxRx.scala 147:15:@149.16]
  assign _GEN_52 = _GEN_50 & _GEN_51; // @[UartTxRx.scala 147:15:@149.16]
  assign _GEN_53 = _T_114 == 1'h0; // @[UartTxRx.scala 147:15:@149.16]
  assign _GEN_54 = _GEN_52 & _GEN_53; // @[UartTxRx.scala 147:15:@149.16]
  assign _GEN_55 = _GEN_54 & _T_125; // @[UartTxRx.scala 147:15:@149.16]
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  tx = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  rxData = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  rxValid = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  txAck = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  rxActive = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  rxTrigger = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  rxDurationCounter = _RAND_6[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  rx1 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  rx2 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  rxBuf = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  rxCounter = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  txActive = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  txTrigger = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  txDurationCounter = _RAND_13[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  txBuf = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  txCounter = _RAND_15[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      tx <= 1'h1;
    end else begin
      if (txActive) begin
        if (txTrigger) begin
          if (_T_108) begin
            tx <= 1'h0;
          end else begin
            if (_T_114) begin
              tx <= _T_120;
            end else begin
              tx <= 1'h1;
            end
          end
        end
      end else begin
        tx <= 1'h1;
      end
    end
    if (reset) begin
      rxData <= 8'h0;
    end else begin
      if (_T_78) begin
        rxData <= 8'h0;
      end else begin
        if (rxActive) begin
          if (rxTrigger) begin
            if (_T_73) begin
              rxData <= rxBuf;
            end
          end
        end
      end
    end
    if (reset) begin
      rxValid <= 1'h0;
    end else begin
      if (_T_78) begin
        rxValid <= 1'h0;
      end else begin
        if (rxActive) begin
          if (rxTrigger) begin
            if (_T_73) begin
              rxValid <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      txAck <= 1'h0;
    end else begin
      if (_T_92) begin
        txAck <= io_txValid;
      end else begin
        txAck <= 1'h0;
      end
    end
    if (reset) begin
      rxActive <= 1'h0;
    end else begin
      if (rxActive) begin
        if (rxTrigger) begin
          if (_T_73) begin
            rxActive <= 1'h0;
          end else begin
            if (_T_37) begin
              rxActive <= _T_40;
            end
          end
        end else begin
          if (_T_37) begin
            rxActive <= _T_40;
          end
        end
      end else begin
        if (_T_37) begin
          rxActive <= _T_40;
        end
      end
    end
    if (reset) begin
      rxTrigger <= 1'h0;
    end else begin
      if (_T_37) begin
        rxTrigger <= 1'h0;
      end else begin
        if (_T_51) begin
          rxTrigger <= 1'h0;
        end else begin
          rxTrigger <= 1'h1;
        end
      end
    end
    if (reset) begin
      rxDurationCounter <= 10'sh0;
    end else begin
      if (_T_37) begin
        if (_T_40) begin
          rxDurationCounter <= {{1{_T_47[8]}},_T_47};
        end
      end else begin
        if (_T_51) begin
          rxDurationCounter <= _T_55;
        end else begin
          rxDurationCounter <= 10'sh0;
        end
      end
    end
    if (reset) begin
      rx1 <= 1'h1;
    end else begin
      rx1 <= io_rx;
    end
    if (reset) begin
      rx2 <= 1'h1;
    end else begin
      rx2 <= rx1;
    end
    if (reset) begin
      rxBuf <= 8'h0;
    end else begin
      if (rxActive) begin
        if (rxTrigger) begin
          rxBuf <= _T_71;
        end
      end else begin
        rxBuf <= 8'h0;
      end
    end
    if (reset) begin
      rxCounter <= 4'h0;
    end else begin
      if (rxActive) begin
        if (rxTrigger) begin
          rxCounter <= _T_65;
        end
      end else begin
        rxCounter <= 4'h0;
      end
    end
    if (reset) begin
      txActive <= 1'h0;
    end else begin
      if (txActive) begin
        if (txTrigger) begin
          if (_T_108) begin
            if (_T_92) begin
              if (io_txValid) begin
                txActive <= 1'h1;
              end
            end
          end else begin
            if (_T_114) begin
              if (_T_92) begin
                if (io_txValid) begin
                  txActive <= 1'h1;
                end
              end
            end else begin
              if (_T_125) begin
                if (_T_92) begin
                  if (io_txValid) begin
                    txActive <= 1'h1;
                  end
                end
              end else begin
                txActive <= 1'h0;
              end
            end
          end
        end else begin
          if (_T_92) begin
            if (io_txValid) begin
              txActive <= 1'h1;
            end
          end
        end
      end else begin
        txActive <= _GEN_29;
      end
    end
    if (reset) begin
      txTrigger <= 1'h0;
    end else begin
      if (!(_T_92)) begin
        if (_T_99) begin
          txTrigger <= 1'h0;
        end else begin
          txTrigger <= 1'h1;
        end
      end
    end
    if (reset) begin
      txDurationCounter <= 10'sh0;
    end else begin
      if (_T_92) begin
        if (io_txValid) begin
          txDurationCounter <= 10'sh0;
        end
      end else begin
        if (_T_99) begin
          txDurationCounter <= _T_103;
        end else begin
          txDurationCounter <= 10'sh0;
        end
      end
    end
    if (reset) begin
      txBuf <= 8'h0;
    end else begin
      if (_T_92) begin
        if (io_txValid) begin
          txBuf <= io_txData;
        end
      end
    end
    if (reset) begin
      txCounter <= 4'h0;
    end else begin
      if (txActive) begin
        if (txTrigger) begin
          if (_T_108) begin
            txCounter <= _T_112;
          end else begin
            if (_T_114) begin
              txCounter <= _T_112;
            end else begin
              if (_T_125) begin
                txCounter <= _T_112;
              end else begin
                txCounter <= 4'h0;
              end
            end
          end
        end
      end else begin
        txCounter <= 4'h0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_55 & _T_128) begin
          $fwrite(32'h80000002,"[Tx] stopbit\n"); // @[UartTxRx.scala 147:15:@149.16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module BrainfuckProcessor( // @[:@168.2]
  input        clock, // @[:@169.4]
  input        reset, // @[:@170.4]
  input        io_run, // @[:@171.4]
  input        io_program, // @[:@171.4]
  input  [7:0] io_programData, // @[:@171.4]
  input        io_programValid, // @[:@171.4]
  output       io_programReady, // @[:@171.4]
  output       io_programAck, // @[:@171.4]
  output [7:0] io_inst, // @[:@171.4]
  output       io_halted, // @[:@171.4]
  output [2:0] io_errorCode, // @[:@171.4]
  input  [7:0] io_stdinData, // @[:@171.4]
  input        io_stdinValid, // @[:@171.4]
  output       io_stdinAck, // @[:@171.4]
  output [7:0] io_stdoutData, // @[:@171.4]
  output       io_stdoutValid, // @[:@171.4]
  input        io_stdoutReady, // @[:@171.4]
  input        io_stdoutAck // @[:@171.4]
);
  reg  programReady; // @[BrainfuckProcessor.scala 46:29:@173.4]
  reg [31:0] _RAND_0;
  reg  programAck; // @[BrainfuckProcessor.scala 48:27:@175.4]
  reg [31:0] _RAND_1;
  reg  halted; // @[BrainfuckProcessor.scala 50:23:@177.4]
  reg [31:0] _RAND_2;
  reg [3:0] errorCode; // @[BrainfuckProcessor.scala 52:26:@179.4]
  reg [31:0] _RAND_3;
  reg  stdinAck; // @[BrainfuckProcessor.scala 56:25:@183.4]
  reg [31:0] _RAND_4;
  reg [7:0] stdoutData; // @[BrainfuckProcessor.scala 58:27:@185.4]
  reg [31:0] _RAND_5;
  reg  stdoutValid; // @[BrainfuckProcessor.scala 60:28:@187.4]
  reg [31:0] _RAND_6;
  reg [7:0] instMem [0:16383]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  reg [31:0] _RAND_7;
  wire [7:0] instMem__T_78_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_78_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_124_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_124_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_144_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_144_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_166_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_166_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_183_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_183_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_203_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_203_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_217_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_217_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_230_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_230_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_238_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_238_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_278_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_278_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_283_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_283_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [7:0] instMem__T_322_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire [13:0] instMem__T_322_addr; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire  instMem__T_322_mask; // @[BrainfuckProcessor.scala 64:20:@189.4]
  wire  instMem__T_322_en; // @[BrainfuckProcessor.scala 64:20:@189.4]
  reg [13:0] programAddr; // @[BrainfuckProcessor.scala 65:28:@190.4]
  reg [31:0] _RAND_8;
  reg [7:0] stackMem [0:1023]; // @[BrainfuckProcessor.scala 68:21:@191.4]
  reg [31:0] _RAND_9;
  wire [7:0] stackMem__T_131_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [9:0] stackMem__T_131_addr; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [7:0] stackMem__T_153_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [9:0] stackMem__T_153_addr; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [7:0] stackMem__T_286_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [9:0] stackMem__T_286_addr; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [7:0] stackMem__T_159_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [9:0] stackMem__T_159_addr; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire  stackMem__T_159_mask; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire  stackMem__T_159_en; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [7:0] stackMem__T_176_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [9:0] stackMem__T_176_addr; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire  stackMem__T_176_mask; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire  stackMem__T_176_en; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [7:0] stackMem__T_210_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire [9:0] stackMem__T_210_addr; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire  stackMem__T_210_mask; // @[BrainfuckProcessor.scala 68:21:@191.4]
  wire  stackMem__T_210_en; // @[BrainfuckProcessor.scala 68:21:@191.4]
  reg [9:0] stackPtr; // @[BrainfuckProcessor.scala 69:25:@192.4]
  reg [31:0] _RAND_10;
  reg [7:0] stackData; // @[BrainfuckProcessor.scala 70:26:@193.4]
  reg [31:0] _RAND_11;
  reg [13:0] branchStackMem [0:15]; // @[BrainfuckProcessor.scala 75:27:@196.4]
  reg [31:0] _RAND_12;
  wire [13:0] branchStackMem__T_255_data; // @[BrainfuckProcessor.scala 75:27:@196.4]
  wire [3:0] branchStackMem__T_255_addr; // @[BrainfuckProcessor.scala 75:27:@196.4]
  wire [13:0] branchStackMem__T_231_data; // @[BrainfuckProcessor.scala 75:27:@196.4]
  wire [3:0] branchStackMem__T_231_addr; // @[BrainfuckProcessor.scala 75:27:@196.4]
  wire  branchStackMem__T_231_mask; // @[BrainfuckProcessor.scala 75:27:@196.4]
  wire  branchStackMem__T_231_en; // @[BrainfuckProcessor.scala 75:27:@196.4]
  reg [3:0] branchStackPtr; // @[BrainfuckProcessor.scala 76:31:@197.4]
  reg [31:0] _RAND_13;
  reg [13:0] branchStackData; // @[BrainfuckProcessor.scala 77:32:@198.4]
  reg [31:0] _RAND_14;
  reg  branchJump; // @[BrainfuckProcessor.scala 92:27:@210.4]
  reg [31:0] _RAND_15;
  reg [3:0] branchJumpNest; // @[BrainfuckProcessor.scala 93:31:@211.4]
  reg [31:0] _RAND_16;
  reg [7:0] inst; // @[BrainfuckProcessor.scala 94:21:@212.4]
  reg [31:0] _RAND_17;
  reg [13:0] pc; // @[BrainfuckProcessor.scala 95:19:@213.4]
  reg [31:0] _RAND_18;
  reg  run; // @[BrainfuckProcessor.scala 243:20:@493.4]
  reg [31:0] _RAND_19;
  reg  run2; // @[BrainfuckProcessor.scala 244:21:@494.4]
  reg [31:0] _RAND_20;
  reg  programDelay; // @[BrainfuckProcessor.scala 255:29:@512.4]
  reg [31:0] _RAND_21;
  wire  _GEN_0; // @[BrainfuckProcessor.scala 82:18:@201.4]
  wire [7:0] _GEN_1; // @[BrainfuckProcessor.scala 86:24:@205.6]
  wire  _GEN_2; // @[BrainfuckProcessor.scala 86:24:@205.6]
  wire [7:0] _GEN_3; // @[BrainfuckProcessor.scala 85:21:@204.4]
  wire  _GEN_4; // @[BrainfuckProcessor.scala 85:21:@204.4]
  wire  _T_68; // @[BrainfuckProcessor.scala 99:8:@216.4]
  wire  _T_71; // @[BrainfuckProcessor.scala 100:11:@219.6]
  wire [14:0] _T_73; // @[BrainfuckProcessor.scala 103:17:@224.8]
  wire [13:0] _T_74; // @[BrainfuckProcessor.scala 103:17:@225.8]
  wire [13:0] _T_77; // @[BrainfuckProcessor.scala 104:31:@228.8]
  wire  _T_81; // @[Conditional.scala 37:30:@231.8]
  wire  _T_82; // @[Conditional.scala 37:30:@232.8]
  wire  _T_83; // @[Conditional.scala 37:55:@233.8]
  wire  _T_87; // @[Conditional.scala 37:30:@239.10]
  wire  _T_89; // @[BrainfuckProcessor.scala 111:31:@241.12]
  wire [4:0] _T_93; // @[BrainfuckProcessor.scala 115:47:@247.14]
  wire [3:0] _T_94; // @[BrainfuckProcessor.scala 115:47:@248.14]
  wire  _GEN_5; // @[BrainfuckProcessor.scala 111:63:@242.12]
  wire [3:0] _GEN_6; // @[BrainfuckProcessor.scala 111:63:@242.12]
  wire [3:0] _GEN_7; // @[BrainfuckProcessor.scala 111:63:@242.12]
  wire  _T_96; // @[Conditional.scala 37:30:@253.12]
  wire  _T_98; // @[BrainfuckProcessor.scala 119:31:@255.14]
  wire [4:0] _T_100; // @[BrainfuckProcessor.scala 120:47:@257.16]
  wire [4:0] _T_101; // @[BrainfuckProcessor.scala 120:47:@258.16]
  wire [3:0] _T_102; // @[BrainfuckProcessor.scala 120:47:@259.16]
  wire [3:0] _GEN_8; // @[BrainfuckProcessor.scala 119:38:@256.14]
  wire  _GEN_9; // @[BrainfuckProcessor.scala 119:38:@256.14]
  wire [3:0] _GEN_10; // @[Conditional.scala 39:67:@254.12]
  wire  _GEN_11; // @[Conditional.scala 39:67:@254.12]
  wire  _GEN_12; // @[Conditional.scala 39:67:@240.10]
  wire [3:0] _GEN_13; // @[Conditional.scala 39:67:@240.10]
  wire [3:0] _GEN_14; // @[Conditional.scala 39:67:@240.10]
  wire  _GEN_15; // @[Conditional.scala 39:67:@240.10]
  wire  _GEN_16; // @[Conditional.scala 40:58:@234.8]
  wire [3:0] _GEN_17; // @[Conditional.scala 40:58:@234.8]
  wire [3:0] _GEN_18; // @[Conditional.scala 40:58:@234.8]
  wire  _GEN_19; // @[Conditional.scala 40:58:@234.8]
  wire  _T_113; // @[Conditional.scala 37:30:@277.10]
  wire  _T_115; // @[BrainfuckProcessor.scala 136:26:@279.12]
  wire [13:0] _T_123; // @[BrainfuckProcessor.scala 141:37:@289.14]
  wire [10:0] _T_126; // @[BrainfuckProcessor.scala 142:35:@292.14]
  wire [9:0] _T_127; // @[BrainfuckProcessor.scala 142:35:@293.14]
  wire [9:0] _T_130; // @[BrainfuckProcessor.scala 143:49:@296.14]
  wire  _GEN_20; // @[BrainfuckProcessor.scala 136:52:@280.12]
  wire [3:0] _GEN_21; // @[BrainfuckProcessor.scala 136:52:@280.12]
  wire [13:0] _GEN_22; // @[BrainfuckProcessor.scala 136:52:@280.12]
  wire  _GEN_25; // @[BrainfuckProcessor.scala 136:52:@280.12]
  wire [7:0] _GEN_26; // @[BrainfuckProcessor.scala 136:52:@280.12]
  wire [9:0] _GEN_27; // @[BrainfuckProcessor.scala 136:52:@280.12]
  wire [7:0] _GEN_29; // @[BrainfuckProcessor.scala 136:52:@280.12]
  wire  _T_133; // @[Conditional.scala 37:30:@302.12]
  wire  _T_135; // @[BrainfuckProcessor.scala 147:26:@304.14]
  wire [13:0] _T_143; // @[BrainfuckProcessor.scala 152:37:@314.16]
  wire [10:0] _T_146; // @[BrainfuckProcessor.scala 153:35:@317.16]
  wire [10:0] _T_147; // @[BrainfuckProcessor.scala 153:35:@318.16]
  wire [9:0] _T_148; // @[BrainfuckProcessor.scala 153:35:@319.16]
  wire [9:0] _T_152; // @[BrainfuckProcessor.scala 154:49:@323.16]
  wire  _GEN_30; // @[BrainfuckProcessor.scala 147:35:@305.14]
  wire [3:0] _GEN_31; // @[BrainfuckProcessor.scala 147:35:@305.14]
  wire [13:0] _GEN_32; // @[BrainfuckProcessor.scala 147:35:@305.14]
  wire  _GEN_35; // @[BrainfuckProcessor.scala 147:35:@305.14]
  wire [7:0] _GEN_36; // @[BrainfuckProcessor.scala 147:35:@305.14]
  wire [9:0] _GEN_37; // @[BrainfuckProcessor.scala 147:35:@305.14]
  wire [7:0] _GEN_39; // @[BrainfuckProcessor.scala 147:35:@305.14]
  wire  _T_155; // @[Conditional.scala 37:30:@329.14]
  wire [8:0] _T_157; // @[BrainfuckProcessor.scala 158:46:@331.16]
  wire [7:0] _T_158; // @[BrainfuckProcessor.scala 158:46:@332.16]
  wire [13:0] _T_165; // @[BrainfuckProcessor.scala 161:35:@339.16]
  wire  _T_171; // @[Conditional.scala 37:30:@347.16]
  wire [8:0] _T_173; // @[BrainfuckProcessor.scala 165:46:@349.18]
  wire [8:0] _T_174; // @[BrainfuckProcessor.scala 165:46:@350.18]
  wire [7:0] _T_175; // @[BrainfuckProcessor.scala 165:46:@351.18]
  wire [13:0] _T_182; // @[BrainfuckProcessor.scala 168:35:@358.18]
  wire  _T_189; // @[Conditional.scala 37:30:@367.18]
  wire  _T_191; // @[BrainfuckProcessor.scala 173:34:@369.20]
  wire  _T_192; // @[BrainfuckProcessor.scala 173:31:@370.20]
  wire [13:0] _T_202; // @[BrainfuckProcessor.scala 180:37:@383.22]
  wire [7:0] _GEN_40; // @[BrainfuckProcessor.scala 173:48:@371.20]
  wire  _GEN_41; // @[BrainfuckProcessor.scala 173:48:@371.20]
  wire [13:0] _GEN_42; // @[BrainfuckProcessor.scala 173:48:@371.20]
  wire [7:0] _GEN_46; // @[BrainfuckProcessor.scala 173:48:@371.20]
  wire  _T_205; // @[Conditional.scala 37:30:@389.20]
  wire  _T_207; // @[BrainfuckProcessor.scala 185:33:@391.22]
  wire  _T_208; // @[BrainfuckProcessor.scala 185:30:@392.22]
  wire [13:0] _T_216; // @[BrainfuckProcessor.scala 190:37:@401.24]
  wire  _GEN_47; // @[BrainfuckProcessor.scala 185:44:@393.22]
  wire [13:0] _GEN_52; // @[BrainfuckProcessor.scala 185:44:@393.22]
  wire [7:0] _GEN_54; // @[BrainfuckProcessor.scala 185:44:@393.22]
  wire [7:0] _GEN_55; // @[BrainfuckProcessor.scala 185:44:@393.22]
  wire  _T_221; // @[BrainfuckProcessor.scala 195:26:@410.24]
  wire [13:0] _T_229; // @[BrainfuckProcessor.scala 200:37:@418.26]
  wire [13:0] _T_237; // @[BrainfuckProcessor.scala 205:37:@429.26]
  wire [4:0] _T_240; // @[BrainfuckProcessor.scala 206:47:@432.26]
  wire [3:0] _T_241; // @[BrainfuckProcessor.scala 206:47:@433.26]
  wire  _GEN_56; // @[BrainfuckProcessor.scala 195:35:@411.24]
  wire [3:0] _GEN_57; // @[BrainfuckProcessor.scala 195:35:@411.24]
  wire [13:0] _GEN_58; // @[BrainfuckProcessor.scala 195:35:@411.24]
  wire [7:0] _GEN_62; // @[BrainfuckProcessor.scala 195:35:@411.24]
  wire  _GEN_65; // @[BrainfuckProcessor.scala 195:35:@411.24]
  wire [3:0] _GEN_68; // @[BrainfuckProcessor.scala 195:35:@411.24]
  wire [13:0] _GEN_69; // @[BrainfuckProcessor.scala 195:35:@411.24]
  wire  _T_246; // @[BrainfuckProcessor.scala 215:31:@443.26]
  wire [4:0] _T_248; // @[BrainfuckProcessor.scala 216:47:@445.28]
  wire [4:0] _T_249; // @[BrainfuckProcessor.scala 216:47:@446.28]
  wire [3:0] _T_250; // @[BrainfuckProcessor.scala 216:47:@447.28]
  wire [4:0] _T_252; // @[BrainfuckProcessor.scala 217:67:@449.28]
  wire [4:0] _T_253; // @[BrainfuckProcessor.scala 217:67:@450.28]
  wire [3:0] _T_254; // @[BrainfuckProcessor.scala 217:67:@451.28]
  wire [3:0] _GEN_70; // @[BrainfuckProcessor.scala 215:38:@444.26]
  wire [13:0] _GEN_74; // @[BrainfuckProcessor.scala 215:38:@444.26]
  wire  _T_263; // @[Conditional.scala 37:30:@461.26]
  wire  _T_264; // @[Conditional.scala 37:30:@462.26]
  wire  _T_265; // @[Conditional.scala 37:30:@463.26]
  wire  _T_266; // @[Conditional.scala 37:30:@464.26]
  wire  _T_267; // @[Conditional.scala 37:30:@465.26]
  wire  _T_268; // @[Conditional.scala 37:55:@466.26]
  wire  _T_269; // @[Conditional.scala 37:55:@467.26]
  wire  _T_270; // @[Conditional.scala 37:55:@468.26]
  wire  _T_271; // @[Conditional.scala 37:55:@469.26]
  wire [13:0] _T_277; // @[BrainfuckProcessor.scala 227:35:@475.28]
  wire [13:0] _GEN_75; // @[Conditional.scala 39:67:@470.26]
  wire [7:0] _GEN_79; // @[Conditional.scala 39:67:@470.26]
  wire [13:0] _GEN_80; // @[Conditional.scala 39:67:@440.24]
  wire [7:0] _GEN_81; // @[Conditional.scala 39:67:@440.24]
  wire [3:0] _GEN_82; // @[Conditional.scala 39:67:@440.24]
  wire  _GEN_85; // @[Conditional.scala 39:67:@440.24]
  wire [13:0] _GEN_86; // @[Conditional.scala 39:67:@440.24]
  wire  _GEN_89; // @[Conditional.scala 39:67:@440.24]
  wire  _GEN_90; // @[Conditional.scala 39:67:@409.22]
  wire [3:0] _GEN_91; // @[Conditional.scala 39:67:@409.22]
  wire [13:0] _GEN_92; // @[Conditional.scala 39:67:@409.22]
  wire  _GEN_95; // @[Conditional.scala 39:67:@409.22]
  wire [7:0] _GEN_96; // @[Conditional.scala 39:67:@409.22]
  wire  _GEN_99; // @[Conditional.scala 39:67:@409.22]
  wire [3:0] _GEN_102; // @[Conditional.scala 39:67:@409.22]
  wire [13:0] _GEN_103; // @[Conditional.scala 39:67:@409.22]
  wire  _GEN_106; // @[Conditional.scala 39:67:@409.22]
  wire  _GEN_109; // @[Conditional.scala 39:67:@409.22]
  wire  _GEN_110; // @[Conditional.scala 39:67:@390.20]
  wire  _GEN_113; // @[Conditional.scala 39:67:@390.20]
  wire [13:0] _GEN_115; // @[Conditional.scala 39:67:@390.20]
  wire [7:0] _GEN_117; // @[Conditional.scala 39:67:@390.20]
  wire [7:0] _GEN_118; // @[Conditional.scala 39:67:@390.20]
  wire  _GEN_119; // @[Conditional.scala 39:67:@390.20]
  wire [3:0] _GEN_120; // @[Conditional.scala 39:67:@390.20]
  wire  _GEN_123; // @[Conditional.scala 39:67:@390.20]
  wire  _GEN_126; // @[Conditional.scala 39:67:@390.20]
  wire [3:0] _GEN_129; // @[Conditional.scala 39:67:@390.20]
  wire [13:0] _GEN_130; // @[Conditional.scala 39:67:@390.20]
  wire  _GEN_133; // @[Conditional.scala 39:67:@390.20]
  wire  _GEN_136; // @[Conditional.scala 39:67:@390.20]
  wire [7:0] _GEN_137; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_138; // @[Conditional.scala 39:67:@368.18]
  wire [13:0] _GEN_139; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_142; // @[Conditional.scala 39:67:@368.18]
  wire [7:0] _GEN_143; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_144; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_147; // @[Conditional.scala 39:67:@368.18]
  wire [7:0] _GEN_150; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_151; // @[Conditional.scala 39:67:@368.18]
  wire [3:0] _GEN_152; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_155; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_158; // @[Conditional.scala 39:67:@368.18]
  wire [3:0] _GEN_161; // @[Conditional.scala 39:67:@368.18]
  wire [13:0] _GEN_162; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_165; // @[Conditional.scala 39:67:@368.18]
  wire  _GEN_168; // @[Conditional.scala 39:67:@368.18]
  wire [13:0] _GEN_173; // @[Conditional.scala 39:67:@348.16]
  wire [7:0] _GEN_175; // @[Conditional.scala 39:67:@348.16]
  wire [7:0] _GEN_176; // @[Conditional.scala 39:67:@348.16]
  wire [7:0] _GEN_177; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_178; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_181; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_182; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_185; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_188; // @[Conditional.scala 39:67:@348.16]
  wire [3:0] _GEN_189; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_192; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_195; // @[Conditional.scala 39:67:@348.16]
  wire [3:0] _GEN_198; // @[Conditional.scala 39:67:@348.16]
  wire [13:0] _GEN_199; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_202; // @[Conditional.scala 39:67:@348.16]
  wire  _GEN_205; // @[Conditional.scala 39:67:@348.16]
  wire [13:0] _GEN_210; // @[Conditional.scala 39:67:@330.14]
  wire [7:0] _GEN_212; // @[Conditional.scala 39:67:@330.14]
  wire [7:0] _GEN_213; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_216; // @[Conditional.scala 39:67:@330.14]
  wire [7:0] _GEN_219; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_220; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_223; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_224; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_227; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_230; // @[Conditional.scala 39:67:@330.14]
  wire [3:0] _GEN_231; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_234; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_237; // @[Conditional.scala 39:67:@330.14]
  wire [3:0] _GEN_240; // @[Conditional.scala 39:67:@330.14]
  wire [13:0] _GEN_241; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_244; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_247; // @[Conditional.scala 39:67:@330.14]
  wire  _GEN_248; // @[Conditional.scala 39:67:@303.12]
  wire [3:0] _GEN_249; // @[Conditional.scala 39:67:@303.12]
  wire [13:0] _GEN_250; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_253; // @[Conditional.scala 39:67:@303.12]
  wire [7:0] _GEN_254; // @[Conditional.scala 39:67:@303.12]
  wire [9:0] _GEN_255; // @[Conditional.scala 39:67:@303.12]
  wire [7:0] _GEN_257; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_260; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_265; // @[Conditional.scala 39:67:@303.12]
  wire [7:0] _GEN_268; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_269; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_272; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_273; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_276; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_279; // @[Conditional.scala 39:67:@303.12]
  wire [3:0] _GEN_280; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_283; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_286; // @[Conditional.scala 39:67:@303.12]
  wire [3:0] _GEN_289; // @[Conditional.scala 39:67:@303.12]
  wire [13:0] _GEN_290; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_293; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_296; // @[Conditional.scala 39:67:@303.12]
  wire  _GEN_297; // @[Conditional.scala 39:67:@278.10]
  wire [3:0] _GEN_298; // @[Conditional.scala 39:67:@278.10]
  wire [13:0] _GEN_299; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_302; // @[Conditional.scala 39:67:@278.10]
  wire [7:0] _GEN_303; // @[Conditional.scala 39:67:@278.10]
  wire [9:0] _GEN_304; // @[Conditional.scala 39:67:@278.10]
  wire [7:0] _GEN_306; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_309; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_313; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_318; // @[Conditional.scala 39:67:@278.10]
  wire [7:0] _GEN_321; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_322; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_325; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_326; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_329; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_332; // @[Conditional.scala 39:67:@278.10]
  wire [3:0] _GEN_333; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_336; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_339; // @[Conditional.scala 39:67:@278.10]
  wire [3:0] _GEN_342; // @[Conditional.scala 39:67:@278.10]
  wire [13:0] _GEN_343; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_346; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_349; // @[Conditional.scala 39:67:@278.10]
  wire  _GEN_350; // @[Conditional.scala 40:58:@272.8]
  wire [3:0] _GEN_351; // @[Conditional.scala 40:58:@272.8]
  wire [13:0] _GEN_352; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_355; // @[Conditional.scala 40:58:@272.8]
  wire [7:0] _GEN_356; // @[Conditional.scala 40:58:@272.8]
  wire [9:0] _GEN_357; // @[Conditional.scala 40:58:@272.8]
  wire [7:0] _GEN_359; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_362; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_366; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_371; // @[Conditional.scala 40:58:@272.8]
  wire [7:0] _GEN_374; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_375; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_378; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_379; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_382; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_385; // @[Conditional.scala 40:58:@272.8]
  wire [3:0] _GEN_386; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_389; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_392; // @[Conditional.scala 40:58:@272.8]
  wire [3:0] _GEN_395; // @[Conditional.scala 40:58:@272.8]
  wire [13:0] _GEN_396; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_399; // @[Conditional.scala 40:58:@272.8]
  wire  _GEN_402; // @[Conditional.scala 40:58:@272.8]
  wire [13:0] _GEN_403; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [7:0] _GEN_407; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_408; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [3:0] _GEN_409; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [3:0] _GEN_410; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_411; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_414; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [9:0] _GEN_415; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [7:0] _GEN_417; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_420; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_424; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_429; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [7:0] _GEN_432; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_433; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_436; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_437; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_440; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_445; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_448; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [3:0] _GEN_451; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [13:0] _GEN_452; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_455; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire  _GEN_458; // @[BrainfuckProcessor.scala 101:22:@223.6]
  wire [13:0] _GEN_459; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_462; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [7:0] _GEN_463; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_464; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [3:0] _GEN_465; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [3:0] _GEN_466; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_467; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_470; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [9:0] _GEN_471; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [7:0] _GEN_473; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_476; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_480; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_485; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [7:0] _GEN_488; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_489; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_492; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_493; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_496; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_501; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_504; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [3:0] _GEN_507; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire [13:0] _GEN_508; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_511; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_514; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _GEN_517; // @[BrainfuckProcessor.scala 99:17:@217.4]
  wire  _T_294; // @[BrainfuckProcessor.scala 248:11:@498.6]
  wire  _T_295; // @[BrainfuckProcessor.scala 248:17:@499.6]
  wire  _T_297; // @[BrainfuckProcessor.scala 248:28:@500.6]
  wire  _T_298; // @[BrainfuckProcessor.scala 248:25:@501.6]
  wire [3:0] _GEN_518; // @[BrainfuckProcessor.scala 248:41:@502.6]
  wire  _GEN_519; // @[BrainfuckProcessor.scala 248:41:@502.6]
  wire [3:0] _GEN_520; // @[BrainfuckProcessor.scala 247:16:@497.4]
  wire  _GEN_521; // @[BrainfuckProcessor.scala 247:16:@497.4]
  wire  _T_310; // @[BrainfuckProcessor.scala 256:20:@515.4]
  wire [14:0] _T_324; // @[BrainfuckProcessor.scala 274:34:@538.10]
  wire [13:0] _T_325; // @[BrainfuckProcessor.scala 274:34:@539.10]
  wire  _GEN_522; // @[BrainfuckProcessor.scala 268:34:@528.8]
  wire  _GEN_523; // @[BrainfuckProcessor.scala 268:34:@528.8]
  wire [13:0] _GEN_528; // @[BrainfuckProcessor.scala 268:34:@528.8]
  wire [7:0] _GEN_529; // @[BrainfuckProcessor.scala 268:34:@528.8]
  wire  _GEN_530; // @[BrainfuckProcessor.scala 268:34:@528.8]
  wire  _GEN_531; // @[BrainfuckProcessor.scala 264:24:@523.6]
  wire  _GEN_532; // @[BrainfuckProcessor.scala 264:24:@523.6]
  wire  _GEN_535; // @[BrainfuckProcessor.scala 264:24:@523.6]
  wire [13:0] _GEN_537; // @[BrainfuckProcessor.scala 264:24:@523.6]
  wire [7:0] _GEN_538; // @[BrainfuckProcessor.scala 264:24:@523.6]
  wire  _GEN_539; // @[BrainfuckProcessor.scala 264:24:@523.6]
  wire [13:0] _GEN_540; // @[BrainfuckProcessor.scala 256:32:@516.4]
  wire  _GEN_541; // @[BrainfuckProcessor.scala 256:32:@516.4]
  wire  _GEN_542; // @[BrainfuckProcessor.scala 256:32:@516.4]
  wire  _GEN_543; // @[BrainfuckProcessor.scala 256:32:@516.4]
  wire  _GEN_546; // @[BrainfuckProcessor.scala 256:32:@516.4]
  wire [7:0] _GEN_548; // @[BrainfuckProcessor.scala 256:32:@516.4]
  wire  _GEN_549; // @[BrainfuckProcessor.scala 256:32:@516.4]
  wire  _GEN_600; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_601; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_602; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_603; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_604; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_605; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_606; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_607; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_608; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_609; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_610; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_611; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_612; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_613; // @[BrainfuckProcessor.scala 175:19:@375.24]
  wire  _GEN_614; // @[BrainfuckProcessor.scala 249:13:@506.10]
  wire  _GEN_615; // @[BrainfuckProcessor.scala 270:13:@532.12]
  wire  _GEN_616; // @[BrainfuckProcessor.scala 270:13:@532.12]
  wire  _GEN_617; // @[BrainfuckProcessor.scala 270:13:@532.12]
  wire  _GEN_618; // @[BrainfuckProcessor.scala 270:13:@532.12]
  assign instMem__T_78_addr = _T_77;
  assign instMem__T_78_data = instMem[instMem__T_78_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_124_addr = _T_123;
  assign instMem__T_124_data = instMem[instMem__T_124_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_144_addr = _T_143;
  assign instMem__T_144_data = instMem[instMem__T_144_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_166_addr = _T_165;
  assign instMem__T_166_data = instMem[instMem__T_166_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_183_addr = _T_182;
  assign instMem__T_183_data = instMem[instMem__T_183_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_203_addr = _T_202;
  assign instMem__T_203_data = instMem[instMem__T_203_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_217_addr = _T_216;
  assign instMem__T_217_data = instMem[instMem__T_217_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_230_addr = _T_229;
  assign instMem__T_230_data = instMem[instMem__T_230_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_238_addr = _T_237;
  assign instMem__T_238_data = instMem[instMem__T_238_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_278_addr = _T_277;
  assign instMem__T_278_data = instMem[instMem__T_278_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_283_addr = 14'h0;
  assign instMem__T_283_data = instMem[instMem__T_283_addr]; // @[BrainfuckProcessor.scala 64:20:@189.4]
  assign instMem__T_322_data = io_programData;
  assign instMem__T_322_addr = programAddr;
  assign instMem__T_322_mask = _GEN_546;
  assign instMem__T_322_en = _GEN_546;
  assign stackMem__T_131_addr = _T_130;
  assign stackMem__T_131_data = stackMem[stackMem__T_131_addr]; // @[BrainfuckProcessor.scala 68:21:@191.4]
  assign stackMem__T_153_addr = _T_152;
  assign stackMem__T_153_data = stackMem[stackMem__T_153_addr]; // @[BrainfuckProcessor.scala 68:21:@191.4]
  assign stackMem__T_286_addr = 10'h0;
  assign stackMem__T_286_data = stackMem[stackMem__T_286_addr]; // @[BrainfuckProcessor.scala 68:21:@191.4]
  assign stackMem__T_159_data = _T_158;
  assign stackMem__T_159_addr = stackPtr;
  assign stackMem__T_159_mask = _GEN_480;
  assign stackMem__T_159_en = _GEN_480;
  assign stackMem__T_176_data = _T_175;
  assign stackMem__T_176_addr = stackPtr;
  assign stackMem__T_176_mask = _GEN_485;
  assign stackMem__T_176_en = _GEN_485;
  assign stackMem__T_210_data = io_stdinData;
  assign stackMem__T_210_addr = stackPtr;
  assign stackMem__T_210_mask = _GEN_496;
  assign stackMem__T_210_en = _GEN_496;
  assign branchStackMem__T_255_addr = _T_254;
  assign branchStackMem__T_255_data = branchStackMem[branchStackMem__T_255_addr]; // @[BrainfuckProcessor.scala 75:27:@196.4]
  assign branchStackMem__T_231_data = pc;
  assign branchStackMem__T_231_addr = branchStackPtr;
  assign branchStackMem__T_231_mask = _GEN_504;
  assign branchStackMem__T_231_en = _GEN_504;
  assign _GEN_0 = stdinAck ? 1'h0 : stdinAck; // @[BrainfuckProcessor.scala 82:18:@201.4]
  assign _GEN_1 = io_stdoutAck ? 8'h0 : stdoutData; // @[BrainfuckProcessor.scala 86:24:@205.6]
  assign _GEN_2 = io_stdoutAck ? 1'h0 : stdoutValid; // @[BrainfuckProcessor.scala 86:24:@205.6]
  assign _GEN_3 = stdoutValid ? _GEN_1 : stdoutData; // @[BrainfuckProcessor.scala 85:21:@204.4]
  assign _GEN_4 = stdoutValid ? _GEN_2 : stdoutValid; // @[BrainfuckProcessor.scala 85:21:@204.4]
  assign _T_68 = halted == 1'h0; // @[BrainfuckProcessor.scala 99:8:@216.4]
  assign _T_71 = reset == 1'h0; // @[BrainfuckProcessor.scala 100:11:@219.6]
  assign _T_73 = pc + 14'h1; // @[BrainfuckProcessor.scala 103:17:@224.8]
  assign _T_74 = _T_73[13:0]; // @[BrainfuckProcessor.scala 103:17:@225.8]
  assign _T_77 = _T_73[13:0]; // @[BrainfuckProcessor.scala 104:31:@228.8]
  assign _T_81 = 8'h0 == inst; // @[Conditional.scala 37:30:@231.8]
  assign _T_82 = 8'h23 == inst; // @[Conditional.scala 37:30:@232.8]
  assign _T_83 = _T_81 | _T_82; // @[Conditional.scala 37:55:@233.8]
  assign _T_87 = 8'h5b == inst; // @[Conditional.scala 37:30:@239.10]
  assign _T_89 = branchJumpNest == 4'hf; // @[BrainfuckProcessor.scala 111:31:@241.12]
  assign _T_93 = branchJumpNest + 4'h1; // @[BrainfuckProcessor.scala 115:47:@247.14]
  assign _T_94 = _T_93[3:0]; // @[BrainfuckProcessor.scala 115:47:@248.14]
  assign _GEN_5 = _T_89 ? 1'h1 : halted; // @[BrainfuckProcessor.scala 111:63:@242.12]
  assign _GEN_6 = _T_89 ? 4'h2 : errorCode; // @[BrainfuckProcessor.scala 111:63:@242.12]
  assign _GEN_7 = _T_89 ? branchJumpNest : _T_94; // @[BrainfuckProcessor.scala 111:63:@242.12]
  assign _T_96 = 8'h5d == inst; // @[Conditional.scala 37:30:@253.12]
  assign _T_98 = branchJumpNest > 4'h0; // @[BrainfuckProcessor.scala 119:31:@255.14]
  assign _T_100 = branchJumpNest - 4'h1; // @[BrainfuckProcessor.scala 120:47:@257.16]
  assign _T_101 = $unsigned(_T_100); // @[BrainfuckProcessor.scala 120:47:@258.16]
  assign _T_102 = _T_101[3:0]; // @[BrainfuckProcessor.scala 120:47:@259.16]
  assign _GEN_8 = _T_98 ? _T_102 : 4'h0; // @[BrainfuckProcessor.scala 119:38:@256.14]
  assign _GEN_9 = _T_98 ? branchJump : 1'h0; // @[BrainfuckProcessor.scala 119:38:@256.14]
  assign _GEN_10 = _T_96 ? _GEN_8 : branchJumpNest; // @[Conditional.scala 39:67:@254.12]
  assign _GEN_11 = _T_96 ? _GEN_9 : branchJump; // @[Conditional.scala 39:67:@254.12]
  assign _GEN_12 = _T_87 ? _GEN_5 : halted; // @[Conditional.scala 39:67:@240.10]
  assign _GEN_13 = _T_87 ? _GEN_6 : errorCode; // @[Conditional.scala 39:67:@240.10]
  assign _GEN_14 = _T_87 ? _GEN_7 : _GEN_10; // @[Conditional.scala 39:67:@240.10]
  assign _GEN_15 = _T_87 ? branchJump : _GEN_11; // @[Conditional.scala 39:67:@240.10]
  assign _GEN_16 = _T_83 ? 1'h1 : _GEN_12; // @[Conditional.scala 40:58:@234.8]
  assign _GEN_17 = _T_83 ? 4'h1 : _GEN_13; // @[Conditional.scala 40:58:@234.8]
  assign _GEN_18 = _T_83 ? branchJumpNest : _GEN_14; // @[Conditional.scala 40:58:@234.8]
  assign _GEN_19 = _T_83 ? branchJump : _GEN_15; // @[Conditional.scala 40:58:@234.8]
  assign _T_113 = 8'h3e == inst; // @[Conditional.scala 37:30:@277.10]
  assign _T_115 = stackPtr == 10'h3ff; // @[BrainfuckProcessor.scala 136:26:@279.12]
  assign _T_123 = _T_73[13:0]; // @[BrainfuckProcessor.scala 141:37:@289.14]
  assign _T_126 = stackPtr + 10'h1; // @[BrainfuckProcessor.scala 142:35:@292.14]
  assign _T_127 = _T_126[9:0]; // @[BrainfuckProcessor.scala 142:35:@293.14]
  assign _T_130 = _T_126[9:0]; // @[BrainfuckProcessor.scala 143:49:@296.14]
  assign _GEN_20 = _T_115 ? 1'h1 : halted; // @[BrainfuckProcessor.scala 136:52:@280.12]
  assign _GEN_21 = _T_115 ? 4'h3 : errorCode; // @[BrainfuckProcessor.scala 136:52:@280.12]
  assign _GEN_22 = _T_115 ? pc : _T_74; // @[BrainfuckProcessor.scala 136:52:@280.12]
  assign _GEN_25 = _T_115 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 136:52:@280.12]
  assign _GEN_26 = _T_115 ? inst : instMem__T_124_data; // @[BrainfuckProcessor.scala 136:52:@280.12]
  assign _GEN_27 = _T_115 ? stackPtr : _T_127; // @[BrainfuckProcessor.scala 136:52:@280.12]
  assign _GEN_29 = _T_115 ? stackData : stackMem__T_131_data; // @[BrainfuckProcessor.scala 136:52:@280.12]
  assign _T_133 = 8'h3c == inst; // @[Conditional.scala 37:30:@302.12]
  assign _T_135 = stackPtr == 10'h0; // @[BrainfuckProcessor.scala 147:26:@304.14]
  assign _T_143 = _T_73[13:0]; // @[BrainfuckProcessor.scala 152:37:@314.16]
  assign _T_146 = stackPtr - 10'h1; // @[BrainfuckProcessor.scala 153:35:@317.16]
  assign _T_147 = $unsigned(_T_146); // @[BrainfuckProcessor.scala 153:35:@318.16]
  assign _T_148 = _T_147[9:0]; // @[BrainfuckProcessor.scala 153:35:@319.16]
  assign _T_152 = _T_147[9:0]; // @[BrainfuckProcessor.scala 154:49:@323.16]
  assign _GEN_30 = _T_135 ? 1'h1 : halted; // @[BrainfuckProcessor.scala 147:35:@305.14]
  assign _GEN_31 = _T_135 ? 4'h4 : errorCode; // @[BrainfuckProcessor.scala 147:35:@305.14]
  assign _GEN_32 = _T_135 ? pc : _T_74; // @[BrainfuckProcessor.scala 147:35:@305.14]
  assign _GEN_35 = _T_135 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 147:35:@305.14]
  assign _GEN_36 = _T_135 ? inst : instMem__T_144_data; // @[BrainfuckProcessor.scala 147:35:@305.14]
  assign _GEN_37 = _T_135 ? stackPtr : _T_148; // @[BrainfuckProcessor.scala 147:35:@305.14]
  assign _GEN_39 = _T_135 ? stackData : stackMem__T_153_data; // @[BrainfuckProcessor.scala 147:35:@305.14]
  assign _T_155 = 8'h2b == inst; // @[Conditional.scala 37:30:@329.14]
  assign _T_157 = stackData + 8'h1; // @[BrainfuckProcessor.scala 158:46:@331.16]
  assign _T_158 = _T_157[7:0]; // @[BrainfuckProcessor.scala 158:46:@332.16]
  assign _T_165 = _T_73[13:0]; // @[BrainfuckProcessor.scala 161:35:@339.16]
  assign _T_171 = 8'h2d == inst; // @[Conditional.scala 37:30:@347.16]
  assign _T_173 = stackData - 8'h1; // @[BrainfuckProcessor.scala 165:46:@349.18]
  assign _T_174 = $unsigned(_T_173); // @[BrainfuckProcessor.scala 165:46:@350.18]
  assign _T_175 = _T_174[7:0]; // @[BrainfuckProcessor.scala 165:46:@351.18]
  assign _T_182 = _T_73[13:0]; // @[BrainfuckProcessor.scala 168:35:@358.18]
  assign _T_189 = 8'h2e == inst; // @[Conditional.scala 37:30:@367.18]
  assign _T_191 = stdoutValid == 1'h0; // @[BrainfuckProcessor.scala 173:34:@369.20]
  assign _T_192 = io_stdoutReady & _T_191; // @[BrainfuckProcessor.scala 173:31:@370.20]
  assign _T_202 = _T_73[13:0]; // @[BrainfuckProcessor.scala 180:37:@383.22]
  assign _GEN_40 = _T_192 ? stackData : _GEN_3; // @[BrainfuckProcessor.scala 173:48:@371.20]
  assign _GEN_41 = _T_192 ? 1'h1 : _GEN_4; // @[BrainfuckProcessor.scala 173:48:@371.20]
  assign _GEN_42 = _T_192 ? _T_74 : pc; // @[BrainfuckProcessor.scala 173:48:@371.20]
  assign _GEN_46 = _T_192 ? instMem__T_203_data : inst; // @[BrainfuckProcessor.scala 173:48:@371.20]
  assign _T_205 = 8'h2c == inst; // @[Conditional.scala 37:30:@389.20]
  assign _T_207 = stdinAck == 1'h0; // @[BrainfuckProcessor.scala 185:33:@391.22]
  assign _T_208 = io_stdinValid & _T_207; // @[BrainfuckProcessor.scala 185:30:@392.22]
  assign _T_216 = _T_73[13:0]; // @[BrainfuckProcessor.scala 190:37:@401.24]
  assign _GEN_47 = _T_208 ? 1'h1 : _GEN_0; // @[BrainfuckProcessor.scala 185:44:@393.22]
  assign _GEN_52 = _T_208 ? _T_74 : pc; // @[BrainfuckProcessor.scala 185:44:@393.22]
  assign _GEN_54 = _T_208 ? instMem__T_217_data : inst; // @[BrainfuckProcessor.scala 185:44:@393.22]
  assign _GEN_55 = _T_208 ? io_stdinData : stackData; // @[BrainfuckProcessor.scala 185:44:@393.22]
  assign _T_221 = stackData == 8'h0; // @[BrainfuckProcessor.scala 195:26:@410.24]
  assign _T_229 = _T_73[13:0]; // @[BrainfuckProcessor.scala 200:37:@418.26]
  assign _T_237 = _T_73[13:0]; // @[BrainfuckProcessor.scala 205:37:@429.26]
  assign _T_240 = branchStackPtr + 4'h1; // @[BrainfuckProcessor.scala 206:47:@432.26]
  assign _T_241 = _T_240[3:0]; // @[BrainfuckProcessor.scala 206:47:@433.26]
  assign _GEN_56 = _T_221 ? 1'h1 : branchJump; // @[BrainfuckProcessor.scala 195:35:@411.24]
  assign _GEN_57 = _T_221 ? 4'h0 : branchJumpNest; // @[BrainfuckProcessor.scala 195:35:@411.24]
  assign _GEN_58 = _T_221 ? _T_74 : _T_74; // @[BrainfuckProcessor.scala 195:35:@411.24]
  assign _GEN_62 = _T_221 ? instMem__T_230_data : instMem__T_238_data; // @[BrainfuckProcessor.scala 195:35:@411.24]
  assign _GEN_65 = _T_221 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 195:35:@411.24]
  assign _GEN_68 = _T_221 ? branchStackPtr : _T_241; // @[BrainfuckProcessor.scala 195:35:@411.24]
  assign _GEN_69 = _T_221 ? branchStackData : pc; // @[BrainfuckProcessor.scala 195:35:@411.24]
  assign _T_246 = branchStackPtr > 4'h1; // @[BrainfuckProcessor.scala 215:31:@443.26]
  assign _T_248 = branchStackPtr - 4'h1; // @[BrainfuckProcessor.scala 216:47:@445.28]
  assign _T_249 = $unsigned(_T_248); // @[BrainfuckProcessor.scala 216:47:@446.28]
  assign _T_250 = _T_249[3:0]; // @[BrainfuckProcessor.scala 216:47:@447.28]
  assign _T_252 = branchStackPtr - 4'h2; // @[BrainfuckProcessor.scala 217:67:@449.28]
  assign _T_253 = $unsigned(_T_252); // @[BrainfuckProcessor.scala 217:67:@450.28]
  assign _T_254 = _T_253[3:0]; // @[BrainfuckProcessor.scala 217:67:@451.28]
  assign _GEN_70 = _T_246 ? _T_250 : 4'h0; // @[BrainfuckProcessor.scala 215:38:@444.26]
  assign _GEN_74 = _T_246 ? branchStackMem__T_255_data : 14'h0; // @[BrainfuckProcessor.scala 215:38:@444.26]
  assign _T_263 = 8'hd == inst; // @[Conditional.scala 37:30:@461.26]
  assign _T_264 = 8'ha == inst; // @[Conditional.scala 37:30:@462.26]
  assign _T_265 = 8'h20 == inst; // @[Conditional.scala 37:30:@463.26]
  assign _T_266 = 8'h58 == inst; // @[Conditional.scala 37:30:@464.26]
  assign _T_267 = 8'h78 == inst; // @[Conditional.scala 37:30:@465.26]
  assign _T_268 = _T_263 | _T_264; // @[Conditional.scala 37:55:@466.26]
  assign _T_269 = _T_268 | _T_265; // @[Conditional.scala 37:55:@467.26]
  assign _T_270 = _T_269 | _T_266; // @[Conditional.scala 37:55:@468.26]
  assign _T_271 = _T_270 | _T_267; // @[Conditional.scala 37:55:@469.26]
  assign _T_277 = _T_73[13:0]; // @[BrainfuckProcessor.scala 227:35:@475.28]
  assign _GEN_75 = _T_271 ? _T_74 : pc; // @[Conditional.scala 39:67:@470.26]
  assign _GEN_79 = _T_271 ? instMem__T_278_data : inst; // @[Conditional.scala 39:67:@470.26]
  assign _GEN_80 = _T_96 ? branchStackData : _GEN_75; // @[Conditional.scala 39:67:@440.24]
  assign _GEN_81 = _T_96 ? 8'h5b : _GEN_79; // @[Conditional.scala 39:67:@440.24]
  assign _GEN_82 = _T_96 ? _GEN_70 : branchStackPtr; // @[Conditional.scala 39:67:@440.24]
  assign _GEN_85 = _T_96 ? _T_246 : 1'h0; // @[Conditional.scala 39:67:@440.24]
  assign _GEN_86 = _T_96 ? _GEN_74 : branchStackData; // @[Conditional.scala 39:67:@440.24]
  assign _GEN_89 = _T_96 ? 1'h0 : _T_271; // @[Conditional.scala 39:67:@440.24]
  assign _GEN_90 = _T_87 ? _GEN_56 : branchJump; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_91 = _T_87 ? _GEN_57 : branchJumpNest; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_92 = _T_87 ? _GEN_58 : _GEN_80; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_95 = _T_87 ? _T_221 : 1'h0; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_96 = _T_87 ? _GEN_62 : _GEN_81; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_99 = _T_87 ? _GEN_65 : 1'h0; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_102 = _T_87 ? _GEN_68 : _GEN_82; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_103 = _T_87 ? _GEN_69 : _GEN_86; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_106 = _T_87 ? 1'h0 : _GEN_85; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_109 = _T_87 ? 1'h0 : _GEN_89; // @[Conditional.scala 39:67:@409.22]
  assign _GEN_110 = _T_205 ? _GEN_47 : _GEN_0; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_113 = _T_205 ? _T_208 : 1'h0; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_115 = _T_205 ? _GEN_52 : _GEN_92; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_117 = _T_205 ? _GEN_54 : _GEN_96; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_118 = _T_205 ? _GEN_55 : stackData; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_119 = _T_205 ? branchJump : _GEN_90; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_120 = _T_205 ? branchJumpNest : _GEN_91; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_123 = _T_205 ? 1'h0 : _GEN_95; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_126 = _T_205 ? 1'h0 : _GEN_99; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_129 = _T_205 ? branchStackPtr : _GEN_102; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_130 = _T_205 ? branchStackData : _GEN_103; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_133 = _T_205 ? 1'h0 : _GEN_106; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_136 = _T_205 ? 1'h0 : _GEN_109; // @[Conditional.scala 39:67:@390.20]
  assign _GEN_137 = _T_189 ? _GEN_40 : _GEN_3; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_138 = _T_189 ? _GEN_41 : _GEN_4; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_139 = _T_189 ? _GEN_42 : _GEN_115; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_142 = _T_189 ? _T_192 : 1'h0; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_143 = _T_189 ? _GEN_46 : _GEN_117; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_144 = _T_189 ? _GEN_0 : _GEN_110; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_147 = _T_189 ? 1'h0 : _GEN_113; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_150 = _T_189 ? stackData : _GEN_118; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_151 = _T_189 ? branchJump : _GEN_119; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_152 = _T_189 ? branchJumpNest : _GEN_120; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_155 = _T_189 ? 1'h0 : _GEN_123; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_158 = _T_189 ? 1'h0 : _GEN_126; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_161 = _T_189 ? branchStackPtr : _GEN_129; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_162 = _T_189 ? branchStackData : _GEN_130; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_165 = _T_189 ? 1'h0 : _GEN_133; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_168 = _T_189 ? 1'h0 : _GEN_136; // @[Conditional.scala 39:67:@368.18]
  assign _GEN_173 = _T_171 ? _T_74 : _GEN_139; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_175 = _T_171 ? instMem__T_183_data : _GEN_143; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_176 = _T_171 ? _T_175 : _GEN_150; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_177 = _T_171 ? _GEN_3 : _GEN_137; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_178 = _T_171 ? _GEN_4 : _GEN_138; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_181 = _T_171 ? 1'h0 : _GEN_142; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_182 = _T_171 ? _GEN_0 : _GEN_144; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_185 = _T_171 ? 1'h0 : _GEN_147; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_188 = _T_171 ? branchJump : _GEN_151; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_189 = _T_171 ? branchJumpNest : _GEN_152; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_192 = _T_171 ? 1'h0 : _GEN_155; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_195 = _T_171 ? 1'h0 : _GEN_158; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_198 = _T_171 ? branchStackPtr : _GEN_161; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_199 = _T_171 ? branchStackData : _GEN_162; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_202 = _T_171 ? 1'h0 : _GEN_165; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_205 = _T_171 ? 1'h0 : _GEN_168; // @[Conditional.scala 39:67:@348.16]
  assign _GEN_210 = _T_155 ? _T_74 : _GEN_173; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_212 = _T_155 ? instMem__T_166_data : _GEN_175; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_213 = _T_155 ? _T_158 : _GEN_176; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_216 = _T_155 ? 1'h0 : _T_171; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_219 = _T_155 ? _GEN_3 : _GEN_177; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_220 = _T_155 ? _GEN_4 : _GEN_178; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_223 = _T_155 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_224 = _T_155 ? _GEN_0 : _GEN_182; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_227 = _T_155 ? 1'h0 : _GEN_185; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_230 = _T_155 ? branchJump : _GEN_188; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_231 = _T_155 ? branchJumpNest : _GEN_189; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_234 = _T_155 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_237 = _T_155 ? 1'h0 : _GEN_195; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_240 = _T_155 ? branchStackPtr : _GEN_198; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_241 = _T_155 ? branchStackData : _GEN_199; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_244 = _T_155 ? 1'h0 : _GEN_202; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_247 = _T_155 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67:@330.14]
  assign _GEN_248 = _T_133 ? _GEN_30 : halted; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_249 = _T_133 ? _GEN_31 : errorCode; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_250 = _T_133 ? _GEN_32 : _GEN_210; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_253 = _T_133 ? _GEN_35 : 1'h0; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_254 = _T_133 ? _GEN_36 : _GEN_212; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_255 = _T_133 ? _GEN_37 : stackPtr; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_257 = _T_133 ? _GEN_39 : _GEN_213; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_260 = _T_133 ? 1'h0 : _T_155; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_265 = _T_133 ? 1'h0 : _GEN_216; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_268 = _T_133 ? _GEN_3 : _GEN_219; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_269 = _T_133 ? _GEN_4 : _GEN_220; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_272 = _T_133 ? 1'h0 : _GEN_223; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_273 = _T_133 ? _GEN_0 : _GEN_224; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_276 = _T_133 ? 1'h0 : _GEN_227; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_279 = _T_133 ? branchJump : _GEN_230; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_280 = _T_133 ? branchJumpNest : _GEN_231; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_283 = _T_133 ? 1'h0 : _GEN_234; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_286 = _T_133 ? 1'h0 : _GEN_237; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_289 = _T_133 ? branchStackPtr : _GEN_240; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_290 = _T_133 ? branchStackData : _GEN_241; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_293 = _T_133 ? 1'h0 : _GEN_244; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_296 = _T_133 ? 1'h0 : _GEN_247; // @[Conditional.scala 39:67:@303.12]
  assign _GEN_297 = _T_113 ? _GEN_20 : _GEN_248; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_298 = _T_113 ? _GEN_21 : _GEN_249; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_299 = _T_113 ? _GEN_22 : _GEN_250; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_302 = _T_113 ? _GEN_25 : 1'h0; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_303 = _T_113 ? _GEN_26 : _GEN_254; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_304 = _T_113 ? _GEN_27 : _GEN_255; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_306 = _T_113 ? _GEN_29 : _GEN_257; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_309 = _T_113 ? 1'h0 : _GEN_253; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_313 = _T_113 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_318 = _T_113 ? 1'h0 : _GEN_265; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_321 = _T_113 ? _GEN_3 : _GEN_268; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_322 = _T_113 ? _GEN_4 : _GEN_269; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_325 = _T_113 ? 1'h0 : _GEN_272; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_326 = _T_113 ? _GEN_0 : _GEN_273; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_329 = _T_113 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_332 = _T_113 ? branchJump : _GEN_279; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_333 = _T_113 ? branchJumpNest : _GEN_280; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_336 = _T_113 ? 1'h0 : _GEN_283; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_339 = _T_113 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_342 = _T_113 ? branchStackPtr : _GEN_289; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_343 = _T_113 ? branchStackData : _GEN_290; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_346 = _T_113 ? 1'h0 : _GEN_293; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_349 = _T_113 ? 1'h0 : _GEN_296; // @[Conditional.scala 39:67:@278.10]
  assign _GEN_350 = _T_83 ? 1'h1 : _GEN_297; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_351 = _T_83 ? 4'h0 : _GEN_298; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_352 = _T_83 ? pc : _GEN_299; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_355 = _T_83 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_356 = _T_83 ? inst : _GEN_303; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_357 = _T_83 ? stackPtr : _GEN_304; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_359 = _T_83 ? stackData : _GEN_306; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_362 = _T_83 ? 1'h0 : _GEN_309; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_366 = _T_83 ? 1'h0 : _GEN_313; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_371 = _T_83 ? 1'h0 : _GEN_318; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_374 = _T_83 ? _GEN_3 : _GEN_321; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_375 = _T_83 ? _GEN_4 : _GEN_322; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_378 = _T_83 ? 1'h0 : _GEN_325; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_379 = _T_83 ? _GEN_0 : _GEN_326; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_382 = _T_83 ? 1'h0 : _GEN_329; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_385 = _T_83 ? branchJump : _GEN_332; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_386 = _T_83 ? branchJumpNest : _GEN_333; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_389 = _T_83 ? 1'h0 : _GEN_336; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_392 = _T_83 ? 1'h0 : _GEN_339; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_395 = _T_83 ? branchStackPtr : _GEN_342; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_396 = _T_83 ? branchStackData : _GEN_343; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_399 = _T_83 ? 1'h0 : _GEN_346; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_402 = _T_83 ? 1'h0 : _GEN_349; // @[Conditional.scala 40:58:@272.8]
  assign _GEN_403 = branchJump ? _T_74 : _GEN_352; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_407 = branchJump ? instMem__T_78_data : _GEN_356; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_408 = branchJump ? _GEN_16 : _GEN_350; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_409 = branchJump ? _GEN_17 : _GEN_351; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_410 = branchJump ? _GEN_18 : _GEN_386; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_411 = branchJump ? _GEN_19 : _GEN_385; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_414 = branchJump ? 1'h0 : _GEN_355; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_415 = branchJump ? stackPtr : _GEN_357; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_417 = branchJump ? stackData : _GEN_359; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_420 = branchJump ? 1'h0 : _GEN_362; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_424 = branchJump ? 1'h0 : _GEN_366; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_429 = branchJump ? 1'h0 : _GEN_371; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_432 = branchJump ? _GEN_3 : _GEN_374; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_433 = branchJump ? _GEN_4 : _GEN_375; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_436 = branchJump ? 1'h0 : _GEN_378; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_437 = branchJump ? _GEN_0 : _GEN_379; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_440 = branchJump ? 1'h0 : _GEN_382; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_445 = branchJump ? 1'h0 : _GEN_389; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_448 = branchJump ? 1'h0 : _GEN_392; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_451 = branchJump ? branchStackPtr : _GEN_395; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_452 = branchJump ? branchStackData : _GEN_396; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_455 = branchJump ? 1'h0 : _GEN_399; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_458 = branchJump ? 1'h0 : _GEN_402; // @[BrainfuckProcessor.scala 101:22:@223.6]
  assign _GEN_459 = _T_68 ? _GEN_403 : 14'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_462 = _T_68 ? branchJump : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_463 = _T_68 ? _GEN_407 : instMem__T_283_data; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_464 = _T_68 ? _GEN_408 : halted; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_465 = _T_68 ? _GEN_409 : errorCode; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_466 = _T_68 ? _GEN_410 : 4'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_467 = _T_68 ? _GEN_411 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_470 = _T_68 ? _GEN_414 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_471 = _T_68 ? _GEN_415 : 10'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_473 = _T_68 ? _GEN_417 : stackMem__T_286_data; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_476 = _T_68 ? _GEN_420 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_480 = _T_68 ? _GEN_424 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_485 = _T_68 ? _GEN_429 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_488 = _T_68 ? _GEN_432 : _GEN_3; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_489 = _T_68 ? _GEN_433 : _GEN_4; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_492 = _T_68 ? _GEN_436 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_493 = _T_68 ? _GEN_437 : _GEN_0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_496 = _T_68 ? _GEN_440 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_501 = _T_68 ? _GEN_445 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_504 = _T_68 ? _GEN_448 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_507 = _T_68 ? _GEN_451 : 4'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_508 = _T_68 ? _GEN_452 : 14'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_511 = _T_68 ? _GEN_455 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_514 = _T_68 ? _GEN_458 : 1'h0; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _GEN_517 = _T_68 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 99:17:@217.4]
  assign _T_294 = run2 == 1'h0; // @[BrainfuckProcessor.scala 248:11:@498.6]
  assign _T_295 = _T_294 & run; // @[BrainfuckProcessor.scala 248:17:@499.6]
  assign _T_297 = io_program == 1'h0; // @[BrainfuckProcessor.scala 248:28:@500.6]
  assign _T_298 = _T_295 & _T_297; // @[BrainfuckProcessor.scala 248:25:@501.6]
  assign _GEN_518 = _T_298 ? 4'h0 : _GEN_465; // @[BrainfuckProcessor.scala 248:41:@502.6]
  assign _GEN_519 = _T_298 ? 1'h0 : _GEN_464; // @[BrainfuckProcessor.scala 248:41:@502.6]
  assign _GEN_520 = halted ? _GEN_518 : _GEN_465; // @[BrainfuckProcessor.scala 247:16:@497.4]
  assign _GEN_521 = halted ? _GEN_519 : _GEN_464; // @[BrainfuckProcessor.scala 247:16:@497.4]
  assign _T_310 = _T_297 | _T_68; // @[BrainfuckProcessor.scala 256:20:@515.4]
  assign _T_324 = programAddr + 14'h1; // @[BrainfuckProcessor.scala 274:34:@538.10]
  assign _T_325 = _T_324[13:0]; // @[BrainfuckProcessor.scala 274:34:@539.10]
  assign _GEN_522 = io_programValid ? 1'h1 : programAck; // @[BrainfuckProcessor.scala 268:34:@528.8]
  assign _GEN_523 = io_programValid ? 1'h1 : programDelay; // @[BrainfuckProcessor.scala 268:34:@528.8]
  assign _GEN_528 = io_programValid ? _T_325 : programAddr; // @[BrainfuckProcessor.scala 268:34:@528.8]
  assign _GEN_529 = io_programValid ? io_programData : _GEN_488; // @[BrainfuckProcessor.scala 268:34:@528.8]
  assign _GEN_530 = io_programValid ? 1'h1 : _GEN_489; // @[BrainfuckProcessor.scala 268:34:@528.8]
  assign _GEN_531 = programDelay ? 1'h0 : _GEN_522; // @[BrainfuckProcessor.scala 264:24:@523.6]
  assign _GEN_532 = programDelay ? 1'h0 : _GEN_523; // @[BrainfuckProcessor.scala 264:24:@523.6]
  assign _GEN_535 = programDelay ? 1'h0 : io_programValid; // @[BrainfuckProcessor.scala 264:24:@523.6]
  assign _GEN_537 = programDelay ? programAddr : _GEN_528; // @[BrainfuckProcessor.scala 264:24:@523.6]
  assign _GEN_538 = programDelay ? _GEN_488 : _GEN_529; // @[BrainfuckProcessor.scala 264:24:@523.6]
  assign _GEN_539 = programDelay ? _GEN_489 : _GEN_530; // @[BrainfuckProcessor.scala 264:24:@523.6]
  assign _GEN_540 = _T_310 ? 14'h0 : _GEN_537; // @[BrainfuckProcessor.scala 256:32:@516.4]
  assign _GEN_541 = _T_310 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 256:32:@516.4]
  assign _GEN_542 = _T_310 ? 1'h0 : _GEN_532; // @[BrainfuckProcessor.scala 256:32:@516.4]
  assign _GEN_543 = _T_310 ? programAck : _GEN_531; // @[BrainfuckProcessor.scala 256:32:@516.4]
  assign _GEN_546 = _T_310 ? 1'h0 : _GEN_535; // @[BrainfuckProcessor.scala 256:32:@516.4]
  assign _GEN_548 = _T_310 ? _GEN_488 : _GEN_538; // @[BrainfuckProcessor.scala 256:32:@516.4]
  assign _GEN_549 = _T_310 ? _GEN_489 : _GEN_539; // @[BrainfuckProcessor.scala 256:32:@516.4]
  assign io_programReady = programReady;
  assign io_programAck = programAck;
  assign io_inst = inst;
  assign io_halted = halted;
  assign io_errorCode = errorCode[2:0];
  assign io_stdinAck = stdinAck;
  assign io_stdoutData = stdoutData;
  assign io_stdoutValid = stdoutValid;
  assign _GEN_600 = branchJump == 1'h0; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_601 = _T_68 & _GEN_600; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_602 = _T_83 == 1'h0; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_603 = _GEN_601 & _GEN_602; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_604 = _T_113 == 1'h0; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_605 = _GEN_603 & _GEN_604; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_606 = _T_133 == 1'h0; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_607 = _GEN_605 & _GEN_606; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_608 = _T_155 == 1'h0; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_609 = _GEN_607 & _GEN_608; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_610 = _T_171 == 1'h0; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_611 = _GEN_609 & _GEN_610; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_612 = _GEN_611 & _T_189; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_613 = _GEN_612 & _T_192; // @[BrainfuckProcessor.scala 175:19:@375.24]
  assign _GEN_614 = halted & _T_298; // @[BrainfuckProcessor.scala 249:13:@506.10]
  assign _GEN_615 = _T_310 == 1'h0; // @[BrainfuckProcessor.scala 270:13:@532.12]
  assign _GEN_616 = programDelay == 1'h0; // @[BrainfuckProcessor.scala 270:13:@532.12]
  assign _GEN_617 = _GEN_615 & _GEN_616; // @[BrainfuckProcessor.scala 270:13:@532.12]
  assign _GEN_618 = _GEN_617 & io_programValid; // @[BrainfuckProcessor.scala 270:13:@532.12]
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  programReady = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  programAck = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  halted = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  errorCode = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  stdinAck = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  stdoutData = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  stdoutValid = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    instMem[initvar] = _RAND_7[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  programAddr = _RAND_8[13:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    stackMem[initvar] = _RAND_9[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  stackPtr = _RAND_10[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  stackData = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    branchStackMem[initvar] = _RAND_12[13:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  branchStackPtr = _RAND_13[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  branchStackData = _RAND_14[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  branchJump = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  branchJumpNest = _RAND_16[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  inst = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  pc = _RAND_18[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  run = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  run2 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  programDelay = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      programReady <= 1'h0;
    end else begin
      if (_T_310) begin
        programReady <= 1'h0;
      end else begin
        programReady <= 1'h1;
      end
    end
    if (reset) begin
      programAck <= 1'h0;
    end else begin
      if (!(_T_310)) begin
        if (programDelay) begin
          programAck <= 1'h0;
        end else begin
          if (io_programValid) begin
            programAck <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      halted <= 1'h1;
    end else begin
      if (halted) begin
        if (_T_298) begin
          halted <= 1'h0;
        end else begin
          if (_T_68) begin
            if (branchJump) begin
              if (_T_83) begin
                halted <= 1'h1;
              end else begin
                if (_T_87) begin
                  if (_T_89) begin
                    halted <= 1'h1;
                  end
                end
              end
            end else begin
              if (_T_83) begin
                halted <= 1'h1;
              end else begin
                if (_T_113) begin
                  if (_T_115) begin
                    halted <= 1'h1;
                  end
                end else begin
                  if (_T_133) begin
                    if (_T_135) begin
                      halted <= 1'h1;
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (_T_68) begin
          if (branchJump) begin
            if (_T_83) begin
              halted <= 1'h1;
            end else begin
              if (_T_87) begin
                if (_T_89) begin
                  halted <= 1'h1;
                end
              end
            end
          end else begin
            if (_T_83) begin
              halted <= 1'h1;
            end else begin
              if (_T_113) begin
                if (_T_115) begin
                  halted <= 1'h1;
                end
              end else begin
                if (_T_133) begin
                  if (_T_135) begin
                    halted <= 1'h1;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      errorCode <= 4'h0;
    end else begin
      if (halted) begin
        if (_T_298) begin
          errorCode <= 4'h0;
        end else begin
          if (_T_68) begin
            if (branchJump) begin
              if (_T_83) begin
                errorCode <= 4'h1;
              end else begin
                if (_T_87) begin
                  if (_T_89) begin
                    errorCode <= 4'h2;
                  end
                end
              end
            end else begin
              if (_T_83) begin
                errorCode <= 4'h0;
              end else begin
                if (_T_113) begin
                  if (_T_115) begin
                    errorCode <= 4'h3;
                  end
                end else begin
                  if (_T_133) begin
                    if (_T_135) begin
                      errorCode <= 4'h4;
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (_T_68) begin
          if (branchJump) begin
            if (_T_83) begin
              errorCode <= 4'h1;
            end else begin
              if (_T_87) begin
                if (_T_89) begin
                  errorCode <= 4'h2;
                end
              end
            end
          end else begin
            if (_T_83) begin
              errorCode <= 4'h0;
            end else begin
              if (_T_113) begin
                if (_T_115) begin
                  errorCode <= 4'h3;
                end
              end else begin
                if (_T_133) begin
                  if (_T_135) begin
                    errorCode <= 4'h4;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      stdinAck <= 1'h1;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          if (stdinAck) begin
            stdinAck <= 1'h0;
          end
        end else begin
          if (_T_83) begin
            if (stdinAck) begin
              stdinAck <= 1'h0;
            end
          end else begin
            if (_T_113) begin
              if (stdinAck) begin
                stdinAck <= 1'h0;
              end
            end else begin
              if (_T_133) begin
                if (stdinAck) begin
                  stdinAck <= 1'h0;
                end
              end else begin
                if (_T_155) begin
                  stdinAck <= _GEN_0;
                end else begin
                  if (_T_171) begin
                    stdinAck <= _GEN_0;
                  end else begin
                    if (_T_189) begin
                      stdinAck <= _GEN_0;
                    end else begin
                      if (_T_205) begin
                        if (_T_208) begin
                          stdinAck <= 1'h1;
                        end else begin
                          stdinAck <= _GEN_0;
                        end
                      end else begin
                        stdinAck <= _GEN_0;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        stdinAck <= _GEN_0;
      end
    end
    if (reset) begin
      stdoutData <= 8'h0;
    end else begin
      if (_T_310) begin
        if (_T_68) begin
          if (branchJump) begin
            if (stdoutValid) begin
              if (io_stdoutAck) begin
                stdoutData <= 8'h0;
              end
            end
          end else begin
            if (_T_83) begin
              if (stdoutValid) begin
                if (io_stdoutAck) begin
                  stdoutData <= 8'h0;
                end
              end
            end else begin
              if (_T_113) begin
                if (stdoutValid) begin
                  if (io_stdoutAck) begin
                    stdoutData <= 8'h0;
                  end
                end
              end else begin
                if (_T_133) begin
                  if (stdoutValid) begin
                    if (io_stdoutAck) begin
                      stdoutData <= 8'h0;
                    end
                  end
                end else begin
                  if (_T_155) begin
                    stdoutData <= _GEN_3;
                  end else begin
                    if (_T_171) begin
                      stdoutData <= _GEN_3;
                    end else begin
                      if (_T_189) begin
                        if (_T_192) begin
                          stdoutData <= stackData;
                        end else begin
                          stdoutData <= _GEN_3;
                        end
                      end else begin
                        stdoutData <= _GEN_3;
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          stdoutData <= _GEN_3;
        end
      end else begin
        if (programDelay) begin
          if (_T_68) begin
            if (branchJump) begin
              stdoutData <= _GEN_3;
            end else begin
              if (_T_83) begin
                stdoutData <= _GEN_3;
              end else begin
                if (_T_113) begin
                  stdoutData <= _GEN_3;
                end else begin
                  if (_T_133) begin
                    stdoutData <= _GEN_3;
                  end else begin
                    if (_T_155) begin
                      stdoutData <= _GEN_3;
                    end else begin
                      if (_T_171) begin
                        stdoutData <= _GEN_3;
                      end else begin
                        if (_T_189) begin
                          if (_T_192) begin
                            stdoutData <= stackData;
                          end else begin
                            stdoutData <= _GEN_3;
                          end
                        end else begin
                          stdoutData <= _GEN_3;
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            stdoutData <= _GEN_3;
          end
        end else begin
          if (io_programValid) begin
            stdoutData <= io_programData;
          end else begin
            if (_T_68) begin
              if (branchJump) begin
                stdoutData <= _GEN_3;
              end else begin
                if (_T_83) begin
                  stdoutData <= _GEN_3;
                end else begin
                  if (_T_113) begin
                    stdoutData <= _GEN_3;
                  end else begin
                    if (_T_133) begin
                      stdoutData <= _GEN_3;
                    end else begin
                      if (_T_155) begin
                        stdoutData <= _GEN_3;
                      end else begin
                        if (_T_171) begin
                          stdoutData <= _GEN_3;
                        end else begin
                          if (_T_189) begin
                            if (_T_192) begin
                              stdoutData <= stackData;
                            end else begin
                              stdoutData <= _GEN_3;
                            end
                          end else begin
                            stdoutData <= _GEN_3;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              stdoutData <= _GEN_3;
            end
          end
        end
      end
    end
    if (reset) begin
      stdoutValid <= 1'h0;
    end else begin
      if (_T_310) begin
        if (_T_68) begin
          if (branchJump) begin
            if (stdoutValid) begin
              if (io_stdoutAck) begin
                stdoutValid <= 1'h0;
              end
            end
          end else begin
            if (_T_83) begin
              if (stdoutValid) begin
                if (io_stdoutAck) begin
                  stdoutValid <= 1'h0;
                end
              end
            end else begin
              if (_T_113) begin
                if (stdoutValid) begin
                  if (io_stdoutAck) begin
                    stdoutValid <= 1'h0;
                  end
                end
              end else begin
                if (_T_133) begin
                  if (stdoutValid) begin
                    if (io_stdoutAck) begin
                      stdoutValid <= 1'h0;
                    end
                  end
                end else begin
                  if (_T_155) begin
                    stdoutValid <= _GEN_4;
                  end else begin
                    if (_T_171) begin
                      stdoutValid <= _GEN_4;
                    end else begin
                      if (_T_189) begin
                        if (_T_192) begin
                          stdoutValid <= 1'h1;
                        end else begin
                          stdoutValid <= _GEN_4;
                        end
                      end else begin
                        stdoutValid <= _GEN_4;
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          stdoutValid <= _GEN_4;
        end
      end else begin
        if (programDelay) begin
          if (_T_68) begin
            if (branchJump) begin
              stdoutValid <= _GEN_4;
            end else begin
              if (_T_83) begin
                stdoutValid <= _GEN_4;
              end else begin
                if (_T_113) begin
                  stdoutValid <= _GEN_4;
                end else begin
                  if (_T_133) begin
                    stdoutValid <= _GEN_4;
                  end else begin
                    if (_T_155) begin
                      stdoutValid <= _GEN_4;
                    end else begin
                      if (_T_171) begin
                        stdoutValid <= _GEN_4;
                      end else begin
                        if (_T_189) begin
                          if (_T_192) begin
                            stdoutValid <= 1'h1;
                          end else begin
                            stdoutValid <= _GEN_4;
                          end
                        end else begin
                          stdoutValid <= _GEN_4;
                        end
                      end
                    end
                  end
                end
              end
            end
          end else begin
            stdoutValid <= _GEN_4;
          end
        end else begin
          if (io_programValid) begin
            stdoutValid <= 1'h1;
          end else begin
            if (_T_68) begin
              if (branchJump) begin
                stdoutValid <= _GEN_4;
              end else begin
                if (_T_83) begin
                  stdoutValid <= _GEN_4;
                end else begin
                  if (_T_113) begin
                    stdoutValid <= _GEN_4;
                  end else begin
                    if (_T_133) begin
                      stdoutValid <= _GEN_4;
                    end else begin
                      if (_T_155) begin
                        stdoutValid <= _GEN_4;
                      end else begin
                        if (_T_171) begin
                          stdoutValid <= _GEN_4;
                        end else begin
                          if (_T_189) begin
                            if (_T_192) begin
                              stdoutValid <= 1'h1;
                            end else begin
                              stdoutValid <= _GEN_4;
                            end
                          end else begin
                            stdoutValid <= _GEN_4;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              stdoutValid <= _GEN_4;
            end
          end
        end
      end
    end
    if(instMem__T_322_en & instMem__T_322_mask) begin
      instMem[instMem__T_322_addr] <= instMem__T_322_data; // @[BrainfuckProcessor.scala 64:20:@189.4]
    end
    if (reset) begin
      programAddr <= 14'h0;
    end else begin
      if (_T_310) begin
        programAddr <= 14'h0;
      end else begin
        if (!(programDelay)) begin
          if (io_programValid) begin
            programAddr <= _T_325;
          end
        end
      end
    end
    if(stackMem__T_159_en & stackMem__T_159_mask) begin
      stackMem[stackMem__T_159_addr] <= stackMem__T_159_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
    end
    if(stackMem__T_176_en & stackMem__T_176_mask) begin
      stackMem[stackMem__T_176_addr] <= stackMem__T_176_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
    end
    if(stackMem__T_210_en & stackMem__T_210_mask) begin
      stackMem[stackMem__T_210_addr] <= stackMem__T_210_data; // @[BrainfuckProcessor.scala 68:21:@191.4]
    end
    if (reset) begin
      stackPtr <= 10'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_83)) begin
            if (_T_113) begin
              if (!(_T_115)) begin
                stackPtr <= _T_127;
              end
            end else begin
              if (_T_133) begin
                if (!(_T_135)) begin
                  stackPtr <= _T_148;
                end
              end
            end
          end
        end
      end else begin
        stackPtr <= 10'h0;
      end
    end
    if (reset) begin
      stackData <= 8'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_83)) begin
            if (_T_113) begin
              if (!(_T_115)) begin
                stackData <= stackMem__T_131_data;
              end
            end else begin
              if (_T_133) begin
                if (!(_T_135)) begin
                  stackData <= stackMem__T_153_data;
                end
              end else begin
                if (_T_155) begin
                  stackData <= _T_158;
                end else begin
                  if (_T_171) begin
                    stackData <= _T_175;
                  end else begin
                    if (!(_T_189)) begin
                      if (_T_205) begin
                        if (_T_208) begin
                          stackData <= io_stdinData;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        stackData <= stackMem__T_286_data;
      end
    end
    if(branchStackMem__T_231_en & branchStackMem__T_231_mask) begin
      branchStackMem[branchStackMem__T_231_addr] <= branchStackMem__T_231_data; // @[BrainfuckProcessor.scala 75:27:@196.4]
    end
    if (reset) begin
      branchStackPtr <= 4'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_83)) begin
            if (!(_T_113)) begin
              if (!(_T_133)) begin
                if (!(_T_155)) begin
                  if (!(_T_171)) begin
                    if (!(_T_189)) begin
                      if (!(_T_205)) begin
                        if (_T_87) begin
                          if (!(_T_221)) begin
                            branchStackPtr <= _T_241;
                          end
                        end else begin
                          if (_T_96) begin
                            if (_T_246) begin
                              branchStackPtr <= _T_250;
                            end else begin
                              branchStackPtr <= 4'h0;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        branchStackPtr <= 4'h0;
      end
    end
    if (reset) begin
      branchStackData <= 14'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_83)) begin
            if (!(_T_113)) begin
              if (!(_T_133)) begin
                if (!(_T_155)) begin
                  if (!(_T_171)) begin
                    if (!(_T_189)) begin
                      if (!(_T_205)) begin
                        if (_T_87) begin
                          if (!(_T_221)) begin
                            branchStackData <= pc;
                          end
                        end else begin
                          if (_T_96) begin
                            if (_T_246) begin
                              branchStackData <= branchStackMem__T_255_data;
                            end else begin
                              branchStackData <= 14'h0;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        branchStackData <= 14'h0;
      end
    end
    if (reset) begin
      branchJump <= 1'h0;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          if (!(_T_83)) begin
            if (!(_T_87)) begin
              if (_T_96) begin
                if (!(_T_98)) begin
                  branchJump <= 1'h0;
                end
              end
            end
          end
        end else begin
          if (!(_T_83)) begin
            if (!(_T_113)) begin
              if (!(_T_133)) begin
                if (!(_T_155)) begin
                  if (!(_T_171)) begin
                    if (!(_T_189)) begin
                      if (!(_T_205)) begin
                        if (_T_87) begin
                          if (_T_221) begin
                            branchJump <= 1'h1;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        branchJump <= 1'h0;
      end
    end
    if (reset) begin
      branchJumpNest <= 4'h0;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          if (!(_T_83)) begin
            if (_T_87) begin
              if (!(_T_89)) begin
                branchJumpNest <= _T_94;
              end
            end else begin
              if (_T_96) begin
                if (_T_98) begin
                  branchJumpNest <= _T_102;
                end else begin
                  branchJumpNest <= 4'h0;
                end
              end
            end
          end
        end else begin
          if (!(_T_83)) begin
            if (!(_T_113)) begin
              if (!(_T_133)) begin
                if (!(_T_155)) begin
                  if (!(_T_171)) begin
                    if (!(_T_189)) begin
                      if (!(_T_205)) begin
                        if (_T_87) begin
                          if (_T_221) begin
                            branchJumpNest <= 4'h0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        branchJumpNest <= 4'h0;
      end
    end
    if (reset) begin
      inst <= 8'h0;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          inst <= instMem__T_78_data;
        end else begin
          if (!(_T_83)) begin
            if (_T_113) begin
              if (!(_T_115)) begin
                inst <= instMem__T_124_data;
              end
            end else begin
              if (_T_133) begin
                if (!(_T_135)) begin
                  inst <= instMem__T_144_data;
                end
              end else begin
                if (_T_155) begin
                  inst <= instMem__T_166_data;
                end else begin
                  if (_T_171) begin
                    inst <= instMem__T_183_data;
                  end else begin
                    if (_T_189) begin
                      if (_T_192) begin
                        inst <= instMem__T_203_data;
                      end
                    end else begin
                      if (_T_205) begin
                        if (_T_208) begin
                          inst <= instMem__T_217_data;
                        end
                      end else begin
                        if (_T_87) begin
                          if (_T_221) begin
                            inst <= instMem__T_230_data;
                          end else begin
                            inst <= instMem__T_238_data;
                          end
                        end else begin
                          if (_T_96) begin
                            inst <= 8'h5b;
                          end else begin
                            if (_T_271) begin
                              inst <= instMem__T_278_data;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        inst <= instMem__T_283_data;
      end
    end
    if (reset) begin
      pc <= 14'h0;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          pc <= _T_74;
        end else begin
          if (!(_T_83)) begin
            if (_T_113) begin
              if (!(_T_115)) begin
                pc <= _T_74;
              end
            end else begin
              if (_T_133) begin
                if (!(_T_135)) begin
                  pc <= _T_74;
                end
              end else begin
                if (_T_155) begin
                  pc <= _T_74;
                end else begin
                  if (_T_171) begin
                    pc <= _T_74;
                  end else begin
                    if (_T_189) begin
                      if (_T_192) begin
                        pc <= _T_74;
                      end
                    end else begin
                      if (_T_205) begin
                        if (_T_208) begin
                          pc <= _T_74;
                        end
                      end else begin
                        if (_T_87) begin
                          if (_T_221) begin
                            pc <= _T_74;
                          end else begin
                            pc <= _T_74;
                          end
                        end else begin
                          if (_T_96) begin
                            pc <= branchStackData;
                          end else begin
                            if (_T_271) begin
                              pc <= _T_74;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        pc <= 14'h0;
      end
    end
    if (reset) begin
      run <= 1'h0;
    end else begin
      run <= io_run;
    end
    if (reset) begin
      run2 <= 1'h0;
    end else begin
      run2 <= run;
    end
    if (reset) begin
      programDelay <= 1'h0;
    end else begin
      if (_T_310) begin
        programDelay <= 1'h0;
      end else begin
        if (programDelay) begin
          programDelay <= 1'h0;
        end else begin
          if (io_programValid) begin
            programDelay <= 1'h1;
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_68 & _T_71) begin
          $fwrite(32'h80000002,"[process] branchJump:%d pc:%d inst:%c (%d) stackPtr:%d stackData:%d\n",branchJump,pc,inst,inst,stackPtr,stackData); // @[BrainfuckProcessor.scala 100:11:@221.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_613 & _T_71) begin
          $fwrite(32'h80000002,"[stdout] %c %d\n",stackData,stackData); // @[BrainfuckProcessor.scala 175:19:@375.24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_614 & _T_71) begin
          $fwrite(32'h80000002,"[run] Trigger!\n"); // @[BrainfuckProcessor.scala 249:13:@506.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_618 & _T_71) begin
          $fwrite(32'h80000002,"[program] Write programAddr:%d data:%c (%d)\n",programAddr,io_programData,io_programData); // @[BrainfuckProcessor.scala 270:13:@532.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module UntiChatter( // @[:@546.2]
  input   clock, // @[:@547.4]
  input   reset, // @[:@548.4]
  input   io_din, // @[:@549.4]
  output  io_dout // @[:@549.4]
);
  reg [19:0] counter; // @[UntiChatter.scala 18:24:@551.4]
  reg [31:0] _RAND_0;
  reg  trigger; // @[UntiChatter.scala 19:24:@552.4]
  reg [31:0] _RAND_1;
  reg  dout; // @[UntiChatter.scala 28:21:@564.4]
  reg [31:0] _RAND_2;
  reg [7:0] captureData; // @[UntiChatter.scala 30:28:@566.4]
  reg [31:0] _RAND_3;
  wire  _T_9; // @[UntiChatter.scala 20:16:@553.4]
  wire [20:0] _T_11; // @[UntiChatter.scala 21:24:@555.6]
  wire [19:0] _T_12; // @[UntiChatter.scala 21:24:@556.6]
  wire [19:0] _GEN_0; // @[UntiChatter.scala 20:30:@554.4]
  wire  _GEN_1; // @[UntiChatter.scala 20:30:@554.4]
  wire [8:0] _GEN_4; // @[UntiChatter.scala 32:33:@568.6]
  wire [8:0] _T_20; // @[UntiChatter.scala 32:33:@568.6]
  wire [8:0] _GEN_5; // @[UntiChatter.scala 32:46:@570.6]
  wire [9:0] _T_24; // @[UntiChatter.scala 32:46:@570.6]
  wire [8:0] _T_25; // @[UntiChatter.scala 32:46:@571.6]
  wire [7:0] _T_26; // @[UntiChatter.scala 33:43:@573.6]
  wire  _T_28; // @[UntiChatter.scala 33:43:@574.6]
  wire [8:0] _GEN_2; // @[UntiChatter.scala 31:18:@567.4]
  wire  _GEN_3; // @[UntiChatter.scala 31:18:@567.4]
  assign _T_9 = counter < 20'h7a120; // @[UntiChatter.scala 20:16:@553.4]
  assign _T_11 = counter + 20'h1; // @[UntiChatter.scala 21:24:@555.6]
  assign _T_12 = _T_11[19:0]; // @[UntiChatter.scala 21:24:@556.6]
  assign _GEN_0 = _T_9 ? _T_12 : 20'h0; // @[UntiChatter.scala 20:30:@554.4]
  assign _GEN_1 = _T_9 ? 1'h0 : 1'h1; // @[UntiChatter.scala 20:30:@554.4]
  assign _GEN_4 = {{1'd0}, captureData}; // @[UntiChatter.scala 32:33:@568.6]
  assign _T_20 = _GEN_4 << 1; // @[UntiChatter.scala 32:33:@568.6]
  assign _GEN_5 = {{8'd0}, io_din}; // @[UntiChatter.scala 32:46:@570.6]
  assign _T_24 = _T_20 + _GEN_5; // @[UntiChatter.scala 32:46:@570.6]
  assign _T_25 = _T_24[8:0]; // @[UntiChatter.scala 32:46:@571.6]
  assign _T_26 = ~ captureData; // @[UntiChatter.scala 33:43:@573.6]
  assign _T_28 = _T_26 == 8'h0; // @[UntiChatter.scala 33:43:@574.6]
  assign _GEN_2 = trigger ? _T_25 : {{1'd0}, captureData}; // @[UntiChatter.scala 31:18:@567.4]
  assign _GEN_3 = trigger ? _T_28 : dout; // @[UntiChatter.scala 31:18:@567.4]
  assign io_dout = dout;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  counter = _RAND_0[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  trigger = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  dout = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  captureData = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      counter <= 20'h0;
    end else begin
      if (_T_9) begin
        counter <= _T_12;
      end else begin
        counter <= 20'h0;
      end
    end
    if (reset) begin
      trigger <= 1'h0;
    end else begin
      if (_T_9) begin
        trigger <= 1'h0;
      end else begin
        trigger <= 1'h1;
      end
    end
    if (reset) begin
      dout <= 1'h0;
    end else begin
      if (trigger) begin
        dout <= _T_28;
      end
    end
    if (reset) begin
      captureData <= 8'h0;
    end else begin
      captureData <= _GEN_2[7:0];
    end
  end
endmodule
module Fifo( // @[:@610.2]
  input        clock, // @[:@611.4]
  input        reset, // @[:@612.4]
  input  [7:0] io_inData, // @[:@613.4]
  input        io_inValid, // @[:@613.4]
  output       io_inReady, // @[:@613.4]
  output       io_inAck, // @[:@613.4]
  output [7:0] io_outData, // @[:@613.4]
  output       io_outValid, // @[:@613.4]
  input        io_outReady, // @[:@613.4]
  input        io_outAck // @[:@613.4]
);
  reg  inReady; // @[Fifo.scala 26:24:@615.4]
  reg [31:0] _RAND_0;
  reg  inAck; // @[Fifo.scala 27:22:@616.4]
  reg [31:0] _RAND_1;
  reg [7:0] outData; // @[Fifo.scala 28:24:@617.4]
  reg [31:0] _RAND_2;
  reg  outValid; // @[Fifo.scala 29:25:@618.4]
  reg [31:0] _RAND_3;
  reg [7:0] mem [0:15]; // @[Fifo.scala 36:16:@623.4]
  reg [31:0] _RAND_4;
  wire [7:0] mem__T_93_data; // @[Fifo.scala 36:16:@623.4]
  wire [3:0] mem__T_93_addr; // @[Fifo.scala 36:16:@623.4]
  wire [7:0] mem__T_97_data; // @[Fifo.scala 36:16:@623.4]
  wire [3:0] mem__T_97_addr; // @[Fifo.scala 36:16:@623.4]
  wire [7:0] mem__T_77_data; // @[Fifo.scala 36:16:@623.4]
  wire [3:0] mem__T_77_addr; // @[Fifo.scala 36:16:@623.4]
  wire  mem__T_77_mask; // @[Fifo.scala 36:16:@623.4]
  wire  mem__T_77_en; // @[Fifo.scala 36:16:@623.4]
  reg [3:0] inPtr; // @[Fifo.scala 38:22:@624.4]
  reg [31:0] _RAND_5;
  reg [3:0] outPtr; // @[Fifo.scala 39:23:@625.4]
  reg [31:0] _RAND_6;
  reg  inDelay; // @[Fifo.scala 58:24:@665.4]
  reg [31:0] _RAND_7;
  reg  waitAck; // @[Fifo.scala 81:24:@691.4]
  reg [31:0] _RAND_8;
  wire  _T_28; // @[Fifo.scala 47:12:@628.4]
  wire [4:0] _T_29; // @[Fifo.scala 48:11:@629.4]
  wire [4:0] _T_30; // @[Fifo.scala 48:11:@630.4]
  wire [3:0] _T_31; // @[Fifo.scala 48:11:@631.4]
  wire [4:0] _T_33; // @[Fifo.scala 48:20:@632.4]
  wire [4:0] _T_34; // @[Fifo.scala 48:20:@633.4]
  wire [3:0] _T_35; // @[Fifo.scala 48:20:@634.4]
  wire [4:0] _GEN_51; // @[Fifo.scala 49:14:@635.4]
  wire [5:0] _T_37; // @[Fifo.scala 49:14:@635.4]
  wire [5:0] _T_38; // @[Fifo.scala 49:14:@636.4]
  wire [4:0] _T_39; // @[Fifo.scala 49:14:@637.4]
  wire [5:0] _T_41; // @[Fifo.scala 49:23:@638.4]
  wire [5:0] _T_42; // @[Fifo.scala 49:23:@639.4]
  wire [4:0] _T_43; // @[Fifo.scala 49:23:@640.4]
  wire [4:0] _GEN_52; // @[Fifo.scala 49:30:@641.4]
  wire [5:0] _T_44; // @[Fifo.scala 49:30:@641.4]
  wire [4:0] _T_45; // @[Fifo.scala 49:30:@642.4]
  wire [4:0] count; // @[Fifo.scala 46:18:@643.4]
  wire  empty; // @[Fifo.scala 51:21:@644.4]
  wire [5:0] _T_49; // @[Fifo.scala 52:33:@645.4]
  wire [5:0] _T_50; // @[Fifo.scala 52:33:@646.4]
  wire [4:0] _T_51; // @[Fifo.scala 52:33:@647.4]
  wire  full; // @[Fifo.scala 52:20:@648.4]
  wire [5:0] _T_54; // @[Fifo.scala 53:39:@649.4]
  wire [5:0] _T_55; // @[Fifo.scala 53:39:@650.4]
  wire [4:0] _T_56; // @[Fifo.scala 53:39:@651.4]
  wire  _T_57; // @[Fifo.scala 53:29:@652.4]
  wire [4:0] _T_59; // @[Fifo.scala 53:52:@653.4]
  wire [3:0] _T_60; // @[Fifo.scala 53:52:@654.4]
  wire [3:0] inPtrNext; // @[Fifo.scala 53:22:@655.4]
  wire  _T_67; // @[Fifo.scala 54:31:@659.4]
  wire [4:0] _T_69; // @[Fifo.scala 54:55:@660.4]
  wire [3:0] _T_70; // @[Fifo.scala 54:55:@661.4]
  wire [3:0] outPtrNext; // @[Fifo.scala 54:23:@662.4]
  wire  _T_76; // @[Fifo.scala 61:15:@670.6]
  wire [3:0] _GEN_4; // @[Fifo.scala 62:22:@672.8]
  wire  _GEN_8; // @[Fifo.scala 61:22:@671.6]
  wire [3:0] _GEN_10; // @[Fifo.scala 61:22:@671.6]
  wire  _GEN_12; // @[Fifo.scala 59:17:@666.4]
  wire [3:0] _GEN_16; // @[Fifo.scala 59:17:@666.4]
  wire  _GEN_17; // @[Fifo.scala 59:17:@666.4]
  wire  _GEN_18; // @[Fifo.scala 59:17:@666.4]
  wire  _T_90; // @[Fifo.scala 82:8:@692.4]
  wire  _T_92; // @[Fifo.scala 86:13:@695.8]
  wire  _T_96; // @[Fifo.scala 87:15:@699.10]
  wire [7:0] _GEN_19; // @[Fifo.scala 93:25:@710.10]
  wire  _GEN_20; // @[Fifo.scala 93:25:@710.10]
  wire  _GEN_21; // @[Fifo.scala 93:25:@710.10]
  wire [7:0] _GEN_25; // @[Fifo.scala 86:23:@696.8]
  wire [3:0] _GEN_26; // @[Fifo.scala 86:23:@696.8]
  wire  _GEN_27; // @[Fifo.scala 86:23:@696.8]
  wire  _GEN_28; // @[Fifo.scala 86:23:@696.8]
  wire  _GEN_31; // @[Fifo.scala 84:23:@694.6]
  wire [7:0] _GEN_32; // @[Fifo.scala 84:23:@694.6]
  wire [3:0] _GEN_33; // @[Fifo.scala 84:23:@694.6]
  wire  _GEN_34; // @[Fifo.scala 84:23:@694.6]
  wire  _GEN_35; // @[Fifo.scala 84:23:@694.6]
  wire  _GEN_38; // @[Fifo.scala 82:16:@693.4]
  wire [7:0] _GEN_39; // @[Fifo.scala 82:16:@693.4]
  wire [3:0] _GEN_40; // @[Fifo.scala 82:16:@693.4]
  wire  _GEN_41; // @[Fifo.scala 82:16:@693.4]
  wire  _GEN_42; // @[Fifo.scala 82:16:@693.4]
  wire  _GEN_55; // @[Fifo.scala 87:15:@701.12]
  wire  _GEN_56; // @[Fifo.scala 87:15:@701.12]
  wire  _GEN_58; // @[Fifo.scala 95:17:@714.14]
  wire  _GEN_59; // @[Fifo.scala 95:17:@714.14]
  wire  _GEN_60; // @[Fifo.scala 95:17:@714.14]
  assign mem__T_93_addr = outPtrNext;
  assign mem__T_93_data = mem[mem__T_93_addr]; // @[Fifo.scala 36:16:@623.4]
  assign mem__T_97_addr = outPtrNext;
  assign mem__T_97_data = mem[mem__T_97_addr]; // @[Fifo.scala 36:16:@623.4]
  assign mem__T_77_data = io_inData;
  assign mem__T_77_addr = inPtr;
  assign mem__T_77_mask = _GEN_12;
  assign mem__T_77_en = _GEN_12;
  assign _T_28 = outPtr <= inPtr; // @[Fifo.scala 47:12:@628.4]
  assign _T_29 = inPtr - outPtr; // @[Fifo.scala 48:11:@629.4]
  assign _T_30 = $unsigned(_T_29); // @[Fifo.scala 48:11:@630.4]
  assign _T_31 = _T_30[3:0]; // @[Fifo.scala 48:11:@631.4]
  assign _T_33 = _T_31 - 4'h1; // @[Fifo.scala 48:20:@632.4]
  assign _T_34 = $unsigned(_T_33); // @[Fifo.scala 48:20:@633.4]
  assign _T_35 = _T_34[3:0]; // @[Fifo.scala 48:20:@634.4]
  assign _GEN_51 = {{1'd0}, outPtr}; // @[Fifo.scala 49:14:@635.4]
  assign _T_37 = 5'h10 - _GEN_51; // @[Fifo.scala 49:14:@635.4]
  assign _T_38 = $unsigned(_T_37); // @[Fifo.scala 49:14:@636.4]
  assign _T_39 = _T_38[4:0]; // @[Fifo.scala 49:14:@637.4]
  assign _T_41 = _T_39 - 5'h1; // @[Fifo.scala 49:23:@638.4]
  assign _T_42 = $unsigned(_T_41); // @[Fifo.scala 49:23:@639.4]
  assign _T_43 = _T_42[4:0]; // @[Fifo.scala 49:23:@640.4]
  assign _GEN_52 = {{1'd0}, inPtr}; // @[Fifo.scala 49:30:@641.4]
  assign _T_44 = _T_43 + _GEN_52; // @[Fifo.scala 49:30:@641.4]
  assign _T_45 = _T_44[4:0]; // @[Fifo.scala 49:30:@642.4]
  assign count = _T_28 ? {{1'd0}, _T_35} : _T_45; // @[Fifo.scala 46:18:@643.4]
  assign empty = count == 5'h0; // @[Fifo.scala 51:21:@644.4]
  assign _T_49 = 5'h10 - 5'h3; // @[Fifo.scala 52:33:@645.4]
  assign _T_50 = $unsigned(_T_49); // @[Fifo.scala 52:33:@646.4]
  assign _T_51 = _T_50[4:0]; // @[Fifo.scala 52:33:@647.4]
  assign full = count == _T_51; // @[Fifo.scala 52:20:@648.4]
  assign _T_54 = 5'h10 - 5'h1; // @[Fifo.scala 53:39:@649.4]
  assign _T_55 = $unsigned(_T_54); // @[Fifo.scala 53:39:@650.4]
  assign _T_56 = _T_55[4:0]; // @[Fifo.scala 53:39:@651.4]
  assign _T_57 = _GEN_52 < _T_56; // @[Fifo.scala 53:29:@652.4]
  assign _T_59 = inPtr + 4'h1; // @[Fifo.scala 53:52:@653.4]
  assign _T_60 = _T_59[3:0]; // @[Fifo.scala 53:52:@654.4]
  assign inPtrNext = _T_57 ? _T_60 : 4'h0; // @[Fifo.scala 53:22:@655.4]
  assign _T_67 = _GEN_51 < _T_56; // @[Fifo.scala 54:31:@659.4]
  assign _T_69 = outPtr + 4'h1; // @[Fifo.scala 54:55:@660.4]
  assign _T_70 = _T_69[3:0]; // @[Fifo.scala 54:55:@661.4]
  assign outPtrNext = _T_67 ? _T_70 : 4'h0; // @[Fifo.scala 54:23:@662.4]
  assign _T_76 = full == 1'h0; // @[Fifo.scala 61:15:@670.6]
  assign _GEN_4 = io_inValid ? inPtrNext : inPtr; // @[Fifo.scala 62:22:@672.8]
  assign _GEN_8 = _T_76 ? io_inValid : 1'h0; // @[Fifo.scala 61:22:@671.6]
  assign _GEN_10 = _T_76 ? _GEN_4 : inPtr; // @[Fifo.scala 61:22:@671.6]
  assign _GEN_12 = inDelay ? 1'h0 : _GEN_8; // @[Fifo.scala 59:17:@666.4]
  assign _GEN_16 = inDelay ? inPtr : _GEN_10; // @[Fifo.scala 59:17:@666.4]
  assign _GEN_17 = inDelay ? inReady : _T_76; // @[Fifo.scala 59:17:@666.4]
  assign _GEN_18 = inDelay ? inAck : _GEN_8; // @[Fifo.scala 59:17:@666.4]
  assign _T_90 = empty == 1'h0; // @[Fifo.scala 82:8:@692.4]
  assign _T_92 = waitAck == 1'h0; // @[Fifo.scala 86:13:@695.8]
  assign _T_96 = reset == 1'h0; // @[Fifo.scala 87:15:@699.10]
  assign _GEN_19 = io_outAck ? 8'h0 : outData; // @[Fifo.scala 93:25:@710.10]
  assign _GEN_20 = io_outAck ? 1'h0 : outValid; // @[Fifo.scala 93:25:@710.10]
  assign _GEN_21 = io_outAck ? 1'h0 : waitAck; // @[Fifo.scala 93:25:@710.10]
  assign _GEN_25 = _T_92 ? mem__T_97_data : _GEN_19; // @[Fifo.scala 86:23:@696.8]
  assign _GEN_26 = _T_92 ? outPtrNext : outPtr; // @[Fifo.scala 86:23:@696.8]
  assign _GEN_27 = _T_92 ? 1'h1 : _GEN_20; // @[Fifo.scala 86:23:@696.8]
  assign _GEN_28 = _T_92 ? 1'h1 : _GEN_21; // @[Fifo.scala 86:23:@696.8]
  assign _GEN_31 = io_outReady ? _T_92 : 1'h0; // @[Fifo.scala 84:23:@694.6]
  assign _GEN_32 = io_outReady ? _GEN_25 : 8'h0; // @[Fifo.scala 84:23:@694.6]
  assign _GEN_33 = io_outReady ? _GEN_26 : outPtr; // @[Fifo.scala 84:23:@694.6]
  assign _GEN_34 = io_outReady ? _GEN_27 : 1'h0; // @[Fifo.scala 84:23:@694.6]
  assign _GEN_35 = io_outReady ? _GEN_28 : 1'h0; // @[Fifo.scala 84:23:@694.6]
  assign _GEN_38 = _T_90 ? _GEN_31 : 1'h0; // @[Fifo.scala 82:16:@693.4]
  assign _GEN_39 = _T_90 ? _GEN_32 : _GEN_19; // @[Fifo.scala 82:16:@693.4]
  assign _GEN_40 = _T_90 ? _GEN_33 : outPtr; // @[Fifo.scala 82:16:@693.4]
  assign _GEN_41 = _T_90 ? _GEN_34 : _GEN_20; // @[Fifo.scala 82:16:@693.4]
  assign _GEN_42 = _T_90 ? _GEN_35 : _GEN_21; // @[Fifo.scala 82:16:@693.4]
  assign io_inReady = inReady;
  assign io_inAck = inAck;
  assign io_outData = outData;
  assign io_outValid = outValid;
  assign _GEN_55 = _T_90 & io_outReady; // @[Fifo.scala 87:15:@701.12]
  assign _GEN_56 = _GEN_55 & _T_92; // @[Fifo.scala 87:15:@701.12]
  assign _GEN_58 = _T_92 == 1'h0; // @[Fifo.scala 95:17:@714.14]
  assign _GEN_59 = _GEN_55 & _GEN_58; // @[Fifo.scala 95:17:@714.14]
  assign _GEN_60 = _GEN_59 & io_outAck; // @[Fifo.scala 95:17:@714.14]
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  inReady = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  inAck = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  outData = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  outValid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    mem[initvar] = _RAND_4[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  inPtr = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  outPtr = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  inDelay = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  waitAck = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      inReady <= 1'h0;
    end else begin
      if (!(inDelay)) begin
        inReady <= _T_76;
      end
    end
    if (reset) begin
      inAck <= 1'h0;
    end else begin
      if (!(inDelay)) begin
        if (_T_76) begin
          inAck <= io_inValid;
        end else begin
          inAck <= 1'h0;
        end
      end
    end
    if (reset) begin
      outData <= 8'h0;
    end else begin
      if (_T_90) begin
        if (io_outReady) begin
          if (_T_92) begin
            outData <= mem__T_97_data;
          end else begin
            if (io_outAck) begin
              outData <= 8'h0;
            end
          end
        end else begin
          outData <= 8'h0;
        end
      end else begin
        if (io_outAck) begin
          outData <= 8'h0;
        end
      end
    end
    if (reset) begin
      outValid <= 1'h0;
    end else begin
      if (_T_90) begin
        if (io_outReady) begin
          if (_T_92) begin
            outValid <= 1'h1;
          end else begin
            if (io_outAck) begin
              outValid <= 1'h0;
            end
          end
        end else begin
          outValid <= 1'h0;
        end
      end else begin
        if (io_outAck) begin
          outValid <= 1'h0;
        end
      end
    end
    if(mem__T_77_en & mem__T_77_mask) begin
      mem[mem__T_77_addr] <= mem__T_77_data; // @[Fifo.scala 36:16:@623.4]
    end
    if (reset) begin
      inPtr <= 4'h1;
    end else begin
      if (!(inDelay)) begin
        if (_T_76) begin
          if (io_inValid) begin
            if (_T_57) begin
              inPtr <= _T_60;
            end else begin
              inPtr <= 4'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      outPtr <= 4'h0;
    end else begin
      if (_T_90) begin
        if (io_outReady) begin
          if (_T_92) begin
            if (_T_67) begin
              outPtr <= _T_70;
            end else begin
              outPtr <= 4'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      inDelay <= 1'h0;
    end else begin
      if (inDelay) begin
        inDelay <= 1'h0;
      end else begin
        if (_T_76) begin
          inDelay <= io_inValid;
        end else begin
          inDelay <= 1'h0;
        end
      end
    end
    if (reset) begin
      waitAck <= 1'h0;
    end else begin
      if (_T_90) begin
        if (io_outReady) begin
          if (_T_92) begin
            waitAck <= 1'h1;
          end else begin
            if (io_outAck) begin
              waitAck <= 1'h0;
            end
          end
        end else begin
          waitAck <= 1'h0;
        end
      end else begin
        if (io_outAck) begin
          waitAck <= 1'h0;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_56 & _T_96) begin
          $fwrite(32'h80000002,"[Fifo] [dequeue] data:%d outPtr:%d count:%d\n",mem__T_93_data,outPtrNext,count); // @[Fifo.scala 87:15:@701.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_60 & _T_96) begin
          $fwrite(32'h80000002,"[Fifo] [dequeue] Ack Received\n"); // @[Fifo.scala 95:17:@714.14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module DebugAccessPort( // @[:@862.2]
  input        clock, // @[:@863.4]
  input        reset, // @[:@864.4]
  output       io_uartTx, // @[:@865.4]
  input        io_uartRx, // @[:@865.4]
  input        io_switches_0, // @[:@865.4]
  input        io_switches_1, // @[:@865.4]
  input        io_switches_2, // @[:@865.4]
  input        io_switches_3, // @[:@865.4]
  output       io_leds_0, // @[:@865.4]
  output       io_leds_1, // @[:@865.4]
  output       io_leds_2, // @[:@865.4]
  output       io_leds_3, // @[:@865.4]
  output [2:0] io_triLed0, // @[:@865.4]
  output [2:0] io_triLed1, // @[:@865.4]
  output [2:0] io_triLed2, // @[:@865.4]
  output [2:0] io_triLed3 // @[:@865.4]
);
  wire  uart_clock; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  uart_reset; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  uart_io_rx; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  uart_io_tx; // @[DebugAccessPort.scala 37:20:@867.4]
  wire [7:0] uart_io_rxData; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  uart_io_rxValid; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  uart_io_rxAck; // @[DebugAccessPort.scala 37:20:@867.4]
  wire [7:0] uart_io_txData; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  uart_io_txValid; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  uart_io_txAck; // @[DebugAccessPort.scala 37:20:@867.4]
  wire  bf_clock; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_reset; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_run; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_program; // @[DebugAccessPort.scala 38:18:@870.4]
  wire [7:0] bf_io_programData; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_programValid; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_programReady; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_programAck; // @[DebugAccessPort.scala 38:18:@870.4]
  wire [7:0] bf_io_inst; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_halted; // @[DebugAccessPort.scala 38:18:@870.4]
  wire [2:0] bf_io_errorCode; // @[DebugAccessPort.scala 38:18:@870.4]
  wire [7:0] bf_io_stdinData; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_stdinValid; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_stdinAck; // @[DebugAccessPort.scala 38:18:@870.4]
  wire [7:0] bf_io_stdoutData; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_stdoutValid; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_stdoutReady; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  bf_io_stdoutAck; // @[DebugAccessPort.scala 38:18:@870.4]
  wire  chatterProgram_clock; // @[DebugAccessPort.scala 42:30:@873.4]
  wire  chatterProgram_reset; // @[DebugAccessPort.scala 42:30:@873.4]
  wire  chatterProgram_io_din; // @[DebugAccessPort.scala 42:30:@873.4]
  wire  chatterProgram_io_dout; // @[DebugAccessPort.scala 42:30:@873.4]
  wire  chatterRun_clock; // @[DebugAccessPort.scala 47:26:@880.4]
  wire  chatterRun_reset; // @[DebugAccessPort.scala 47:26:@880.4]
  wire  chatterRun_io_din; // @[DebugAccessPort.scala 47:26:@880.4]
  wire  chatterRun_io_dout; // @[DebugAccessPort.scala 47:26:@880.4]
  reg [7:0] statusInst; // @[DebugAccessPort.scala 55:27:@887.4]
  reg [31:0] _RAND_0;
  wire  fifoUartToBf_clock; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoUartToBf_reset; // @[DebugAccessPort.scala 73:28:@902.4]
  wire [7:0] fifoUartToBf_io_inData; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoUartToBf_io_inValid; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoUartToBf_io_inReady; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoUartToBf_io_inAck; // @[DebugAccessPort.scala 73:28:@902.4]
  wire [7:0] fifoUartToBf_io_outData; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoUartToBf_io_outValid; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoUartToBf_io_outReady; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoUartToBf_io_outAck; // @[DebugAccessPort.scala 73:28:@902.4]
  wire  fifoBfToUart_clock; // @[DebugAccessPort.scala 87:28:@920.4]
  wire  fifoBfToUart_reset; // @[DebugAccessPort.scala 87:28:@920.4]
  wire [7:0] fifoBfToUart_io_inData; // @[DebugAccessPort.scala 87:28:@920.4]
  wire  fifoBfToUart_io_inValid; // @[DebugAccessPort.scala 87:28:@920.4]
  wire  fifoBfToUart_io_inReady; // @[DebugAccessPort.scala 87:28:@920.4]
  wire  fifoBfToUart_io_inAck; // @[DebugAccessPort.scala 87:28:@920.4]
  wire [7:0] fifoBfToUart_io_outData; // @[DebugAccessPort.scala 87:28:@920.4]
  wire  fifoBfToUart_io_outValid; // @[DebugAccessPort.scala 87:28:@920.4]
  wire  fifoBfToUart_io_outReady; // @[DebugAccessPort.scala 87:28:@920.4]
  wire  fifoBfToUart_io_outAck; // @[DebugAccessPort.scala 87:28:@920.4]
  wire [2:0] _T_30; // @[DebugAccessPort.scala 61:27:@893.4]
  wire [2:0] _T_31; // @[DebugAccessPort.scala 62:27:@895.4]
  wire [1:0] _T_32; // @[DebugAccessPort.scala 63:27:@897.4]
  wire  program$; // @[DebugAccessPort.scala 43:21:@876.4]
  wire  _T_34; // @[DebugAccessPort.scala 81:28:@911.4]
  wire  _T_36; // @[DebugAccessPort.scala 82:27:@913.4]
  wire  _T_38; // @[DebugAccessPort.scala 82:26:@914.4]
  wire  _T_39; // @[DebugAccessPort.scala 83:34:@916.4]
  wire  _T_40; // @[DebugAccessPort.scala 84:32:@918.4]
  wire  run; // @[DebugAccessPort.scala 48:17:@883.4]
  UartTxRx uart ( // @[DebugAccessPort.scala 37:20:@867.4]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_rx(uart_io_rx),
    .io_tx(uart_io_tx),
    .io_rxData(uart_io_rxData),
    .io_rxValid(uart_io_rxValid),
    .io_rxAck(uart_io_rxAck),
    .io_txData(uart_io_txData),
    .io_txValid(uart_io_txValid),
    .io_txAck(uart_io_txAck)
  );
  BrainfuckProcessor bf ( // @[DebugAccessPort.scala 38:18:@870.4]
    .clock(bf_clock),
    .reset(bf_reset),
    .io_run(bf_io_run),
    .io_program(bf_io_program),
    .io_programData(bf_io_programData),
    .io_programValid(bf_io_programValid),
    .io_programReady(bf_io_programReady),
    .io_programAck(bf_io_programAck),
    .io_inst(bf_io_inst),
    .io_halted(bf_io_halted),
    .io_errorCode(bf_io_errorCode),
    .io_stdinData(bf_io_stdinData),
    .io_stdinValid(bf_io_stdinValid),
    .io_stdinAck(bf_io_stdinAck),
    .io_stdoutData(bf_io_stdoutData),
    .io_stdoutValid(bf_io_stdoutValid),
    .io_stdoutReady(bf_io_stdoutReady),
    .io_stdoutAck(bf_io_stdoutAck)
  );
  UntiChatter chatterProgram ( // @[DebugAccessPort.scala 42:30:@873.4]
    .clock(chatterProgram_clock),
    .reset(chatterProgram_reset),
    .io_din(chatterProgram_io_din),
    .io_dout(chatterProgram_io_dout)
  );
  UntiChatter chatterRun ( // @[DebugAccessPort.scala 47:26:@880.4]
    .clock(chatterRun_clock),
    .reset(chatterRun_reset),
    .io_din(chatterRun_io_din),
    .io_dout(chatterRun_io_dout)
  );
  Fifo fifoUartToBf ( // @[DebugAccessPort.scala 73:28:@902.4]
    .clock(fifoUartToBf_clock),
    .reset(fifoUartToBf_reset),
    .io_inData(fifoUartToBf_io_inData),
    .io_inValid(fifoUartToBf_io_inValid),
    .io_inReady(fifoUartToBf_io_inReady),
    .io_inAck(fifoUartToBf_io_inAck),
    .io_outData(fifoUartToBf_io_outData),
    .io_outValid(fifoUartToBf_io_outValid),
    .io_outReady(fifoUartToBf_io_outReady),
    .io_outAck(fifoUartToBf_io_outAck)
  );
  Fifo fifoBfToUart ( // @[DebugAccessPort.scala 87:28:@920.4]
    .clock(fifoBfToUart_clock),
    .reset(fifoBfToUart_reset),
    .io_inData(fifoBfToUart_io_inData),
    .io_inValid(fifoBfToUart_io_inValid),
    .io_inReady(fifoBfToUart_io_inReady),
    .io_inAck(fifoBfToUart_io_inAck),
    .io_outData(fifoBfToUart_io_outData),
    .io_outValid(fifoBfToUart_io_outValid),
    .io_outReady(fifoBfToUart_io_outReady),
    .io_outAck(fifoBfToUart_io_outAck)
  );
  assign _T_30 = statusInst[2:0]; // @[DebugAccessPort.scala 61:27:@893.4]
  assign _T_31 = statusInst[5:3]; // @[DebugAccessPort.scala 62:27:@895.4]
  assign _T_32 = statusInst[7:6]; // @[DebugAccessPort.scala 63:27:@897.4]
  assign program$ = chatterProgram_io_dout; // @[DebugAccessPort.scala 43:21:@876.4]
  assign _T_34 = program$ ? fifoUartToBf_io_outValid : 1'h0; // @[DebugAccessPort.scala 81:28:@911.4]
  assign _T_36 = program$ == 1'h0; // @[DebugAccessPort.scala 82:27:@913.4]
  assign _T_38 = _T_36 ? fifoUartToBf_io_outValid : 1'h0; // @[DebugAccessPort.scala 82:26:@914.4]
  assign _T_39 = program$ ? bf_io_programReady : 1'h1; // @[DebugAccessPort.scala 83:34:@916.4]
  assign _T_40 = program$ ? bf_io_programAck : bf_io_stdinAck; // @[DebugAccessPort.scala 84:32:@918.4]
  assign run = chatterRun_io_dout; // @[DebugAccessPort.scala 48:17:@883.4]
  assign io_uartTx = uart_io_tx;
  assign io_leds_0 = program$;
  assign io_leds_1 = run;
  assign io_leds_2 = bf_io_stdoutValid;
  assign io_leds_3 = bf_io_halted;
  assign io_triLed0 = _T_30;
  assign io_triLed1 = _T_31;
  assign io_triLed2 = {{1'd0}, _T_32};
  assign io_triLed3 = bf_io_errorCode;
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_rx = io_uartRx;
  assign uart_io_rxAck = fifoUartToBf_io_inAck;
  assign uart_io_txData = fifoBfToUart_io_outData;
  assign uart_io_txValid = fifoBfToUart_io_outValid;
  assign bf_clock = clock;
  assign bf_reset = reset;
  assign bf_io_run = run;
  assign bf_io_program = program$;
  assign bf_io_programData = fifoUartToBf_io_outData;
  assign bf_io_programValid = _T_34;
  assign bf_io_stdinData = fifoUartToBf_io_outData;
  assign bf_io_stdinValid = _T_38;
  assign bf_io_stdoutReady = fifoBfToUart_io_inReady;
  assign bf_io_stdoutAck = fifoBfToUart_io_inAck;
  assign chatterProgram_clock = clock;
  assign chatterProgram_reset = reset;
  assign chatterProgram_io_din = io_switches_0;
  assign chatterRun_clock = clock;
  assign chatterRun_reset = reset;
  assign chatterRun_io_din = io_switches_1;
  assign fifoUartToBf_clock = clock;
  assign fifoUartToBf_reset = reset;
  assign fifoUartToBf_io_inData = uart_io_rxData;
  assign fifoUartToBf_io_inValid = uart_io_rxValid;
  assign fifoUartToBf_io_outReady = _T_39;
  assign fifoUartToBf_io_outAck = _T_40;
  assign fifoBfToUart_clock = clock;
  assign fifoBfToUart_reset = reset;
  assign fifoBfToUart_io_inData = bf_io_stdoutData;
  assign fifoBfToUart_io_inValid = bf_io_stdoutValid;
  assign fifoBfToUart_io_outReady = 1'h1;
  assign fifoBfToUart_io_outAck = uart_io_txAck;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  statusInst = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      statusInst <= 8'h0;
    end else begin
      statusInst <= bf_io_inst;
    end
  end
endmodule
