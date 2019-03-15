package libs

import chisel3._
import chisel3.core.withClockAndReset
import chisel3.util._

class SpiMaster extends Module {
  val io = IO(new Bundle {
    // external
    val cs = Output(Bool())
    val miso = Input(Bool())
    val mosi = Output(Bool())
    val sck = Output(Bool()) // freq = system clock / 2
    // internal
    val enable = Input(Bool()) // 開始する際にAssert, dinが有効であれば8bit送る
    val idle = Output(Bool()) // 送りきってdinのデータ街の際にAssert, enableをNegateされたら転送終了する
    // input fifo
    val din = Input(UInt(8.W)) // 転送するデータ
    val rd_req = Input(Bool()) // 転送するデータが準備完了時にAssert(== not empty)
    val rd_ack = Output(Bool()) // 転送するデータを読み取る場合にAssert
    // output fifo
    val dout = Output(UInt(8.W)) // 転送されてきたデータ
    val wr_req = Output(Bool()) // 転送されてきたデータが準備完了(== not empty)
    val wr_ack = Input(Bool()) // 外部で受信するFIFOが、doutのデータを受け取る際にAssert
  })
  // internal state
  val state_counter = Reg(UInt(6.W)) // idle, d[7] ~ d[0],
  val din_ff = Reg(UInt(8.W)) // internal -> din => mosi
  val dout_ff = Reg(UInt(8.W)) //  internal <- dout <= miso
  // flags
  val can_rd = io.enable && io.rd_req && io.idle // dinのデータを読み出して転送開始できるか
  val transfer = !io.idle && (state_counter < 17.U) // 転送中
  val complete = (state_counter == 17.U).B // 転送完了
  val done_wr = io.wr_req && io.wr_ack // doutのデータをホストが受け取ったか
  // logics
  def init() = {
    state_counter := 0.U
    din_ff := 0.U
    dout_ff := 0.U

    io.cs := true.B
    io.mosi := false.B
    io.sck := false.B
    io.idle := true.B

    io.rd_ack := false.B
    io.dout := 0.U
    io.wr_req := false.B
  }
  when(!io.enable) {
    init()
  } .otherwise {
    // WR FIFOの面倒は独立すべき
    when(done_wr) {
      // 書き込みデータが受け取られたのでクリア
      io.dout := 0.U
      io.wr_req := false.B
    }
    // 処理一式
    when(can_rd) {
      // 書き込みデータが準備できているので開始
      io.cs := 0.U
      state_counter := 0.U
      io.idle := false.B

      din_ff := io.din
      io.rd_ack := true.B
    }.elsewhen(transfer) {
      // 2/CLKでのクロック生成とデータ転送
      when(!state_counter(0)) {
        io.sck := false.B
        // MOSI: negedge and dataset
        io.mosi := din_ff(7)
        din_ff := (din_ff << 1)
        // MISO: negedge only
      }.otherwise {
        io.sck := true.B
        // MOSI: posedge only
        // MISO: capture data
        dout_ff := (dout_ff << 1) | (io.miso)
      }
      state_counter := state_counter + 1.U
    }.elsewhen(complete) {
      // すでに返したデータが受け取られていない場合のみまつ
      when(!io.wr_req) {
        io.dout := dout_ff
        io.wr_req := true.B
        // state clear
        state_counter := 0.U
        io.idle := true.B
      }
    } .otherwise {
      init()
    }
  }
}

object SpiMaster extends App {
  chisel3.Driver.execute(args,()=>new SpiMaster())
}