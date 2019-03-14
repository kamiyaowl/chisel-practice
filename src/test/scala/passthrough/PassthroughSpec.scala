import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class PassthroughSpec extends FlatSpec with Matchers {
  "Passthrough" should "input == output" in {
    val result = Driver(() => new Passthrough()) {
      c => new PeekPokeTester(c) {
        poke(c.io.in, 0)
        expect(c.io.out, 0)
        poke(c.io.in, 255)
        expect(c.io.out, 255)
      }
    }
    println(result)
    assert(result)
    true
  }
}
