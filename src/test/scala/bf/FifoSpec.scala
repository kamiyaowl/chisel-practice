package bf

import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class FifoSpec extends ChiselFlatSpec {
  "Fifo" should "Simple Behavior Test" in {
    val din = 0x0 to 0xff
    var dout = Seq[Int]()
    val dequeueDelay = 4
    val result = Driver(() => new Fifo(8, 4)) {
      c =>  new PeekPokeTester(c) {
        // init
        poke(c.io.inData, 0.U)
        poke(c.io.inValid, false.B)
        poke(c.io.outReady, false.B)
        poke(c.io.outAck, false.B)
        step(5)
        // enqueu and dequeue
        poke(c.io.outReady, true.B)
        poke(c.io.outReady, true.B)
        poke(c.io.outAck, false.B)
        step(1)
        var loop = 0
        for(d <- din) {
          println(s"din:${din.dropWhile(_ != d).mkString}")
          println(s"dout:${dout.mkString}")
          if (peek(c.io.inReady) == BigInt(0)) {
            println(s"\r[$loop] inReady == false")
            step(1)
          } else {
            println(s"\r[$loop] [enqueue] data:$d")
            poke(c.io.inData, d.U)
            poke(c.io.inValid, true.B)
          }
          // dequeueはDelay遅らせた後にやる
          if (loop > dequeueDelay) {
            if (peek(c.io.outValid) == BigInt(1)) {
              val data = peek(c.io.outData).toInt
              dout = dout :+ data
              println(s"\r[$loop] [dequeue] data:$data")
              poke(c.io.outAck, true.B) // 次のデータにしておく
            }
          }
          step(1)
          // 後処理
          poke(c.io.inData, d.U)
          poke(c.io.inValid, false.B)
          poke(c.io.outAck, false.B)
          loop = loop + 1
        }
        // 残ったデータをすべて吐き出す
        while(peek(c.io.outValid) == BigInt(1)) {
          val data = peek(c.io.outData).toInt
          dout = dout :+ data
          println(s"\r[out of loop] [dequeue] data:$data")
          poke(c.io.outAck, true.B) // 次のデータにしておく
          step(1)
        }
        println(dout.mkString(","))
      }
    }
    //
    assert(result)
    din.mkString.equals(dout.mkString)
  }

  "Fifo" should "Enqueue Full Test" in {
    val din = 0x0 to 0xff
    var dout = Seq[Int]()
    val dequeueDelay = 4
    val result = Driver(() => new Fifo(8, 4)) {
      c =>  new PeekPokeTester(c) {
        // init
        poke(c.io.inData, 0.U)
        poke(c.io.inValid, false.B)
        poke(c.io.outReady, false.B)
        poke(c.io.outAck, false.B)
        step(5)
        // enqueu and dequeue
        poke(c.io.outReady, true.B)
        poke(c.io.outReady, true.B)
        poke(c.io.outAck, false.B)
        step(1)
        var loop = 0
        for(d <- din) {
          println(s"din:${din.dropWhile(_ != d).mkString}")
          println(s"dout:${dout.mkString}")
          if (peek(c.io.inReady) == BigInt(0)) {
            println(s"\r[$loop] inReady == false")
            step(1)
          } else {
            println(s"\r[$loop] [enqueue] data:$d")
            poke(c.io.inData, d.U)
            poke(c.io.inValid, true.B)
          }
          // !!! Dequeueしない
          step(1)
          // 後処理
          poke(c.io.inData, d.U)
          poke(c.io.inValid, false.B)
          poke(c.io.outAck, false.B)
          loop = loop + 1
        }
        // 残ったデータをすべて吐き出す
        while(peek(c.io.outValid) == BigInt(1)) {
          val data = peek(c.io.outData).toInt
          dout = dout :+ data
          println(s"\r[out of loop] [dequeue] data:$data")
          poke(c.io.outAck, true.B) // 次のデータにしておく
          step(1)
        }
        println(dout.mkString(","))
      }
    }
    //
    assert(result)
    din.take(16 - 3).mkString.equals(dout.mkString)
  }

  "Fifo" should "Dequeue" in {
    val din = 0x0 to 0x4
    var dout = Seq[Int]()
    val dequeueDelay = 4
    val result = Driver(() => new Fifo(8, 4)) {
      c =>  new PeekPokeTester(c) {
        // init
        poke(c.io.inData, 0.U)
        poke(c.io.inValid, false.B)
        poke(c.io.outReady, false.B)
        poke(c.io.outAck, false.B)
        step(5)
        // enqueu and dequeue
        poke(c.io.outReady, true.B)
        poke(c.io.outReady, true.B)
        poke(c.io.outAck, false.B)
        step(1)
        var loop = 0
        for(d <- din) {
          println(s"din:${din.dropWhile(_ != d).mkString}")
          println(s"dout:${dout.mkString}")
          if (peek(c.io.inReady) == BigInt(0)) {
            println(s"\r[$loop] inReady == false")
            step(1)
          } else {
            println(s"\r[$loop] [enqueue] data:$d")
            poke(c.io.inData, d.U)
            poke(c.io.inValid, true.B)
          }
          // dequeueはDelay遅らせた後にやる
          if(peek(c.io.outValid) == BigInt(1)) {
            val data = peek(c.io.outData).toInt
            dout = dout :+ data
            println(s"\r[$loop] [dequeue] data:$data")
          }
          poke(c.io.outAck, true.B) // 次のデータにしておく
          step(1)
          // 後処理
          poke(c.io.inData, d.U)
          poke(c.io.inValid, false.B)
          poke(c.io.outAck, false.B)
          loop = loop + 1
        }
        // 残ったデータをすべて吐き出す
        while(peek(c.io.outValid) == BigInt(1)) {
          val data = peek(c.io.outData).toInt
          dout = dout :+ data
          println(s"\r[out of loop] [dequeue] data:$data")
          poke(c.io.outAck, true.B) // 次のデータにしておく
          step(1)
        }
        println(dout.mkString(","))
      }
    }
    //
    assert(result)
    din.mkString.equals(dout.mkString)
  }

}


