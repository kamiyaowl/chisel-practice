package audio

import chisel3._
import chisel3.util._

class Distortion(width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(SInt(width.W))
    val out = Output(SInt(width.W))
    // params
    val point = Input(SInt(width.W)) // 歪ませる変化点
    val shift = Input(UInt(width.W)) // 傾きのレート

  })
  val abs_in = RegInit(0.S)
  abs_in := Mux(io.in < 0.S, -io.in, io.in)
  io.out := RegNext(abs_in)

}
object Distortion extends App {
  chisel3.Driver.execute(args,()=>new Distortion(32 ))
}