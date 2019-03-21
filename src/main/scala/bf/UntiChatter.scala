package bf

import chisel3._
import scala.math.{ log10, ceil }

// チャタリング防止
// sysFreq >> captureFreqであること
// isPositive: true-> キャプチャしたデータがすべてtrueのときにAssert, false->キャプチャしたデータのor
class UntiChatter(sysFreq: Double, captureFreq: Double = 100, averageWidth: Int = 8, isPositive: Boolean = true) extends Module {
  val io = IO(new Bundle {
    val din = Input(Bool())
    val dout = Output(Bool())
  })
  val duration: Int = (sysFreq / captureFreq).toInt
  val halfDuration: Int = duration / 2
  val log2: Double => Double = (x: Double) => log10(x)/log10(2.0)
  val counterWidth: Int = ceil(log2(duration)).toInt + 1
  // とりあえずSysCLKでは早すぎるので分周する
  val counter = RegInit(UInt(counterWidth.W), 0.U)
  val trigger = RegInit(Bool(), false.B)
  when(counter < halfDuration.U) {
    counter := counter + 1.U
    trigger := false.B
  } .otherwise {
    counter := 0.U
    trigger := true.B
  }
  // capture
  val dout = RegInit(Bool(), false.B)
  io.dout := dout
  val captureData = RegInit(UInt(averageWidth.W), 0.U)
  when (trigger) {
    captureData := (captureData << 1).asUInt + Mux(io.din, 1.U, 0.U)
    dout := { if (isPositive) captureData.andR else captureData.orR } // 正論理の場合はすべてtrue、負論理の場合はすべてfalseにしたい
  }
}
object UntiChatter extends App {
  chisel3.Driver.execute(args,()=>new UntiChatter(100e6))
}