;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.12.3, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:26:31.979, builtAtMillis: 1517873191979
circuit Compressor : 
  module Compressor : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : SInt<32>, out : SInt<32>, flip point : SInt<32>, flip rate : SInt<32>}
    
    reg dst : SInt, clock with : (reset => (reset, asSInt(UInt<1>("h00")))) @[Compressor.scala 15:20]
    io.out <= dst @[Compressor.scala 16:10]
    node is_negative = lt(io.in, asSInt(UInt<1>("h00"))) @[Compressor.scala 18:27]
    node _T_10 = sub(asSInt(UInt<1>("h00")), io.in) @[Compressor.scala 19:33]
    node _T_11 = tail(_T_10, 1) @[Compressor.scala 19:33]
    node _T_12 = asSInt(_T_11) @[Compressor.scala 19:33]
    node abs_in = mux(is_negative, _T_12, io.in) @[Compressor.scala 19:19]
    node is_valid = gt(io.rate, asSInt(UInt<1>("h00"))) @[Compressor.scala 20:26]
    node _T_14 = gt(abs_in, io.point) @[Compressor.scala 21:16]
    node _T_15 = and(_T_14, is_valid) @[Compressor.scala 21:28]
    when _T_15 : @[Compressor.scala 21:41]
      node _T_16 = sub(abs_in, io.point) @[Compressor.scala 22:24]
      node _T_17 = tail(_T_16, 1) @[Compressor.scala 22:24]
      node _T_18 = asSInt(_T_17) @[Compressor.scala 22:24]
      node _T_19 = div(_T_18, io.rate) @[Compressor.scala 22:36]
      node _T_20 = add(io.point, _T_19) @[Compressor.scala 23:25]
      node _T_21 = tail(_T_20, 1) @[Compressor.scala 23:25]
      node _T_22 = asSInt(_T_21) @[Compressor.scala 23:25]
      node _T_24 = sub(asSInt(UInt<1>("h00")), _T_22) @[Compressor.scala 24:51]
      node _T_25 = tail(_T_24, 1) @[Compressor.scala 24:51]
      node _T_26 = asSInt(_T_25) @[Compressor.scala 24:51]
      node _T_27 = mux(is_negative, _T_26, _T_22) @[Compressor.scala 24:37]
      node _T_28 = mux(is_valid, _T_27, io.in) @[Compressor.scala 24:23]
      reg _T_30 : SInt, clock @[Compressor.scala 24:19]
      _T_30 <= _T_28 @[Compressor.scala 24:19]
      dst <= _T_30 @[Compressor.scala 24:9]
      skip @[Compressor.scala 21:41]
    else : @[Compressor.scala 25:16]
      reg _T_32 : SInt, clock @[Compressor.scala 26:19]
      _T_32 <= io.in @[Compressor.scala 26:19]
      dst <= _T_32 @[Compressor.scala 26:9]
      skip @[Compressor.scala 25:16]
    
