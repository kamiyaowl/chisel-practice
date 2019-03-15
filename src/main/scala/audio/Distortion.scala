package audio

import chisel3._
import chisel3.util._

class Distortion(width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(SInt(width.W))
    val out = Output(SInt(width.W))
    // params
    val point = Input(SInt(width.W)) // 歪ませる変化点
    val shift = Input(UInt(width.W)) // 傾きのレート(右シフト数)

  })
  val is_negative = RegInit(false.B)
  val abs_in = RegInit(0.S)
  is_negative := io.in < 0.S
  abs_in := Mux(is_negative, -io.in, io.in)

  when(abs_in > io.point) {
    val diff = (abs_in - io.point) >> io.shift
    io.out := RegNext(io.point + diff.asInstanceOf[SInt])
  } .otherwise {
    io.out := RegNext(io.in)
  }
}
object Distortion extends App {
  chisel3.Driver.execute(args,()=>new Distortion(32 ))
}