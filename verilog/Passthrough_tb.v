`timescale 1ns/1ns
module tb();
    reg CLK = 0;
    reg RST = 0;
    reg [7:0] in_data = 8'd0;
    wire [7:0] out_data;

    Passthrough p(
        CLK,
        RST,
        in_data,
        out_data
    );

    initial begin
        CLK = 0;
        forever #10 CLK = !CLK;
    end

    initial begin
        RST = 1;
        #50 RST = 0;
    end

    always @ (posedge CLK) begin
        if (RST == 1) begin
            in_data <= 8'd0;
        end else begin
            in_data <= in_data + 8'd1;
        end
    end

    initial begin
        $dumpfile("Passthrough.vcd");
        $dumpvars(0, in_data);
        $dumpvars(0, out_data);

        #500 $finish();
    end
endmodule