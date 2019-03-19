package bf

import chisel3._
import chisel3.util._
import scala.math.{ log10, ceil }

// databit=8, stopbit=1, parity=none
class UartTxRx(freq: Double, baud: Double) extends Module {
  val io = IO(new Bundle{
    val tx = Output(Bool())
    val rx = Input(Bool())
    // rx -> FIFO
    val rxData = Output(UInt(8.W))
    val rxReady = Input(Bool()) // FIFOが受取可能？
    val rxValid = Output(Bool()) // データが有効
    val rxAck = Input(Bool()) // データを受け取った
    // FIFO -> Tx
    val txData = Input(UInt(8.W))
    val txReady = Output(Bool())
    val txValid = Input(Bool())
    val txAck = Output(Bool())
  })
  // io/Outputs
  val tx = RegInit(Bool(), true.B)
  val rxData = RegInit(UInt(8.W), 0.U)
  val rxValid = RegInit(Bool(), false.B)
  val txReady = RegInit(Bool(), false.B)
  val txAck = RegInit(Bool(), false.B)
  io.tx := tx
  io.rxData := rxData
  io.rxValid := rxValid
  io.txReady := txReady
  io.txAck := txAck
  // freq, baudからデータの周期を計算する, chisel様様
  val log2 = (x: Double) => log10(x)/log10(2.0)
  val duration = (freq / baud).toInt
  val halfDuration = duration / 2
  val durationCounterWidth = ceil(log2(duration)).toInt + 1 // ex.100MHz, 9600で10416-log2->13.34  14bit必要(<16384)

  // startbit検出時にリセットさせて位相同期する
  val rxActive = RegInit(Bool(), false.B) // startbit検出〜全データ受信までtrue, 取り込み終わったら解除してね
  val rxTrigger = RegInit(Bool(), false.B) // trueのときに取り込んで
  val rxDurationCounter = RegInit(SInt(durationCounterWidth.W), 0.S) // 位相補正でマイナスを使う
  val rx1 = RegInit(Bool(), true.B)
  val rx2 = RegInit(Bool(), true.B)
  rx1 := io.rx
  rx2 := rx1
  when(!rxActive) {
    when(!rx2 && rx1) {
      rxActive := true.B
      rxTrigger := false.B
      rxDurationCounter := -halfDuration.S // このトリガがかかる時点では遷移直後なので半周期ずらす
    } .otherwise {
      rxActive := false.B
      rxTrigger := false.B
    }
  } .otherwise {
    when(rxDurationCounter < duration.S) {
      rxDurationCounter := rxDurationCounter + 1.S
      rxTrigger := false.B
    } .otherwise {
      rxDurationCounter := 0.S // 2回目以降は位相が半周期遅れているので大丈夫
      rxTrigger := true.B
    }
  }
  // rxTriggerに同期してデータ取り込む仕事
  val rxBuf = RegInit(UInt(8.W), 0.U)
  val rxCounter = RegInit(UInt(4.W), 0.U)
  when(rxActive) {
    when(rxTrigger) {
      rxCounter := rxCounter + 1.U
      rxBuf := (rxBuf << 1).asUInt + Mux(io.rx, 1.U, 0.U)
      // @stopbit
      when(rxCounter > 7.U) {
        rxActive := false.B
        rxData := rxBuf
        rxValid := true.B
      }
    }
  } .otherwise {
    rxBuf := 0.U
    rxCounter := 0.U
  }
  // rxの受け取り後処理
  when(rxValid & io.rxAck) {
    rxData := 0.U
    rxValid := false.B
  }

}

object UartTxRx extends App {
  chisel3.Driver.execute(args,()=>new UartTxRx(100e6, 9600))
}