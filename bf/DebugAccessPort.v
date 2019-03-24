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
  input        io_rxReady, // @[:@6.4]
  output       io_rxValid, // @[:@6.4]
  input        io_rxAck, // @[:@6.4]
  input  [7:0] io_txData, // @[:@6.4]
  output       io_txReady, // @[:@6.4]
  input        io_txValid, // @[:@6.4]
  output       io_txAck, // @[:@6.4]
  output       io_rxActive, // @[:@6.4]
  output       io_txActive, // @[:@6.4]
  output [7:0] io_rxDebugBuf, // @[:@6.4]
  output [7:0] io_txDebugBuf // @[:@6.4]
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
  reg [14:0] rxDurationCounter; // @[UartTxRx.scala 51:34:@21.4]
  reg [31:0] _RAND_6;
  reg  rx1; // @[UartTxRx.scala 52:20:@22.4]
  reg [31:0] _RAND_7;
  reg  rx2; // @[UartTxRx.scala 53:20:@23.4]
  reg [31:0] _RAND_8;
  reg [7:0] rxBuf; // @[UartTxRx.scala 76:22:@62.4]
  reg [31:0] _RAND_9;
  reg [3:0] rxCounter; // @[UartTxRx.scala 78:26:@64.4]
  reg [31:0] _RAND_10;
  reg  txActive; // @[UartTxRx.scala 103:25:@102.4]
  reg [31:0] _RAND_11;
  reg  txTrigger; // @[UartTxRx.scala 105:26:@104.4]
  reg [31:0] _RAND_12;
  reg [14:0] txDurationCounter; // @[UartTxRx.scala 106:34:@105.4]
  reg [31:0] _RAND_13;
  reg [7:0] txBuf; // @[UartTxRx.scala 107:22:@106.4]
  reg [31:0] _RAND_14;
  reg [3:0] txCounter; // @[UartTxRx.scala 109:26:@108.4]
  reg [31:0] _RAND_15;
  wire  _T_37; // @[UartTxRx.scala 56:8:@26.4]
  wire  _T_39; // @[UartTxRx.scala 57:17:@28.6]
  wire  _T_40; // @[UartTxRx.scala 57:14:@29.6]
  wire  _T_43; // @[UartTxRx.scala 58:13:@32.8]
  wire [14:0] _T_48; // @[UartTxRx.scala 61:28:@38.8]
  wire [13:0] _T_49; // @[UartTxRx.scala 61:28:@39.8]
  wire [13:0] _T_50; // @[UartTxRx.scala 61:28:@40.8]
  wire [14:0] _GEN_2; // @[UartTxRx.scala 57:23:@30.6]
  wire  _T_54; // @[UartTxRx.scala 67:28:@49.6]
  wire [15:0] _T_56; // @[UartTxRx.scala 68:46:@51.8]
  wire [14:0] _T_57; // @[UartTxRx.scala 68:46:@52.8]
  wire [14:0] _T_58; // @[UartTxRx.scala 68:46:@53.8]
  wire [14:0] _GEN_3; // @[UartTxRx.scala 67:42:@50.6]
  wire  _GEN_4; // @[UartTxRx.scala 67:42:@50.6]
  wire  _GEN_5; // @[UartTxRx.scala 56:19:@27.4]
  wire  _GEN_6; // @[UartTxRx.scala 56:19:@27.4]
  wire [14:0] _GEN_7; // @[UartTxRx.scala 56:19:@27.4]
  wire [4:0] _T_67; // @[UartTxRx.scala 81:30:@67.8]
  wire [3:0] _T_68; // @[UartTxRx.scala 81:30:@68.8]
  wire [6:0] _T_69; // @[UartTxRx.scala 82:23:@70.8]
  wire [7:0] _T_72; // @[UartTxRx.scala 82:41:@71.8]
  wire [7:0] _GEN_49; // @[UartTxRx.scala 82:36:@72.8]
  wire [8:0] _T_73; // @[UartTxRx.scala 82:36:@72.8]
  wire [7:0] _T_74; // @[UartTxRx.scala 82:36:@73.8]
  wire  _T_79; // @[UartTxRx.scala 85:22:@80.8]
  wire  _GEN_8; // @[UartTxRx.scala 85:29:@81.8]
  wire [7:0] _GEN_9; // @[UartTxRx.scala 85:29:@81.8]
  wire  _GEN_10; // @[UartTxRx.scala 85:29:@81.8]
  wire [3:0] _GEN_11; // @[UartTxRx.scala 80:21:@66.6]
  wire [7:0] _GEN_12; // @[UartTxRx.scala 80:21:@66.6]
  wire  _GEN_13; // @[UartTxRx.scala 80:21:@66.6]
  wire [7:0] _GEN_14; // @[UartTxRx.scala 80:21:@66.6]
  wire  _GEN_15; // @[UartTxRx.scala 80:21:@66.6]
  wire [3:0] _GEN_16; // @[UartTxRx.scala 79:18:@65.4]
  wire [7:0] _GEN_17; // @[UartTxRx.scala 79:18:@65.4]
  wire  _GEN_18; // @[UartTxRx.scala 79:18:@65.4]
  wire [7:0] _GEN_19; // @[UartTxRx.scala 79:18:@65.4]
  wire  _GEN_20; // @[UartTxRx.scala 79:18:@65.4]
  wire  _T_87; // @[UartTxRx.scala 97:16:@97.4]
  wire [7:0] _GEN_21; // @[UartTxRx.scala 97:28:@98.4]
  wire  _GEN_22; // @[UartTxRx.scala 97:28:@98.4]
  wire  _T_101; // @[UartTxRx.scala 110:8:@109.4]
  wire  _GEN_23; // @[UartTxRx.scala 111:23:@111.6]
  wire [7:0] _GEN_24; // @[UartTxRx.scala 111:23:@111.6]
  wire [14:0] _GEN_26; // @[UartTxRx.scala 111:23:@111.6]
  wire  _T_111; // @[UartTxRx.scala 123:29:@128.6]
  wire [15:0] _T_113; // @[UartTxRx.scala 124:46:@130.8]
  wire [14:0] _T_114; // @[UartTxRx.scala 124:46:@131.8]
  wire [14:0] _T_115; // @[UartTxRx.scala 124:46:@132.8]
  wire [14:0] _GEN_27; // @[UartTxRx.scala 123:43:@129.6]
  wire  _GEN_28; // @[UartTxRx.scala 123:43:@129.6]
  wire  _GEN_29; // @[UartTxRx.scala 110:19:@110.4]
  wire [7:0] _GEN_30; // @[UartTxRx.scala 110:19:@110.4]
  wire  _GEN_31; // @[UartTxRx.scala 110:19:@110.4]
  wire [14:0] _GEN_32; // @[UartTxRx.scala 110:19:@110.4]
  wire  _GEN_33; // @[UartTxRx.scala 110:19:@110.4]
  wire  _T_123; // @[UartTxRx.scala 136:22:@148.8]
  wire [4:0] _T_129; // @[UartTxRx.scala 139:32:@156.10]
  wire [3:0] _T_130; // @[UartTxRx.scala 139:32:@157.10]
  wire  _T_132; // @[UartTxRx.scala 140:29:@161.10]
  wire [4:0] _T_137; // @[UartTxRx.scala 143:31:@168.12]
  wire [4:0] _T_138; // @[UartTxRx.scala 143:31:@169.12]
  wire [3:0] _T_139; // @[UartTxRx.scala 143:31:@170.12]
  wire [7:0] _T_140; // @[UartTxRx.scala 143:20:@171.12]
  wire  _T_141; // @[UartTxRx.scala 143:20:@172.12]
  wire  _T_146; // @[UartTxRx.scala 145:29:@179.12]
  wire [3:0] _GEN_35; // @[UartTxRx.scala 145:37:@180.12]
  wire  _GEN_36; // @[UartTxRx.scala 145:37:@180.12]
  wire  _GEN_37; // @[UartTxRx.scala 140:36:@162.10]
  wire [3:0] _GEN_38; // @[UartTxRx.scala 140:36:@162.10]
  wire  _GEN_39; // @[UartTxRx.scala 140:36:@162.10]
  wire  _GEN_40; // @[UartTxRx.scala 136:31:@149.8]
  wire [3:0] _GEN_41; // @[UartTxRx.scala 136:31:@149.8]
  wire  _GEN_42; // @[UartTxRx.scala 136:31:@149.8]
  wire  _GEN_43; // @[UartTxRx.scala 134:21:@142.6]
  wire [3:0] _GEN_44; // @[UartTxRx.scala 134:21:@142.6]
  wire  _GEN_45; // @[UartTxRx.scala 134:21:@142.6]
  wire  _GEN_46; // @[UartTxRx.scala 133:18:@141.4]
  wire [3:0] _GEN_47; // @[UartTxRx.scala 133:18:@141.4]
  wire  _GEN_48; // @[UartTxRx.scala 133:18:@141.4]
  wire  _GEN_50; // @[UartTxRx.scala 58:13:@34.10]
  wire  _GEN_51; // @[UartTxRx.scala 83:13:@78.10]
  wire  _GEN_53; // @[UartTxRx.scala 86:15:@85.12]
  wire  _GEN_54; // @[UartTxRx.scala 113:13:@115.10]
  wire  _GEN_55; // @[UartTxRx.scala 135:13:@146.10]
  wire  _GEN_57; // @[UartTxRx.scala 137:15:@153.12]
  wire  _GEN_59; // @[UartTxRx.scala 142:15:@166.14]
  wire  _GEN_60; // @[UartTxRx.scala 142:15:@166.14]
  wire  _GEN_61; // @[UartTxRx.scala 142:15:@166.14]
  wire  _GEN_65; // @[UartTxRx.scala 147:15:@184.16]
  wire  _GEN_66; // @[UartTxRx.scala 147:15:@184.16]
  wire  _GEN_67; // @[UartTxRx.scala 147:15:@184.16]
  wire  _GEN_73; // @[UartTxRx.scala 152:15:@195.16]
  wire  _GEN_74; // @[UartTxRx.scala 152:15:@195.16]
  assign _T_37 = rxActive == 1'h0; // @[UartTxRx.scala 56:8:@26.4]
  assign _T_39 = rx1 == 1'h0; // @[UartTxRx.scala 57:17:@28.6]
  assign _T_40 = rx2 & _T_39; // @[UartTxRx.scala 57:14:@29.6]
  assign _T_43 = reset == 1'h0; // @[UartTxRx.scala 58:13:@32.8]
  assign _T_48 = $signed(14'sh0) - $signed(14'sh1458); // @[UartTxRx.scala 61:28:@38.8]
  assign _T_49 = _T_48[13:0]; // @[UartTxRx.scala 61:28:@39.8]
  assign _T_50 = $signed(_T_49); // @[UartTxRx.scala 61:28:@40.8]
  assign _GEN_2 = _T_40 ? $signed({{1{_T_50[13]}},_T_50}) : $signed(rxDurationCounter); // @[UartTxRx.scala 57:23:@30.6]
  assign _T_54 = $signed(rxDurationCounter) < $signed(15'sh28b0); // @[UartTxRx.scala 67:28:@49.6]
  assign _T_56 = $signed(rxDurationCounter) + $signed(15'sh1); // @[UartTxRx.scala 68:46:@51.8]
  assign _T_57 = _T_56[14:0]; // @[UartTxRx.scala 68:46:@52.8]
  assign _T_58 = $signed(_T_57); // @[UartTxRx.scala 68:46:@53.8]
  assign _GEN_3 = _T_54 ? $signed(_T_58) : $signed(15'sh0); // @[UartTxRx.scala 67:42:@50.6]
  assign _GEN_4 = _T_54 ? 1'h0 : 1'h1; // @[UartTxRx.scala 67:42:@50.6]
  assign _GEN_5 = _T_37 ? _T_40 : rxActive; // @[UartTxRx.scala 56:19:@27.4]
  assign _GEN_6 = _T_37 ? 1'h0 : _GEN_4; // @[UartTxRx.scala 56:19:@27.4]
  assign _GEN_7 = _T_37 ? $signed(_GEN_2) : $signed(_GEN_3); // @[UartTxRx.scala 56:19:@27.4]
  assign _T_67 = rxCounter + 4'h1; // @[UartTxRx.scala 81:30:@67.8]
  assign _T_68 = _T_67[3:0]; // @[UartTxRx.scala 81:30:@68.8]
  assign _T_69 = rxBuf[7:1]; // @[UartTxRx.scala 82:23:@70.8]
  assign _T_72 = io_rx ? 8'h80 : 8'h0; // @[UartTxRx.scala 82:41:@71.8]
  assign _GEN_49 = {{1'd0}, _T_69}; // @[UartTxRx.scala 82:36:@72.8]
  assign _T_73 = _GEN_49 + _T_72; // @[UartTxRx.scala 82:36:@72.8]
  assign _T_74 = _T_73[7:0]; // @[UartTxRx.scala 82:36:@73.8]
  assign _T_79 = rxCounter > 4'h7; // @[UartTxRx.scala 85:22:@80.8]
  assign _GEN_8 = _T_79 ? 1'h0 : _GEN_5; // @[UartTxRx.scala 85:29:@81.8]
  assign _GEN_9 = _T_79 ? rxBuf : rxData; // @[UartTxRx.scala 85:29:@81.8]
  assign _GEN_10 = _T_79 ? 1'h1 : rxValid; // @[UartTxRx.scala 85:29:@81.8]
  assign _GEN_11 = rxTrigger ? _T_68 : rxCounter; // @[UartTxRx.scala 80:21:@66.6]
  assign _GEN_12 = rxTrigger ? _T_74 : rxBuf; // @[UartTxRx.scala 80:21:@66.6]
  assign _GEN_13 = rxTrigger ? _GEN_8 : _GEN_5; // @[UartTxRx.scala 80:21:@66.6]
  assign _GEN_14 = rxTrigger ? _GEN_9 : rxData; // @[UartTxRx.scala 80:21:@66.6]
  assign _GEN_15 = rxTrigger ? _GEN_10 : rxValid; // @[UartTxRx.scala 80:21:@66.6]
  assign _GEN_16 = rxActive ? _GEN_11 : 4'h0; // @[UartTxRx.scala 79:18:@65.4]
  assign _GEN_17 = rxActive ? _GEN_12 : 8'h0; // @[UartTxRx.scala 79:18:@65.4]
  assign _GEN_18 = rxActive ? _GEN_13 : _GEN_5; // @[UartTxRx.scala 79:18:@65.4]
  assign _GEN_19 = rxActive ? _GEN_14 : rxData; // @[UartTxRx.scala 79:18:@65.4]
  assign _GEN_20 = rxActive ? _GEN_15 : rxValid; // @[UartTxRx.scala 79:18:@65.4]
  assign _T_87 = rxValid & io_rxAck; // @[UartTxRx.scala 97:16:@97.4]
  assign _GEN_21 = _T_87 ? 8'h0 : _GEN_19; // @[UartTxRx.scala 97:28:@98.4]
  assign _GEN_22 = _T_87 ? 1'h0 : _GEN_20; // @[UartTxRx.scala 97:28:@98.4]
  assign _T_101 = txActive == 1'h0; // @[UartTxRx.scala 110:8:@109.4]
  assign _GEN_23 = io_txValid ? 1'h1 : txActive; // @[UartTxRx.scala 111:23:@111.6]
  assign _GEN_24 = io_txValid ? io_txData : txBuf; // @[UartTxRx.scala 111:23:@111.6]
  assign _GEN_26 = io_txValid ? $signed(15'sh0) : $signed(txDurationCounter); // @[UartTxRx.scala 111:23:@111.6]
  assign _T_111 = $signed(txDurationCounter) < $signed(15'sh28b0); // @[UartTxRx.scala 123:29:@128.6]
  assign _T_113 = $signed(txDurationCounter) + $signed(15'sh1); // @[UartTxRx.scala 124:46:@130.8]
  assign _T_114 = _T_113[14:0]; // @[UartTxRx.scala 124:46:@131.8]
  assign _T_115 = $signed(_T_114); // @[UartTxRx.scala 124:46:@132.8]
  assign _GEN_27 = _T_111 ? $signed(_T_115) : $signed(15'sh0); // @[UartTxRx.scala 123:43:@129.6]
  assign _GEN_28 = _T_111 ? 1'h0 : 1'h1; // @[UartTxRx.scala 123:43:@129.6]
  assign _GEN_29 = _T_101 ? _GEN_23 : txActive; // @[UartTxRx.scala 110:19:@110.4]
  assign _GEN_30 = _T_101 ? _GEN_24 : txBuf; // @[UartTxRx.scala 110:19:@110.4]
  assign _GEN_31 = _T_101 ? io_txValid : 1'h0; // @[UartTxRx.scala 110:19:@110.4]
  assign _GEN_32 = _T_101 ? $signed(_GEN_26) : $signed(_GEN_27); // @[UartTxRx.scala 110:19:@110.4]
  assign _GEN_33 = _T_101 ? txTrigger : _GEN_28; // @[UartTxRx.scala 110:19:@110.4]
  assign _T_123 = txCounter == 4'h0; // @[UartTxRx.scala 136:22:@148.8]
  assign _T_129 = txCounter + 4'h1; // @[UartTxRx.scala 139:32:@156.10]
  assign _T_130 = _T_129[3:0]; // @[UartTxRx.scala 139:32:@157.10]
  assign _T_132 = txCounter < 4'h9; // @[UartTxRx.scala 140:29:@161.10]
  assign _T_137 = txCounter - 4'h1; // @[UartTxRx.scala 143:31:@168.12]
  assign _T_138 = $unsigned(_T_137); // @[UartTxRx.scala 143:31:@169.12]
  assign _T_139 = _T_138[3:0]; // @[UartTxRx.scala 143:31:@170.12]
  assign _T_140 = txBuf >> _T_139; // @[UartTxRx.scala 143:20:@171.12]
  assign _T_141 = _T_140[0]; // @[UartTxRx.scala 143:20:@172.12]
  assign _T_146 = txCounter < 4'ha; // @[UartTxRx.scala 145:29:@179.12]
  assign _GEN_35 = _T_146 ? _T_130 : 4'h0; // @[UartTxRx.scala 145:37:@180.12]
  assign _GEN_36 = _T_146 ? _GEN_29 : 1'h0; // @[UartTxRx.scala 145:37:@180.12]
  assign _GEN_37 = _T_132 ? _T_141 : 1'h1; // @[UartTxRx.scala 140:36:@162.10]
  assign _GEN_38 = _T_132 ? _T_130 : _GEN_35; // @[UartTxRx.scala 140:36:@162.10]
  assign _GEN_39 = _T_132 ? _GEN_29 : _GEN_36; // @[UartTxRx.scala 140:36:@162.10]
  assign _GEN_40 = _T_123 ? 1'h0 : _GEN_37; // @[UartTxRx.scala 136:31:@149.8]
  assign _GEN_41 = _T_123 ? _T_130 : _GEN_38; // @[UartTxRx.scala 136:31:@149.8]
  assign _GEN_42 = _T_123 ? _GEN_29 : _GEN_39; // @[UartTxRx.scala 136:31:@149.8]
  assign _GEN_43 = txTrigger ? _GEN_40 : tx; // @[UartTxRx.scala 134:21:@142.6]
  assign _GEN_44 = txTrigger ? _GEN_41 : txCounter; // @[UartTxRx.scala 134:21:@142.6]
  assign _GEN_45 = txTrigger ? _GEN_42 : _GEN_29; // @[UartTxRx.scala 134:21:@142.6]
  assign _GEN_46 = txActive ? _GEN_43 : 1'h1; // @[UartTxRx.scala 133:18:@141.4]
  assign _GEN_47 = txActive ? _GEN_44 : 4'h0; // @[UartTxRx.scala 133:18:@141.4]
  assign _GEN_48 = txActive ? _GEN_45 : _GEN_29; // @[UartTxRx.scala 133:18:@141.4]
  assign io_tx = tx;
  assign io_rxData = rxData;
  assign io_rxValid = rxValid;
  assign io_txReady = 1'h1;
  assign io_txAck = txAck;
  assign io_rxActive = rxActive;
  assign io_txActive = txActive;
  assign io_rxDebugBuf = rxBuf;
  assign io_txDebugBuf = txBuf;
  assign _GEN_50 = _T_37 & _T_40; // @[UartTxRx.scala 58:13:@34.10]
  assign _GEN_51 = rxActive & rxTrigger; // @[UartTxRx.scala 83:13:@78.10]
  assign _GEN_53 = _GEN_51 & _T_79; // @[UartTxRx.scala 86:15:@85.12]
  assign _GEN_54 = _T_101 & io_txValid; // @[UartTxRx.scala 113:13:@115.10]
  assign _GEN_55 = txActive & txTrigger; // @[UartTxRx.scala 135:13:@146.10]
  assign _GEN_57 = _GEN_55 & _T_123; // @[UartTxRx.scala 137:15:@153.12]
  assign _GEN_59 = _T_123 == 1'h0; // @[UartTxRx.scala 142:15:@166.14]
  assign _GEN_60 = _GEN_55 & _GEN_59; // @[UartTxRx.scala 142:15:@166.14]
  assign _GEN_61 = _GEN_60 & _T_132; // @[UartTxRx.scala 142:15:@166.14]
  assign _GEN_65 = _T_132 == 1'h0; // @[UartTxRx.scala 147:15:@184.16]
  assign _GEN_66 = _GEN_60 & _GEN_65; // @[UartTxRx.scala 147:15:@184.16]
  assign _GEN_67 = _GEN_66 & _T_146; // @[UartTxRx.scala 147:15:@184.16]
  assign _GEN_73 = _T_146 == 1'h0; // @[UartTxRx.scala 152:15:@195.16]
  assign _GEN_74 = _GEN_66 & _GEN_73; // @[UartTxRx.scala 152:15:@195.16]
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
  rxDurationCounter = _RAND_6[14:0];
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
  txDurationCounter = _RAND_13[14:0];
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
          if (_T_123) begin
            tx <= 1'h0;
          end else begin
            if (_T_132) begin
              tx <= _T_141;
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
      if (_T_87) begin
        rxData <= 8'h0;
      end else begin
        if (rxActive) begin
          if (rxTrigger) begin
            if (_T_79) begin
              rxData <= rxBuf;
            end
          end
        end
      end
    end
    if (reset) begin
      rxValid <= 1'h0;
    end else begin
      if (_T_87) begin
        rxValid <= 1'h0;
      end else begin
        if (rxActive) begin
          if (rxTrigger) begin
            if (_T_79) begin
              rxValid <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      txAck <= 1'h0;
    end else begin
      if (_T_101) begin
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
          if (_T_79) begin
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
        if (_T_54) begin
          rxTrigger <= 1'h0;
        end else begin
          rxTrigger <= 1'h1;
        end
      end
    end
    if (reset) begin
      rxDurationCounter <= 15'sh0;
    end else begin
      if (_T_37) begin
        if (_T_40) begin
          rxDurationCounter <= {{1{_T_50[13]}},_T_50};
        end
      end else begin
        if (_T_54) begin
          rxDurationCounter <= _T_58;
        end else begin
          rxDurationCounter <= 15'sh0;
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
          rxBuf <= _T_74;
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
          rxCounter <= _T_68;
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
          if (_T_123) begin
            if (_T_101) begin
              if (io_txValid) begin
                txActive <= 1'h1;
              end
            end
          end else begin
            if (_T_132) begin
              if (_T_101) begin
                if (io_txValid) begin
                  txActive <= 1'h1;
                end
              end
            end else begin
              if (_T_146) begin
                if (_T_101) begin
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
          if (_T_101) begin
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
      if (!(_T_101)) begin
        if (_T_111) begin
          txTrigger <= 1'h0;
        end else begin
          txTrigger <= 1'h1;
        end
      end
    end
    if (reset) begin
      txDurationCounter <= 15'sh0;
    end else begin
      if (_T_101) begin
        if (io_txValid) begin
          txDurationCounter <= 15'sh0;
        end
      end else begin
        if (_T_111) begin
          txDurationCounter <= _T_115;
        end else begin
          txDurationCounter <= 15'sh0;
        end
      end
    end
    if (reset) begin
      txBuf <= 8'h0;
    end else begin
      if (_T_101) begin
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
          if (_T_123) begin
            txCounter <= _T_130;
          end else begin
            if (_T_132) begin
              txCounter <= _T_130;
            end else begin
              if (_T_146) begin
                txCounter <= _T_130;
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
        if (_GEN_50 & _T_43) begin
          $fwrite(32'h80000002,"[Rx] Active\n"); // @[UartTxRx.scala 58:13:@34.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_51 & _T_43) begin
          $fwrite(32'h80000002,"[Rx] [%d] rx:%d buf:%d\n",rxCounter,io_rx,rxBuf); // @[UartTxRx.scala 83:13:@78.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_43) begin
          $fwrite(32'h80000002,"[Rx] Received:%d\n",rxBuf); // @[UartTxRx.scala 86:15:@85.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_54 & _T_43) begin
          $fwrite(32'h80000002,"[Tx] Active Bundle(rx -> %d, tx -> %d, rxData -> %d, rxReady -> %d, rxValid -> %d, rxAck -> %d, txData -> %d, txReady -> %d, txValid -> %d, txAck -> %d, rxActive -> %d, txActive -> %d, rxDebugBuf -> %d, txDebugBuf -> %d).txData\n",io_rx,io_tx,io_rxData,io_rxReady,io_rxValid,io_rxAck,io_txData,io_txReady,io_txValid,io_txAck,io_rxActive,io_txActive,io_rxDebugBuf,io_txDebugBuf); // @[UartTxRx.scala 113:13:@115.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_55 & _T_43) begin
          $fwrite(32'h80000002,"[Tx] [%d] rx:%d buf:%d\n",txCounter,tx,txBuf); // @[UartTxRx.scala 135:13:@146.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_57 & _T_43) begin
          $fwrite(32'h80000002,"[Tx] startbit\n"); // @[UartTxRx.scala 137:15:@153.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_61 & _T_43) begin
          $fwrite(32'h80000002,"[Tx] data\n"); // @[UartTxRx.scala 142:15:@166.14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_67 & _T_43) begin
          $fwrite(32'h80000002,"[Tx] stopbit\n"); // @[UartTxRx.scala 147:15:@184.16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_74 & _T_43) begin
          $fwrite(32'h80000002,"[Tx] fin\n"); // @[UartTxRx.scala 152:15:@195.16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module BrainfuckProcessor( // @[:@208.2]
  input        clock, // @[:@209.4]
  input        reset, // @[:@210.4]
  input        io_run, // @[:@211.4]
  input        io_program, // @[:@211.4]
  input  [7:0] io_programData, // @[:@211.4]
  input        io_programValid, // @[:@211.4]
  output       io_programReady, // @[:@211.4]
  output       io_programAck, // @[:@211.4]
  output [7:0] io_inst, // @[:@211.4]
  output       io_halted, // @[:@211.4]
  output [2:0] io_errorCode, // @[:@211.4]
  input  [7:0] io_stdinData, // @[:@211.4]
  input        io_stdinValid, // @[:@211.4]
  output       io_stdinAck, // @[:@211.4]
  output [7:0] io_stdoutData, // @[:@211.4]
  output       io_stdoutValid, // @[:@211.4]
  input        io_stdoutReady, // @[:@211.4]
  input        io_stdoutAck // @[:@211.4]
);
  reg  programReady; // @[BrainfuckProcessor.scala 43:29:@213.4]
  reg [31:0] _RAND_0;
  reg  programAck; // @[BrainfuckProcessor.scala 45:27:@215.4]
  reg [31:0] _RAND_1;
  reg  halted; // @[BrainfuckProcessor.scala 47:23:@217.4]
  reg [31:0] _RAND_2;
  reg [3:0] errorCode; // @[BrainfuckProcessor.scala 49:26:@219.4]
  reg [31:0] _RAND_3;
  reg  stdinAck; // @[BrainfuckProcessor.scala 53:25:@223.4]
  reg [31:0] _RAND_4;
  reg [7:0] stdoutData; // @[BrainfuckProcessor.scala 55:27:@225.4]
  reg [31:0] _RAND_5;
  reg  stdoutValid; // @[BrainfuckProcessor.scala 57:28:@227.4]
  reg [31:0] _RAND_6;
  reg [7:0] instMem [0:65535]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  reg [31:0] _RAND_7;
  wire [7:0] instMem__T_75_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_75_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_121_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_121_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_141_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_141_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_163_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_163_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_180_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_180_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_197_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_197_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_211_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_211_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_224_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_224_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_232_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_232_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_272_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_272_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_277_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_277_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [7:0] instMem__T_304_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire [15:0] instMem__T_304_addr; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire  instMem__T_304_mask; // @[BrainfuckProcessor.scala 61:20:@229.4]
  wire  instMem__T_304_en; // @[BrainfuckProcessor.scala 61:20:@229.4]
  reg [15:0] programAddr; // @[BrainfuckProcessor.scala 62:28:@230.4]
  reg [31:0] _RAND_8;
  reg [7:0] stackMem [0:65535]; // @[BrainfuckProcessor.scala 65:21:@231.4]
  reg [31:0] _RAND_9;
  wire [7:0] stackMem__T_128_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [15:0] stackMem__T_128_addr; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [7:0] stackMem__T_150_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [15:0] stackMem__T_150_addr; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [7:0] stackMem__T_280_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [15:0] stackMem__T_280_addr; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [7:0] stackMem__T_156_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [15:0] stackMem__T_156_addr; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire  stackMem__T_156_mask; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire  stackMem__T_156_en; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [7:0] stackMem__T_173_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [15:0] stackMem__T_173_addr; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire  stackMem__T_173_mask; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire  stackMem__T_173_en; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [7:0] stackMem__T_204_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire [15:0] stackMem__T_204_addr; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire  stackMem__T_204_mask; // @[BrainfuckProcessor.scala 65:21:@231.4]
  wire  stackMem__T_204_en; // @[BrainfuckProcessor.scala 65:21:@231.4]
  reg [15:0] stackPtr; // @[BrainfuckProcessor.scala 66:25:@232.4]
  reg [31:0] _RAND_10;
  reg [7:0] stackData; // @[BrainfuckProcessor.scala 67:26:@233.4]
  reg [31:0] _RAND_11;
  reg [15:0] branchStackMem [0:15]; // @[BrainfuckProcessor.scala 72:27:@236.4]
  reg [31:0] _RAND_12;
  wire [15:0] branchStackMem__T_249_data; // @[BrainfuckProcessor.scala 72:27:@236.4]
  wire [3:0] branchStackMem__T_249_addr; // @[BrainfuckProcessor.scala 72:27:@236.4]
  wire [15:0] branchStackMem__T_225_data; // @[BrainfuckProcessor.scala 72:27:@236.4]
  wire [3:0] branchStackMem__T_225_addr; // @[BrainfuckProcessor.scala 72:27:@236.4]
  wire  branchStackMem__T_225_mask; // @[BrainfuckProcessor.scala 72:27:@236.4]
  wire  branchStackMem__T_225_en; // @[BrainfuckProcessor.scala 72:27:@236.4]
  reg [3:0] branchStackPtr; // @[BrainfuckProcessor.scala 73:31:@237.4]
  reg [31:0] _RAND_13;
  reg [15:0] branchStackData; // @[BrainfuckProcessor.scala 74:32:@238.4]
  reg [31:0] _RAND_14;
  reg  branchJump; // @[BrainfuckProcessor.scala 90:27:@250.4]
  reg [31:0] _RAND_15;
  reg [3:0] branchJumpNest; // @[BrainfuckProcessor.scala 91:31:@251.4]
  reg [31:0] _RAND_16;
  reg [7:0] inst; // @[BrainfuckProcessor.scala 92:21:@252.4]
  reg [31:0] _RAND_17;
  reg [15:0] pc; // @[BrainfuckProcessor.scala 93:19:@253.4]
  reg [31:0] _RAND_18;
  reg  run; // @[BrainfuckProcessor.scala 240:20:@523.4]
  reg [31:0] _RAND_19;
  reg  run2; // @[BrainfuckProcessor.scala 241:21:@524.4]
  reg [31:0] _RAND_20;
  wire  _GEN_0; // @[BrainfuckProcessor.scala 79:18:@241.4]
  wire [7:0] _GEN_1; // @[BrainfuckProcessor.scala 84:24:@245.6]
  wire  _GEN_2; // @[BrainfuckProcessor.scala 84:24:@245.6]
  wire [7:0] _GEN_3; // @[BrainfuckProcessor.scala 83:21:@244.4]
  wire  _GEN_4; // @[BrainfuckProcessor.scala 83:21:@244.4]
  wire  _T_68; // @[BrainfuckProcessor.scala 97:8:@256.4]
  wire [16:0] _T_70; // @[BrainfuckProcessor.scala 100:17:@259.8]
  wire [15:0] _T_71; // @[BrainfuckProcessor.scala 100:17:@260.8]
  wire [15:0] _T_74; // @[BrainfuckProcessor.scala 101:31:@263.8]
  wire  _T_78; // @[Conditional.scala 37:30:@266.8]
  wire  _T_79; // @[Conditional.scala 37:30:@267.8]
  wire  _T_80; // @[Conditional.scala 37:55:@268.8]
  wire  _T_84; // @[Conditional.scala 37:30:@274.10]
  wire  _T_86; // @[BrainfuckProcessor.scala 108:31:@276.12]
  wire [4:0] _T_90; // @[BrainfuckProcessor.scala 112:47:@282.14]
  wire [3:0] _T_91; // @[BrainfuckProcessor.scala 112:47:@283.14]
  wire  _GEN_5; // @[BrainfuckProcessor.scala 108:63:@277.12]
  wire [3:0] _GEN_6; // @[BrainfuckProcessor.scala 108:63:@277.12]
  wire [3:0] _GEN_7; // @[BrainfuckProcessor.scala 108:63:@277.12]
  wire  _T_93; // @[Conditional.scala 37:30:@288.12]
  wire  _T_95; // @[BrainfuckProcessor.scala 116:31:@290.14]
  wire [4:0] _T_97; // @[BrainfuckProcessor.scala 117:47:@292.16]
  wire [4:0] _T_98; // @[BrainfuckProcessor.scala 117:47:@293.16]
  wire [3:0] _T_99; // @[BrainfuckProcessor.scala 117:47:@294.16]
  wire [3:0] _GEN_8; // @[BrainfuckProcessor.scala 116:38:@291.14]
  wire  _GEN_9; // @[BrainfuckProcessor.scala 116:38:@291.14]
  wire [3:0] _GEN_10; // @[Conditional.scala 39:67:@289.12]
  wire  _GEN_11; // @[Conditional.scala 39:67:@289.12]
  wire  _GEN_12; // @[Conditional.scala 39:67:@275.10]
  wire [3:0] _GEN_13; // @[Conditional.scala 39:67:@275.10]
  wire [3:0] _GEN_14; // @[Conditional.scala 39:67:@275.10]
  wire  _GEN_15; // @[Conditional.scala 39:67:@275.10]
  wire  _GEN_16; // @[Conditional.scala 40:58:@269.8]
  wire [3:0] _GEN_17; // @[Conditional.scala 40:58:@269.8]
  wire [3:0] _GEN_18; // @[Conditional.scala 40:58:@269.8]
  wire  _GEN_19; // @[Conditional.scala 40:58:@269.8]
  wire  _T_110; // @[Conditional.scala 37:30:@312.10]
  wire  _T_112; // @[BrainfuckProcessor.scala 133:26:@314.12]
  wire [15:0] _T_120; // @[BrainfuckProcessor.scala 138:37:@324.14]
  wire [16:0] _T_123; // @[BrainfuckProcessor.scala 139:35:@327.14]
  wire [15:0] _T_124; // @[BrainfuckProcessor.scala 139:35:@328.14]
  wire [15:0] _T_127; // @[BrainfuckProcessor.scala 140:49:@331.14]
  wire  _GEN_20; // @[BrainfuckProcessor.scala 133:52:@315.12]
  wire [3:0] _GEN_21; // @[BrainfuckProcessor.scala 133:52:@315.12]
  wire [15:0] _GEN_22; // @[BrainfuckProcessor.scala 133:52:@315.12]
  wire  _GEN_25; // @[BrainfuckProcessor.scala 133:52:@315.12]
  wire [7:0] _GEN_26; // @[BrainfuckProcessor.scala 133:52:@315.12]
  wire [15:0] _GEN_27; // @[BrainfuckProcessor.scala 133:52:@315.12]
  wire [7:0] _GEN_29; // @[BrainfuckProcessor.scala 133:52:@315.12]
  wire  _T_130; // @[Conditional.scala 37:30:@337.12]
  wire  _T_132; // @[BrainfuckProcessor.scala 144:26:@339.14]
  wire [15:0] _T_140; // @[BrainfuckProcessor.scala 149:37:@349.16]
  wire [16:0] _T_143; // @[BrainfuckProcessor.scala 150:35:@352.16]
  wire [16:0] _T_144; // @[BrainfuckProcessor.scala 150:35:@353.16]
  wire [15:0] _T_145; // @[BrainfuckProcessor.scala 150:35:@354.16]
  wire [15:0] _T_149; // @[BrainfuckProcessor.scala 151:49:@358.16]
  wire  _GEN_30; // @[BrainfuckProcessor.scala 144:35:@340.14]
  wire [3:0] _GEN_31; // @[BrainfuckProcessor.scala 144:35:@340.14]
  wire [15:0] _GEN_32; // @[BrainfuckProcessor.scala 144:35:@340.14]
  wire  _GEN_35; // @[BrainfuckProcessor.scala 144:35:@340.14]
  wire [7:0] _GEN_36; // @[BrainfuckProcessor.scala 144:35:@340.14]
  wire [15:0] _GEN_37; // @[BrainfuckProcessor.scala 144:35:@340.14]
  wire [7:0] _GEN_39; // @[BrainfuckProcessor.scala 144:35:@340.14]
  wire  _T_152; // @[Conditional.scala 37:30:@364.14]
  wire [8:0] _T_154; // @[BrainfuckProcessor.scala 155:46:@366.16]
  wire [7:0] _T_155; // @[BrainfuckProcessor.scala 155:46:@367.16]
  wire [15:0] _T_162; // @[BrainfuckProcessor.scala 158:35:@374.16]
  wire  _T_168; // @[Conditional.scala 37:30:@382.16]
  wire [8:0] _T_170; // @[BrainfuckProcessor.scala 162:46:@384.18]
  wire [8:0] _T_171; // @[BrainfuckProcessor.scala 162:46:@385.18]
  wire [7:0] _T_172; // @[BrainfuckProcessor.scala 162:46:@386.18]
  wire [15:0] _T_179; // @[BrainfuckProcessor.scala 165:35:@393.18]
  wire  _T_186; // @[Conditional.scala 37:30:@402.18]
  wire  _T_188; // @[BrainfuckProcessor.scala 170:34:@404.20]
  wire  _T_189; // @[BrainfuckProcessor.scala 170:31:@405.20]
  wire [15:0] _T_196; // @[BrainfuckProcessor.scala 177:37:@413.22]
  wire [7:0] _GEN_40; // @[BrainfuckProcessor.scala 170:48:@406.20]
  wire  _GEN_41; // @[BrainfuckProcessor.scala 170:48:@406.20]
  wire [15:0] _GEN_42; // @[BrainfuckProcessor.scala 170:48:@406.20]
  wire [7:0] _GEN_46; // @[BrainfuckProcessor.scala 170:48:@406.20]
  wire  _T_199; // @[Conditional.scala 37:30:@419.20]
  wire  _T_201; // @[BrainfuckProcessor.scala 182:33:@421.22]
  wire  _T_202; // @[BrainfuckProcessor.scala 182:30:@422.22]
  wire [15:0] _T_210; // @[BrainfuckProcessor.scala 187:37:@431.24]
  wire  _GEN_47; // @[BrainfuckProcessor.scala 182:44:@423.22]
  wire [15:0] _GEN_52; // @[BrainfuckProcessor.scala 182:44:@423.22]
  wire [7:0] _GEN_54; // @[BrainfuckProcessor.scala 182:44:@423.22]
  wire [7:0] _GEN_55; // @[BrainfuckProcessor.scala 182:44:@423.22]
  wire  _T_215; // @[BrainfuckProcessor.scala 192:26:@440.24]
  wire [15:0] _T_223; // @[BrainfuckProcessor.scala 197:37:@448.26]
  wire [15:0] _T_231; // @[BrainfuckProcessor.scala 202:37:@459.26]
  wire [4:0] _T_234; // @[BrainfuckProcessor.scala 203:47:@462.26]
  wire [3:0] _T_235; // @[BrainfuckProcessor.scala 203:47:@463.26]
  wire  _GEN_56; // @[BrainfuckProcessor.scala 192:35:@441.24]
  wire [3:0] _GEN_57; // @[BrainfuckProcessor.scala 192:35:@441.24]
  wire [15:0] _GEN_58; // @[BrainfuckProcessor.scala 192:35:@441.24]
  wire [7:0] _GEN_62; // @[BrainfuckProcessor.scala 192:35:@441.24]
  wire  _GEN_65; // @[BrainfuckProcessor.scala 192:35:@441.24]
  wire [3:0] _GEN_68; // @[BrainfuckProcessor.scala 192:35:@441.24]
  wire [15:0] _GEN_69; // @[BrainfuckProcessor.scala 192:35:@441.24]
  wire  _T_240; // @[BrainfuckProcessor.scala 212:31:@473.26]
  wire [4:0] _T_242; // @[BrainfuckProcessor.scala 213:47:@475.28]
  wire [4:0] _T_243; // @[BrainfuckProcessor.scala 213:47:@476.28]
  wire [3:0] _T_244; // @[BrainfuckProcessor.scala 213:47:@477.28]
  wire [4:0] _T_246; // @[BrainfuckProcessor.scala 214:67:@479.28]
  wire [4:0] _T_247; // @[BrainfuckProcessor.scala 214:67:@480.28]
  wire [3:0] _T_248; // @[BrainfuckProcessor.scala 214:67:@481.28]
  wire [3:0] _GEN_70; // @[BrainfuckProcessor.scala 212:38:@474.26]
  wire [15:0] _GEN_74; // @[BrainfuckProcessor.scala 212:38:@474.26]
  wire  _T_257; // @[Conditional.scala 37:30:@491.26]
  wire  _T_258; // @[Conditional.scala 37:30:@492.26]
  wire  _T_259; // @[Conditional.scala 37:30:@493.26]
  wire  _T_260; // @[Conditional.scala 37:30:@494.26]
  wire  _T_261; // @[Conditional.scala 37:30:@495.26]
  wire  _T_262; // @[Conditional.scala 37:55:@496.26]
  wire  _T_263; // @[Conditional.scala 37:55:@497.26]
  wire  _T_264; // @[Conditional.scala 37:55:@498.26]
  wire  _T_265; // @[Conditional.scala 37:55:@499.26]
  wire [15:0] _T_271; // @[BrainfuckProcessor.scala 224:35:@505.28]
  wire [15:0] _GEN_75; // @[Conditional.scala 39:67:@500.26]
  wire [7:0] _GEN_79; // @[Conditional.scala 39:67:@500.26]
  wire [15:0] _GEN_80; // @[Conditional.scala 39:67:@470.24]
  wire [7:0] _GEN_81; // @[Conditional.scala 39:67:@470.24]
  wire [3:0] _GEN_82; // @[Conditional.scala 39:67:@470.24]
  wire  _GEN_85; // @[Conditional.scala 39:67:@470.24]
  wire [15:0] _GEN_86; // @[Conditional.scala 39:67:@470.24]
  wire  _GEN_89; // @[Conditional.scala 39:67:@470.24]
  wire  _GEN_90; // @[Conditional.scala 39:67:@439.22]
  wire [3:0] _GEN_91; // @[Conditional.scala 39:67:@439.22]
  wire [15:0] _GEN_92; // @[Conditional.scala 39:67:@439.22]
  wire  _GEN_95; // @[Conditional.scala 39:67:@439.22]
  wire [7:0] _GEN_96; // @[Conditional.scala 39:67:@439.22]
  wire  _GEN_99; // @[Conditional.scala 39:67:@439.22]
  wire [3:0] _GEN_102; // @[Conditional.scala 39:67:@439.22]
  wire [15:0] _GEN_103; // @[Conditional.scala 39:67:@439.22]
  wire  _GEN_106; // @[Conditional.scala 39:67:@439.22]
  wire  _GEN_109; // @[Conditional.scala 39:67:@439.22]
  wire  _GEN_110; // @[Conditional.scala 39:67:@420.20]
  wire  _GEN_113; // @[Conditional.scala 39:67:@420.20]
  wire [15:0] _GEN_115; // @[Conditional.scala 39:67:@420.20]
  wire [7:0] _GEN_117; // @[Conditional.scala 39:67:@420.20]
  wire [7:0] _GEN_118; // @[Conditional.scala 39:67:@420.20]
  wire  _GEN_119; // @[Conditional.scala 39:67:@420.20]
  wire [3:0] _GEN_120; // @[Conditional.scala 39:67:@420.20]
  wire  _GEN_123; // @[Conditional.scala 39:67:@420.20]
  wire  _GEN_126; // @[Conditional.scala 39:67:@420.20]
  wire [3:0] _GEN_129; // @[Conditional.scala 39:67:@420.20]
  wire [15:0] _GEN_130; // @[Conditional.scala 39:67:@420.20]
  wire  _GEN_133; // @[Conditional.scala 39:67:@420.20]
  wire  _GEN_136; // @[Conditional.scala 39:67:@420.20]
  wire [7:0] _GEN_137; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_138; // @[Conditional.scala 39:67:@403.18]
  wire [15:0] _GEN_139; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_142; // @[Conditional.scala 39:67:@403.18]
  wire [7:0] _GEN_143; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_144; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_147; // @[Conditional.scala 39:67:@403.18]
  wire [7:0] _GEN_150; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_151; // @[Conditional.scala 39:67:@403.18]
  wire [3:0] _GEN_152; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_155; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_158; // @[Conditional.scala 39:67:@403.18]
  wire [3:0] _GEN_161; // @[Conditional.scala 39:67:@403.18]
  wire [15:0] _GEN_162; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_165; // @[Conditional.scala 39:67:@403.18]
  wire  _GEN_168; // @[Conditional.scala 39:67:@403.18]
  wire [15:0] _GEN_173; // @[Conditional.scala 39:67:@383.16]
  wire [7:0] _GEN_175; // @[Conditional.scala 39:67:@383.16]
  wire [7:0] _GEN_176; // @[Conditional.scala 39:67:@383.16]
  wire [7:0] _GEN_177; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_178; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_181; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_182; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_185; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_188; // @[Conditional.scala 39:67:@383.16]
  wire [3:0] _GEN_189; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_192; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_195; // @[Conditional.scala 39:67:@383.16]
  wire [3:0] _GEN_198; // @[Conditional.scala 39:67:@383.16]
  wire [15:0] _GEN_199; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_202; // @[Conditional.scala 39:67:@383.16]
  wire  _GEN_205; // @[Conditional.scala 39:67:@383.16]
  wire [15:0] _GEN_210; // @[Conditional.scala 39:67:@365.14]
  wire [7:0] _GEN_212; // @[Conditional.scala 39:67:@365.14]
  wire [7:0] _GEN_213; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_216; // @[Conditional.scala 39:67:@365.14]
  wire [7:0] _GEN_219; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_220; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_223; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_224; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_227; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_230; // @[Conditional.scala 39:67:@365.14]
  wire [3:0] _GEN_231; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_234; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_237; // @[Conditional.scala 39:67:@365.14]
  wire [3:0] _GEN_240; // @[Conditional.scala 39:67:@365.14]
  wire [15:0] _GEN_241; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_244; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_247; // @[Conditional.scala 39:67:@365.14]
  wire  _GEN_248; // @[Conditional.scala 39:67:@338.12]
  wire [3:0] _GEN_249; // @[Conditional.scala 39:67:@338.12]
  wire [15:0] _GEN_250; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_253; // @[Conditional.scala 39:67:@338.12]
  wire [7:0] _GEN_254; // @[Conditional.scala 39:67:@338.12]
  wire [15:0] _GEN_255; // @[Conditional.scala 39:67:@338.12]
  wire [7:0] _GEN_257; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_260; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_265; // @[Conditional.scala 39:67:@338.12]
  wire [7:0] _GEN_268; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_269; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_272; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_273; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_276; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_279; // @[Conditional.scala 39:67:@338.12]
  wire [3:0] _GEN_280; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_283; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_286; // @[Conditional.scala 39:67:@338.12]
  wire [3:0] _GEN_289; // @[Conditional.scala 39:67:@338.12]
  wire [15:0] _GEN_290; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_293; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_296; // @[Conditional.scala 39:67:@338.12]
  wire  _GEN_297; // @[Conditional.scala 39:67:@313.10]
  wire [3:0] _GEN_298; // @[Conditional.scala 39:67:@313.10]
  wire [15:0] _GEN_299; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_302; // @[Conditional.scala 39:67:@313.10]
  wire [7:0] _GEN_303; // @[Conditional.scala 39:67:@313.10]
  wire [15:0] _GEN_304; // @[Conditional.scala 39:67:@313.10]
  wire [7:0] _GEN_306; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_309; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_313; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_318; // @[Conditional.scala 39:67:@313.10]
  wire [7:0] _GEN_321; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_322; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_325; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_326; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_329; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_332; // @[Conditional.scala 39:67:@313.10]
  wire [3:0] _GEN_333; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_336; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_339; // @[Conditional.scala 39:67:@313.10]
  wire [3:0] _GEN_342; // @[Conditional.scala 39:67:@313.10]
  wire [15:0] _GEN_343; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_346; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_349; // @[Conditional.scala 39:67:@313.10]
  wire  _GEN_350; // @[Conditional.scala 40:58:@307.8]
  wire [3:0] _GEN_351; // @[Conditional.scala 40:58:@307.8]
  wire [15:0] _GEN_352; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_355; // @[Conditional.scala 40:58:@307.8]
  wire [7:0] _GEN_356; // @[Conditional.scala 40:58:@307.8]
  wire [15:0] _GEN_357; // @[Conditional.scala 40:58:@307.8]
  wire [7:0] _GEN_359; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_362; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_366; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_371; // @[Conditional.scala 40:58:@307.8]
  wire [7:0] _GEN_374; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_375; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_378; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_379; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_382; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_385; // @[Conditional.scala 40:58:@307.8]
  wire [3:0] _GEN_386; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_389; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_392; // @[Conditional.scala 40:58:@307.8]
  wire [3:0] _GEN_395; // @[Conditional.scala 40:58:@307.8]
  wire [15:0] _GEN_396; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_399; // @[Conditional.scala 40:58:@307.8]
  wire  _GEN_402; // @[Conditional.scala 40:58:@307.8]
  wire [15:0] _GEN_403; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [7:0] _GEN_407; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_408; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [3:0] _GEN_409; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [3:0] _GEN_410; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_411; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_414; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [15:0] _GEN_415; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [7:0] _GEN_417; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_420; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_424; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_429; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [7:0] _GEN_432; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_433; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_436; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_437; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_440; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_445; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_448; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [3:0] _GEN_451; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [15:0] _GEN_452; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_455; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire  _GEN_458; // @[BrainfuckProcessor.scala 98:22:@258.6]
  wire [15:0] _GEN_459; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_462; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [7:0] _GEN_463; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_464; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [3:0] _GEN_465; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [3:0] _GEN_466; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_467; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_470; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [15:0] _GEN_471; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [7:0] _GEN_473; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_476; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_480; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_485; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [7:0] _GEN_488; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_489; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_492; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_493; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_496; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_501; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_504; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [3:0] _GEN_507; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire [15:0] _GEN_508; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_511; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_514; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _GEN_517; // @[BrainfuckProcessor.scala 97:17:@257.4]
  wire  _T_288; // @[BrainfuckProcessor.scala 245:11:@528.6]
  wire  _T_289; // @[BrainfuckProcessor.scala 245:17:@529.6]
  wire  _T_291; // @[BrainfuckProcessor.scala 245:28:@530.6]
  wire  _T_292; // @[BrainfuckProcessor.scala 245:25:@531.6]
  wire [3:0] _GEN_518; // @[BrainfuckProcessor.scala 245:41:@532.6]
  wire  _GEN_519; // @[BrainfuckProcessor.scala 245:41:@532.6]
  wire [3:0] _GEN_520; // @[BrainfuckProcessor.scala 244:16:@527.4]
  wire  _GEN_521; // @[BrainfuckProcessor.scala 244:16:@527.4]
  wire  _T_299; // @[BrainfuckProcessor.scala 251:20:@539.4]
  wire [16:0] _T_306; // @[BrainfuckProcessor.scala 261:34:@550.8]
  wire [15:0] _T_307; // @[BrainfuckProcessor.scala 261:34:@551.8]
  wire [15:0] _GEN_526; // @[BrainfuckProcessor.scala 258:27:@546.6]
  wire [15:0] _GEN_527; // @[BrainfuckProcessor.scala 251:32:@540.4]
  wire  _GEN_528; // @[BrainfuckProcessor.scala 251:32:@540.4]
  wire  _GEN_529; // @[BrainfuckProcessor.scala 251:32:@540.4]
  wire  _GEN_532; // @[BrainfuckProcessor.scala 251:32:@540.4]
  assign instMem__T_75_addr = _T_74;
  assign instMem__T_75_data = instMem[instMem__T_75_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_121_addr = _T_120;
  assign instMem__T_121_data = instMem[instMem__T_121_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_141_addr = _T_140;
  assign instMem__T_141_data = instMem[instMem__T_141_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_163_addr = _T_162;
  assign instMem__T_163_data = instMem[instMem__T_163_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_180_addr = _T_179;
  assign instMem__T_180_data = instMem[instMem__T_180_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_197_addr = _T_196;
  assign instMem__T_197_data = instMem[instMem__T_197_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_211_addr = _T_210;
  assign instMem__T_211_data = instMem[instMem__T_211_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_224_addr = _T_223;
  assign instMem__T_224_data = instMem[instMem__T_224_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_232_addr = _T_231;
  assign instMem__T_232_data = instMem[instMem__T_232_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_272_addr = _T_271;
  assign instMem__T_272_data = instMem[instMem__T_272_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_277_addr = 16'h0;
  assign instMem__T_277_data = instMem[instMem__T_277_addr]; // @[BrainfuckProcessor.scala 61:20:@229.4]
  assign instMem__T_304_data = io_programData;
  assign instMem__T_304_addr = programAddr;
  assign instMem__T_304_mask = _GEN_532;
  assign instMem__T_304_en = _GEN_532;
  assign stackMem__T_128_addr = _T_127;
  assign stackMem__T_128_data = stackMem[stackMem__T_128_addr]; // @[BrainfuckProcessor.scala 65:21:@231.4]
  assign stackMem__T_150_addr = _T_149;
  assign stackMem__T_150_data = stackMem[stackMem__T_150_addr]; // @[BrainfuckProcessor.scala 65:21:@231.4]
  assign stackMem__T_280_addr = 16'h0;
  assign stackMem__T_280_data = stackMem[stackMem__T_280_addr]; // @[BrainfuckProcessor.scala 65:21:@231.4]
  assign stackMem__T_156_data = _T_155;
  assign stackMem__T_156_addr = stackPtr;
  assign stackMem__T_156_mask = _GEN_480;
  assign stackMem__T_156_en = _GEN_480;
  assign stackMem__T_173_data = _T_172;
  assign stackMem__T_173_addr = stackPtr;
  assign stackMem__T_173_mask = _GEN_485;
  assign stackMem__T_173_en = _GEN_485;
  assign stackMem__T_204_data = io_stdinData;
  assign stackMem__T_204_addr = stackPtr;
  assign stackMem__T_204_mask = _GEN_496;
  assign stackMem__T_204_en = _GEN_496;
  assign branchStackMem__T_249_addr = _T_248;
  assign branchStackMem__T_249_data = branchStackMem[branchStackMem__T_249_addr]; // @[BrainfuckProcessor.scala 72:27:@236.4]
  assign branchStackMem__T_225_data = pc;
  assign branchStackMem__T_225_addr = branchStackPtr;
  assign branchStackMem__T_225_mask = _GEN_504;
  assign branchStackMem__T_225_en = _GEN_504;
  assign _GEN_0 = stdinAck ? 1'h0 : stdinAck; // @[BrainfuckProcessor.scala 79:18:@241.4]
  assign _GEN_1 = io_stdoutAck ? 8'h0 : stdoutData; // @[BrainfuckProcessor.scala 84:24:@245.6]
  assign _GEN_2 = io_stdoutAck ? 1'h0 : stdoutValid; // @[BrainfuckProcessor.scala 84:24:@245.6]
  assign _GEN_3 = stdoutValid ? _GEN_1 : stdoutData; // @[BrainfuckProcessor.scala 83:21:@244.4]
  assign _GEN_4 = stdoutValid ? _GEN_2 : stdoutValid; // @[BrainfuckProcessor.scala 83:21:@244.4]
  assign _T_68 = halted == 1'h0; // @[BrainfuckProcessor.scala 97:8:@256.4]
  assign _T_70 = pc + 16'h1; // @[BrainfuckProcessor.scala 100:17:@259.8]
  assign _T_71 = _T_70[15:0]; // @[BrainfuckProcessor.scala 100:17:@260.8]
  assign _T_74 = _T_70[15:0]; // @[BrainfuckProcessor.scala 101:31:@263.8]
  assign _T_78 = 8'h0 == inst; // @[Conditional.scala 37:30:@266.8]
  assign _T_79 = 8'h23 == inst; // @[Conditional.scala 37:30:@267.8]
  assign _T_80 = _T_78 | _T_79; // @[Conditional.scala 37:55:@268.8]
  assign _T_84 = 8'h5b == inst; // @[Conditional.scala 37:30:@274.10]
  assign _T_86 = branchJumpNest == 4'hf; // @[BrainfuckProcessor.scala 108:31:@276.12]
  assign _T_90 = branchJumpNest + 4'h1; // @[BrainfuckProcessor.scala 112:47:@282.14]
  assign _T_91 = _T_90[3:0]; // @[BrainfuckProcessor.scala 112:47:@283.14]
  assign _GEN_5 = _T_86 ? 1'h1 : halted; // @[BrainfuckProcessor.scala 108:63:@277.12]
  assign _GEN_6 = _T_86 ? 4'h2 : errorCode; // @[BrainfuckProcessor.scala 108:63:@277.12]
  assign _GEN_7 = _T_86 ? branchJumpNest : _T_91; // @[BrainfuckProcessor.scala 108:63:@277.12]
  assign _T_93 = 8'h5d == inst; // @[Conditional.scala 37:30:@288.12]
  assign _T_95 = branchJumpNest > 4'h0; // @[BrainfuckProcessor.scala 116:31:@290.14]
  assign _T_97 = branchJumpNest - 4'h1; // @[BrainfuckProcessor.scala 117:47:@292.16]
  assign _T_98 = $unsigned(_T_97); // @[BrainfuckProcessor.scala 117:47:@293.16]
  assign _T_99 = _T_98[3:0]; // @[BrainfuckProcessor.scala 117:47:@294.16]
  assign _GEN_8 = _T_95 ? _T_99 : 4'h0; // @[BrainfuckProcessor.scala 116:38:@291.14]
  assign _GEN_9 = _T_95 ? branchJump : 1'h0; // @[BrainfuckProcessor.scala 116:38:@291.14]
  assign _GEN_10 = _T_93 ? _GEN_8 : branchJumpNest; // @[Conditional.scala 39:67:@289.12]
  assign _GEN_11 = _T_93 ? _GEN_9 : branchJump; // @[Conditional.scala 39:67:@289.12]
  assign _GEN_12 = _T_84 ? _GEN_5 : halted; // @[Conditional.scala 39:67:@275.10]
  assign _GEN_13 = _T_84 ? _GEN_6 : errorCode; // @[Conditional.scala 39:67:@275.10]
  assign _GEN_14 = _T_84 ? _GEN_7 : _GEN_10; // @[Conditional.scala 39:67:@275.10]
  assign _GEN_15 = _T_84 ? branchJump : _GEN_11; // @[Conditional.scala 39:67:@275.10]
  assign _GEN_16 = _T_80 ? 1'h1 : _GEN_12; // @[Conditional.scala 40:58:@269.8]
  assign _GEN_17 = _T_80 ? 4'h1 : _GEN_13; // @[Conditional.scala 40:58:@269.8]
  assign _GEN_18 = _T_80 ? branchJumpNest : _GEN_14; // @[Conditional.scala 40:58:@269.8]
  assign _GEN_19 = _T_80 ? branchJump : _GEN_15; // @[Conditional.scala 40:58:@269.8]
  assign _T_110 = 8'h3e == inst; // @[Conditional.scala 37:30:@312.10]
  assign _T_112 = stackPtr == 16'hffff; // @[BrainfuckProcessor.scala 133:26:@314.12]
  assign _T_120 = _T_70[15:0]; // @[BrainfuckProcessor.scala 138:37:@324.14]
  assign _T_123 = stackPtr + 16'h1; // @[BrainfuckProcessor.scala 139:35:@327.14]
  assign _T_124 = _T_123[15:0]; // @[BrainfuckProcessor.scala 139:35:@328.14]
  assign _T_127 = _T_123[15:0]; // @[BrainfuckProcessor.scala 140:49:@331.14]
  assign _GEN_20 = _T_112 ? 1'h1 : halted; // @[BrainfuckProcessor.scala 133:52:@315.12]
  assign _GEN_21 = _T_112 ? 4'h3 : errorCode; // @[BrainfuckProcessor.scala 133:52:@315.12]
  assign _GEN_22 = _T_112 ? pc : _T_71; // @[BrainfuckProcessor.scala 133:52:@315.12]
  assign _GEN_25 = _T_112 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 133:52:@315.12]
  assign _GEN_26 = _T_112 ? inst : instMem__T_121_data; // @[BrainfuckProcessor.scala 133:52:@315.12]
  assign _GEN_27 = _T_112 ? stackPtr : _T_124; // @[BrainfuckProcessor.scala 133:52:@315.12]
  assign _GEN_29 = _T_112 ? stackData : stackMem__T_128_data; // @[BrainfuckProcessor.scala 133:52:@315.12]
  assign _T_130 = 8'h3c == inst; // @[Conditional.scala 37:30:@337.12]
  assign _T_132 = stackPtr == 16'h0; // @[BrainfuckProcessor.scala 144:26:@339.14]
  assign _T_140 = _T_70[15:0]; // @[BrainfuckProcessor.scala 149:37:@349.16]
  assign _T_143 = stackPtr - 16'h1; // @[BrainfuckProcessor.scala 150:35:@352.16]
  assign _T_144 = $unsigned(_T_143); // @[BrainfuckProcessor.scala 150:35:@353.16]
  assign _T_145 = _T_144[15:0]; // @[BrainfuckProcessor.scala 150:35:@354.16]
  assign _T_149 = _T_144[15:0]; // @[BrainfuckProcessor.scala 151:49:@358.16]
  assign _GEN_30 = _T_132 ? 1'h1 : halted; // @[BrainfuckProcessor.scala 144:35:@340.14]
  assign _GEN_31 = _T_132 ? 4'h4 : errorCode; // @[BrainfuckProcessor.scala 144:35:@340.14]
  assign _GEN_32 = _T_132 ? pc : _T_71; // @[BrainfuckProcessor.scala 144:35:@340.14]
  assign _GEN_35 = _T_132 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 144:35:@340.14]
  assign _GEN_36 = _T_132 ? inst : instMem__T_141_data; // @[BrainfuckProcessor.scala 144:35:@340.14]
  assign _GEN_37 = _T_132 ? stackPtr : _T_145; // @[BrainfuckProcessor.scala 144:35:@340.14]
  assign _GEN_39 = _T_132 ? stackData : stackMem__T_150_data; // @[BrainfuckProcessor.scala 144:35:@340.14]
  assign _T_152 = 8'h2b == inst; // @[Conditional.scala 37:30:@364.14]
  assign _T_154 = stackData + 8'h1; // @[BrainfuckProcessor.scala 155:46:@366.16]
  assign _T_155 = _T_154[7:0]; // @[BrainfuckProcessor.scala 155:46:@367.16]
  assign _T_162 = _T_70[15:0]; // @[BrainfuckProcessor.scala 158:35:@374.16]
  assign _T_168 = 8'h2d == inst; // @[Conditional.scala 37:30:@382.16]
  assign _T_170 = stackData - 8'h1; // @[BrainfuckProcessor.scala 162:46:@384.18]
  assign _T_171 = $unsigned(_T_170); // @[BrainfuckProcessor.scala 162:46:@385.18]
  assign _T_172 = _T_171[7:0]; // @[BrainfuckProcessor.scala 162:46:@386.18]
  assign _T_179 = _T_70[15:0]; // @[BrainfuckProcessor.scala 165:35:@393.18]
  assign _T_186 = 8'h2e == inst; // @[Conditional.scala 37:30:@402.18]
  assign _T_188 = stdoutValid == 1'h0; // @[BrainfuckProcessor.scala 170:34:@404.20]
  assign _T_189 = io_stdoutReady & _T_188; // @[BrainfuckProcessor.scala 170:31:@405.20]
  assign _T_196 = _T_70[15:0]; // @[BrainfuckProcessor.scala 177:37:@413.22]
  assign _GEN_40 = _T_189 ? stackData : _GEN_3; // @[BrainfuckProcessor.scala 170:48:@406.20]
  assign _GEN_41 = _T_189 ? 1'h1 : _GEN_4; // @[BrainfuckProcessor.scala 170:48:@406.20]
  assign _GEN_42 = _T_189 ? _T_71 : pc; // @[BrainfuckProcessor.scala 170:48:@406.20]
  assign _GEN_46 = _T_189 ? instMem__T_197_data : inst; // @[BrainfuckProcessor.scala 170:48:@406.20]
  assign _T_199 = 8'h2c == inst; // @[Conditional.scala 37:30:@419.20]
  assign _T_201 = stdinAck == 1'h0; // @[BrainfuckProcessor.scala 182:33:@421.22]
  assign _T_202 = io_stdinValid & _T_201; // @[BrainfuckProcessor.scala 182:30:@422.22]
  assign _T_210 = _T_70[15:0]; // @[BrainfuckProcessor.scala 187:37:@431.24]
  assign _GEN_47 = _T_202 ? 1'h1 : _GEN_0; // @[BrainfuckProcessor.scala 182:44:@423.22]
  assign _GEN_52 = _T_202 ? _T_71 : pc; // @[BrainfuckProcessor.scala 182:44:@423.22]
  assign _GEN_54 = _T_202 ? instMem__T_211_data : inst; // @[BrainfuckProcessor.scala 182:44:@423.22]
  assign _GEN_55 = _T_202 ? io_stdinData : stackData; // @[BrainfuckProcessor.scala 182:44:@423.22]
  assign _T_215 = stackData == 8'h0; // @[BrainfuckProcessor.scala 192:26:@440.24]
  assign _T_223 = _T_70[15:0]; // @[BrainfuckProcessor.scala 197:37:@448.26]
  assign _T_231 = _T_70[15:0]; // @[BrainfuckProcessor.scala 202:37:@459.26]
  assign _T_234 = branchStackPtr + 4'h1; // @[BrainfuckProcessor.scala 203:47:@462.26]
  assign _T_235 = _T_234[3:0]; // @[BrainfuckProcessor.scala 203:47:@463.26]
  assign _GEN_56 = _T_215 ? 1'h1 : branchJump; // @[BrainfuckProcessor.scala 192:35:@441.24]
  assign _GEN_57 = _T_215 ? 4'h0 : branchJumpNest; // @[BrainfuckProcessor.scala 192:35:@441.24]
  assign _GEN_58 = _T_215 ? _T_71 : _T_71; // @[BrainfuckProcessor.scala 192:35:@441.24]
  assign _GEN_62 = _T_215 ? instMem__T_224_data : instMem__T_232_data; // @[BrainfuckProcessor.scala 192:35:@441.24]
  assign _GEN_65 = _T_215 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 192:35:@441.24]
  assign _GEN_68 = _T_215 ? branchStackPtr : _T_235; // @[BrainfuckProcessor.scala 192:35:@441.24]
  assign _GEN_69 = _T_215 ? branchStackData : pc; // @[BrainfuckProcessor.scala 192:35:@441.24]
  assign _T_240 = branchStackPtr > 4'h1; // @[BrainfuckProcessor.scala 212:31:@473.26]
  assign _T_242 = branchStackPtr - 4'h1; // @[BrainfuckProcessor.scala 213:47:@475.28]
  assign _T_243 = $unsigned(_T_242); // @[BrainfuckProcessor.scala 213:47:@476.28]
  assign _T_244 = _T_243[3:0]; // @[BrainfuckProcessor.scala 213:47:@477.28]
  assign _T_246 = branchStackPtr - 4'h2; // @[BrainfuckProcessor.scala 214:67:@479.28]
  assign _T_247 = $unsigned(_T_246); // @[BrainfuckProcessor.scala 214:67:@480.28]
  assign _T_248 = _T_247[3:0]; // @[BrainfuckProcessor.scala 214:67:@481.28]
  assign _GEN_70 = _T_240 ? _T_244 : 4'h0; // @[BrainfuckProcessor.scala 212:38:@474.26]
  assign _GEN_74 = _T_240 ? branchStackMem__T_249_data : 16'h0; // @[BrainfuckProcessor.scala 212:38:@474.26]
  assign _T_257 = 8'hd == inst; // @[Conditional.scala 37:30:@491.26]
  assign _T_258 = 8'ha == inst; // @[Conditional.scala 37:30:@492.26]
  assign _T_259 = 8'h20 == inst; // @[Conditional.scala 37:30:@493.26]
  assign _T_260 = 8'h58 == inst; // @[Conditional.scala 37:30:@494.26]
  assign _T_261 = 8'h78 == inst; // @[Conditional.scala 37:30:@495.26]
  assign _T_262 = _T_257 | _T_258; // @[Conditional.scala 37:55:@496.26]
  assign _T_263 = _T_262 | _T_259; // @[Conditional.scala 37:55:@497.26]
  assign _T_264 = _T_263 | _T_260; // @[Conditional.scala 37:55:@498.26]
  assign _T_265 = _T_264 | _T_261; // @[Conditional.scala 37:55:@499.26]
  assign _T_271 = _T_70[15:0]; // @[BrainfuckProcessor.scala 224:35:@505.28]
  assign _GEN_75 = _T_265 ? _T_71 : pc; // @[Conditional.scala 39:67:@500.26]
  assign _GEN_79 = _T_265 ? instMem__T_272_data : inst; // @[Conditional.scala 39:67:@500.26]
  assign _GEN_80 = _T_93 ? branchStackData : _GEN_75; // @[Conditional.scala 39:67:@470.24]
  assign _GEN_81 = _T_93 ? 8'h5b : _GEN_79; // @[Conditional.scala 39:67:@470.24]
  assign _GEN_82 = _T_93 ? _GEN_70 : branchStackPtr; // @[Conditional.scala 39:67:@470.24]
  assign _GEN_85 = _T_93 ? _T_240 : 1'h0; // @[Conditional.scala 39:67:@470.24]
  assign _GEN_86 = _T_93 ? _GEN_74 : branchStackData; // @[Conditional.scala 39:67:@470.24]
  assign _GEN_89 = _T_93 ? 1'h0 : _T_265; // @[Conditional.scala 39:67:@470.24]
  assign _GEN_90 = _T_84 ? _GEN_56 : branchJump; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_91 = _T_84 ? _GEN_57 : branchJumpNest; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_92 = _T_84 ? _GEN_58 : _GEN_80; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_95 = _T_84 ? _T_215 : 1'h0; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_96 = _T_84 ? _GEN_62 : _GEN_81; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_99 = _T_84 ? _GEN_65 : 1'h0; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_102 = _T_84 ? _GEN_68 : _GEN_82; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_103 = _T_84 ? _GEN_69 : _GEN_86; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_106 = _T_84 ? 1'h0 : _GEN_85; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_109 = _T_84 ? 1'h0 : _GEN_89; // @[Conditional.scala 39:67:@439.22]
  assign _GEN_110 = _T_199 ? _GEN_47 : _GEN_0; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_113 = _T_199 ? _T_202 : 1'h0; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_115 = _T_199 ? _GEN_52 : _GEN_92; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_117 = _T_199 ? _GEN_54 : _GEN_96; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_118 = _T_199 ? _GEN_55 : stackData; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_119 = _T_199 ? branchJump : _GEN_90; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_120 = _T_199 ? branchJumpNest : _GEN_91; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_123 = _T_199 ? 1'h0 : _GEN_95; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_126 = _T_199 ? 1'h0 : _GEN_99; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_129 = _T_199 ? branchStackPtr : _GEN_102; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_130 = _T_199 ? branchStackData : _GEN_103; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_133 = _T_199 ? 1'h0 : _GEN_106; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_136 = _T_199 ? 1'h0 : _GEN_109; // @[Conditional.scala 39:67:@420.20]
  assign _GEN_137 = _T_186 ? _GEN_40 : _GEN_3; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_138 = _T_186 ? _GEN_41 : _GEN_4; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_139 = _T_186 ? _GEN_42 : _GEN_115; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_142 = _T_186 ? _T_189 : 1'h0; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_143 = _T_186 ? _GEN_46 : _GEN_117; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_144 = _T_186 ? _GEN_0 : _GEN_110; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_147 = _T_186 ? 1'h0 : _GEN_113; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_150 = _T_186 ? stackData : _GEN_118; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_151 = _T_186 ? branchJump : _GEN_119; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_152 = _T_186 ? branchJumpNest : _GEN_120; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_155 = _T_186 ? 1'h0 : _GEN_123; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_158 = _T_186 ? 1'h0 : _GEN_126; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_161 = _T_186 ? branchStackPtr : _GEN_129; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_162 = _T_186 ? branchStackData : _GEN_130; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_165 = _T_186 ? 1'h0 : _GEN_133; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_168 = _T_186 ? 1'h0 : _GEN_136; // @[Conditional.scala 39:67:@403.18]
  assign _GEN_173 = _T_168 ? _T_71 : _GEN_139; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_175 = _T_168 ? instMem__T_180_data : _GEN_143; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_176 = _T_168 ? _T_172 : _GEN_150; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_177 = _T_168 ? _GEN_3 : _GEN_137; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_178 = _T_168 ? _GEN_4 : _GEN_138; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_181 = _T_168 ? 1'h0 : _GEN_142; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_182 = _T_168 ? _GEN_0 : _GEN_144; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_185 = _T_168 ? 1'h0 : _GEN_147; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_188 = _T_168 ? branchJump : _GEN_151; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_189 = _T_168 ? branchJumpNest : _GEN_152; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_192 = _T_168 ? 1'h0 : _GEN_155; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_195 = _T_168 ? 1'h0 : _GEN_158; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_198 = _T_168 ? branchStackPtr : _GEN_161; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_199 = _T_168 ? branchStackData : _GEN_162; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_202 = _T_168 ? 1'h0 : _GEN_165; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_205 = _T_168 ? 1'h0 : _GEN_168; // @[Conditional.scala 39:67:@383.16]
  assign _GEN_210 = _T_152 ? _T_71 : _GEN_173; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_212 = _T_152 ? instMem__T_163_data : _GEN_175; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_213 = _T_152 ? _T_155 : _GEN_176; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_216 = _T_152 ? 1'h0 : _T_168; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_219 = _T_152 ? _GEN_3 : _GEN_177; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_220 = _T_152 ? _GEN_4 : _GEN_178; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_223 = _T_152 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_224 = _T_152 ? _GEN_0 : _GEN_182; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_227 = _T_152 ? 1'h0 : _GEN_185; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_230 = _T_152 ? branchJump : _GEN_188; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_231 = _T_152 ? branchJumpNest : _GEN_189; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_234 = _T_152 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_237 = _T_152 ? 1'h0 : _GEN_195; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_240 = _T_152 ? branchStackPtr : _GEN_198; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_241 = _T_152 ? branchStackData : _GEN_199; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_244 = _T_152 ? 1'h0 : _GEN_202; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_247 = _T_152 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67:@365.14]
  assign _GEN_248 = _T_130 ? _GEN_30 : halted; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_249 = _T_130 ? _GEN_31 : errorCode; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_250 = _T_130 ? _GEN_32 : _GEN_210; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_253 = _T_130 ? _GEN_35 : 1'h0; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_254 = _T_130 ? _GEN_36 : _GEN_212; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_255 = _T_130 ? _GEN_37 : stackPtr; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_257 = _T_130 ? _GEN_39 : _GEN_213; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_260 = _T_130 ? 1'h0 : _T_152; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_265 = _T_130 ? 1'h0 : _GEN_216; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_268 = _T_130 ? _GEN_3 : _GEN_219; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_269 = _T_130 ? _GEN_4 : _GEN_220; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_272 = _T_130 ? 1'h0 : _GEN_223; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_273 = _T_130 ? _GEN_0 : _GEN_224; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_276 = _T_130 ? 1'h0 : _GEN_227; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_279 = _T_130 ? branchJump : _GEN_230; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_280 = _T_130 ? branchJumpNest : _GEN_231; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_283 = _T_130 ? 1'h0 : _GEN_234; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_286 = _T_130 ? 1'h0 : _GEN_237; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_289 = _T_130 ? branchStackPtr : _GEN_240; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_290 = _T_130 ? branchStackData : _GEN_241; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_293 = _T_130 ? 1'h0 : _GEN_244; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_296 = _T_130 ? 1'h0 : _GEN_247; // @[Conditional.scala 39:67:@338.12]
  assign _GEN_297 = _T_110 ? _GEN_20 : _GEN_248; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_298 = _T_110 ? _GEN_21 : _GEN_249; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_299 = _T_110 ? _GEN_22 : _GEN_250; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_302 = _T_110 ? _GEN_25 : 1'h0; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_303 = _T_110 ? _GEN_26 : _GEN_254; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_304 = _T_110 ? _GEN_27 : _GEN_255; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_306 = _T_110 ? _GEN_29 : _GEN_257; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_309 = _T_110 ? 1'h0 : _GEN_253; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_313 = _T_110 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_318 = _T_110 ? 1'h0 : _GEN_265; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_321 = _T_110 ? _GEN_3 : _GEN_268; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_322 = _T_110 ? _GEN_4 : _GEN_269; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_325 = _T_110 ? 1'h0 : _GEN_272; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_326 = _T_110 ? _GEN_0 : _GEN_273; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_329 = _T_110 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_332 = _T_110 ? branchJump : _GEN_279; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_333 = _T_110 ? branchJumpNest : _GEN_280; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_336 = _T_110 ? 1'h0 : _GEN_283; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_339 = _T_110 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_342 = _T_110 ? branchStackPtr : _GEN_289; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_343 = _T_110 ? branchStackData : _GEN_290; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_346 = _T_110 ? 1'h0 : _GEN_293; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_349 = _T_110 ? 1'h0 : _GEN_296; // @[Conditional.scala 39:67:@313.10]
  assign _GEN_350 = _T_80 ? 1'h1 : _GEN_297; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_351 = _T_80 ? 4'h0 : _GEN_298; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_352 = _T_80 ? pc : _GEN_299; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_355 = _T_80 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_356 = _T_80 ? inst : _GEN_303; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_357 = _T_80 ? stackPtr : _GEN_304; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_359 = _T_80 ? stackData : _GEN_306; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_362 = _T_80 ? 1'h0 : _GEN_309; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_366 = _T_80 ? 1'h0 : _GEN_313; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_371 = _T_80 ? 1'h0 : _GEN_318; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_374 = _T_80 ? _GEN_3 : _GEN_321; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_375 = _T_80 ? _GEN_4 : _GEN_322; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_378 = _T_80 ? 1'h0 : _GEN_325; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_379 = _T_80 ? _GEN_0 : _GEN_326; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_382 = _T_80 ? 1'h0 : _GEN_329; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_385 = _T_80 ? branchJump : _GEN_332; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_386 = _T_80 ? branchJumpNest : _GEN_333; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_389 = _T_80 ? 1'h0 : _GEN_336; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_392 = _T_80 ? 1'h0 : _GEN_339; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_395 = _T_80 ? branchStackPtr : _GEN_342; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_396 = _T_80 ? branchStackData : _GEN_343; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_399 = _T_80 ? 1'h0 : _GEN_346; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_402 = _T_80 ? 1'h0 : _GEN_349; // @[Conditional.scala 40:58:@307.8]
  assign _GEN_403 = branchJump ? _T_71 : _GEN_352; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_407 = branchJump ? instMem__T_75_data : _GEN_356; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_408 = branchJump ? _GEN_16 : _GEN_350; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_409 = branchJump ? _GEN_17 : _GEN_351; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_410 = branchJump ? _GEN_18 : _GEN_386; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_411 = branchJump ? _GEN_19 : _GEN_385; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_414 = branchJump ? 1'h0 : _GEN_355; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_415 = branchJump ? stackPtr : _GEN_357; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_417 = branchJump ? stackData : _GEN_359; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_420 = branchJump ? 1'h0 : _GEN_362; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_424 = branchJump ? 1'h0 : _GEN_366; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_429 = branchJump ? 1'h0 : _GEN_371; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_432 = branchJump ? _GEN_3 : _GEN_374; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_433 = branchJump ? _GEN_4 : _GEN_375; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_436 = branchJump ? 1'h0 : _GEN_378; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_437 = branchJump ? _GEN_0 : _GEN_379; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_440 = branchJump ? 1'h0 : _GEN_382; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_445 = branchJump ? 1'h0 : _GEN_389; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_448 = branchJump ? 1'h0 : _GEN_392; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_451 = branchJump ? branchStackPtr : _GEN_395; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_452 = branchJump ? branchStackData : _GEN_396; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_455 = branchJump ? 1'h0 : _GEN_399; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_458 = branchJump ? 1'h0 : _GEN_402; // @[BrainfuckProcessor.scala 98:22:@258.6]
  assign _GEN_459 = _T_68 ? _GEN_403 : 16'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_462 = _T_68 ? branchJump : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_463 = _T_68 ? _GEN_407 : instMem__T_277_data; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_464 = _T_68 ? _GEN_408 : halted; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_465 = _T_68 ? _GEN_409 : errorCode; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_466 = _T_68 ? _GEN_410 : 4'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_467 = _T_68 ? _GEN_411 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_470 = _T_68 ? _GEN_414 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_471 = _T_68 ? _GEN_415 : 16'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_473 = _T_68 ? _GEN_417 : stackMem__T_280_data; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_476 = _T_68 ? _GEN_420 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_480 = _T_68 ? _GEN_424 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_485 = _T_68 ? _GEN_429 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_488 = _T_68 ? _GEN_432 : _GEN_3; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_489 = _T_68 ? _GEN_433 : _GEN_4; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_492 = _T_68 ? _GEN_436 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_493 = _T_68 ? _GEN_437 : _GEN_0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_496 = _T_68 ? _GEN_440 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_501 = _T_68 ? _GEN_445 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_504 = _T_68 ? _GEN_448 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_507 = _T_68 ? _GEN_451 : 4'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_508 = _T_68 ? _GEN_452 : 16'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_511 = _T_68 ? _GEN_455 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_514 = _T_68 ? _GEN_458 : 1'h0; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _GEN_517 = _T_68 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 97:17:@257.4]
  assign _T_288 = run2 == 1'h0; // @[BrainfuckProcessor.scala 245:11:@528.6]
  assign _T_289 = _T_288 & run; // @[BrainfuckProcessor.scala 245:17:@529.6]
  assign _T_291 = io_program == 1'h0; // @[BrainfuckProcessor.scala 245:28:@530.6]
  assign _T_292 = _T_289 & _T_291; // @[BrainfuckProcessor.scala 245:25:@531.6]
  assign _GEN_518 = _T_292 ? 4'h0 : _GEN_465; // @[BrainfuckProcessor.scala 245:41:@532.6]
  assign _GEN_519 = _T_292 ? 1'h0 : _GEN_464; // @[BrainfuckProcessor.scala 245:41:@532.6]
  assign _GEN_520 = halted ? _GEN_518 : _GEN_465; // @[BrainfuckProcessor.scala 244:16:@527.4]
  assign _GEN_521 = halted ? _GEN_519 : _GEN_464; // @[BrainfuckProcessor.scala 244:16:@527.4]
  assign _T_299 = _T_291 | _T_68; // @[BrainfuckProcessor.scala 251:20:@539.4]
  assign _T_306 = programAddr + 16'h1; // @[BrainfuckProcessor.scala 261:34:@550.8]
  assign _T_307 = _T_306[15:0]; // @[BrainfuckProcessor.scala 261:34:@551.8]
  assign _GEN_526 = io_programValid ? _T_307 : programAddr; // @[BrainfuckProcessor.scala 258:27:@546.6]
  assign _GEN_527 = _T_299 ? 16'h0 : _GEN_526; // @[BrainfuckProcessor.scala 251:32:@540.4]
  assign _GEN_528 = _T_299 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 251:32:@540.4]
  assign _GEN_529 = _T_299 ? programAck : io_programValid; // @[BrainfuckProcessor.scala 251:32:@540.4]
  assign _GEN_532 = _T_299 ? 1'h0 : io_programValid; // @[BrainfuckProcessor.scala 251:32:@540.4]
  assign io_programReady = programReady;
  assign io_programAck = programAck;
  assign io_inst = inst;
  assign io_halted = halted;
  assign io_errorCode = errorCode[2:0];
  assign io_stdinAck = stdinAck;
  assign io_stdoutData = stdoutData;
  assign io_stdoutValid = stdoutValid;
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
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    instMem[initvar] = _RAND_7[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  programAddr = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    stackMem[initvar] = _RAND_9[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  stackPtr = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  stackData = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    branchStackMem[initvar] = _RAND_12[15:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  branchStackPtr = _RAND_13[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  branchStackData = _RAND_14[15:0];
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
  pc = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  run = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  run2 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      programReady <= 1'h0;
    end else begin
      if (_T_299) begin
        programReady <= 1'h0;
      end else begin
        programReady <= 1'h1;
      end
    end
    if (reset) begin
      programAck <= 1'h0;
    end else begin
      if (!(_T_299)) begin
        programAck <= io_programValid;
      end
    end
    if (reset) begin
      halted <= 1'h1;
    end else begin
      if (halted) begin
        if (_T_292) begin
          halted <= 1'h0;
        end else begin
          if (_T_68) begin
            if (branchJump) begin
              if (_T_80) begin
                halted <= 1'h1;
              end else begin
                if (_T_84) begin
                  if (_T_86) begin
                    halted <= 1'h1;
                  end
                end
              end
            end else begin
              if (_T_80) begin
                halted <= 1'h1;
              end else begin
                if (_T_110) begin
                  if (_T_112) begin
                    halted <= 1'h1;
                  end
                end else begin
                  if (_T_130) begin
                    if (_T_132) begin
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
            if (_T_80) begin
              halted <= 1'h1;
            end else begin
              if (_T_84) begin
                if (_T_86) begin
                  halted <= 1'h1;
                end
              end
            end
          end else begin
            if (_T_80) begin
              halted <= 1'h1;
            end else begin
              if (_T_110) begin
                if (_T_112) begin
                  halted <= 1'h1;
                end
              end else begin
                if (_T_130) begin
                  if (_T_132) begin
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
        if (_T_292) begin
          errorCode <= 4'h0;
        end else begin
          if (_T_68) begin
            if (branchJump) begin
              if (_T_80) begin
                errorCode <= 4'h1;
              end else begin
                if (_T_84) begin
                  if (_T_86) begin
                    errorCode <= 4'h2;
                  end
                end
              end
            end else begin
              if (_T_80) begin
                errorCode <= 4'h0;
              end else begin
                if (_T_110) begin
                  if (_T_112) begin
                    errorCode <= 4'h3;
                  end
                end else begin
                  if (_T_130) begin
                    if (_T_132) begin
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
            if (_T_80) begin
              errorCode <= 4'h1;
            end else begin
              if (_T_84) begin
                if (_T_86) begin
                  errorCode <= 4'h2;
                end
              end
            end
          end else begin
            if (_T_80) begin
              errorCode <= 4'h0;
            end else begin
              if (_T_110) begin
                if (_T_112) begin
                  errorCode <= 4'h3;
                end
              end else begin
                if (_T_130) begin
                  if (_T_132) begin
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
          if (_T_80) begin
            if (stdinAck) begin
              stdinAck <= 1'h0;
            end
          end else begin
            if (_T_110) begin
              if (stdinAck) begin
                stdinAck <= 1'h0;
              end
            end else begin
              if (_T_130) begin
                if (stdinAck) begin
                  stdinAck <= 1'h0;
                end
              end else begin
                if (_T_152) begin
                  stdinAck <= _GEN_0;
                end else begin
                  if (_T_168) begin
                    stdinAck <= _GEN_0;
                  end else begin
                    if (_T_186) begin
                      stdinAck <= _GEN_0;
                    end else begin
                      if (_T_199) begin
                        if (_T_202) begin
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
      if (_T_68) begin
        if (branchJump) begin
          if (stdoutValid) begin
            if (io_stdoutAck) begin
              stdoutData <= 8'h0;
            end
          end
        end else begin
          if (_T_80) begin
            if (stdoutValid) begin
              if (io_stdoutAck) begin
                stdoutData <= 8'h0;
              end
            end
          end else begin
            if (_T_110) begin
              if (stdoutValid) begin
                if (io_stdoutAck) begin
                  stdoutData <= 8'h0;
                end
              end
            end else begin
              if (_T_130) begin
                if (stdoutValid) begin
                  if (io_stdoutAck) begin
                    stdoutData <= 8'h0;
                  end
                end
              end else begin
                if (_T_152) begin
                  stdoutData <= _GEN_3;
                end else begin
                  if (_T_168) begin
                    stdoutData <= _GEN_3;
                  end else begin
                    if (_T_186) begin
                      if (_T_189) begin
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
    if (reset) begin
      stdoutValid <= 1'h0;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          if (stdoutValid) begin
            if (io_stdoutAck) begin
              stdoutValid <= 1'h0;
            end
          end
        end else begin
          if (_T_80) begin
            if (stdoutValid) begin
              if (io_stdoutAck) begin
                stdoutValid <= 1'h0;
              end
            end
          end else begin
            if (_T_110) begin
              if (stdoutValid) begin
                if (io_stdoutAck) begin
                  stdoutValid <= 1'h0;
                end
              end
            end else begin
              if (_T_130) begin
                if (stdoutValid) begin
                  if (io_stdoutAck) begin
                    stdoutValid <= 1'h0;
                  end
                end
              end else begin
                if (_T_152) begin
                  stdoutValid <= _GEN_4;
                end else begin
                  if (_T_168) begin
                    stdoutValid <= _GEN_4;
                  end else begin
                    if (_T_186) begin
                      if (_T_189) begin
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
    if(instMem__T_304_en & instMem__T_304_mask) begin
      instMem[instMem__T_304_addr] <= instMem__T_304_data; // @[BrainfuckProcessor.scala 61:20:@229.4]
    end
    if (reset) begin
      programAddr <= 16'h0;
    end else begin
      if (_T_299) begin
        programAddr <= 16'h0;
      end else begin
        if (io_programValid) begin
          programAddr <= _T_307;
        end
      end
    end
    if(stackMem__T_156_en & stackMem__T_156_mask) begin
      stackMem[stackMem__T_156_addr] <= stackMem__T_156_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
    end
    if(stackMem__T_173_en & stackMem__T_173_mask) begin
      stackMem[stackMem__T_173_addr] <= stackMem__T_173_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
    end
    if(stackMem__T_204_en & stackMem__T_204_mask) begin
      stackMem[stackMem__T_204_addr] <= stackMem__T_204_data; // @[BrainfuckProcessor.scala 65:21:@231.4]
    end
    if (reset) begin
      stackPtr <= 16'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_80)) begin
            if (_T_110) begin
              if (!(_T_112)) begin
                stackPtr <= _T_124;
              end
            end else begin
              if (_T_130) begin
                if (!(_T_132)) begin
                  stackPtr <= _T_145;
                end
              end
            end
          end
        end
      end else begin
        stackPtr <= 16'h0;
      end
    end
    if (reset) begin
      stackData <= 8'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_80)) begin
            if (_T_110) begin
              if (!(_T_112)) begin
                stackData <= stackMem__T_128_data;
              end
            end else begin
              if (_T_130) begin
                if (!(_T_132)) begin
                  stackData <= stackMem__T_150_data;
                end
              end else begin
                if (_T_152) begin
                  stackData <= _T_155;
                end else begin
                  if (_T_168) begin
                    stackData <= _T_172;
                  end else begin
                    if (!(_T_186)) begin
                      if (_T_199) begin
                        if (_T_202) begin
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
        stackData <= stackMem__T_280_data;
      end
    end
    if(branchStackMem__T_225_en & branchStackMem__T_225_mask) begin
      branchStackMem[branchStackMem__T_225_addr] <= branchStackMem__T_225_data; // @[BrainfuckProcessor.scala 72:27:@236.4]
    end
    if (reset) begin
      branchStackPtr <= 4'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_80)) begin
            if (!(_T_110)) begin
              if (!(_T_130)) begin
                if (!(_T_152)) begin
                  if (!(_T_168)) begin
                    if (!(_T_186)) begin
                      if (!(_T_199)) begin
                        if (_T_84) begin
                          if (!(_T_215)) begin
                            branchStackPtr <= _T_235;
                          end
                        end else begin
                          if (_T_93) begin
                            if (_T_240) begin
                              branchStackPtr <= _T_244;
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
      branchStackData <= 16'h0;
    end else begin
      if (_T_68) begin
        if (!(branchJump)) begin
          if (!(_T_80)) begin
            if (!(_T_110)) begin
              if (!(_T_130)) begin
                if (!(_T_152)) begin
                  if (!(_T_168)) begin
                    if (!(_T_186)) begin
                      if (!(_T_199)) begin
                        if (_T_84) begin
                          if (!(_T_215)) begin
                            branchStackData <= pc;
                          end
                        end else begin
                          if (_T_93) begin
                            if (_T_240) begin
                              branchStackData <= branchStackMem__T_249_data;
                            end else begin
                              branchStackData <= 16'h0;
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
        branchStackData <= 16'h0;
      end
    end
    if (reset) begin
      branchJump <= 1'h0;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          if (!(_T_80)) begin
            if (!(_T_84)) begin
              if (_T_93) begin
                if (!(_T_95)) begin
                  branchJump <= 1'h0;
                end
              end
            end
          end
        end else begin
          if (!(_T_80)) begin
            if (!(_T_110)) begin
              if (!(_T_130)) begin
                if (!(_T_152)) begin
                  if (!(_T_168)) begin
                    if (!(_T_186)) begin
                      if (!(_T_199)) begin
                        if (_T_84) begin
                          if (_T_215) begin
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
          if (!(_T_80)) begin
            if (_T_84) begin
              if (!(_T_86)) begin
                branchJumpNest <= _T_91;
              end
            end else begin
              if (_T_93) begin
                if (_T_95) begin
                  branchJumpNest <= _T_99;
                end else begin
                  branchJumpNest <= 4'h0;
                end
              end
            end
          end
        end else begin
          if (!(_T_80)) begin
            if (!(_T_110)) begin
              if (!(_T_130)) begin
                if (!(_T_152)) begin
                  if (!(_T_168)) begin
                    if (!(_T_186)) begin
                      if (!(_T_199)) begin
                        if (_T_84) begin
                          if (_T_215) begin
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
          inst <= instMem__T_75_data;
        end else begin
          if (!(_T_80)) begin
            if (_T_110) begin
              if (!(_T_112)) begin
                inst <= instMem__T_121_data;
              end
            end else begin
              if (_T_130) begin
                if (!(_T_132)) begin
                  inst <= instMem__T_141_data;
                end
              end else begin
                if (_T_152) begin
                  inst <= instMem__T_163_data;
                end else begin
                  if (_T_168) begin
                    inst <= instMem__T_180_data;
                  end else begin
                    if (_T_186) begin
                      if (_T_189) begin
                        inst <= instMem__T_197_data;
                      end
                    end else begin
                      if (_T_199) begin
                        if (_T_202) begin
                          inst <= instMem__T_211_data;
                        end
                      end else begin
                        if (_T_84) begin
                          if (_T_215) begin
                            inst <= instMem__T_224_data;
                          end else begin
                            inst <= instMem__T_232_data;
                          end
                        end else begin
                          if (_T_93) begin
                            inst <= 8'h5b;
                          end else begin
                            if (_T_265) begin
                              inst <= instMem__T_272_data;
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
        inst <= instMem__T_277_data;
      end
    end
    if (reset) begin
      pc <= 16'h0;
    end else begin
      if (_T_68) begin
        if (branchJump) begin
          pc <= _T_71;
        end else begin
          if (!(_T_80)) begin
            if (_T_110) begin
              if (!(_T_112)) begin
                pc <= _T_71;
              end
            end else begin
              if (_T_130) begin
                if (!(_T_132)) begin
                  pc <= _T_71;
                end
              end else begin
                if (_T_152) begin
                  pc <= _T_71;
                end else begin
                  if (_T_168) begin
                    pc <= _T_71;
                  end else begin
                    if (_T_186) begin
                      if (_T_189) begin
                        pc <= _T_71;
                      end
                    end else begin
                      if (_T_199) begin
                        if (_T_202) begin
                          pc <= _T_71;
                        end
                      end else begin
                        if (_T_84) begin
                          if (_T_215) begin
                            pc <= _T_71;
                          end else begin
                            pc <= _T_71;
                          end
                        end else begin
                          if (_T_93) begin
                            pc <= branchStackData;
                          end else begin
                            if (_T_265) begin
                              pc <= _T_71;
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
        pc <= 16'h0;
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
  end
endmodule
module UntiChatter( // @[:@559.2]
  input   clock, // @[:@560.4]
  input   reset, // @[:@561.4]
  input   io_din, // @[:@562.4]
  output  io_dout // @[:@562.4]
);
  reg [20:0] counter; // @[UntiChatter.scala 19:24:@564.4]
  reg [31:0] _RAND_0;
  reg  trigger; // @[UntiChatter.scala 20:24:@565.4]
  reg [31:0] _RAND_1;
  reg  dout; // @[UntiChatter.scala 29:21:@577.4]
  reg [31:0] _RAND_2;
  reg [7:0] captureData; // @[UntiChatter.scala 31:28:@579.4]
  reg [31:0] _RAND_3;
  wire  _T_9; // @[UntiChatter.scala 21:16:@566.4]
  wire [21:0] _T_11; // @[UntiChatter.scala 22:24:@568.6]
  wire [20:0] _T_12; // @[UntiChatter.scala 22:24:@569.6]
  wire [20:0] _GEN_0; // @[UntiChatter.scala 21:34:@567.4]
  wire  _GEN_1; // @[UntiChatter.scala 21:34:@567.4]
  wire [8:0] _GEN_4; // @[UntiChatter.scala 33:33:@581.6]
  wire [8:0] _T_20; // @[UntiChatter.scala 33:33:@581.6]
  wire [8:0] _GEN_5; // @[UntiChatter.scala 33:46:@583.6]
  wire [9:0] _T_24; // @[UntiChatter.scala 33:46:@583.6]
  wire [8:0] _T_25; // @[UntiChatter.scala 33:46:@584.6]
  wire [7:0] _T_26; // @[UntiChatter.scala 34:43:@586.6]
  wire  _T_28; // @[UntiChatter.scala 34:43:@587.6]
  wire [8:0] _GEN_2; // @[UntiChatter.scala 32:18:@580.4]
  wire  _GEN_3; // @[UntiChatter.scala 32:18:@580.4]
  assign _T_9 = counter < 21'h7a120; // @[UntiChatter.scala 21:16:@566.4]
  assign _T_11 = counter + 21'h1; // @[UntiChatter.scala 22:24:@568.6]
  assign _T_12 = _T_11[20:0]; // @[UntiChatter.scala 22:24:@569.6]
  assign _GEN_0 = _T_9 ? _T_12 : 21'h0; // @[UntiChatter.scala 21:34:@567.4]
  assign _GEN_1 = _T_9 ? 1'h0 : 1'h1; // @[UntiChatter.scala 21:34:@567.4]
  assign _GEN_4 = {{1'd0}, captureData}; // @[UntiChatter.scala 33:33:@581.6]
  assign _T_20 = _GEN_4 << 1; // @[UntiChatter.scala 33:33:@581.6]
  assign _GEN_5 = {{8'd0}, io_din}; // @[UntiChatter.scala 33:46:@583.6]
  assign _T_24 = _T_20 + _GEN_5; // @[UntiChatter.scala 33:46:@583.6]
  assign _T_25 = _T_24[8:0]; // @[UntiChatter.scala 33:46:@584.6]
  assign _T_26 = ~ captureData; // @[UntiChatter.scala 34:43:@586.6]
  assign _T_28 = _T_26 == 8'h0; // @[UntiChatter.scala 34:43:@587.6]
  assign _GEN_2 = trigger ? _T_25 : {{1'd0}, captureData}; // @[UntiChatter.scala 32:18:@580.4]
  assign _GEN_3 = trigger ? _T_28 : dout; // @[UntiChatter.scala 32:18:@580.4]
  assign io_dout = dout;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  counter = _RAND_0[20:0];
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
      counter <= 21'h0;
    end else begin
      if (_T_9) begin
        counter <= _T_12;
      end else begin
        counter <= 21'h0;
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
module Fifo( // @[:@623.2]
  input        clock, // @[:@624.4]
  input        reset, // @[:@625.4]
  input  [7:0] io_inData, // @[:@626.4]
  input        io_inValid, // @[:@626.4]
  output       io_inReady, // @[:@626.4]
  output       io_inAck, // @[:@626.4]
  output [7:0] io_outData, // @[:@626.4]
  output       io_outValid, // @[:@626.4]
  input        io_outReady, // @[:@626.4]
  input        io_outAck // @[:@626.4]
);
  reg  inReady; // @[Fifo.scala 26:24:@628.4]
  reg [31:0] _RAND_0;
  reg  inAck; // @[Fifo.scala 27:22:@629.4]
  reg [31:0] _RAND_1;
  reg [7:0] outData; // @[Fifo.scala 28:24:@630.4]
  reg [31:0] _RAND_2;
  reg  outValid; // @[Fifo.scala 29:25:@631.4]
  reg [31:0] _RAND_3;
  reg [7:0] mem [0:15]; // @[Fifo.scala 36:16:@636.4]
  reg [31:0] _RAND_4;
  wire [7:0] mem__T_95_data; // @[Fifo.scala 36:16:@636.4]
  wire [3:0] mem__T_95_addr; // @[Fifo.scala 36:16:@636.4]
  wire [7:0] mem__T_74_data; // @[Fifo.scala 36:16:@636.4]
  wire [3:0] mem__T_74_addr; // @[Fifo.scala 36:16:@636.4]
  wire  mem__T_74_mask; // @[Fifo.scala 36:16:@636.4]
  wire  mem__T_74_en; // @[Fifo.scala 36:16:@636.4]
  reg [3:0] inPtr; // @[Fifo.scala 38:22:@637.4]
  reg [31:0] _RAND_5;
  reg [3:0] outPtr; // @[Fifo.scala 39:23:@638.4]
  reg [31:0] _RAND_6;
  wire  _T_28; // @[Fifo.scala 47:12:@641.4]
  wire [4:0] _T_29; // @[Fifo.scala 48:11:@642.4]
  wire [4:0] _T_30; // @[Fifo.scala 48:11:@643.4]
  wire [3:0] _T_31; // @[Fifo.scala 48:11:@644.4]
  wire [4:0] _T_33; // @[Fifo.scala 48:20:@645.4]
  wire [4:0] _T_34; // @[Fifo.scala 48:20:@646.4]
  wire [3:0] _T_35; // @[Fifo.scala 48:20:@647.4]
  wire [4:0] _GEN_38; // @[Fifo.scala 49:14:@648.4]
  wire [5:0] _T_37; // @[Fifo.scala 49:14:@648.4]
  wire [5:0] _T_38; // @[Fifo.scala 49:14:@649.4]
  wire [4:0] _T_39; // @[Fifo.scala 49:14:@650.4]
  wire [5:0] _T_41; // @[Fifo.scala 49:23:@651.4]
  wire [5:0] _T_42; // @[Fifo.scala 49:23:@652.4]
  wire [4:0] _T_43; // @[Fifo.scala 49:23:@653.4]
  wire [4:0] _GEN_39; // @[Fifo.scala 49:30:@654.4]
  wire [5:0] _T_44; // @[Fifo.scala 49:30:@654.4]
  wire [4:0] _T_45; // @[Fifo.scala 49:30:@655.4]
  wire [4:0] count; // @[Fifo.scala 46:18:@656.4]
  wire  empty; // @[Fifo.scala 51:21:@657.4]
  wire [5:0] _T_49; // @[Fifo.scala 52:33:@658.4]
  wire [5:0] _T_50; // @[Fifo.scala 52:33:@659.4]
  wire [4:0] _T_51; // @[Fifo.scala 52:33:@660.4]
  wire  full; // @[Fifo.scala 52:20:@661.4]
  wire [5:0] _T_54; // @[Fifo.scala 53:39:@662.4]
  wire [5:0] _T_55; // @[Fifo.scala 53:39:@663.4]
  wire [4:0] _T_56; // @[Fifo.scala 53:39:@664.4]
  wire  _T_57; // @[Fifo.scala 53:29:@665.4]
  wire [4:0] _T_59; // @[Fifo.scala 53:52:@666.4]
  wire [3:0] _T_60; // @[Fifo.scala 53:52:@667.4]
  wire [3:0] inPtrNext; // @[Fifo.scala 53:22:@668.4]
  wire  _T_67; // @[Fifo.scala 54:31:@672.4]
  wire [4:0] _T_69; // @[Fifo.scala 54:55:@673.4]
  wire [3:0] _T_70; // @[Fifo.scala 54:55:@674.4]
  wire [3:0] outPtrNext; // @[Fifo.scala 54:23:@675.4]
  wire  _T_73; // @[Fifo.scala 58:8:@678.4]
  wire  _T_79; // @[Fifo.scala 64:13:@687.8]
  wire [3:0] _GEN_4; // @[Fifo.scala 59:22:@680.6]
  wire  _GEN_8; // @[Fifo.scala 58:15:@679.4]
  wire [3:0] _GEN_10; // @[Fifo.scala 58:15:@679.4]
  wire  _T_88; // @[Fifo.scala 75:8:@706.4]
  wire  _T_90; // @[Fifo.scala 80:24:@709.8]
  wire  _T_91; // @[Fifo.scala 80:22:@710.8]
  wire [7:0] _GEN_15; // @[Fifo.scala 80:35:@711.8]
  wire [3:0] _GEN_16; // @[Fifo.scala 80:35:@711.8]
  wire  _GEN_17; // @[Fifo.scala 80:35:@711.8]
  wire  _GEN_20; // @[Fifo.scala 77:23:@708.6]
  wire [7:0] _GEN_21; // @[Fifo.scala 77:23:@708.6]
  wire [3:0] _GEN_22; // @[Fifo.scala 77:23:@708.6]
  wire  _GEN_23; // @[Fifo.scala 77:23:@708.6]
  wire [7:0] _GEN_24; // @[Fifo.scala 97:21:@736.6]
  wire  _GEN_25; // @[Fifo.scala 97:21:@736.6]
  wire  _GEN_28; // @[Fifo.scala 75:16:@707.4]
  wire [7:0] _GEN_29; // @[Fifo.scala 75:16:@707.4]
  wire [3:0] _GEN_30; // @[Fifo.scala 75:16:@707.4]
  wire  _GEN_31; // @[Fifo.scala 75:16:@707.4]
  wire  _GEN_42; // @[Fifo.scala 64:13:@689.10]
  wire  _GEN_43; // @[Fifo.scala 66:13:@696.10]
  wire  _GEN_44; // @[Fifo.scala 66:13:@696.10]
  wire  _GEN_45; // @[Fifo.scala 81:15:@715.12]
  wire  _GEN_46; // @[Fifo.scala 81:15:@715.12]
  wire  _GEN_48; // @[Fifo.scala 88:15:@726.12]
  wire  _GEN_49; // @[Fifo.scala 88:15:@726.12]
  wire  _GEN_50; // @[Fifo.scala 98:13:@740.10]
  wire  _GEN_51; // @[Fifo.scala 98:13:@740.10]
  assign mem__T_95_addr = outPtrNext;
  assign mem__T_95_data = mem[mem__T_95_addr]; // @[Fifo.scala 36:16:@636.4]
  assign mem__T_74_data = io_inData;
  assign mem__T_74_addr = inPtr;
  assign mem__T_74_mask = _GEN_8;
  assign mem__T_74_en = _GEN_8;
  assign _T_28 = outPtr <= inPtr; // @[Fifo.scala 47:12:@641.4]
  assign _T_29 = inPtr - outPtr; // @[Fifo.scala 48:11:@642.4]
  assign _T_30 = $unsigned(_T_29); // @[Fifo.scala 48:11:@643.4]
  assign _T_31 = _T_30[3:0]; // @[Fifo.scala 48:11:@644.4]
  assign _T_33 = _T_31 - 4'h1; // @[Fifo.scala 48:20:@645.4]
  assign _T_34 = $unsigned(_T_33); // @[Fifo.scala 48:20:@646.4]
  assign _T_35 = _T_34[3:0]; // @[Fifo.scala 48:20:@647.4]
  assign _GEN_38 = {{1'd0}, outPtr}; // @[Fifo.scala 49:14:@648.4]
  assign _T_37 = 5'h10 - _GEN_38; // @[Fifo.scala 49:14:@648.4]
  assign _T_38 = $unsigned(_T_37); // @[Fifo.scala 49:14:@649.4]
  assign _T_39 = _T_38[4:0]; // @[Fifo.scala 49:14:@650.4]
  assign _T_41 = _T_39 - 5'h1; // @[Fifo.scala 49:23:@651.4]
  assign _T_42 = $unsigned(_T_41); // @[Fifo.scala 49:23:@652.4]
  assign _T_43 = _T_42[4:0]; // @[Fifo.scala 49:23:@653.4]
  assign _GEN_39 = {{1'd0}, inPtr}; // @[Fifo.scala 49:30:@654.4]
  assign _T_44 = _T_43 + _GEN_39; // @[Fifo.scala 49:30:@654.4]
  assign _T_45 = _T_44[4:0]; // @[Fifo.scala 49:30:@655.4]
  assign count = _T_28 ? {{1'd0}, _T_35} : _T_45; // @[Fifo.scala 46:18:@656.4]
  assign empty = count == 5'h0; // @[Fifo.scala 51:21:@657.4]
  assign _T_49 = 5'h10 - 5'h3; // @[Fifo.scala 52:33:@658.4]
  assign _T_50 = $unsigned(_T_49); // @[Fifo.scala 52:33:@659.4]
  assign _T_51 = _T_50[4:0]; // @[Fifo.scala 52:33:@660.4]
  assign full = count == _T_51; // @[Fifo.scala 52:20:@661.4]
  assign _T_54 = 5'h10 - 5'h1; // @[Fifo.scala 53:39:@662.4]
  assign _T_55 = $unsigned(_T_54); // @[Fifo.scala 53:39:@663.4]
  assign _T_56 = _T_55[4:0]; // @[Fifo.scala 53:39:@664.4]
  assign _T_57 = _GEN_39 < _T_56; // @[Fifo.scala 53:29:@665.4]
  assign _T_59 = inPtr + 4'h1; // @[Fifo.scala 53:52:@666.4]
  assign _T_60 = _T_59[3:0]; // @[Fifo.scala 53:52:@667.4]
  assign inPtrNext = _T_57 ? _T_60 : 4'h0; // @[Fifo.scala 53:22:@668.4]
  assign _T_67 = _GEN_38 < _T_56; // @[Fifo.scala 54:31:@672.4]
  assign _T_69 = outPtr + 4'h1; // @[Fifo.scala 54:55:@673.4]
  assign _T_70 = _T_69[3:0]; // @[Fifo.scala 54:55:@674.4]
  assign outPtrNext = _T_67 ? _T_70 : 4'h0; // @[Fifo.scala 54:23:@675.4]
  assign _T_73 = full == 1'h0; // @[Fifo.scala 58:8:@678.4]
  assign _T_79 = reset == 1'h0; // @[Fifo.scala 64:13:@687.8]
  assign _GEN_4 = io_inValid ? inPtrNext : inPtr; // @[Fifo.scala 59:22:@680.6]
  assign _GEN_8 = _T_73 ? io_inValid : 1'h0; // @[Fifo.scala 58:15:@679.4]
  assign _GEN_10 = _T_73 ? _GEN_4 : inPtr; // @[Fifo.scala 58:15:@679.4]
  assign _T_88 = empty == 1'h0; // @[Fifo.scala 75:8:@706.4]
  assign _T_90 = outValid == 1'h0; // @[Fifo.scala 80:24:@709.8]
  assign _T_91 = io_outAck | _T_90; // @[Fifo.scala 80:22:@710.8]
  assign _GEN_15 = _T_91 ? mem__T_95_data : outData; // @[Fifo.scala 80:35:@711.8]
  assign _GEN_16 = _T_91 ? outPtrNext : outPtr; // @[Fifo.scala 80:35:@711.8]
  assign _GEN_17 = _T_91 ? 1'h1 : outValid; // @[Fifo.scala 80:35:@711.8]
  assign _GEN_20 = io_outReady ? _T_91 : 1'h0; // @[Fifo.scala 77:23:@708.6]
  assign _GEN_21 = io_outReady ? _GEN_15 : 8'h0; // @[Fifo.scala 77:23:@708.6]
  assign _GEN_22 = io_outReady ? _GEN_16 : outPtr; // @[Fifo.scala 77:23:@708.6]
  assign _GEN_23 = io_outReady ? _GEN_17 : 1'h0; // @[Fifo.scala 77:23:@708.6]
  assign _GEN_24 = io_outAck ? 8'h0 : outData; // @[Fifo.scala 97:21:@736.6]
  assign _GEN_25 = io_outAck ? 1'h0 : outValid; // @[Fifo.scala 97:21:@736.6]
  assign _GEN_28 = _T_88 ? _GEN_20 : 1'h0; // @[Fifo.scala 75:16:@707.4]
  assign _GEN_29 = _T_88 ? _GEN_21 : _GEN_24; // @[Fifo.scala 75:16:@707.4]
  assign _GEN_30 = _T_88 ? _GEN_22 : outPtr; // @[Fifo.scala 75:16:@707.4]
  assign _GEN_31 = _T_88 ? _GEN_23 : _GEN_25; // @[Fifo.scala 75:16:@707.4]
  assign io_inReady = inReady;
  assign io_inAck = inAck;
  assign io_outData = outData;
  assign io_outValid = outValid;
  assign _GEN_42 = _T_73 & io_inValid; // @[Fifo.scala 64:13:@689.10]
  assign _GEN_43 = io_inValid == 1'h0; // @[Fifo.scala 66:13:@696.10]
  assign _GEN_44 = _T_73 & _GEN_43; // @[Fifo.scala 66:13:@696.10]
  assign _GEN_45 = _T_88 & io_outReady; // @[Fifo.scala 81:15:@715.12]
  assign _GEN_46 = _GEN_45 & _T_91; // @[Fifo.scala 81:15:@715.12]
  assign _GEN_48 = _T_91 == 1'h0; // @[Fifo.scala 88:15:@726.12]
  assign _GEN_49 = _GEN_45 & _GEN_48; // @[Fifo.scala 88:15:@726.12]
  assign _GEN_50 = _T_88 == 1'h0; // @[Fifo.scala 98:13:@740.10]
  assign _GEN_51 = _GEN_50 & io_outAck; // @[Fifo.scala 98:13:@740.10]
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
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      inReady <= 1'h0;
    end else begin
      inReady <= _T_73;
    end
    if (reset) begin
      inAck <= 1'h0;
    end else begin
      if (_T_73) begin
        inAck <= io_inValid;
      end else begin
        inAck <= 1'h0;
      end
    end
    if (reset) begin
      outData <= 8'h0;
    end else begin
      if (_T_88) begin
        if (io_outReady) begin
          if (_T_91) begin
            outData <= mem__T_95_data;
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
      if (_T_88) begin
        if (io_outReady) begin
          if (_T_91) begin
            outValid <= 1'h1;
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
    if(mem__T_74_en & mem__T_74_mask) begin
      mem[mem__T_74_addr] <= mem__T_74_data; // @[Fifo.scala 36:16:@636.4]
    end
    if (reset) begin
      inPtr <= 4'h1;
    end else begin
      if (_T_73) begin
        if (io_inValid) begin
          if (_T_57) begin
            inPtr <= _T_60;
          end else begin
            inPtr <= 4'h0;
          end
        end
      end
    end
    if (reset) begin
      outPtr <= 4'h0;
    end else begin
      if (_T_88) begin
        if (io_outReady) begin
          if (_T_91) begin
            if (_T_67) begin
              outPtr <= _T_70;
            end else begin
              outPtr <= 4'h0;
            end
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_42 & _T_79) begin
          $fwrite(32'h80000002,"[Fifo] [euqueue] data:%d inPtr:%d count:%d\n",io_inData,inPtr,count); // @[Fifo.scala 64:13:@689.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_44 & _T_79) begin
          $fwrite(32'h80000002,"[Fifo] [euqueue] nack count:%d\n",count); // @[Fifo.scala 66:13:@696.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_46 & _T_79) begin
          $fwrite(32'h80000002,"[Fifo] [dequeue] data:%d outPtr:%d count:%d\n",outData,outPtr,count); // @[Fifo.scala 81:15:@715.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_79) begin
          $fwrite(32'h80000002,"[Fifo] [dequeue] keep count:%d\n",count); // @[Fifo.scala 88:15:@726.12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_51 & _T_79) begin
          $fwrite(32'h80000002,"[Fifo] [dequeue] negate(empty) count:%d\n",count); // @[Fifo.scala 98:13:@740.10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module DebugAccessPort( // @[:@871.2]
  input        clock, // @[:@872.4]
  input        reset, // @[:@873.4]
  output       io_uartTx, // @[:@874.4]
  input        io_uartRx, // @[:@874.4]
  input        io_switches_0, // @[:@874.4]
  input        io_switches_1, // @[:@874.4]
  input        io_switches_2, // @[:@874.4]
  input        io_switches_3, // @[:@874.4]
  output       io_leds_0, // @[:@874.4]
  output       io_leds_1, // @[:@874.4]
  output       io_leds_2, // @[:@874.4]
  output       io_leds_3, // @[:@874.4]
  output [2:0] io_triLed0, // @[:@874.4]
  output [2:0] io_triLed1, // @[:@874.4]
  output [2:0] io_triLed2, // @[:@874.4]
  output [2:0] io_triLed3 // @[:@874.4]
);
  wire  uart_clock; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_reset; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_rx; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_tx; // @[DebugAccessPort.scala 37:20:@876.4]
  wire [7:0] uart_io_rxData; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_rxReady; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_rxValid; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_rxAck; // @[DebugAccessPort.scala 37:20:@876.4]
  wire [7:0] uart_io_txData; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_txReady; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_txValid; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_txAck; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_rxActive; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  uart_io_txActive; // @[DebugAccessPort.scala 37:20:@876.4]
  wire [7:0] uart_io_rxDebugBuf; // @[DebugAccessPort.scala 37:20:@876.4]
  wire [7:0] uart_io_txDebugBuf; // @[DebugAccessPort.scala 37:20:@876.4]
  wire  bf_clock; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_reset; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_run; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_program; // @[DebugAccessPort.scala 38:18:@879.4]
  wire [7:0] bf_io_programData; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_programValid; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_programReady; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_programAck; // @[DebugAccessPort.scala 38:18:@879.4]
  wire [7:0] bf_io_inst; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_halted; // @[DebugAccessPort.scala 38:18:@879.4]
  wire [2:0] bf_io_errorCode; // @[DebugAccessPort.scala 38:18:@879.4]
  wire [7:0] bf_io_stdinData; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_stdinValid; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_stdinAck; // @[DebugAccessPort.scala 38:18:@879.4]
  wire [7:0] bf_io_stdoutData; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_stdoutValid; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_stdoutReady; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  bf_io_stdoutAck; // @[DebugAccessPort.scala 38:18:@879.4]
  wire  chatterProgram_clock; // @[DebugAccessPort.scala 42:30:@882.4]
  wire  chatterProgram_reset; // @[DebugAccessPort.scala 42:30:@882.4]
  wire  chatterProgram_io_din; // @[DebugAccessPort.scala 42:30:@882.4]
  wire  chatterProgram_io_dout; // @[DebugAccessPort.scala 42:30:@882.4]
  wire  chatterRun_clock; // @[DebugAccessPort.scala 43:26:@885.4]
  wire  chatterRun_reset; // @[DebugAccessPort.scala 43:26:@885.4]
  wire  chatterRun_io_din; // @[DebugAccessPort.scala 43:26:@885.4]
  wire  chatterRun_io_dout; // @[DebugAccessPort.scala 43:26:@885.4]
  reg [7:0] statusInst; // @[DebugAccessPort.scala 55:27:@896.4]
  reg [31:0] _RAND_0;
  wire  fifoUartToBf_clock; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoUartToBf_reset; // @[DebugAccessPort.scala 73:28:@911.4]
  wire [7:0] fifoUartToBf_io_inData; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoUartToBf_io_inValid; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoUartToBf_io_inReady; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoUartToBf_io_inAck; // @[DebugAccessPort.scala 73:28:@911.4]
  wire [7:0] fifoUartToBf_io_outData; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoUartToBf_io_outValid; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoUartToBf_io_outReady; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoUartToBf_io_outAck; // @[DebugAccessPort.scala 73:28:@911.4]
  wire  fifoBfToUart_clock; // @[DebugAccessPort.scala 87:28:@929.4]
  wire  fifoBfToUart_reset; // @[DebugAccessPort.scala 87:28:@929.4]
  wire [7:0] fifoBfToUart_io_inData; // @[DebugAccessPort.scala 87:28:@929.4]
  wire  fifoBfToUart_io_inValid; // @[DebugAccessPort.scala 87:28:@929.4]
  wire  fifoBfToUart_io_inReady; // @[DebugAccessPort.scala 87:28:@929.4]
  wire  fifoBfToUart_io_inAck; // @[DebugAccessPort.scala 87:28:@929.4]
  wire [7:0] fifoBfToUart_io_outData; // @[DebugAccessPort.scala 87:28:@929.4]
  wire  fifoBfToUart_io_outValid; // @[DebugAccessPort.scala 87:28:@929.4]
  wire  fifoBfToUart_io_outReady; // @[DebugAccessPort.scala 87:28:@929.4]
  wire  fifoBfToUart_io_outAck; // @[DebugAccessPort.scala 87:28:@929.4]
  wire [2:0] _T_30; // @[DebugAccessPort.scala 61:27:@902.4]
  wire [2:0] _T_31; // @[DebugAccessPort.scala 62:27:@904.4]
  wire [1:0] _T_32; // @[DebugAccessPort.scala 63:27:@906.4]
  wire  program$; // @[DebugAccessPort.scala 44:21:@888.4]
  wire  _T_34; // @[DebugAccessPort.scala 81:28:@920.4]
  wire  _T_36; // @[DebugAccessPort.scala 82:27:@922.4]
  wire  _T_38; // @[DebugAccessPort.scala 82:26:@923.4]
  wire  _T_39; // @[DebugAccessPort.scala 83:34:@925.4]
  wire  _T_40; // @[DebugAccessPort.scala 84:32:@927.4]
  UartTxRx uart ( // @[DebugAccessPort.scala 37:20:@876.4]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_rx(uart_io_rx),
    .io_tx(uart_io_tx),
    .io_rxData(uart_io_rxData),
    .io_rxReady(uart_io_rxReady),
    .io_rxValid(uart_io_rxValid),
    .io_rxAck(uart_io_rxAck),
    .io_txData(uart_io_txData),
    .io_txReady(uart_io_txReady),
    .io_txValid(uart_io_txValid),
    .io_txAck(uart_io_txAck),
    .io_rxActive(uart_io_rxActive),
    .io_txActive(uart_io_txActive),
    .io_rxDebugBuf(uart_io_rxDebugBuf),
    .io_txDebugBuf(uart_io_txDebugBuf)
  );
  BrainfuckProcessor bf ( // @[DebugAccessPort.scala 38:18:@879.4]
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
  UntiChatter chatterProgram ( // @[DebugAccessPort.scala 42:30:@882.4]
    .clock(chatterProgram_clock),
    .reset(chatterProgram_reset),
    .io_din(chatterProgram_io_din),
    .io_dout(chatterProgram_io_dout)
  );
  UntiChatter chatterRun ( // @[DebugAccessPort.scala 43:26:@885.4]
    .clock(chatterRun_clock),
    .reset(chatterRun_reset),
    .io_din(chatterRun_io_din),
    .io_dout(chatterRun_io_dout)
  );
  Fifo fifoUartToBf ( // @[DebugAccessPort.scala 73:28:@911.4]
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
  Fifo fifoBfToUart ( // @[DebugAccessPort.scala 87:28:@929.4]
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
  assign _T_30 = statusInst[2:0]; // @[DebugAccessPort.scala 61:27:@902.4]
  assign _T_31 = statusInst[5:3]; // @[DebugAccessPort.scala 62:27:@904.4]
  assign _T_32 = statusInst[7:6]; // @[DebugAccessPort.scala 63:27:@906.4]
  assign program$ = chatterProgram_io_dout; // @[DebugAccessPort.scala 44:21:@888.4]
  assign _T_34 = program$ ? fifoUartToBf_io_outValid : 1'h0; // @[DebugAccessPort.scala 81:28:@920.4]
  assign _T_36 = program$ == 1'h0; // @[DebugAccessPort.scala 82:27:@922.4]
  assign _T_38 = _T_36 ? fifoUartToBf_io_outValid : 1'h0; // @[DebugAccessPort.scala 82:26:@923.4]
  assign _T_39 = program$ ? bf_io_programReady : 1'h1; // @[DebugAccessPort.scala 83:34:@925.4]
  assign _T_40 = program$ ? bf_io_programAck : bf_io_stdinAck; // @[DebugAccessPort.scala 84:32:@927.4]
  assign io_uartTx = uart_io_tx;
  assign io_leds_0 = program$;
  assign io_leds_1 = program$;
  assign io_leds_2 = bf_io_stdoutValid;
  assign io_leds_3 = bf_io_halted;
  assign io_triLed0 = _T_30;
  assign io_triLed1 = _T_31;
  assign io_triLed2 = {{1'd0}, _T_32};
  assign io_triLed3 = bf_io_errorCode;
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_rx = io_uartRx;
  assign uart_io_rxReady = fifoUartToBf_io_inReady;
  assign uart_io_rxAck = fifoUartToBf_io_inAck;
  assign uart_io_txData = fifoBfToUart_io_outData;
  assign uart_io_txValid = fifoBfToUart_io_outValid;
  assign bf_clock = clock;
  assign bf_reset = reset;
  assign bf_io_run = program$;
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
