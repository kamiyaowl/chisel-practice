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

module BrainfuckProcessor( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input         io_run, // @[:@6.4]
  input         io_program, // @[:@6.4]
  input  [31:0] io_programAddr, // @[:@6.4]
  input  [7:0]  io_programData, // @[:@6.4]
  input         io_programValid, // @[:@6.4]
  output        io_programAck, // @[:@6.4]
  output [15:0] io_pc, // @[:@6.4]
  output [7:0]  io_inst, // @[:@6.4]
  output [15:0] io_stackPtr, // @[:@6.4]
  output [7:0]  io_stackData, // @[:@6.4]
  output [3:0]  io_branchStackPtr, // @[:@6.4]
  output [15:0] io_branchStackData, // @[:@6.4]
  output        io_halted, // @[:@6.4]
  input  [7:0]  io_stdinData, // @[:@6.4]
  input         io_stdinValid, // @[:@6.4]
  output        io_stdinReady, // @[:@6.4]
  output        io_stdinAck, // @[:@6.4]
  output [7:0]  io_stdoutData, // @[:@6.4]
  output        io_stdoutValid, // @[:@6.4]
  input         io_stdoutReady, // @[:@6.4]
  input         io_stdoutAck // @[:@6.4]
);
  reg  programAck; // @[BrainfuckProcessor.scala 39:27:@8.4]
  reg [31:0] _RAND_0;
  reg  halted; // @[BrainfuckProcessor.scala 41:23:@10.4]
  reg [31:0] _RAND_1;
  reg  stdinAck; // @[BrainfuckProcessor.scala 45:25:@14.4]
  reg [31:0] _RAND_2;
  reg [7:0] stdoutData; // @[BrainfuckProcessor.scala 47:27:@16.4]
  reg [31:0] _RAND_3;
  reg  stdoutValid; // @[BrainfuckProcessor.scala 49:28:@18.4]
  reg [31:0] _RAND_4;
  reg [7:0] instMem [0:65535]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  reg [31:0] _RAND_5;
  wire [7:0] instMem__T_68_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_68_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_96_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_96_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_113_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_113_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_129_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_129_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_151_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_151_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_168_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_168_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_185_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_185_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_199_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_199_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_212_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_212_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_220_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_220_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_244_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_244_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [7:0] instMem__T_265_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire [15:0] instMem__T_265_addr; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire  instMem__T_265_mask; // @[BrainfuckProcessor.scala 53:20:@20.4]
  wire  instMem__T_265_en; // @[BrainfuckProcessor.scala 53:20:@20.4]
  reg [7:0] stackMem [0:65535]; // @[BrainfuckProcessor.scala 56:21:@21.4]
  reg [31:0] _RAND_6;
  wire [7:0] stackMem__T_120_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [15:0] stackMem__T_120_addr; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [7:0] stackMem__T_138_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [15:0] stackMem__T_138_addr; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [7:0] stackMem__T_247_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [15:0] stackMem__T_247_addr; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [7:0] stackMem__T_144_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [15:0] stackMem__T_144_addr; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire  stackMem__T_144_mask; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire  stackMem__T_144_en; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [7:0] stackMem__T_161_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [15:0] stackMem__T_161_addr; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire  stackMem__T_161_mask; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire  stackMem__T_161_en; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [7:0] stackMem__T_192_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire [15:0] stackMem__T_192_addr; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire  stackMem__T_192_mask; // @[BrainfuckProcessor.scala 56:21:@21.4]
  wire  stackMem__T_192_en; // @[BrainfuckProcessor.scala 56:21:@21.4]
  reg [15:0] stackPtr; // @[BrainfuckProcessor.scala 57:25:@22.4]
  reg [31:0] _RAND_7;
  reg [7:0] stackData; // @[BrainfuckProcessor.scala 58:26:@23.4]
  reg [31:0] _RAND_8;
  reg [15:0] branchStackMem [0:15]; // @[BrainfuckProcessor.scala 63:27:@26.4]
  reg [31:0] _RAND_9;
  wire [15:0] branchStackMem__T_237_data; // @[BrainfuckProcessor.scala 63:27:@26.4]
  wire [3:0] branchStackMem__T_237_addr; // @[BrainfuckProcessor.scala 63:27:@26.4]
  wire [15:0] branchStackMem__T_213_data; // @[BrainfuckProcessor.scala 63:27:@26.4]
  wire [3:0] branchStackMem__T_213_addr; // @[BrainfuckProcessor.scala 63:27:@26.4]
  wire  branchStackMem__T_213_mask; // @[BrainfuckProcessor.scala 63:27:@26.4]
  wire  branchStackMem__T_213_en; // @[BrainfuckProcessor.scala 63:27:@26.4]
  reg [3:0] branchStackPtr; // @[BrainfuckProcessor.scala 64:31:@27.4]
  reg [31:0] _RAND_10;
  reg [15:0] branchStackData; // @[BrainfuckProcessor.scala 65:32:@28.4]
  reg [31:0] _RAND_11;
  reg  branchJump; // @[BrainfuckProcessor.scala 81:27:@40.4]
  reg [31:0] _RAND_12;
  reg [3:0] branchJumpNest; // @[BrainfuckProcessor.scala 82:31:@41.4]
  reg [31:0] _RAND_13;
  reg [7:0] inst; // @[BrainfuckProcessor.scala 83:21:@42.4]
  reg [31:0] _RAND_14;
  reg [15:0] pc; // @[BrainfuckProcessor.scala 84:19:@43.4]
  reg [31:0] _RAND_15;
  reg  run; // @[BrainfuckProcessor.scala 221:20:@284.4]
  reg [31:0] _RAND_16;
  reg  run2; // @[BrainfuckProcessor.scala 222:21:@285.4]
  reg [31:0] _RAND_17;
  wire  _GEN_0; // @[BrainfuckProcessor.scala 70:18:@31.4]
  wire [7:0] _GEN_1; // @[BrainfuckProcessor.scala 75:24:@35.6]
  wire  _GEN_2; // @[BrainfuckProcessor.scala 75:24:@35.6]
  wire [7:0] _GEN_3; // @[BrainfuckProcessor.scala 74:21:@34.4]
  wire  _GEN_4; // @[BrainfuckProcessor.scala 74:21:@34.4]
  wire  _T_61; // @[BrainfuckProcessor.scala 88:8:@46.4]
  wire [16:0] _T_63; // @[BrainfuckProcessor.scala 91:17:@49.8]
  wire [15:0] _T_64; // @[BrainfuckProcessor.scala 91:17:@50.8]
  wire [15:0] _T_67; // @[BrainfuckProcessor.scala 92:31:@53.8]
  wire  _T_70; // @[Conditional.scala 37:30:@56.8]
  wire  _T_73; // @[Conditional.scala 37:30:@61.10]
  wire [4:0] _T_75; // @[BrainfuckProcessor.scala 98:45:@63.12]
  wire [3:0] _T_76; // @[BrainfuckProcessor.scala 98:45:@64.12]
  wire  _T_78; // @[Conditional.scala 37:30:@68.12]
  wire  _T_80; // @[BrainfuckProcessor.scala 101:31:@70.14]
  wire [4:0] _T_82; // @[BrainfuckProcessor.scala 102:47:@72.16]
  wire [4:0] _T_83; // @[BrainfuckProcessor.scala 102:47:@73.16]
  wire [3:0] _T_84; // @[BrainfuckProcessor.scala 102:47:@74.16]
  wire [3:0] _GEN_5; // @[BrainfuckProcessor.scala 101:38:@71.14]
  wire  _GEN_6; // @[BrainfuckProcessor.scala 101:38:@71.14]
  wire [3:0] _GEN_7; // @[Conditional.scala 39:67:@69.12]
  wire  _GEN_8; // @[Conditional.scala 39:67:@69.12]
  wire [3:0] _GEN_9; // @[Conditional.scala 39:67:@62.10]
  wire  _GEN_10; // @[Conditional.scala 39:67:@62.10]
  wire  _GEN_11; // @[Conditional.scala 40:58:@57.8]
  wire [3:0] _GEN_12; // @[Conditional.scala 40:58:@57.8]
  wire  _GEN_13; // @[Conditional.scala 40:58:@57.8]
  wire  _T_91; // @[Conditional.scala 37:30:@89.10]
  wire [16:0] _T_98; // @[BrainfuckProcessor.scala 123:33:@96.12]
  wire [15:0] _T_99; // @[BrainfuckProcessor.scala 123:33:@97.12]
  wire [8:0] _T_101; // @[BrainfuckProcessor.scala 124:35:@99.12]
  wire [7:0] _T_102; // @[BrainfuckProcessor.scala 124:35:@100.12]
  wire  _T_106; // @[Conditional.scala 37:30:@106.12]
  wire [15:0] _T_112; // @[BrainfuckProcessor.scala 130:35:@112.14]
  wire [15:0] _T_119; // @[BrainfuckProcessor.scala 132:47:@119.14]
  wire  _T_122; // @[Conditional.scala 37:30:@124.14]
  wire [15:0] _T_128; // @[BrainfuckProcessor.scala 136:35:@130.16]
  wire [16:0] _T_131; // @[BrainfuckProcessor.scala 137:33:@133.16]
  wire [16:0] _T_132; // @[BrainfuckProcessor.scala 137:33:@134.16]
  wire [15:0] _T_133; // @[BrainfuckProcessor.scala 137:33:@135.16]
  wire [15:0] _T_137; // @[BrainfuckProcessor.scala 138:47:@139.16]
  wire  _T_140; // @[Conditional.scala 37:30:@144.16]
  wire [7:0] _T_143; // @[BrainfuckProcessor.scala 141:46:@147.18]
  wire [15:0] _T_150; // @[BrainfuckProcessor.scala 144:35:@154.18]
  wire  _T_156; // @[Conditional.scala 37:30:@162.18]
  wire [8:0] _T_158; // @[BrainfuckProcessor.scala 148:46:@164.20]
  wire [8:0] _T_159; // @[BrainfuckProcessor.scala 148:46:@165.20]
  wire [7:0] _T_160; // @[BrainfuckProcessor.scala 148:46:@166.20]
  wire [15:0] _T_167; // @[BrainfuckProcessor.scala 151:35:@173.20]
  wire  _T_174; // @[Conditional.scala 37:30:@182.20]
  wire  _T_176; // @[BrainfuckProcessor.scala 156:34:@184.22]
  wire  _T_177; // @[BrainfuckProcessor.scala 156:31:@185.22]
  wire [15:0] _T_184; // @[BrainfuckProcessor.scala 163:37:@193.24]
  wire [7:0] _GEN_14; // @[BrainfuckProcessor.scala 156:48:@186.22]
  wire  _GEN_15; // @[BrainfuckProcessor.scala 156:48:@186.22]
  wire [15:0] _GEN_16; // @[BrainfuckProcessor.scala 156:48:@186.22]
  wire [7:0] _GEN_20; // @[BrainfuckProcessor.scala 156:48:@186.22]
  wire  _T_187; // @[Conditional.scala 37:30:@199.22]
  wire  _T_189; // @[BrainfuckProcessor.scala 168:33:@201.24]
  wire  _T_190; // @[BrainfuckProcessor.scala 168:30:@202.24]
  wire [15:0] _T_198; // @[BrainfuckProcessor.scala 173:37:@211.26]
  wire  _GEN_21; // @[BrainfuckProcessor.scala 168:44:@203.24]
  wire [15:0] _GEN_26; // @[BrainfuckProcessor.scala 168:44:@203.24]
  wire [7:0] _GEN_28; // @[BrainfuckProcessor.scala 168:44:@203.24]
  wire [7:0] _GEN_29; // @[BrainfuckProcessor.scala 168:44:@203.24]
  wire  _T_203; // @[BrainfuckProcessor.scala 178:26:@220.26]
  wire [15:0] _T_211; // @[BrainfuckProcessor.scala 183:37:@228.28]
  wire [15:0] _T_219; // @[BrainfuckProcessor.scala 188:37:@239.28]
  wire [4:0] _T_222; // @[BrainfuckProcessor.scala 189:47:@242.28]
  wire [3:0] _T_223; // @[BrainfuckProcessor.scala 189:47:@243.28]
  wire  _GEN_30; // @[BrainfuckProcessor.scala 178:35:@221.26]
  wire [3:0] _GEN_31; // @[BrainfuckProcessor.scala 178:35:@221.26]
  wire [15:0] _GEN_32; // @[BrainfuckProcessor.scala 178:35:@221.26]
  wire [7:0] _GEN_36; // @[BrainfuckProcessor.scala 178:35:@221.26]
  wire  _GEN_39; // @[BrainfuckProcessor.scala 178:35:@221.26]
  wire [3:0] _GEN_42; // @[BrainfuckProcessor.scala 178:35:@221.26]
  wire [15:0] _GEN_43; // @[BrainfuckProcessor.scala 178:35:@221.26]
  wire  _T_228; // @[BrainfuckProcessor.scala 198:31:@253.28]
  wire [4:0] _T_230; // @[BrainfuckProcessor.scala 199:47:@255.30]
  wire [4:0] _T_231; // @[BrainfuckProcessor.scala 199:47:@256.30]
  wire [3:0] _T_232; // @[BrainfuckProcessor.scala 199:47:@257.30]
  wire [4:0] _T_234; // @[BrainfuckProcessor.scala 200:67:@259.30]
  wire [4:0] _T_235; // @[BrainfuckProcessor.scala 200:67:@260.30]
  wire [3:0] _T_236; // @[BrainfuckProcessor.scala 200:67:@261.30]
  wire [3:0] _GEN_44; // @[BrainfuckProcessor.scala 198:38:@254.28]
  wire [15:0] _GEN_48; // @[BrainfuckProcessor.scala 198:38:@254.28]
  wire [15:0] _GEN_49; // @[Conditional.scala 39:67:@250.26]
  wire [7:0] _GEN_50; // @[Conditional.scala 39:67:@250.26]
  wire [3:0] _GEN_51; // @[Conditional.scala 39:67:@250.26]
  wire  _GEN_54; // @[Conditional.scala 39:67:@250.26]
  wire [15:0] _GEN_55; // @[Conditional.scala 39:67:@250.26]
  wire  _GEN_56; // @[Conditional.scala 39:67:@219.24]
  wire [3:0] _GEN_57; // @[Conditional.scala 39:67:@219.24]
  wire [15:0] _GEN_58; // @[Conditional.scala 39:67:@219.24]
  wire  _GEN_61; // @[Conditional.scala 39:67:@219.24]
  wire [7:0] _GEN_62; // @[Conditional.scala 39:67:@219.24]
  wire  _GEN_65; // @[Conditional.scala 39:67:@219.24]
  wire [3:0] _GEN_68; // @[Conditional.scala 39:67:@219.24]
  wire [15:0] _GEN_69; // @[Conditional.scala 39:67:@219.24]
  wire  _GEN_72; // @[Conditional.scala 39:67:@219.24]
  wire  _GEN_73; // @[Conditional.scala 39:67:@200.22]
  wire  _GEN_76; // @[Conditional.scala 39:67:@200.22]
  wire [15:0] _GEN_78; // @[Conditional.scala 39:67:@200.22]
  wire [7:0] _GEN_80; // @[Conditional.scala 39:67:@200.22]
  wire [7:0] _GEN_81; // @[Conditional.scala 39:67:@200.22]
  wire  _GEN_82; // @[Conditional.scala 39:67:@200.22]
  wire [3:0] _GEN_83; // @[Conditional.scala 39:67:@200.22]
  wire  _GEN_86; // @[Conditional.scala 39:67:@200.22]
  wire  _GEN_89; // @[Conditional.scala 39:67:@200.22]
  wire [3:0] _GEN_92; // @[Conditional.scala 39:67:@200.22]
  wire [15:0] _GEN_93; // @[Conditional.scala 39:67:@200.22]
  wire  _GEN_96; // @[Conditional.scala 39:67:@200.22]
  wire [7:0] _GEN_97; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_98; // @[Conditional.scala 39:67:@183.20]
  wire [15:0] _GEN_99; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_102; // @[Conditional.scala 39:67:@183.20]
  wire [7:0] _GEN_103; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_104; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_107; // @[Conditional.scala 39:67:@183.20]
  wire [7:0] _GEN_110; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_111; // @[Conditional.scala 39:67:@183.20]
  wire [3:0] _GEN_112; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_115; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_118; // @[Conditional.scala 39:67:@183.20]
  wire [3:0] _GEN_121; // @[Conditional.scala 39:67:@183.20]
  wire [15:0] _GEN_122; // @[Conditional.scala 39:67:@183.20]
  wire  _GEN_125; // @[Conditional.scala 39:67:@183.20]
  wire [15:0] _GEN_130; // @[Conditional.scala 39:67:@163.18]
  wire [7:0] _GEN_132; // @[Conditional.scala 39:67:@163.18]
  wire [7:0] _GEN_133; // @[Conditional.scala 39:67:@163.18]
  wire [7:0] _GEN_134; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_135; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_138; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_139; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_142; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_145; // @[Conditional.scala 39:67:@163.18]
  wire [3:0] _GEN_146; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_149; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_152; // @[Conditional.scala 39:67:@163.18]
  wire [3:0] _GEN_155; // @[Conditional.scala 39:67:@163.18]
  wire [15:0] _GEN_156; // @[Conditional.scala 39:67:@163.18]
  wire  _GEN_159; // @[Conditional.scala 39:67:@163.18]
  wire [15:0] _GEN_164; // @[Conditional.scala 39:67:@145.16]
  wire [7:0] _GEN_166; // @[Conditional.scala 39:67:@145.16]
  wire [7:0] _GEN_167; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_170; // @[Conditional.scala 39:67:@145.16]
  wire [7:0] _GEN_173; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_174; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_177; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_178; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_181; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_184; // @[Conditional.scala 39:67:@145.16]
  wire [3:0] _GEN_185; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_188; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_191; // @[Conditional.scala 39:67:@145.16]
  wire [3:0] _GEN_194; // @[Conditional.scala 39:67:@145.16]
  wire [15:0] _GEN_195; // @[Conditional.scala 39:67:@145.16]
  wire  _GEN_198; // @[Conditional.scala 39:67:@145.16]
  wire [15:0] _GEN_199; // @[Conditional.scala 39:67:@125.14]
  wire [7:0] _GEN_203; // @[Conditional.scala 39:67:@125.14]
  wire [15:0] _GEN_204; // @[Conditional.scala 39:67:@125.14]
  wire [7:0] _GEN_206; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_209; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_214; // @[Conditional.scala 39:67:@125.14]
  wire [7:0] _GEN_217; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_218; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_221; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_222; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_225; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_228; // @[Conditional.scala 39:67:@125.14]
  wire [3:0] _GEN_229; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_232; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_235; // @[Conditional.scala 39:67:@125.14]
  wire [3:0] _GEN_238; // @[Conditional.scala 39:67:@125.14]
  wire [15:0] _GEN_239; // @[Conditional.scala 39:67:@125.14]
  wire  _GEN_242; // @[Conditional.scala 39:67:@125.14]
  wire [15:0] _GEN_243; // @[Conditional.scala 39:67:@107.12]
  wire [7:0] _GEN_247; // @[Conditional.scala 39:67:@107.12]
  wire [15:0] _GEN_248; // @[Conditional.scala 39:67:@107.12]
  wire [7:0] _GEN_250; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_253; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_257; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_262; // @[Conditional.scala 39:67:@107.12]
  wire [7:0] _GEN_265; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_266; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_269; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_270; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_273; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_276; // @[Conditional.scala 39:67:@107.12]
  wire [3:0] _GEN_277; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_280; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_283; // @[Conditional.scala 39:67:@107.12]
  wire [3:0] _GEN_286; // @[Conditional.scala 39:67:@107.12]
  wire [15:0] _GEN_287; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_290; // @[Conditional.scala 39:67:@107.12]
  wire  _GEN_291; // @[Conditional.scala 39:67:@90.10]
  wire [3:0] _GEN_292; // @[Conditional.scala 39:67:@90.10]
  wire [15:0] _GEN_293; // @[Conditional.scala 39:67:@90.10]
  wire [7:0] _GEN_297; // @[Conditional.scala 39:67:@90.10]
  wire [15:0] _GEN_298; // @[Conditional.scala 39:67:@90.10]
  wire [7:0] _GEN_299; // @[Conditional.scala 39:67:@90.10]
  wire [3:0] _GEN_300; // @[Conditional.scala 39:67:@90.10]
  wire [15:0] _GEN_301; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_304; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_308; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_312; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_317; // @[Conditional.scala 39:67:@90.10]
  wire [7:0] _GEN_320; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_321; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_324; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_325; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_328; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_333; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_336; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_341; // @[Conditional.scala 39:67:@90.10]
  wire  _GEN_343; // @[Conditional.scala 40:58:@85.8]
  wire [3:0] _GEN_344; // @[Conditional.scala 40:58:@85.8]
  wire [15:0] _GEN_345; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_348; // @[Conditional.scala 40:58:@85.8]
  wire [7:0] _GEN_349; // @[Conditional.scala 40:58:@85.8]
  wire [15:0] _GEN_350; // @[Conditional.scala 40:58:@85.8]
  wire [7:0] _GEN_351; // @[Conditional.scala 40:58:@85.8]
  wire [3:0] _GEN_352; // @[Conditional.scala 40:58:@85.8]
  wire [15:0] _GEN_353; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_356; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_360; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_364; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_369; // @[Conditional.scala 40:58:@85.8]
  wire [7:0] _GEN_372; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_373; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_376; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_377; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_380; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_385; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_388; // @[Conditional.scala 40:58:@85.8]
  wire  _GEN_393; // @[Conditional.scala 40:58:@85.8]
  wire [15:0] _GEN_394; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [7:0] _GEN_398; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_399; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [3:0] _GEN_400; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_401; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_404; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [15:0] _GEN_405; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [7:0] _GEN_406; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [3:0] _GEN_407; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [15:0] _GEN_408; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_411; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_415; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_419; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_424; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [7:0] _GEN_427; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_428; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_431; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_432; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_435; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_440; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_443; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire  _GEN_448; // @[BrainfuckProcessor.scala 89:22:@48.6]
  wire [15:0] _GEN_449; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_452; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire [7:0] _GEN_453; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_454; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire [3:0] _GEN_455; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_456; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_459; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire [15:0] _GEN_460; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire [7:0] _GEN_461; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire [3:0] _GEN_462; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire [15:0] _GEN_463; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_466; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_470; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_474; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_479; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire [7:0] _GEN_482; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_483; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_486; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_487; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_490; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_495; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_498; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_503; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _GEN_506; // @[BrainfuckProcessor.scala 88:17:@47.4]
  wire  _T_255; // @[BrainfuckProcessor.scala 226:17:@289.6]
  wire  _T_256; // @[BrainfuckProcessor.scala 226:23:@290.6]
  wire  _T_258; // @[BrainfuckProcessor.scala 226:34:@291.6]
  wire  _T_259; // @[BrainfuckProcessor.scala 226:31:@292.6]
  wire  _GEN_507; // @[BrainfuckProcessor.scala 226:47:@293.6]
  wire  _GEN_508; // @[BrainfuckProcessor.scala 225:16:@288.4]
  wire  _T_261; // @[BrainfuckProcessor.scala 231:15:@297.4]
  wire  _T_262; // @[BrainfuckProcessor.scala 231:29:@298.4]
  wire [15:0] _T_264; // @[:@301.6]
  assign instMem__T_68_addr = _T_67;
  assign instMem__T_68_data = instMem[instMem__T_68_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_96_addr = 16'h0;
  assign instMem__T_96_data = instMem[instMem__T_96_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_113_addr = _T_112;
  assign instMem__T_113_data = instMem[instMem__T_113_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_129_addr = _T_128;
  assign instMem__T_129_data = instMem[instMem__T_129_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_151_addr = _T_150;
  assign instMem__T_151_data = instMem[instMem__T_151_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_168_addr = _T_167;
  assign instMem__T_168_data = instMem[instMem__T_168_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_185_addr = _T_184;
  assign instMem__T_185_data = instMem[instMem__T_185_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_199_addr = _T_198;
  assign instMem__T_199_data = instMem[instMem__T_199_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_212_addr = _T_211;
  assign instMem__T_212_data = instMem[instMem__T_212_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_220_addr = _T_219;
  assign instMem__T_220_data = instMem[instMem__T_220_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_244_addr = 16'h0;
  assign instMem__T_244_data = instMem[instMem__T_244_addr]; // @[BrainfuckProcessor.scala 53:20:@20.4]
  assign instMem__T_265_data = io_programData;
  assign instMem__T_265_addr = _T_264;
  assign instMem__T_265_mask = _T_262;
  assign instMem__T_265_en = _T_262;
  assign stackMem__T_120_addr = _T_119;
  assign stackMem__T_120_data = stackMem[stackMem__T_120_addr]; // @[BrainfuckProcessor.scala 56:21:@21.4]
  assign stackMem__T_138_addr = _T_137;
  assign stackMem__T_138_data = stackMem[stackMem__T_138_addr]; // @[BrainfuckProcessor.scala 56:21:@21.4]
  assign stackMem__T_247_addr = 16'h0;
  assign stackMem__T_247_data = stackMem[stackMem__T_247_addr]; // @[BrainfuckProcessor.scala 56:21:@21.4]
  assign stackMem__T_144_data = _T_143;
  assign stackMem__T_144_addr = stackPtr;
  assign stackMem__T_144_mask = _GEN_474;
  assign stackMem__T_144_en = _GEN_474;
  assign stackMem__T_161_data = _T_160;
  assign stackMem__T_161_addr = stackPtr;
  assign stackMem__T_161_mask = _GEN_479;
  assign stackMem__T_161_en = _GEN_479;
  assign stackMem__T_192_data = io_stdinData;
  assign stackMem__T_192_addr = stackPtr;
  assign stackMem__T_192_mask = _GEN_490;
  assign stackMem__T_192_en = _GEN_490;
  assign branchStackMem__T_237_addr = _T_236;
  assign branchStackMem__T_237_data = branchStackMem[branchStackMem__T_237_addr]; // @[BrainfuckProcessor.scala 63:27:@26.4]
  assign branchStackMem__T_213_data = pc;
  assign branchStackMem__T_213_addr = branchStackPtr;
  assign branchStackMem__T_213_mask = _GEN_498;
  assign branchStackMem__T_213_en = _GEN_498;
  assign _GEN_0 = stdinAck ? 1'h0 : stdinAck; // @[BrainfuckProcessor.scala 70:18:@31.4]
  assign _GEN_1 = io_stdoutAck ? 8'h0 : stdoutData; // @[BrainfuckProcessor.scala 75:24:@35.6]
  assign _GEN_2 = io_stdoutAck ? 1'h0 : stdoutValid; // @[BrainfuckProcessor.scala 75:24:@35.6]
  assign _GEN_3 = stdoutValid ? _GEN_1 : stdoutData; // @[BrainfuckProcessor.scala 74:21:@34.4]
  assign _GEN_4 = stdoutValid ? _GEN_2 : stdoutValid; // @[BrainfuckProcessor.scala 74:21:@34.4]
  assign _T_61 = halted == 1'h0; // @[BrainfuckProcessor.scala 88:8:@46.4]
  assign _T_63 = pc + 16'h1; // @[BrainfuckProcessor.scala 91:17:@49.8]
  assign _T_64 = _T_63[15:0]; // @[BrainfuckProcessor.scala 91:17:@50.8]
  assign _T_67 = _T_63[15:0]; // @[BrainfuckProcessor.scala 92:31:@53.8]
  assign _T_70 = 8'h0 == inst; // @[Conditional.scala 37:30:@56.8]
  assign _T_73 = 8'h5b == inst; // @[Conditional.scala 37:30:@61.10]
  assign _T_75 = branchJumpNest + 4'h1; // @[BrainfuckProcessor.scala 98:45:@63.12]
  assign _T_76 = _T_75[3:0]; // @[BrainfuckProcessor.scala 98:45:@64.12]
  assign _T_78 = 8'h5d == inst; // @[Conditional.scala 37:30:@68.12]
  assign _T_80 = branchJumpNest > 4'h0; // @[BrainfuckProcessor.scala 101:31:@70.14]
  assign _T_82 = branchJumpNest - 4'h1; // @[BrainfuckProcessor.scala 102:47:@72.16]
  assign _T_83 = $unsigned(_T_82); // @[BrainfuckProcessor.scala 102:47:@73.16]
  assign _T_84 = _T_83[3:0]; // @[BrainfuckProcessor.scala 102:47:@74.16]
  assign _GEN_5 = _T_80 ? _T_84 : 4'h0; // @[BrainfuckProcessor.scala 101:38:@71.14]
  assign _GEN_6 = _T_80 ? branchJump : 1'h0; // @[BrainfuckProcessor.scala 101:38:@71.14]
  assign _GEN_7 = _T_78 ? _GEN_5 : branchJumpNest; // @[Conditional.scala 39:67:@69.12]
  assign _GEN_8 = _T_78 ? _GEN_6 : branchJump; // @[Conditional.scala 39:67:@69.12]
  assign _GEN_9 = _T_73 ? _T_76 : _GEN_7; // @[Conditional.scala 39:67:@62.10]
  assign _GEN_10 = _T_73 ? branchJump : _GEN_8; // @[Conditional.scala 39:67:@62.10]
  assign _GEN_11 = _T_70 ? 1'h1 : halted; // @[Conditional.scala 40:58:@57.8]
  assign _GEN_12 = _T_70 ? branchJumpNest : _GEN_9; // @[Conditional.scala 40:58:@57.8]
  assign _GEN_13 = _T_70 ? branchJump : _GEN_10; // @[Conditional.scala 40:58:@57.8]
  assign _T_91 = 8'h21 == inst; // @[Conditional.scala 37:30:@89.10]
  assign _T_98 = stackPtr + 16'h1; // @[BrainfuckProcessor.scala 123:33:@96.12]
  assign _T_99 = _T_98[15:0]; // @[BrainfuckProcessor.scala 123:33:@97.12]
  assign _T_101 = stackData + 8'h1; // @[BrainfuckProcessor.scala 124:35:@99.12]
  assign _T_102 = _T_101[7:0]; // @[BrainfuckProcessor.scala 124:35:@100.12]
  assign _T_106 = 8'h3e == inst; // @[Conditional.scala 37:30:@106.12]
  assign _T_112 = _T_63[15:0]; // @[BrainfuckProcessor.scala 130:35:@112.14]
  assign _T_119 = _T_98[15:0]; // @[BrainfuckProcessor.scala 132:47:@119.14]
  assign _T_122 = 8'h3c == inst; // @[Conditional.scala 37:30:@124.14]
  assign _T_128 = _T_63[15:0]; // @[BrainfuckProcessor.scala 136:35:@130.16]
  assign _T_131 = stackPtr - 16'h1; // @[BrainfuckProcessor.scala 137:33:@133.16]
  assign _T_132 = $unsigned(_T_131); // @[BrainfuckProcessor.scala 137:33:@134.16]
  assign _T_133 = _T_132[15:0]; // @[BrainfuckProcessor.scala 137:33:@135.16]
  assign _T_137 = _T_132[15:0]; // @[BrainfuckProcessor.scala 138:47:@139.16]
  assign _T_140 = 8'h2b == inst; // @[Conditional.scala 37:30:@144.16]
  assign _T_143 = _T_101[7:0]; // @[BrainfuckProcessor.scala 141:46:@147.18]
  assign _T_150 = _T_63[15:0]; // @[BrainfuckProcessor.scala 144:35:@154.18]
  assign _T_156 = 8'h2d == inst; // @[Conditional.scala 37:30:@162.18]
  assign _T_158 = stackData - 8'h1; // @[BrainfuckProcessor.scala 148:46:@164.20]
  assign _T_159 = $unsigned(_T_158); // @[BrainfuckProcessor.scala 148:46:@165.20]
  assign _T_160 = _T_159[7:0]; // @[BrainfuckProcessor.scala 148:46:@166.20]
  assign _T_167 = _T_63[15:0]; // @[BrainfuckProcessor.scala 151:35:@173.20]
  assign _T_174 = 8'h2e == inst; // @[Conditional.scala 37:30:@182.20]
  assign _T_176 = stdoutValid == 1'h0; // @[BrainfuckProcessor.scala 156:34:@184.22]
  assign _T_177 = io_stdoutReady & _T_176; // @[BrainfuckProcessor.scala 156:31:@185.22]
  assign _T_184 = _T_63[15:0]; // @[BrainfuckProcessor.scala 163:37:@193.24]
  assign _GEN_14 = _T_177 ? stackData : _GEN_3; // @[BrainfuckProcessor.scala 156:48:@186.22]
  assign _GEN_15 = _T_177 ? 1'h1 : _GEN_4; // @[BrainfuckProcessor.scala 156:48:@186.22]
  assign _GEN_16 = _T_177 ? _T_64 : pc; // @[BrainfuckProcessor.scala 156:48:@186.22]
  assign _GEN_20 = _T_177 ? instMem__T_185_data : inst; // @[BrainfuckProcessor.scala 156:48:@186.22]
  assign _T_187 = 8'h2c == inst; // @[Conditional.scala 37:30:@199.22]
  assign _T_189 = stdinAck == 1'h0; // @[BrainfuckProcessor.scala 168:33:@201.24]
  assign _T_190 = io_stdinValid & _T_189; // @[BrainfuckProcessor.scala 168:30:@202.24]
  assign _T_198 = _T_63[15:0]; // @[BrainfuckProcessor.scala 173:37:@211.26]
  assign _GEN_21 = _T_190 ? 1'h1 : _GEN_0; // @[BrainfuckProcessor.scala 168:44:@203.24]
  assign _GEN_26 = _T_190 ? _T_64 : pc; // @[BrainfuckProcessor.scala 168:44:@203.24]
  assign _GEN_28 = _T_190 ? instMem__T_199_data : inst; // @[BrainfuckProcessor.scala 168:44:@203.24]
  assign _GEN_29 = _T_190 ? io_stdinData : stackData; // @[BrainfuckProcessor.scala 168:44:@203.24]
  assign _T_203 = stackData == 8'h0; // @[BrainfuckProcessor.scala 178:26:@220.26]
  assign _T_211 = _T_63[15:0]; // @[BrainfuckProcessor.scala 183:37:@228.28]
  assign _T_219 = _T_63[15:0]; // @[BrainfuckProcessor.scala 188:37:@239.28]
  assign _T_222 = branchStackPtr + 4'h1; // @[BrainfuckProcessor.scala 189:47:@242.28]
  assign _T_223 = _T_222[3:0]; // @[BrainfuckProcessor.scala 189:47:@243.28]
  assign _GEN_30 = _T_203 ? 1'h1 : branchJump; // @[BrainfuckProcessor.scala 178:35:@221.26]
  assign _GEN_31 = _T_203 ? 4'h0 : branchJumpNest; // @[BrainfuckProcessor.scala 178:35:@221.26]
  assign _GEN_32 = _T_203 ? _T_64 : _T_64; // @[BrainfuckProcessor.scala 178:35:@221.26]
  assign _GEN_36 = _T_203 ? instMem__T_212_data : instMem__T_220_data; // @[BrainfuckProcessor.scala 178:35:@221.26]
  assign _GEN_39 = _T_203 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 178:35:@221.26]
  assign _GEN_42 = _T_203 ? branchStackPtr : _T_223; // @[BrainfuckProcessor.scala 178:35:@221.26]
  assign _GEN_43 = _T_203 ? branchStackData : pc; // @[BrainfuckProcessor.scala 178:35:@221.26]
  assign _T_228 = branchStackPtr > 4'h1; // @[BrainfuckProcessor.scala 198:31:@253.28]
  assign _T_230 = branchStackPtr - 4'h1; // @[BrainfuckProcessor.scala 199:47:@255.30]
  assign _T_231 = $unsigned(_T_230); // @[BrainfuckProcessor.scala 199:47:@256.30]
  assign _T_232 = _T_231[3:0]; // @[BrainfuckProcessor.scala 199:47:@257.30]
  assign _T_234 = branchStackPtr - 4'h2; // @[BrainfuckProcessor.scala 200:67:@259.30]
  assign _T_235 = $unsigned(_T_234); // @[BrainfuckProcessor.scala 200:67:@260.30]
  assign _T_236 = _T_235[3:0]; // @[BrainfuckProcessor.scala 200:67:@261.30]
  assign _GEN_44 = _T_228 ? _T_232 : 4'h0; // @[BrainfuckProcessor.scala 198:38:@254.28]
  assign _GEN_48 = _T_228 ? branchStackMem__T_237_data : 16'h0; // @[BrainfuckProcessor.scala 198:38:@254.28]
  assign _GEN_49 = _T_78 ? branchStackData : pc; // @[Conditional.scala 39:67:@250.26]
  assign _GEN_50 = _T_78 ? 8'h5b : inst; // @[Conditional.scala 39:67:@250.26]
  assign _GEN_51 = _T_78 ? _GEN_44 : branchStackPtr; // @[Conditional.scala 39:67:@250.26]
  assign _GEN_54 = _T_78 ? _T_228 : 1'h0; // @[Conditional.scala 39:67:@250.26]
  assign _GEN_55 = _T_78 ? _GEN_48 : branchStackData; // @[Conditional.scala 39:67:@250.26]
  assign _GEN_56 = _T_73 ? _GEN_30 : branchJump; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_57 = _T_73 ? _GEN_31 : branchJumpNest; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_58 = _T_73 ? _GEN_32 : _GEN_49; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_61 = _T_73 ? _T_203 : 1'h0; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_62 = _T_73 ? _GEN_36 : _GEN_50; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_65 = _T_73 ? _GEN_39 : 1'h0; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_68 = _T_73 ? _GEN_42 : _GEN_51; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_69 = _T_73 ? _GEN_43 : _GEN_55; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_72 = _T_73 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67:@219.24]
  assign _GEN_73 = _T_187 ? _GEN_21 : _GEN_0; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_76 = _T_187 ? _T_190 : 1'h0; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_78 = _T_187 ? _GEN_26 : _GEN_58; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_80 = _T_187 ? _GEN_28 : _GEN_62; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_81 = _T_187 ? _GEN_29 : stackData; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_82 = _T_187 ? branchJump : _GEN_56; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_83 = _T_187 ? branchJumpNest : _GEN_57; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_86 = _T_187 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_89 = _T_187 ? 1'h0 : _GEN_65; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_92 = _T_187 ? branchStackPtr : _GEN_68; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_93 = _T_187 ? branchStackData : _GEN_69; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_96 = _T_187 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67:@200.22]
  assign _GEN_97 = _T_174 ? _GEN_14 : _GEN_3; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_98 = _T_174 ? _GEN_15 : _GEN_4; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_99 = _T_174 ? _GEN_16 : _GEN_78; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_102 = _T_174 ? _T_177 : 1'h0; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_103 = _T_174 ? _GEN_20 : _GEN_80; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_104 = _T_174 ? _GEN_0 : _GEN_73; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_107 = _T_174 ? 1'h0 : _GEN_76; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_110 = _T_174 ? stackData : _GEN_81; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_111 = _T_174 ? branchJump : _GEN_82; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_112 = _T_174 ? branchJumpNest : _GEN_83; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_115 = _T_174 ? 1'h0 : _GEN_86; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_118 = _T_174 ? 1'h0 : _GEN_89; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_121 = _T_174 ? branchStackPtr : _GEN_92; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_122 = _T_174 ? branchStackData : _GEN_93; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_125 = _T_174 ? 1'h0 : _GEN_96; // @[Conditional.scala 39:67:@183.20]
  assign _GEN_130 = _T_156 ? _T_64 : _GEN_99; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_132 = _T_156 ? instMem__T_168_data : _GEN_103; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_133 = _T_156 ? _T_160 : _GEN_110; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_134 = _T_156 ? _GEN_3 : _GEN_97; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_135 = _T_156 ? _GEN_4 : _GEN_98; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_138 = _T_156 ? 1'h0 : _GEN_102; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_139 = _T_156 ? _GEN_0 : _GEN_104; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_142 = _T_156 ? 1'h0 : _GEN_107; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_145 = _T_156 ? branchJump : _GEN_111; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_146 = _T_156 ? branchJumpNest : _GEN_112; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_149 = _T_156 ? 1'h0 : _GEN_115; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_152 = _T_156 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_155 = _T_156 ? branchStackPtr : _GEN_121; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_156 = _T_156 ? branchStackData : _GEN_122; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_159 = _T_156 ? 1'h0 : _GEN_125; // @[Conditional.scala 39:67:@163.18]
  assign _GEN_164 = _T_140 ? _T_64 : _GEN_130; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_166 = _T_140 ? instMem__T_151_data : _GEN_132; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_167 = _T_140 ? _T_102 : _GEN_133; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_170 = _T_140 ? 1'h0 : _T_156; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_173 = _T_140 ? _GEN_3 : _GEN_134; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_174 = _T_140 ? _GEN_4 : _GEN_135; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_177 = _T_140 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_178 = _T_140 ? _GEN_0 : _GEN_139; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_181 = _T_140 ? 1'h0 : _GEN_142; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_184 = _T_140 ? branchJump : _GEN_145; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_185 = _T_140 ? branchJumpNest : _GEN_146; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_188 = _T_140 ? 1'h0 : _GEN_149; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_191 = _T_140 ? 1'h0 : _GEN_152; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_194 = _T_140 ? branchStackPtr : _GEN_155; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_195 = _T_140 ? branchStackData : _GEN_156; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_198 = _T_140 ? 1'h0 : _GEN_159; // @[Conditional.scala 39:67:@145.16]
  assign _GEN_199 = _T_122 ? _T_64 : _GEN_164; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_203 = _T_122 ? instMem__T_129_data : _GEN_166; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_204 = _T_122 ? _T_133 : stackPtr; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_206 = _T_122 ? stackMem__T_138_data : _GEN_167; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_209 = _T_122 ? 1'h0 : _T_140; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_214 = _T_122 ? 1'h0 : _GEN_170; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_217 = _T_122 ? _GEN_3 : _GEN_173; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_218 = _T_122 ? _GEN_4 : _GEN_174; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_221 = _T_122 ? 1'h0 : _GEN_177; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_222 = _T_122 ? _GEN_0 : _GEN_178; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_225 = _T_122 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_228 = _T_122 ? branchJump : _GEN_184; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_229 = _T_122 ? branchJumpNest : _GEN_185; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_232 = _T_122 ? 1'h0 : _GEN_188; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_235 = _T_122 ? 1'h0 : _GEN_191; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_238 = _T_122 ? branchStackPtr : _GEN_194; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_239 = _T_122 ? branchStackData : _GEN_195; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_242 = _T_122 ? 1'h0 : _GEN_198; // @[Conditional.scala 39:67:@125.14]
  assign _GEN_243 = _T_106 ? _T_64 : _GEN_199; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_247 = _T_106 ? instMem__T_113_data : _GEN_203; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_248 = _T_106 ? _T_99 : _GEN_204; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_250 = _T_106 ? stackMem__T_120_data : _GEN_206; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_253 = _T_106 ? 1'h0 : _T_122; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_257 = _T_106 ? 1'h0 : _GEN_209; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_262 = _T_106 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_265 = _T_106 ? _GEN_3 : _GEN_217; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_266 = _T_106 ? _GEN_4 : _GEN_218; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_269 = _T_106 ? 1'h0 : _GEN_221; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_270 = _T_106 ? _GEN_0 : _GEN_222; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_273 = _T_106 ? 1'h0 : _GEN_225; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_276 = _T_106 ? branchJump : _GEN_228; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_277 = _T_106 ? branchJumpNest : _GEN_229; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_280 = _T_106 ? 1'h0 : _GEN_232; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_283 = _T_106 ? 1'h0 : _GEN_235; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_286 = _T_106 ? branchStackPtr : _GEN_238; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_287 = _T_106 ? branchStackData : _GEN_239; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_290 = _T_106 ? 1'h0 : _GEN_242; // @[Conditional.scala 39:67:@107.12]
  assign _GEN_291 = _T_91 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_292 = _T_91 ? 4'h0 : _GEN_277; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_293 = _T_91 ? 16'h0 : _GEN_243; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_297 = _T_91 ? instMem__T_96_data : _GEN_247; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_298 = _T_91 ? _T_99 : _GEN_248; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_299 = _T_91 ? _T_102 : _GEN_250; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_300 = _T_91 ? 4'h0 : _GEN_286; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_301 = _T_91 ? 16'h0 : _GEN_287; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_304 = _T_91 ? 1'h0 : _T_106; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_308 = _T_91 ? 1'h0 : _GEN_253; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_312 = _T_91 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_317 = _T_91 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_320 = _T_91 ? _GEN_3 : _GEN_265; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_321 = _T_91 ? _GEN_4 : _GEN_266; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_324 = _T_91 ? 1'h0 : _GEN_269; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_325 = _T_91 ? _GEN_0 : _GEN_270; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_328 = _T_91 ? 1'h0 : _GEN_273; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_333 = _T_91 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_336 = _T_91 ? 1'h0 : _GEN_283; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_341 = _T_91 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67:@90.10]
  assign _GEN_343 = _T_70 ? branchJump : _GEN_291; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_344 = _T_70 ? branchJumpNest : _GEN_292; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_345 = _T_70 ? pc : _GEN_293; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_348 = _T_70 ? 1'h0 : _T_91; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_349 = _T_70 ? inst : _GEN_297; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_350 = _T_70 ? stackPtr : _GEN_298; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_351 = _T_70 ? stackData : _GEN_299; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_352 = _T_70 ? branchStackPtr : _GEN_300; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_353 = _T_70 ? branchStackData : _GEN_301; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_356 = _T_70 ? 1'h0 : _GEN_304; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_360 = _T_70 ? 1'h0 : _GEN_308; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_364 = _T_70 ? 1'h0 : _GEN_312; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_369 = _T_70 ? 1'h0 : _GEN_317; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_372 = _T_70 ? _GEN_3 : _GEN_320; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_373 = _T_70 ? _GEN_4 : _GEN_321; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_376 = _T_70 ? 1'h0 : _GEN_324; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_377 = _T_70 ? _GEN_0 : _GEN_325; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_380 = _T_70 ? 1'h0 : _GEN_328; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_385 = _T_70 ? 1'h0 : _GEN_333; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_388 = _T_70 ? 1'h0 : _GEN_336; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_393 = _T_70 ? 1'h0 : _GEN_341; // @[Conditional.scala 40:58:@85.8]
  assign _GEN_394 = branchJump ? _T_64 : _GEN_345; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_398 = branchJump ? instMem__T_68_data : _GEN_349; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_399 = branchJump ? _GEN_11 : _GEN_11; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_400 = branchJump ? _GEN_12 : _GEN_344; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_401 = branchJump ? _GEN_13 : _GEN_343; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_404 = branchJump ? 1'h0 : _GEN_348; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_405 = branchJump ? stackPtr : _GEN_350; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_406 = branchJump ? stackData : _GEN_351; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_407 = branchJump ? branchStackPtr : _GEN_352; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_408 = branchJump ? branchStackData : _GEN_353; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_411 = branchJump ? 1'h0 : _GEN_356; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_415 = branchJump ? 1'h0 : _GEN_360; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_419 = branchJump ? 1'h0 : _GEN_364; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_424 = branchJump ? 1'h0 : _GEN_369; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_427 = branchJump ? _GEN_3 : _GEN_372; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_428 = branchJump ? _GEN_4 : _GEN_373; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_431 = branchJump ? 1'h0 : _GEN_376; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_432 = branchJump ? _GEN_0 : _GEN_377; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_435 = branchJump ? 1'h0 : _GEN_380; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_440 = branchJump ? 1'h0 : _GEN_385; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_443 = branchJump ? 1'h0 : _GEN_388; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_448 = branchJump ? 1'h0 : _GEN_393; // @[BrainfuckProcessor.scala 89:22:@48.6]
  assign _GEN_449 = _T_61 ? _GEN_394 : 16'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_452 = _T_61 ? branchJump : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_453 = _T_61 ? _GEN_398 : instMem__T_244_data; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_454 = _T_61 ? _GEN_399 : halted; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_455 = _T_61 ? _GEN_400 : 4'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_456 = _T_61 ? _GEN_401 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_459 = _T_61 ? _GEN_404 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_460 = _T_61 ? _GEN_405 : 16'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_461 = _T_61 ? _GEN_406 : stackMem__T_247_data; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_462 = _T_61 ? _GEN_407 : 4'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_463 = _T_61 ? _GEN_408 : 16'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_466 = _T_61 ? _GEN_411 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_470 = _T_61 ? _GEN_415 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_474 = _T_61 ? _GEN_419 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_479 = _T_61 ? _GEN_424 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_482 = _T_61 ? _GEN_427 : _GEN_3; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_483 = _T_61 ? _GEN_428 : _GEN_4; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_486 = _T_61 ? _GEN_431 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_487 = _T_61 ? _GEN_432 : _GEN_0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_490 = _T_61 ? _GEN_435 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_495 = _T_61 ? _GEN_440 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_498 = _T_61 ? _GEN_443 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_503 = _T_61 ? _GEN_448 : 1'h0; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _GEN_506 = _T_61 ? 1'h0 : 1'h1; // @[BrainfuckProcessor.scala 88:17:@47.4]
  assign _T_255 = run2 == 1'h0; // @[BrainfuckProcessor.scala 226:17:@289.6]
  assign _T_256 = _T_255 & run; // @[BrainfuckProcessor.scala 226:23:@290.6]
  assign _T_258 = io_program == 1'h0; // @[BrainfuckProcessor.scala 226:34:@291.6]
  assign _T_259 = _T_256 & _T_258; // @[BrainfuckProcessor.scala 226:31:@292.6]
  assign _GEN_507 = _T_259 ? 1'h0 : _GEN_454; // @[BrainfuckProcessor.scala 226:47:@293.6]
  assign _GEN_508 = halted ? _GEN_507 : _GEN_454; // @[BrainfuckProcessor.scala 225:16:@288.4]
  assign _T_261 = halted & io_program; // @[BrainfuckProcessor.scala 231:15:@297.4]
  assign _T_262 = _T_261 & io_programValid; // @[BrainfuckProcessor.scala 231:29:@298.4]
  assign _T_264 = io_programAddr[15:0]; // @[:@301.6]
  assign io_programAck = programAck;
  assign io_pc = pc;
  assign io_inst = inst;
  assign io_stackPtr = stackPtr;
  assign io_stackData = stackData;
  assign io_branchStackPtr = branchStackPtr;
  assign io_branchStackData = branchStackData;
  assign io_halted = halted;
  assign io_stdinReady = 1'h0;
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
  programAck = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  halted = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  stdinAck = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  stdoutData = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  stdoutValid = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    instMem[initvar] = _RAND_5[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    stackMem[initvar] = _RAND_6[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  stackPtr = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  stackData = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    branchStackMem[initvar] = _RAND_9[15:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  branchStackPtr = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  branchStackData = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  branchJump = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  branchJumpNest = _RAND_13[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  inst = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  pc = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  run = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  run2 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      programAck <= 1'h0;
    end else begin
      programAck <= _T_262;
    end
    if (reset) begin
      halted <= 1'h1;
    end else begin
      if (halted) begin
        if (_T_259) begin
          halted <= 1'h0;
        end else begin
          if (_T_61) begin
            if (branchJump) begin
              if (_T_70) begin
                halted <= 1'h1;
              end
            end else begin
              if (_T_70) begin
                halted <= 1'h1;
              end
            end
          end
        end
      end else begin
        if (_T_61) begin
          if (branchJump) begin
            if (_T_70) begin
              halted <= 1'h1;
            end
          end else begin
            if (_T_70) begin
              halted <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      stdinAck <= 1'h1;
    end else begin
      if (_T_61) begin
        if (branchJump) begin
          if (stdinAck) begin
            stdinAck <= 1'h0;
          end
        end else begin
          if (_T_70) begin
            if (stdinAck) begin
              stdinAck <= 1'h0;
            end
          end else begin
            if (_T_91) begin
              if (stdinAck) begin
                stdinAck <= 1'h0;
              end
            end else begin
              if (_T_106) begin
                if (stdinAck) begin
                  stdinAck <= 1'h0;
                end
              end else begin
                if (_T_122) begin
                  stdinAck <= _GEN_0;
                end else begin
                  if (_T_140) begin
                    stdinAck <= _GEN_0;
                  end else begin
                    if (_T_156) begin
                      stdinAck <= _GEN_0;
                    end else begin
                      if (_T_174) begin
                        stdinAck <= _GEN_0;
                      end else begin
                        if (_T_187) begin
                          if (_T_190) begin
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
        end
      end else begin
        stdinAck <= _GEN_0;
      end
    end
    if (reset) begin
      stdoutData <= 8'h0;
    end else begin
      if (_T_61) begin
        if (branchJump) begin
          if (stdoutValid) begin
            if (io_stdoutAck) begin
              stdoutData <= 8'h0;
            end
          end
        end else begin
          if (_T_70) begin
            if (stdoutValid) begin
              if (io_stdoutAck) begin
                stdoutData <= 8'h0;
              end
            end
          end else begin
            if (_T_91) begin
              if (stdoutValid) begin
                if (io_stdoutAck) begin
                  stdoutData <= 8'h0;
                end
              end
            end else begin
              if (_T_106) begin
                if (stdoutValid) begin
                  if (io_stdoutAck) begin
                    stdoutData <= 8'h0;
                  end
                end
              end else begin
                if (_T_122) begin
                  stdoutData <= _GEN_3;
                end else begin
                  if (_T_140) begin
                    stdoutData <= _GEN_3;
                  end else begin
                    if (_T_156) begin
                      stdoutData <= _GEN_3;
                    end else begin
                      if (_T_174) begin
                        if (_T_177) begin
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
        end
      end else begin
        stdoutData <= _GEN_3;
      end
    end
    if (reset) begin
      stdoutValid <= 1'h0;
    end else begin
      if (_T_61) begin
        if (branchJump) begin
          if (stdoutValid) begin
            if (io_stdoutAck) begin
              stdoutValid <= 1'h0;
            end
          end
        end else begin
          if (_T_70) begin
            if (stdoutValid) begin
              if (io_stdoutAck) begin
                stdoutValid <= 1'h0;
              end
            end
          end else begin
            if (_T_91) begin
              if (stdoutValid) begin
                if (io_stdoutAck) begin
                  stdoutValid <= 1'h0;
                end
              end
            end else begin
              if (_T_106) begin
                if (stdoutValid) begin
                  if (io_stdoutAck) begin
                    stdoutValid <= 1'h0;
                  end
                end
              end else begin
                if (_T_122) begin
                  stdoutValid <= _GEN_4;
                end else begin
                  if (_T_140) begin
                    stdoutValid <= _GEN_4;
                  end else begin
                    if (_T_156) begin
                      stdoutValid <= _GEN_4;
                    end else begin
                      if (_T_174) begin
                        if (_T_177) begin
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
        end
      end else begin
        stdoutValid <= _GEN_4;
      end
    end
    if(instMem__T_265_en & instMem__T_265_mask) begin
      instMem[instMem__T_265_addr] <= instMem__T_265_data; // @[BrainfuckProcessor.scala 53:20:@20.4]
    end
    if(stackMem__T_144_en & stackMem__T_144_mask) begin
      stackMem[stackMem__T_144_addr] <= stackMem__T_144_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
    end
    if(stackMem__T_161_en & stackMem__T_161_mask) begin
      stackMem[stackMem__T_161_addr] <= stackMem__T_161_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
    end
    if(stackMem__T_192_en & stackMem__T_192_mask) begin
      stackMem[stackMem__T_192_addr] <= stackMem__T_192_data; // @[BrainfuckProcessor.scala 56:21:@21.4]
    end
    if (reset) begin
      stackPtr <= 16'h0;
    end else begin
      if (_T_61) begin
        if (!(branchJump)) begin
          if (!(_T_70)) begin
            if (_T_91) begin
              stackPtr <= _T_99;
            end else begin
              if (_T_106) begin
                stackPtr <= _T_99;
              end else begin
                if (_T_122) begin
                  stackPtr <= _T_133;
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
      if (_T_61) begin
        if (!(branchJump)) begin
          if (!(_T_70)) begin
            if (_T_91) begin
              stackData <= _T_102;
            end else begin
              if (_T_106) begin
                stackData <= stackMem__T_120_data;
              end else begin
                if (_T_122) begin
                  stackData <= stackMem__T_138_data;
                end else begin
                  if (_T_140) begin
                    stackData <= _T_102;
                  end else begin
                    if (_T_156) begin
                      stackData <= _T_160;
                    end else begin
                      if (!(_T_174)) begin
                        if (_T_187) begin
                          if (_T_190) begin
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
        end
      end else begin
        stackData <= stackMem__T_247_data;
      end
    end
    if(branchStackMem__T_213_en & branchStackMem__T_213_mask) begin
      branchStackMem[branchStackMem__T_213_addr] <= branchStackMem__T_213_data; // @[BrainfuckProcessor.scala 63:27:@26.4]
    end
    if (reset) begin
      branchStackPtr <= 4'h0;
    end else begin
      if (_T_61) begin
        if (!(branchJump)) begin
          if (!(_T_70)) begin
            if (_T_91) begin
              branchStackPtr <= 4'h0;
            end else begin
              if (!(_T_106)) begin
                if (!(_T_122)) begin
                  if (!(_T_140)) begin
                    if (!(_T_156)) begin
                      if (!(_T_174)) begin
                        if (!(_T_187)) begin
                          if (_T_73) begin
                            if (!(_T_203)) begin
                              branchStackPtr <= _T_223;
                            end
                          end else begin
                            if (_T_78) begin
                              if (_T_228) begin
                                branchStackPtr <= _T_232;
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
        end
      end else begin
        branchStackPtr <= 4'h0;
      end
    end
    if (reset) begin
      branchStackData <= 16'h0;
    end else begin
      if (_T_61) begin
        if (!(branchJump)) begin
          if (!(_T_70)) begin
            if (_T_91) begin
              branchStackData <= 16'h0;
            end else begin
              if (!(_T_106)) begin
                if (!(_T_122)) begin
                  if (!(_T_140)) begin
                    if (!(_T_156)) begin
                      if (!(_T_174)) begin
                        if (!(_T_187)) begin
                          if (_T_73) begin
                            if (!(_T_203)) begin
                              branchStackData <= pc;
                            end
                          end else begin
                            if (_T_78) begin
                              if (_T_228) begin
                                branchStackData <= branchStackMem__T_237_data;
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
        end
      end else begin
        branchStackData <= 16'h0;
      end
    end
    if (reset) begin
      branchJump <= 1'h0;
    end else begin
      if (_T_61) begin
        if (branchJump) begin
          if (!(_T_70)) begin
            if (!(_T_73)) begin
              if (_T_78) begin
                if (!(_T_80)) begin
                  branchJump <= 1'h0;
                end
              end
            end
          end
        end else begin
          if (!(_T_70)) begin
            if (_T_91) begin
              branchJump <= 1'h0;
            end else begin
              if (!(_T_106)) begin
                if (!(_T_122)) begin
                  if (!(_T_140)) begin
                    if (!(_T_156)) begin
                      if (!(_T_174)) begin
                        if (!(_T_187)) begin
                          if (_T_73) begin
                            if (_T_203) begin
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
        end
      end else begin
        branchJump <= 1'h0;
      end
    end
    if (reset) begin
      branchJumpNest <= 4'h0;
    end else begin
      if (_T_61) begin
        if (branchJump) begin
          if (!(_T_70)) begin
            if (_T_73) begin
              branchJumpNest <= _T_76;
            end else begin
              if (_T_78) begin
                if (_T_80) begin
                  branchJumpNest <= _T_84;
                end else begin
                  branchJumpNest <= 4'h0;
                end
              end
            end
          end
        end else begin
          if (!(_T_70)) begin
            if (_T_91) begin
              branchJumpNest <= 4'h0;
            end else begin
              if (!(_T_106)) begin
                if (!(_T_122)) begin
                  if (!(_T_140)) begin
                    if (!(_T_156)) begin
                      if (!(_T_174)) begin
                        if (!(_T_187)) begin
                          if (_T_73) begin
                            if (_T_203) begin
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
        end
      end else begin
        branchJumpNest <= 4'h0;
      end
    end
    if (reset) begin
      inst <= 8'h0;
    end else begin
      if (_T_61) begin
        if (branchJump) begin
          inst <= instMem__T_68_data;
        end else begin
          if (!(_T_70)) begin
            if (_T_91) begin
              inst <= instMem__T_96_data;
            end else begin
              if (_T_106) begin
                inst <= instMem__T_113_data;
              end else begin
                if (_T_122) begin
                  inst <= instMem__T_129_data;
                end else begin
                  if (_T_140) begin
                    inst <= instMem__T_151_data;
                  end else begin
                    if (_T_156) begin
                      inst <= instMem__T_168_data;
                    end else begin
                      if (_T_174) begin
                        if (_T_177) begin
                          inst <= instMem__T_185_data;
                        end
                      end else begin
                        if (_T_187) begin
                          if (_T_190) begin
                            inst <= instMem__T_199_data;
                          end
                        end else begin
                          if (_T_73) begin
                            if (_T_203) begin
                              inst <= instMem__T_212_data;
                            end else begin
                              inst <= instMem__T_220_data;
                            end
                          end else begin
                            if (_T_78) begin
                              inst <= 8'h5b;
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
        inst <= instMem__T_244_data;
      end
    end
    if (reset) begin
      pc <= 16'h0;
    end else begin
      if (_T_61) begin
        if (branchJump) begin
          pc <= _T_64;
        end else begin
          if (!(_T_70)) begin
            if (_T_91) begin
              pc <= 16'h0;
            end else begin
              if (_T_106) begin
                pc <= _T_64;
              end else begin
                if (_T_122) begin
                  pc <= _T_64;
                end else begin
                  if (_T_140) begin
                    pc <= _T_64;
                  end else begin
                    if (_T_156) begin
                      pc <= _T_64;
                    end else begin
                      if (_T_174) begin
                        if (_T_177) begin
                          pc <= _T_64;
                        end
                      end else begin
                        if (_T_187) begin
                          if (_T_190) begin
                            pc <= _T_64;
                          end
                        end else begin
                          if (_T_73) begin
                            if (_T_203) begin
                              pc <= _T_64;
                            end else begin
                              pc <= _T_64;
                            end
                          end else begin
                            if (_T_78) begin
                              pc <= branchStackData;
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
