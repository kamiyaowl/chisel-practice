package audio

import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class DistortionSpec extends FlatSpec with Matchers {
  "Distortion" should "parametric full test" in {
    val result = Driver(() => new Distortion(32)) {
      c => new PeekPokeTester(c) {
        (-10000 to 10000) filter(_ % 1000 == 0) foreach { data_in =>
          (0 to 10000) filter(_ % 1000 == 0) foreach { data_point =>
            (0 to 100) foreach { data_rate => {
                poke(c.io.in, data_in)
                poke(c.io.point, data_point)
                poke(c.io.rate, data_rate)
                step(1)
                println(s"in:${data_in}, point:${data_point} shift:${data_rate} out:${peek(c.io.out)}")
                if (Math.abs(data_in) <= data_point || data_rate <= 0) {
                  expect(c.io.out, data_in)
                } else {
                  expect(c.io.out, ((Math.abs(data_in) - data_point) / data_rate + data_point) * (if (data_in < 0) -1 else 1))
                }
              }
            }
          }
        }
      }
    }
    assert(result)
    true
  }
}
