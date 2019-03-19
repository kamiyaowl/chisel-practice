package bf

import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import scala.math.{ log10, ceil }

class UartTxRxSpec extends ChiselFlatSpec {
  def calcDuration(freq: Double, baud: Double): Int = {
    (freq / baud).toInt
  }

  "UartTxRx" should "Rx Data" in {
    val freq = 10e6
    val baud = 115200
    val duration = calcDuration(freq, baud)
    val data = "Hello."
    var dst = "" :: Nil

    val result = Driver(() => new UartTxRx(freq, baud)) {
      c => new PeekPokeTester(c) {
        // init
        poke(c.io.rx, true.B)
        poke(c.io.rxReady, false.B)
        poke(c.io.rxAck, false.B)
        poke(c.io.txData, 0.U)
        poke(c.io.txValid, false.B)
        step(5)
        // init

        // rx data
        poke(c.io.rxReady, true.B)
        poke(c.io.rxAck, false.B)
        step(5)
        for(d <- data) {
          println(s"\t[TEST] Data:$d")
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
            poke(c.io.rx, s.B)
            println(s"\t[TEST] rx:$s")
            for(i <- 0 until duration) {
              step(1)
              if (peek(c.io.rxValid) > BigInt(0)) {
                dst = dst :+ s"${peek(c.io.rxData).charValue}"
                println(s"\t\t[TEST] [RX] ${peek(c.io.rxData)}(${peek(c.io.rxData).charValue})} dst:${dst.mkString}")
                poke(c.io.rxAck, true.B)
              } else {
                poke(c.io.rxAck, false.B)
              }
            }
          }
        }
      }
    }
    println(s"[result] dst:${dst.mkString}")
    assert(result)
    data.equals(dst.mkString)
  }

}
