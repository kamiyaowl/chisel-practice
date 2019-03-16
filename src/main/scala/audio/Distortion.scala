package audio

import chisel3._
import chisel3.util._

class Distortion(width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(SInt(width.W))
    val out = Output(SInt(width.W))
    // params
    val point = Input(SInt(width.W)) // 歪ませる変化点, 負の数は使わないで
    val rate = Input(SInt(width.W)) // 傾きのレート(右シフト数)

  })
  val dst = RegInit(0.S)
  io.out := dst

  val is_negative = io.in < 0.S
  val abs_in = Mux(is_negative, -io.in, io.in)

  when((abs_in > io.point) && (io.rate > 0.S)) {
    val diff = (abs_in - io.point) / io.rate
    val next = io.point + diff.asInstanceOf[SInt]
    dst := RegNext(Mux(is_negative, -next, next))
  } .otherwise {
    dst := RegNext(io.in)
  }
}
object Distortion extends App {
  chisel3.Driver.execute(args,()=>new Distortion(32 ))
}