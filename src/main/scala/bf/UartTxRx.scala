package bf

import chisel3._
import chisel3.util._
import scala.math.{ log10, ceil }

// databit=8, stopbit=1, parity=none
class UartTxRx(freq: Double, baud: Double) extends Module {
  val io = IO(new Bundle{
    val rx = Input(Bool())
    val tx = Output(Bool())
    // rx -> FIFO
    val rxData = Output(UInt(8.W))
    val rxReady = Input(Bool()) // FIFOが受取可能？ -> 使わない
    val rxValid = Output(Bool()) // データが有効
    val rxAck = Input(Bool()) // データを受け取った
    // FIFO -> Tx
    val txData = Input(UInt(8.W))
    val txReady = Output(Bool())
    val txValid = Input(Bool())
    val txAck = Output(Bool())
    // status
    val rxActive = Output(Bool())
    val txActive = Output(Bool())
    // debug
    val rxDebugBuf = Output(UInt(8.W))
    val txDebugBuf = Output(UInt(8.W))
  })
  // io/Outputs
  val tx = RegInit(Bool(), true.B)
  val rxData = RegInit(UInt(8.W), 0.U)
  val rxValid = RegInit(Bool(), false.B)
  val txReady = RegInit(Bool(), true.B) // 使わない
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
  // printf(p"[UartTxRx] freq:$freq baud:$baud duration:$duration counterWidth:$durationCounterWidth")

  // startbit検出時にリセットさせて位相同期する
  val rxActive = RegInit(Bool(), false.B) // startbit検出〜全データ受信までtrue, 取り込み終わったら解除してね
  io.rxActive := rxActive
  val rxTrigger = RegInit(Bool(), false.B) // trueのときに取り込んで
  val rxDurationCounter = RegInit(SInt(durationCounterWidth.W), 0.S) // 位相補正でマイナスを使う
  val rx1 = RegInit(Bool(), true.B)
  val rx2 = RegInit(Bool(), true.B)
  rx1 := io.rx
  rx2 := rx1
  when(!rxActive) {
    when(rx2 && !rx1) {
      printf(p"[Rx] Active\n")
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
  io.rxDebugBuf := rxBuf
  val rxCounter = RegInit(UInt(4.W), 0.U)
  when(rxActive) {
    when(rxTrigger) {
      rxCounter := rxCounter + 1.U
      rxBuf := (rxBuf >> 1).asUInt + Mux(io.rx, 0x80.U, 0x0.U)
      printf(p"[Rx] [$rxCounter] rx:${io.rx} buf:$rxBuf\n")
      // @stopbit
      when(rxCounter > 7.U) {
        printf(p"[Rx] Received:$rxBuf\n")
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

  // txはFIFOがデータを受信したら適当に始める
  val txActive = RegInit(Bool(), false.B)
  io.txActive := txActive
  val txTrigger = RegInit(Bool(), false.B) // trueのときに取り込んで
  val txDurationCounter = RegInit(SInt(durationCounterWidth.W), 0.S) // rxと棲み分け面倒だしsintでいいや
  val txBuf = RegInit(UInt(8.W), 0.U)
  io.txDebugBuf := txBuf
  val txCounter = RegInit(UInt(4.W), 0.U)
  when(!txActive) {
    when (io.txValid) {
      // データ取り込み、転送開始
      printf(p"[Tx] Active $io.txData\n")
      txActive := true.B
      txBuf := io.txData
      txAck := true.B
      txDurationCounter := 0.S
    } .otherwise {
      txAck := false.B
    }
  } .otherwise {
    txAck := false.B // FIFOの受取拒否はここでやる
    when (txDurationCounter < duration.S) {
      txDurationCounter := txDurationCounter + 1.S
      txTrigger := false.B
    } .otherwise {
      txDurationCounter := 0.S
      txTrigger := true.B
    }
  }
  // txTriggerに合わせて吐く
  // Startbit(0), d[0] ~ d[7], Stopbit(1)
  when(txActive) {
    when(txTrigger) {
      printf(p"[Tx] [$txCounter] rx:$tx buf:${txBuf}\n")
      when(txCounter === 0.U) {
        printf(p"[Tx] startbit\n")
        tx := false.B
        txCounter := txCounter + 1.U
      } .elsewhen(txCounter < 9.U) {
        // 1 ~ 8
        printf(p"[Tx] data\n")
        tx := txBuf(txCounter - 1.U)
        txCounter := txCounter + 1.U
      } .elsewhen(txCounter < 10.U) {
        // stopbit
        printf(p"[Tx] stopbit\n")
        tx:= true.B
        txCounter := txCounter + 1.U
      } .otherwise {
        // fin
        printf(p"[Tx] fin\n")
        txActive := false.B
        tx := true.B
        txCounter := 0.U
      }
    }
  } .otherwise {
    tx := true.B
    txCounter := 0.U
  }

}

object UartTxRx extends App {
  chisel3.Driver.execute(args,()=>new UartTxRx(100e6, 9600))
}