package bf

import chisel3._
import chisel3.util._
import scala.math.pow

//noinspection ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses
// 命令 +-><,.
// 無視される \r\nxX[space]
// halt #
class BrainfuckProcessor(instMemWidth: Int = 16, stackMemWidth: Int = 16, branchStackMemWidth: Int = 4) extends Module {
  val io = IO(new Bundle {
    // system
    val run = Input(Bool()) // 実行時のトリガ
    // external programming
    val program = Input(Bool()) // trueでプログラム書き込みモードへ
    val programData = Input(UInt(8.W)) // 入力
    val programValid = Input(Bool()) // 入力内容が有効
    val programAck = Output(Bool()) // 内容を読んだらtrue
    // for status
    val pc = Output(UInt(instMemWidth.W)) // program counter
    val inst = Output(UInt(8.W)) // 現在実行中の命令
    val stackPtr = Output(UInt(stackMemWidth.W))
    val stackData = Output(UInt(8.W))
    val branchStackPtr = Output(UInt(branchStackMemWidth.W))
    val branchStackData = Output(UInt(instMemWidth.W))
    val halted = Output(Bool()) // program停止時にtrue

    // stdin FIFO in
    val stdinData = Input(UInt(8.W)) // 標準入力
    val stdinValid = Input(Bool()) // 入力内容が有効
    val stdinReady = Output(Bool()) // 内容を読める状況
    val stdinAck = Output(Bool()) // 内容を読んだらtrue
    // stdout FIFO out
    val stdoutData = Output(UInt(8.W))
    val stdoutValid = Output(Bool()) // stdoutが有効データならtrue
    val stdoutReady = Input(Bool()) // つないだ先が読み出してくれたらtrue
    val stdoutAck = Input(Bool()) // つないだ先が読み出してくれたらtrue
  })
  // output
  val programAck = RegInit(Bool(), false.B)
  io.programAck := programAck
  val halted = RegInit(Bool(), true.B)
  io.halted := halted
  val stdinReady = RegInit(Bool(), false.B)
  io.stdinReady := stdinReady
  val stdinAck = RegInit(Bool(), true.B)
  io.stdinAck := stdinAck
  val stdoutData = RegInit(UInt(8.W), false.B)
  io.stdoutData := stdoutData
  val stdoutValid = RegInit(Bool(), false.B)
  io.stdoutValid := stdoutValid
  // Program memory
  val instMemSize: Int = pow(2, instMemWidth).asInstanceOf[Int]
  val instMem = Mem(instMemSize, UInt(8.W))
  val programAddr = RegInit(UInt(instMemWidth.W), 0.U)
  // Stack memory
  val stackMemSize: Int = pow(2, stackMemWidth).asInstanceOf[Int]
  val stackMem = Mem(stackMemSize, UInt(8.W))
  val stackPtr = RegInit(UInt(stackMemWidth.W), 0.U)
  val stackData = RegInit(UInt(8.W), 0.U)
  io.stackPtr := stackPtr
  io.stackData := stackData
  // BranchStack memory
  val branchStackMemSize: Int = pow(2, branchStackMemWidth).asInstanceOf[Int]
  val branchStackMem = Mem(branchStackMemSize, UInt(instMemWidth.W))
  val branchStackPtr = RegInit(UInt(branchStackMemWidth.W), 0.U)
  val branchStackData = RegInit(UInt(instMemWidth.W), 0.U)
  io.branchStackPtr := branchStackPtr
  io.branchStackData := branchStackData

  // FIFO後処理
  when(stdinAck) { // メイン側はAckが下がるまで連射しない
    //noinspection ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses
    stdinAck := (false.B)
  }
  when(stdoutValid) { // メイン側はvalidが下がるまで次を出力しないので
    when(io.stdoutAck) {
      stdoutData := (0.U)
      stdoutValid := (false.B)
    }
  }
  // メイン制御
  val branchJump = RegInit(Bool(), false.B) // '['でbranchを抜ける場合
  val branchJumpNest = RegInit(UInt(branchStackMemWidth.W), 0.U) // branchJump中に見かけた'[',']'のネスト数をメモ
  val inst = RegInit(UInt(8.W), 0.U)
  val pc = RegInit(UInt(instMemWidth.W), 0.U)
  io.inst := inst
  io.pc := pc

