package bf

import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class UntiChatterSpec extends ChiselFlatSpec {
  "UntiChatter" should "simple peek poke test" in {
    val sysFreq = 100e6
    val captureFreq = 100
    val incCount = (sysFreq / captureFreq).toInt
    val average = 8

    var success = true
    var measure = Seq[Boolean]()
    var ideal = Seq[Boolean]()
    val result = Driver(() => new UntiChatter(100e6, 100, 8, true)) {
      c => new PeekPokeTester(c) {
        def capture(expect: Boolean) {
          measure = measure :+ (peek(c.io.dout) > BigInt(0))
          ideal = ideal :+ expect
          println(s"current: ${peek(c.io.dout)}, ideal: ${expect} result: ${measure.mkString(",")}")
          if ((peek(c.io.dout) > BigInt(0)) != expect) {
            println("\tFail!")
            success = false
          }
        }

        poke(c.io.din, false.B)
        step(30) // 適当にリセット
        capture(false)
        // false固定されるはず
        for(i <- 0 until 8) {
          poke(c.io.din, true.B)
          step(incCount)
          capture(false)
        }
        // true
        for(i <- 0 until 8) {
          poke(c.io.din, true.B)
          step(incCount)
          capture(true)
        }
        // falseかな
        poke(c.io.din, false.B)
        step(incCount)
        capture(true) // 最初はtrue
        for(i <- 0 until 7) {
          poke(c.io.din, false.B)
          step(incCount)
          capture(false)
        }
        // falseかな
        for(i <- 0 until 8; j <- 0 until incCount) {
          poke(c.io.din, ((i + j) % 2 == 0).B)
          step(1)
          // println(s"[i=$i] [j=$j] din=${j % 2 == 0}")
          capture(false)
        }
      }
    }
    assert(result)
    println(measure.mkString(","))
    success
  }
}
