`timescale 1ns/1ps

module tb_half_adder;

    logic A;
    logic B;
    logic Sum;
    logic Cout;

    // Instantiate the Half Adder
    half_adder uut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("waves/half_adder.vcd");
        $dumpvars(0, tb_half_adder);

        $display("A B | Sum Cout");
        $display("---------------");

        A = 0; B = 0; #10;
        $display("%b %b |  %b    %b", A, B, Sum, Cout);

        A = 0; B = 1; #10;
        $display("%b %b |  %b    %b", A, B, Sum, Cout);

        A = 1; B = 0; #10;
        $display("%b %b |  %b    %b", A, B, Sum, Cout);

        A = 1; B = 1; #10;
        $display("%b %b |  %b    %b", A, B, Sum, Cout);

        $finish;
    end

endmodule