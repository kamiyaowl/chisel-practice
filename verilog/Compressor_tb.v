`timescale 1ns/1ns

module tb();
    localparam DELAY = 10;
    localparam POINT_DELAY = 10000;
    localparam RATE_DELAY = 100000;

    reg CLK = 0;
    reg RST = 0;
    reg signed [31:0] in_data = 32'sd0;
    wire signed [31:0] out_data;
    reg signed [31:0] point = 32'sd0;
    reg signed [31:0] rate = 32'sd0;

    Compressor d(
        CLK,
        RST,
        in_data,
        out_data,
        point,
        rate
    );

    initial begin
        CLK = 0;
        forever #DELAY CLK = !CLK;
    end

    initial begin
        point = 32'sd0;
        forever #POINT_DELAY point = $signed(point) + $signed(32'sd100);
    end
    initial begin
        rate = 32'sd0;
        forever #RATE_DELAY rate = $signed(rate) + $signed(32'sd1);
    end

    initial begin
        RST = 1;
        #100 RST = 0;
    end

    always @ (posedge CLK) begin
        if (RST == 1) begin
            in_data <= 32'sd0;
        end else begin
            in_data <= $signed(in_data) + $signed(32'sd11);
        end
    end

    initial begin
        $dumpfile("Compressor.vcd");
        $dumpvars(0, CLK);
        $dumpvars(0, RST);
        $dumpvars(0, in_data);
        $dumpvars(0, out_data);
        $dumpvars(0, point);
        $dumpvars(0, rate);

        #1000000 $finish();
    end
endmodule