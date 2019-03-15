;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.12.3, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:26:31.979, builtAtMillis: 1517873191979
circuit Distortion : 
  module Distortion : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : SInt<32>, out : SInt<32>, flip point : SInt<32>, flip shift : UInt<32>}
    
    reg abs_in : SInt, clock with : (reset => (reset, asSInt(UInt<1>("h00")))) @[Distortion.scala 15:23]
    node _T_9 = lt(io.in, asSInt(UInt<1>("h00"))) @[Distortion.scala 16:23]
    node _T_11 = sub(asSInt(UInt<1>("h00")), io.in) @[Distortion.scala 16:30]
    node _T_12 = tail(_T_11, 1) @[Distortion.scala 16:30]
    node _T_13 = asSInt(_T_12) @[Distortion.scala 16:30]
    node _T_14 = mux(_T_9, _T_13, io.in) @[Distortion.scala 16:16]
    abs_in <= _T_14 @[Distortion.scala 16:10]
    reg _T_16 : SInt, clock @[Distortion.scala 17:20]
    _T_16 <= abs_in @[Distortion.scala 17:20]
    io.out <= _T_16 @[Distortion.scala 17:10]
    
