package bf

import chisel3._
import chisel3.util._

// synchronous fifo
class Fifo(width: Int = 8, depthWidth: Int = 4)  extends Module {
  val io = IO(new Bundle {
    // input
    val inData = Input(UInt(width.W))
    val inValid = Input(Bool())
    val inReady = Output(Bool()) // full
    val inAck = Output(Bool())
    // output
    val outData = Output(UInt(width.W))
    val outValid = Output(Bool()) // not empty
    val outReady = Input(Bool())
    val outAck = Input(Bool())
    // status
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
  val mem = Mem(UInt(width.W), depth)
  // ptrはどちらも***今いる場所のデータは無効***
  val inPtr = RegInit(UInt(depthWidth.W), 1.U) // 今いる場所にデータを書いたら進める
  val outPtr = RegInit(UInt(depthWidth.W), 0.U) // 読むときは一個先のデータを読んでPtrをその位置に動かす

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

  // in
  when(!full) {
    when(io.inValid) {
      mem.write(inPtr, io.inData)
      inPtr := inPtrNext // overflow対策
      inAck := true.B
    } .otherwise {
      inAck := false.B
    }
  } .otherwise {
    inReady := false.B
    inAck := false.B
  }
// out
  when(!empty) {
    // Ackされてないときは保持
    when(io.outAck) {
      when(io.outReady) {
        outData := mem.read(outPtrNext) // outPtr上は無効データ
        outPtr := outPtrNext
        outValid := true.B
      } .otherwise {
        // 次に出せるデータがないので店じまい
        outData := 0.U
        outValid := false.B
      }
    }
  } .otherwise {
    // Ack以外は保持
    when(io.outAck) {
      outData := 0.U
      outValid := false.B
    }
  }
}

object Fifo extends App {
  chisel3.Driver.execute(args,()=>new Fifo(8, 4))
}