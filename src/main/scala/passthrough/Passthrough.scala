import chisel3._
import chisel3.util._

class Passthrough extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(8.W))
        val out = Output(UInt(8.W))
    })
    io.out := io.in
}
object Passthrough extends App {
  chisel3.Driver.execute(args,()=>new Passthrough)
}