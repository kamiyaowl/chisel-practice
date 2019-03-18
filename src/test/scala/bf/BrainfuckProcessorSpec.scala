package bf

package audio

import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class BrainfuckProcessorSpec extends FlatSpec with Matchers {
  "Brainfuck" should "Program Data and stdout 'ABC'" in {
    val src = "><><+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.+.+.><><"
    val dst = "ABC"
    var stdoutList = "" :: Nil

    val result = Driver(() => new BrainfuckProcessor()) {
      c => new PeekPokeTester(c) {
        // initialize
        poke(c.io.run, false.B)
        poke(c.io.program, false.B)
        poke(c.io.programAddr, 0.U)
        poke(c.io.programData, 0.U)
        poke(c.io.programValid, false.B)
        poke(c.io.stdinData, 'X'.U)
        poke(c.io.stdinValid, false.B)
        poke(c.io.stdoutReaady, false.B)
        poke(c.io.stdoutAck, false.B)
        step(10)
        // initialize

        println(s"[initialized] [Program] inst:${peek(c.io.inst)} pc:${peek(c.io.pc)} halted:${peek(c.io.halted)}")
        println(s"\t[Stack]  data:${peek(c.io.stackData)} ptr:${peek(c.io.stackPtr)}")
        println(s"\t[Branch] data:${peek(c.io.branchStackData)} ptr:${peek(c.io.branchStackPtr)}")
        println(s"\t[stdout] data:${peek(c.io.stdoutData)} valid:${peek(c.io.stdoutValid)}")

        // program data
        for(i <- 0 until src.length) {
          poke(c.io.program, true.B)
          poke(c.io.programAddr, i.U)
          poke(c.io.programData, src(i))
          poke(c.io.programValid, true.B)
          step(1)
          println(s"[Write Program][$i] addr:${peek(c.io.programAddr)} data:${peek(c.io.programData).charValue} stdout:${peek(c.io.stdoutData)}")
        }
        poke(c.io.program, false.B)
        poke(c.io.programAddr, 0.U)
        poke(c.io.programData, 0.U)
        poke(c.io.programValid, false.B)
        step(10)
        // program data

        // run (stdoutは常に受けられるようにする)
        poke(c.io.run, true.B)
        poke(c.io.stdoutReaady, true.B)
        poke(c.io.stdoutAck, true.B)
        step(3) // 3cyc以上入れないとトリガがかからないのでhalted解除されない
        // run

        println(s"[-1] [Program] inst:${peek(c.io.inst)} pc:${peek(c.io.pc)} halted:${peek(c.io.halted)}")
        println(s"\t[Stack]  data:${peek(c.io.stackData)} ptr:${peek(c.io.stackPtr)}")
        println(s"\t[Branch] data:${peek(c.io.branchStackData)} ptr:${peek(c.io.branchStackPtr)}")
        println(s"\t[stdout] data:${peek(c.io.stdoutData)} valid:${peek(c.io.stdoutValid)}")

        // monitor
        var step = 0
        while(peek(c.io.halted) == BigInt(0) && (step < src.length * 2)) { // 無限ループするときのデバッグ用に追加
          println(s"[$step] [Program] inst:${peek(c.io.inst).charValue} pc:${peek(c.io.pc)} halted:${peek(c.io.halted)}")
          step(1) // async memにしたら合成上2cycになった？

          println(s"\t[Stack]  data:${peek(c.io.stackData)} ptr:${peek(c.io.stackPtr)}")
          println(s"\t[Branch] data:${peek(c.io.branchStackData)} ptr:${peek(c.io.branchStackPtr)}")
          println(s"\t[stdout] data:${peek(c.io.stdoutData)} valid:${peek(c.io.stdoutValid)}")
          if (peek(c.io.stdoutValid) > BigInt(0)) {
            stdoutList = stdoutList :+ s"${peek(c.io.stdoutData).charValue}"
            println(s"\t\t[current stdout] ${stdoutList.mkString}")
          }
          step = step + 1
        }
        println(s"[result] stdout:${stdoutList.mkString}")
      }
    }
    println(s"[result] stdout:${stdoutList.mkString}")
    assert(result)
    dst.equals(stdoutList.mkString)
  }
}
