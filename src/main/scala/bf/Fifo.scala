package bf

import chisel3._
import chisel3.util._

// synchronous fifo
class Fifo(width: Int = 8, depthWidth: Int = 4)  extends Module {
  val io = IO(new Bundle {
    // input
    val inData = Input(UInt(width.W)) //連続でValidなデータが来た場合も、かならず1cycのDelayが挿入される
    val inValid = Input(Bool())
    val inReady = Output(Bool())
    val inAck = Output(Bool())
    // output
    val outData = Output(UInt(width.W))
    val outValid = Output(Bool()) // Ackを受けた場合は一旦Validを下げる。受け側はAckを出した次のサイクル時点ではこれが間に合わないため読んではいけない
    val outReady = Input(Bool())
    val outAck = Input(Bool())
    // status
    val empty = Output(Bool())
    val full = Output(Bool())
    val inPtr = Output(UInt(depthWidth.W))
    val outPtr = Output(UInt(depthWidth.W))
  })
  // io
  val inReady = RegInit(Bool(), false.B)
  val inAck = RegInit(Bool(), false.B)
  val outData = RegInit(UInt(width.W), 0.U)
  val outValid = RegInit(Bool(), false.B)
  io.inReady := inReady
  io.inAck := inAck
  io.outData := outData
  io.outValid := outValid
  // ring buffer
  val depth: Int = scala.math.pow(2, depthWidth).toInt
  val mem = Mem(depth, UInt(width.W))
  // ptrはどちらも***今いる場所のデータは無効***
  val inPtr = RegInit(UInt(depthWidth.W), 1.U) // 今いる場所にデータを書いたら進める
  val outPtr = RegInit(UInt(depthWidth.W), 0.U) // 読むときは一個先のデータを読んでPtrをその位置に動かす
  io.inPtr := inPtr
  io.outPtr := outPtr
  // status flags
  // 基本はoutPtr - inPtrで出るはず
  //[x outPtr(x) a b inPtr(x) x] : 4 - 1 (-1) => 2
  //[c inPtr(x) x outPtr(x) a b] : (depth(6) - 3 (-1)) + 1 => 3
  val count = Mux(
    outPtr <= inPtr,
    inPtr - outPtr - 1.U,
    (depth.U - outPtr - 1.U) + inPtr
  )
  val empty = count === 0.U
  val full = count === (depth.U - 3.U) // 余剰をもたせておく
  val inPtrNext = Mux(inPtr < depth.U - 1.U, inPtr + 1.U, 0.U)
  val outPtrNext = Mux(outPtr < depth.U - 1.U, outPtr + 1.U, 0.U)
  io.empty := empty
  io.full := full
  // in
  val inDelay = RegInit(Bool(), false.B) // trueのときは1サイクルまつ
  when(inDelay) {
    inDelay := false.B
  } .elsewhen(!full) {
    when(io.inValid) {
      mem.write(inPtr, io.inData)
      inPtr := inPtrNext // overflow対策
      inReady := true.B
      inAck := true.B
      inDelay := true.B
      // printf(p"[Fifo] [euqueue] data:${io.inData} inPtr:$inPtr count:$count\n")
    } .otherwise {
      // printf(p"[Fifo] [euqueue] nack count:$count\n")
      inReady := true.B
      inAck := false.B
      inDelay := false.B
    }
  } .otherwise {
    inReady := false.B
    inAck := false.B
    inDelay := false.B
  }
  // out
  val waitAck = RegInit(Bool(), false.B) // ackきたらvalid一回下げる
  when(!empty) {
    // readyになるまでは一切処置なし
    when(io.outReady) {
      // outReadyで受け側の準備はできている
      when (!waitAck) {
        printf(p"[Fifo] [dequeue] data:${mem.read(outPtrNext)} outPtr:$outPtrNext count:$count\n")
        outData := mem.read(outPtrNext) // outPtr上は無効データ
        outPtr := outPtrNext
        outValid := true.B
        waitAck := true.B
      } .otherwise {
        when(io.outAck) {
          // 来たので一旦引っ込める(2重受信のバグの温床になってしまった)
          printf(p"[Fifo] [dequeue] Ack Received\n")
          outData := 0.U
          outValid := false.B
          waitAck := false.B
        }
      }
    } .otherwise {
      // 受けが準備できていないらしい
      outData := 0.U
      outValid := false.B
      waitAck := false.B
    }
  } .otherwise {
    // Ack以外は保持
    when(io.outAck) {
      // printf(p"[Fifo] [dequeue] negate(empty) count:$count\n")
      outData := 0.U
      outValid := false.B
      waitAck := false.B
    }
  }
}

object Fifo extends App {
  chisel3.Driver.execute(args,()=>new Fifo(8, 4))
}