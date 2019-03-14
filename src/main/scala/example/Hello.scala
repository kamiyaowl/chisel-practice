import chisel3._
import chisel3.core.UserModule

class MyPort extends Bundle{
  val A =  Input(Bool())
  val B =  Input(Bool())
  val C = Output(Bool())
  val D =  Input(Bool())
}
class Hello extends UserModule{
  val S = IO(new MyPort)
  val M = IO(Flipped(new MyPort))
  S<>M
  M.D := S.A | S.D
}
object Hello extends App{
  chisel3.Driver.execute(args,()=>new Hello)
}