package peripheral

import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class PassthroughSpec extends ChiselFlatSpec {
  "Passthrough(width=8)" should "input == output" in {
    val result = Driver(() => new Passthrough(8)) {
      c => new PeekPokeTester(c) {
        (0 to 0xff) foreach { v =>
//          println(s"input:${v}")
          poke(c.io.in, v)
          expect(c.io.out, v)
        }
      }
    }
    assert(result)
    true
  }
}
