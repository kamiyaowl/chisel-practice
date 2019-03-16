;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.12.3, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:26:31.979, builtAtMillis: 1517873191979
circuit Distortion : 
  module Distortion : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : SInt<32>, out : SInt<32>, flip point : SInt<32>, flip rate : SInt<32>}
    
    reg is_negative : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Distortion.scala 15:28]
    reg abs_in : SInt, clock with : (reset => (reset, asSInt(UInt<1>("h00")))) @[Distortion.scala 16:23]
    node _T_11 = lt(io.in, asSInt(UInt<1>("h00"))) @[Distortion.scala 17:24]
    is_negative <= _T_11 @[Distortion.scala 17:15]
    node _T_13 = sub(asSInt(UInt<1>("h00")), io.in) @[Distortion.scala 18:30]
    node _T_14 = tail(_T_13, 1) @[Distortion.scala 18:30]
    node _T_15 = asSInt(_T_14) @[Distortion.scala 18:30]
    node _T_16 = mux(is_negative, _T_15, io.in) @[Distortion.scala 18:16]
    abs_in <= _T_16 @[Distortion.scala 18:10]
    node _T_17 = gt(abs_in, io.point) @[Distortion.scala 20:16]
    node _T_19 = gt(io.rate, asSInt(UInt<1>("h00"))) @[Distortion.scala 20:40]
    node _T_20 = and(_T_17, _T_19) @[Distortion.scala 20:28]
    when _T_20 : @[Distortion.scala 20:48]
      node _T_21 = sub(abs_in, io.point) @[Distortion.scala 21:24]
      node _T_22 = tail(_T_21, 1) @[Distortion.scala 21:24]
      node _T_23 = asSInt(_T_22) @[Distortion.scala 21:24]
      node _T_24 = div(_T_23, io.rate) @[Distortion.scala 21:36]
      node _T_25 = add(io.point, _T_24) @[Distortion.scala 22:25]
      node _T_26 = tail(_T_25, 1) @[Distortion.scala 22:25]
      node _T_27 = asSInt(_T_26) @[Distortion.scala 22:25]
      node _T_29 = sub(asSInt(UInt<1>("h00")), _T_27) @[Distortion.scala 23:40]
      node _T_30 = tail(_T_29, 1) @[Distortion.scala 23:40]
      node _T_31 = asSInt(_T_30) @[Distortion.scala 23:40]
      node _T_32 = mux(is_negative, _T_31, _T_27) @[Distortion.scala 23:26]
      reg _T_34 : SInt, clock @[Distortion.scala 23:22]
      _T_34 <= _T_32 @[Distortion.scala 23:22]
      io.out <= _T_34 @[Distortion.scala 23:12]
      skip @[Distortion.scala 20:48]
    else : @[Distortion.scala 24:16]
      reg _T_36 : SInt, clock @[Distortion.scala 25:22]
      _T_36 <= io.in @[Distortion.scala 25:22]
      io.out <= _T_36 @[Distortion.scala 25:12]
      skip @[Distortion.scala 24:16]
    
