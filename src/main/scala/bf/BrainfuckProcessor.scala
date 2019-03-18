package bf

import chisel3._
import chisel3.util._
import scala.math.pow
class BrainfuckProcessor(instMemWidth: Int = 16) extends Module {
  val io = IO(new Bundle {
    // system
    val run = Input(Bool()) // falseでプログラム停止
    // external programming
    val program = Input(Bool()) // trueでプログラム書き込みモードへ
    val programData = Input(UInt(8.W)) // 入力
    val programValid = Input(Bool()) // 入力内容が有効
    val programRd = Output(Bool()) // 内容を読んだらtrue
    // for status
    val pc = Output(UInt(32.W)) // program counter
    val halted = Output(Bool()) // program停止時にtrue

    // stdin FIFO in
    val stdinData = Input(UInt(8.W)) // 標準入力
    val itdinValid = Input(Bool()) // 入力内容が有効
    val stdinRd = Output(Bool()) // 内容を読んだらtrue
    // stdout FIFO out
    val stdoutData = Output(UInt(8.W))
    val stdoutValid = Output(Bool()) // stdoutが有効データならtrue
    val stdoutRd = Input(Bool()) // つないだ先が読み出してくれたらtrue
  })
  // Program memory
  val instMemSize = pow(2, instMemWidth).asInstanceOf[Int]
  val instMem = SyncReadMem(instMemSize, UInt(8.W))
  val instMemAddr = Wire(UInt(32.W))
  val instMemIn = Wire(UInt(8.W))
  val instMemOut = Wire(UInt(8.W))
  val instMemRead = Wire(Bool())
  when(instMemRead) {
    instMemOut := instMem.read(instMemAddr, true.B)
  } .otherwise {
    instMem.write(instMemAddr, instMemIn)
    instMemOut := DontCare
  }

}
object BrainfuckProcessor extends App {
  chisel3.Driver.execute(args,()=>new BrainfuckProcessor())
}