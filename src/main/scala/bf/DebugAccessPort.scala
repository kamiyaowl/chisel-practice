package bf

import chisel3._

// Debug Access付きTopModule
class DebugAccessPort(
   // bf core
   instMemWidth: Int = 16, stackMemWidth: Int = 16, branchStackMemWidth: Int = 4,
   // uart
   freq: Double = 100e6, baud: Double = 9600,
   // fifo
   depthWidth: Int = 4
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
    val buttons = Input(UInt(4.W)) // D9,C9,B9,B8(push buttons, active high)
    val switches = Input(UInt(4.W)) // A8,C11,C10,A10

    val leds = Output(UInt(4.W)) // H5,J5,T9,T10(green leds)
    val triLed0 = Output(UInt(3.W)) // G6,F6,E1(full color LED)
    val triLed1 = Output(UInt(3.W)) // G3,J4,G4full color LED)
    val triLed2 = Output(UInt(3.W)) // J3,J2,H4(full color LED)
    val triLed3 = Output(UInt(3.W)) // K1,H6,K2(full color LED)
  })

  val uart = new UartTxRx(freq, baud)
  val bf = new BrainfuckProcessor(instMemWidth, stackMemWidth, branchStackMemWidth)
  val fifoDapToBf = new Fifo(8, depthWidth)
  val fifoBfToDap = new Fifo(8, depthWidth)

  // physical system control
  val program = RegInit(Bool(), false.B)
  program := io.buttons(0)
  val run1 = RegInit(Bool(), false.B)
  val run2 = RegInit(Bool(), false.B)
  val run3 = RegInit(Bool(), false.B)

  // status indicator
  // 合成時にはset_false_path注釈をつけたほうがいいかも
  val statusInst = RegInit(UInt(8.W), 0.U)
  statusInst := bf.io.inst
  io.leds(0) := program
  io.leds(1) <> uart.io.txActive
  io.leds(2) <> uart.io.rxActive
  io.leds(3) <> bf.io.halted
  io.triLed0 <> statusInst(2,0)
  io.triLed1 <> statusInst(5,3)
  io.triLed2 <> statusInst(7,6)
  io.triLed3 <> bf.io.errorCode

  // physicall -> uart
  uart.io.tx <> io.uartTx
  uart.io.rx <> io.uartRx

  // uart -> dap
  val fifoUartToDap = new Fifo(8, depthWidth)
  uart.io.rxData <> fifoUartToDap.io.inData
  uart.io.rxReady <> fifoUartToDap.io.inReady
  uart.io.rxValid <> fifoUartToDap.io.inValid
  uart.io.rxAck <> fifoUartToDap.io.inAck
  // dap -> uart
  val fifoDapToUart = new Fifo(8, depthWidth)
  uart.io.txData <> fifoDapToUart.io.outData
  uart.io.txReady <> fifoDapToUart.io.outReady
  uart.io.txValid <> fifoDapToUart.io.outValid
  uart.io.txAck <> fifoDapToUart.io.outAck
}

object DebugAccessPort extends App {
  chisel3.Driver.execute(args,()=>new DebugAccessPort())
}