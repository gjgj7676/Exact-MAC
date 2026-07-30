`timescale 1ns/1ps

module tb_full_adder;

    logic A;
    logic B;
    logic Cin;

    logic Sum;
    logic Cout;

    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    
    initial begin

        $dumpfile("waves/full_adder.vcd");
        $dumpvars(0, tb_full_adder);

        $display("A B Cin | Sum Cout");
        $display("-------------------");

        for (int i = 0; i < 8; i++) begin
            {A, B, Cin} = i;
            #10;
            $display("%b %b %b |  %b    %b",
                     A, B, Cin, Sum, Cout);
        end

        $finish;
    end

endmodule