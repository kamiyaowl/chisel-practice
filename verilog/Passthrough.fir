;buildInfoPackage: chisel3, version: 3.0.2, scalaVersion: 2.12.3, sbtVersion: 0.13.16, builtAtString: 2018-02-05 23:26:31.979, builtAtMillis: 1517873191979
circuit Passthrough : 
  module Passthrough : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    io.out <= io.in @[Passthrough.scala 9:12]
    
