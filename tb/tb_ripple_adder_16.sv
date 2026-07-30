`timescale 1ns/1ps

module tb_ripple_adder_16;

    logic [15:0] A;
    logic [15:0] B;
    logic Cin;

    logic [15:0] Sum;
    logic Cout;

    ripple_adder_16 DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("waves/ripple_adder_16.vcd");
        $dumpvars(0, tb_ripple_adder_16);

        A = 16'd0;
        B = 16'd0;
        Cin = 0;
        #10;

        A = 16'd25;
        B = 16'd17;
        Cin = 0;
        #10;

        A = 16'd1000;
        B = 16'd2500;
        Cin = 0;
        #10;

        A = 16'hFFFF;
        B = 16'd1;
        Cin = 0;
        #10;

        A = 16'h1234;
        B = 16'h4321;
        Cin = 0;
        #10;

        A = 16'd32768;
        B = 16'd32768;
        Cin = 0;
        #10;

        $finish;
    end

    initial begin
        $monitor(
            "Time=%0t A=%0d B=%0d Cin=%b Sum=%0d Cout=%b",
            $time, A, B, Cin, Sum, Cout
        );
    end

endmodule