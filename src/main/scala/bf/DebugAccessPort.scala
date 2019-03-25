package bf

import chisel3._

// Debug Access付きTopModule
class DebugAccessPort(
   // bf core
   instMemWidth: Int = 14, stackMemWidth: Int = 10, branchStackMemWidth: Int = 4,
   // uart
   freq: Double = 50e6, baud: Double = 115200,
   // fifo
   depthWidth: Int = 4,
   // unti chattering
   captureFreq: Double = 100, averageWidth: Int = 8, isPositive: Boolean = true
   ) extends Module {
  // for Arty A7
  val io = IO(new Bundle{
    // clock, resetは自動生成される方をボードから供給させる
    // clk: E3(100MHz)
    // reset: any(!CK_RST C2, !DTR)...

    // host interfaace
    val uartTx = Output(Bool()) // D10(to FT2232 RXD)
    val uartRx = Input(Bool()) // A9(from FT2232 TXD)

    // !!! Arty A7 Hardware !!!
    // val buttons = Input(UInt(4.W)) // D9,C9,B9,B8(push buttons, active high)
    // 0-program, 1-run, 2-nc, 3-nc(topでreset)
    val switches = Input(Vec(4, Bool())) // A8,C11,C10,A10,

    val leds = Output(Vec(4, Bool())) // H5,J5,T9,T10(green leds)
    val triLed0 = Output(UInt(3.W)) // G6,F6,E1(full color LED)
    val triLed1 = Output(UInt(3.W)) // G3,J4,G4full color LED)
    val triLed2 = Output(UInt(3.W)) // J3,J2,H4(full color LED)
    val triLed3 = Output(UInt(3.W)) // K1,H6,K2(full color LED)
  })
  val uart = Module(new UartTxRx(freq, baud))
  val bf = Module(new BrainfuckProcessor(instMemWidth, stackMemWidth, branchStackMemWidth))

  // physical system control
  // val chatterButton0 = new UntiChatter(freq, captureFreq, averageWidth, isPositive)
  val chatterProgram = Module(new UntiChatter(freq, captureFreq, averageWidth, isPositive))
  val program = Wire(Bool())
  io.switches(0) <> chatterProgram.io.din
  program <> chatterProgram.io.dout
  bf.io.program <> program
  val chatterRun = Module(new UntiChatter(freq, captureFreq, averageWidth, isPositive))
  val run = Wire(Bool())
  io.switches(1) <> chatterRun.io.din
  run <> chatterRun.io.dout
  bf.io.run <> run

  // status indicator
  // 合成時にはset_false_path注釈をつけたほうがいいかも
  val statusInst = RegInit(UInt(8.W), 0.U) // 流石に遅いと嫌なのでラッチしてしまう
  statusInst := bf.io.inst
  io.leds(0) <> program
  io.leds(1) <> run
  io.leds(2) <> bf.io.stdoutValid // とくに思いつかなかったのでUART送信をみとく
  io.leds(3) <> bf.io.halted
  io.triLed0 <> statusInst(2,0)
  io.triLed1 <> statusInst(5,3)
  io.triLed2 <> statusInst(7,6)
  io.triLed3 <> bf.io.errorCode

  // physicall -> uart
  uart.io.tx <> io.uartTx
  uart.io.rx <> io.uartRx

  // uart -> bf
  // programモードだった場合は、program側にのみデータが行くように
  // それ以外の場合は、stdinにデータが行くように
  val fifoUartToBf = Module(new Fifo(8, depthWidth))
  uart.io.rxData <> fifoUartToBf.io.inData
  uart.io.rxReady <> fifoUartToBf.io.inReady
  uart.io.rxValid <> fifoUartToBf.io.inValid
  uart.io.rxAck <> fifoUartToBf.io.inAck

  bf.io.programData <> fifoUartToBf.io.outData
  bf.io.stdinData <> fifoUartToBf.io.outData // dataは共通で兵器
  bf.io.programValid := Mux(program, fifoUartToBf.io.outValid, false.B)
  bf.io.stdinValid := Mux(!program, fifoUartToBf.io.outValid, false.B) // program時は封じておく
  fifoUartToBf.io.outReady := Mux(program, bf.io.programReady, bf.io.stdinReady)
  fifoUartToBf.io.outAck := Mux(program, bf.io.programAck, bf.io.stdinAck) // これが大事

  // bf -> uart
  val fifoBfToUart = Module(new Fifo(8, depthWidth))
  uart.io.txData <> fifoBfToUart.io.outData
  uart.io.txReady <> fifoBfToUart.io.outReady
  uart.io.txValid <> fifoBfToUart.io.outValid
  uart.io.txAck <> fifoBfToUart.io.outAck

  bf.io.stdoutData <> fifoBfToUart.io.inData
  bf.io.stdoutReady <> fifoBfToUart.io.inReady
  bf.io.stdoutValid <> fifoBfToUart.io.inValid
  bf.io.stdoutAck <> fifoBfToUart.io.inAck
}

object DebugAccessPort extends App {
  chisel3.Driver.execute(Array("--target-dir", "bf"),()=>new DebugAccessPort())
}