package audio

import chisel3._
import chisel3.util._

class Compressor(width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(SInt(width.W))
    val out = Output(SInt(width.W))
    // params
    val point = Input(SInt(width.W)) // 歪ませる変化点
    val rate = Input(SInt(width.W))  // pointより大きい値に対して除算する数値、0,1の場合は無効

  })
  val dst = RegInit(0.S)
  io.out := dst

  val is_negative = io.in < 0.S
  val abs_in = Mux(is_negative, -io.in, io.in)
  val is_valid = io.rate > 0.S
  when((abs_in > io.point) && is_valid) {
    val diff = (abs_in - io.point) / io.rate
    val next = io.point + diff.asInstanceOf[SInt]
    dst := RegNext(Mux(is_valid, Mux(is_negative, -next, next), io.in)) // rate:0->1に遷移させた直後のdstが不定になってしまうため
  } .otherwise {
    dst := RegNext(io.in)
  }
}
object Compressor extends App {
  chisel3.Driver.execute(args,()=>new Compressor(32 ))
}