package libs

import chisel3._
import chisel3.util._

class Passthrough(width: Int) extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(width.W))
        val out = Output(UInt(width.W))
    })
    io.out := io.in
}
object Passthrough extends App {
  chisel3.Driver.execute(args,()=>new Passthrough(8))
}