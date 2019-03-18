package bf

import chisel3._
import chisel3.util._
import scala.math.pow
class BrainfuckProcessor(instMemWidth: Int = 16, stackMemWidth: Int = 16, branchDepth: Int = 32) extends Module {
  val io = IO(new Bundle {
    // system
    val run = Input(Bool()) // 実行時のトリガ
    // external programming
    val program = Input(Bool()) // trueでプログラム書き込みモードへ
    val programAddr = Input(UInt(32.W)) // 入力
    val programData = Input(UInt(8.W)) // 入力
    val programValid = Input(Bool()) // 入力内容が有効
    val programRd = Output(Bool()) // 内容を読んだらtrue
    // for status
    val pc = Output(UInt(32.W)) // program counter
    val inst = Output(UInt(8.W)) // 現在実行中の命令
    val stackPtr = Output(UInt(32.W))
    val stackData = Output(UInt(8.W))
    val halted = Output(Bool()) // program停止時にtrue

    // stdin FIFO in
    val stdinData = Input(UInt(8.W)) // 標準入力
    val stdinValid = Input(Bool()) // 入力内容が有効
    val stdinReady = Output(Bool()) // 内容を読める状況
    val stdinAck = Output(Bool()) // 内容を読んだらtrue
    // stdout FIFO out
    val stdoutData = Output(UInt(8.W))
    val stdoutValid = Output(Bool()) // stdoutが有効データならtrue
    val stdoutReaady = Input(Bool()) // つないだ先が読み出してくれたらtrue
    val stdoutAck = Input(Bool()) // つないだ先が読み出してくれたらtrue
  })
  // output
  val programRd = RegInit(Bool(), false.B)
  io.programRd := programRd
  val halted = RegInit(Bool(), true.B)
  io.halted := halted;
  val stdinReady = RegInit(Bool(), false.B)
  io.stdinReady := stdinReady
  val stdinAck = RegInit(Bool(), true.B)
  io.stdinAck := stdinAck
  val stdoutData = RegInit(UInt(8.W), false.B)
  io.stdoutData := stdoutData
  val stdoutValid = RegInit(Bool(), false.B)
  io.stdoutValid := stdoutValid
  // Program memory
  val instMemSize = pow(2, instMemWidth).asInstanceOf[Int]
  val instMem = SyncReadMem(instMemSize, UInt(8.W))
  // Stack memory
  val stackMemSize = pow(2, stackMemWidth).asInstanceOf[Int]
  val stackMem = SyncReadMem(stackMemSize, UInt(8.W))
  val stackPtr = RegInit(UInt(32.W), 0.U)
  val stackData = RegInit(UInt(8.W), 0.U)
  io.stackPtr := stackPtr
  io.stackData := stackData

  // FIFO後処理
  when(stdinAck) { // メイン側はAckが下がるまで連射しない
    stdinAck := RegNext(false.B)
  }
  when(stdoutValid) { // メイン側はvalidが下がるまで次を出力しないので
    when(io.stdoutAck) {
      stdoutData := RegNext(0.U)
      stdoutValid := RegNext(false.B)
    }
  }
  // メイン制御
  val inst = RegInit(UInt(8.W), 0.U)
  val pc = RegInit(UInt(32.W), 0.U)
  io.inst := inst
  io.pc := pc
  when(!halted) {
    // 初回の命令はロードされている状態でスタート
    switch(inst) {
      is(0.U) {
        halted := true.B
      }
      is('>'.U) {
        pc := RegNext(pc + 1.U)
        inst := instMem.read(pc + 1.U)
        stackPtr := RegNext(stackPtr + 1.U)
        stackData := RegNext(stackData + 1.U)
      }
      is('<'.U) {
        pc := RegNext(pc + 1.U)
        inst := instMem.read(pc + 1.U)
        stackPtr := RegNext(stackPtr - 1.U)
        stackData := RegNext(stackData - 1.U)
      }
      is('+'.U) {
        stackMem.write(stackPtr, stackData + 1.U)

        pc := RegNext(pc + 1.U)
        inst := instMem.read(pc + 1.U)
        //       stackPtr := RegNext(stackPtr)
        stackData := RegNext(stackData + 1.U)
      }
      is('-'.U) {
        stackMem.write(stackPtr, stackData - 1.U)

        pc := RegNext(pc + 1.U)
        inst := instMem.read(pc + 1.U)
        //        stackPtr := RegNext(stackPtr)
        stackData := RegNext(stackData - 1.U)
      }
      is('.'.U) {
        // FIFOが受付可能でかつこちらがデータを出していないとき
        when(io.stdoutReaady && !stdoutValid) {
          // 標準出力に追加
          stdoutData := RegNext(stackData)
          stdoutValid := RegNext(true.B)

          pc := RegNext(pc + 1.U)
          inst := instMem.read(pc + 1.U)
          //          stackPtr := RegNext(stackPtr)
          //          stackData := RegNext(stackData)
        }
      }
      is(','.U) {
        // FIFOが受付可能でかつこちらがデータを出していないとき
        when(io.stdinValid && !stdinAck) {
          stdinAck := RegNext(true.B) // 次のタイミングで下げる
          stackMem.write(stackPtr, io.stdinData)
          // 標準出力に追加
          pc := RegNext(pc + 1.U)
          inst := instMem.read(pc + 1.U)
          //            stackPtr := RegNext(stackPtr)
          stackData := RegNext(io.stdinData)
        }
      }
    }
  } .otherwise {
    // プログラムを初期位置へ
    pc := RegNext(0.U)
    inst := instMem.read(0.U)
    stackPtr := RegNext(0.U)
    stackData := stackMem.read(0.U)
  }
  // プログラム開始制御
  val run = RegInit(Bool(), false.B)
  val run2 = RegInit(Bool(), false.B)
  run := RegNext(io.run)
  run2 := RegNext(run)
  when(halted) {
    when((!run2 && run) && !io.program) {
      halted := RegNext(false.B)
    }
  }
  // FIFOから読み出してメモリを書き換える
  when(halted && io.program && io.programValid) {
    programRd := RegNext(true.B)
    instMem.write(io.programAddr, io.programData)
  } .otherwise {
    programRd := RegNext(false.B)
  }

}
object BrainfuckProcessor extends App {
  chisel3.Driver.execute(args,()=>new BrainfuckProcessor(16))
}