package bf

package audio

import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class BrainfuckProcessorSpec extends FlatSpec with Matchers {
  "Brainfuck" should "Hello world" in {
    val result = Driver(() => new BrainfuckProcessor(32)) {
      c => new PeekPokeTester(c) {
      }
    }
    assert(result)
    true
  }
}
