package bf

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class DebugAccessPortSpec extends ChiselFlatSpec {
  def calcDuration(freq: Double, baud: Double): Int = {
    (freq / baud).toInt
  }

  "DAP" should "Hello world!" in {
    val src = ">+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.[-]>++++++++[<++++>-]<.>+++++++++++[<+++++>-]<.>++++++++[<+++>-]<.+++.------.--------.[-]>++++++++[<++++>-]<+.[-]++++++++++."
    val expect = "Hello world!"
    val freq = 50e6
    val baud = 115200
    val duration = calcDuration(freq, baud)
    val captureFreq = 25e6
    val incCount = (freq / captureFreq).toInt
    val average = 2
    val swDelay = (incCount * average * 1.1).toInt

    val result = Driver(() => new DebugAccessPort(freq = freq, baud = baud, captureFreq = captureFreq, averageWidth = average)) {
      c => new PeekPokeTester(c) {
        // initialize
        println(s"[Initialize]")
        poke(c.io.uartRx, true.B)
        poke(c.io.switches(0), false.B) // program
        poke(c.io.switches(1), false.B) // run(edge: L->H)
        step(swDelay)

        // write program
        println(s"[Start Program]")
        poke(c.io.switches(0), true.B)
        step(swDelay)

        for(d <- src) {
          println(s"[Write Program] Data:$d")
          val sendData = Seq(
            false, // startbit
            (d & 0x01) != 0x00,
            (d & 0x02) != 0x00,
            (d & 0x04) != 0x00,
            (d & 0x08) != 0x00,
            (d & 0x10) != 0x00,
            (d & 0x20) != 0x00,
            (d & 0x40) != 0x00,
            (d & 0x80) != 0x00,
            true, // stopbit
          )
          for(s <- sendData) {
            poke(c.io.uartRx, s.B)
            step(duration)
          }
        }
        // ready
        poke(c.io.switches(0), false.B)
        step(swDelay)

        // run
        println(s"[Run]")
        poke(c.io.switches(1), true.B) // run(edge: L->H)
        step(1000)
        while(peek(c.io.leds(3)) == BigInt(0)) { // no halted
          step(1)
        }

      }
    }
  }
}