  when(!halted) {
    when(branchJump) {
      // '[' -> ']'への移動は優先順位が高い
      pc := (pc + 1.U)
      inst := instMem.read(pc + 1.U)
      switch(inst) {
        is(0.U, '#'.U) { // \0か#挿入で停止できるようにした
          halted := true.B
        }
        is('['.U) {
          branchJumpNest := (branchJumpNest + 1.U)
        }
        is(']'.U) {
          when(branchJumpNest > 0.U) {
            branchJumpNest := (branchJumpNest - 1.U)
          } .otherwise {
            // おわり
            branchJump := (false.B)
            branchJumpNest := (0.U)
          }
        }
      }
    } .otherwise {
      // 初回の命令はロードされている状態でスタート
      switch(inst) {
        is(0.U, '#'.U) {
          halted := true.B
        }
        is('>'.U) {
          pc := (pc + 1.U)
          inst := instMem.read(pc + 1.U)
          stackPtr := (stackPtr + 1.U)
          stackData := stackMem.read(stackPtr + 1.U)
        }
        is('<'.U) {
          pc := (pc + 1.U)
          inst := instMem.read(pc + 1.U)
          stackPtr := (stackPtr - 1.U)
          stackData := stackMem.read(stackPtr - 1.U)
        }
        is('+'.U) {
          stackMem.write(stackPtr, stackData + 1.U)

          pc := (pc + 1.U)
          inst := instMem.read(pc + 1.U)
          stackData := (stackData + 1.U)
        }
        is('-'.U) {
          stackMem.write(stackPtr, stackData - 1.U)

          pc := (pc + 1.U)
          inst := instMem.read(pc + 1.U)
          stackData := (stackData - 1.U)
        }
        is('.'.U) {
          // FIFOが受付可能でかつこちらがデータを出していないとき
          when(io.stdoutReady && !stdoutValid) {
            // 標準出力に追加
            //noinspection ScalaUnnecessaryParentheses,ScalaUnnecessaryParentheses
            stdoutData := (stackData)
            stdoutValid := (true.B)

            pc := (pc + 1.U)
            inst := instMem.read(pc + 1.U)
          }
        }
        is(','.U) {
          // FIFOが受付可能でかつこちらがデータを出していないとき
          when(io.stdinValid && !stdinAck) {
            stdinAck := (true.B) // 次のタイミングで下げる
            stackMem.write(stackPtr, io.stdinData)
            // 標準出力に追加
            pc := (pc + 1.U)
            inst := instMem.read(pc + 1.U)
            stackData := (io.stdinData)
          }
        }
        is('['.U) {
          when(stackData === 0.U) {
            // 対応する] までJump
            branchJump := (true.B)
            branchJumpNest := (0.U)
            pc := (pc + 1.U)
            inst := instMem.read(pc + 1.U)
          } .otherwise {
            // branchStackに現在位置を追加して継続
            branchStackMem.write(branchStackPtr, pc)
            pc := (pc + 1.U)
            inst := instMem.read(pc + 1.U)
            branchStackPtr := (branchStackPtr + 1.U)
            branchStackData := (pc) // すぐに読み出せるように最上位の値を格納する
          }
        }
        is(']'.U) {
          // '['の場所まで戻る
          pc := (branchStackData)
          inst := ('['.U)
          // stack popしとく
          when(branchStackPtr > 1.U) {
            branchStackPtr := (branchStackPtr - 1.U)
            branchStackData := branchStackMem.read(branchStackPtr - 2.U) // stackなのでptr-1にデータが有る
          }.otherwise {
            // 1, 0のときにこの命令が来た場合、結果としてstack  clearと等価
            branchStackPtr := (0.U)
            branchStackData := (0.U)
          }
        }
        is('\r'.U, '\n'.U, ' '.U, 'X'.U, 'x'.U) {
          // 余計な文字は無視
          pc := (pc + 1.U)
          inst := instMem.read(pc + 1.U)
        }
      }
    }
  } .otherwise {
    // プログラムを初期位置へ
    branchJump := (false.B)
    branchJumpNest := (0.U)
    pc := (0.U)
    inst := instMem.read(0.U)
    stackPtr := (0.U)
    stackData := stackMem.read(0.U)
    branchStackPtr := (0.U)
    branchStackData := (0.U) // !!!!便宜上 ptr - 1の値を持たせる
  }
  // プログラム開始制御
  val run = RegInit(Bool(), false.B)
  val run2 = RegInit(Bool(), false.B)
  run := (io.run)
  run2 := (run)
  when(halted) {
    when((!run2 && run) && !io.program) {
      halted := (false.B)
    }
  }
  // 非プログラム状態になければAddrは戦闘に戻しておく
  when(!io.program || !halted) {
    programAddr := 0.U
  } .otherwise {
    // 有効データが来ていれば読み出してメモリを書き換える
    when(io.programValid) {
      programAck := (true.B)
      instMem.write(programAddr, io.programData)
      programAddr := programAddr + 1.U // アドレスはインクリしておく
    } .otherwise {
      programAck := (false.B)
    }
  }

}
object BrainfuckProcessor extends App {
  chisel3.Driver.execute(args,()=>new BrainfuckProcessor())
}