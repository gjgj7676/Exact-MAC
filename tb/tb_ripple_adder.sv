`timescale 1ns/1ps

module tb_ripple_adder;

    logic [7:0] A;
    logic [7:0] B;
    logic       Cin;

    logic [7:0] Sum;
    logic       Cout;

    ripple_adder uut (
        .A    (A),
        .B    (B),
        .Cin  (Cin),
        .Sum  (Sum),
        .Cout (Cout)
    );

    initial begin

    $dumpfile("waves/ripple_adder.vcd");
    $dumpvars(0, tb_ripple_adder);    

    $display("     A        B     Cin |      Sum     Cout");
    $display("---------------------------------------------");

    A = 8'd25;   B = 8'd17;  Cin = 0; #10;
    $display("%8d %8d   %b | %8d    %b", A, B, Cin, Sum, Cout);

    A = 8'd100;  B = 8'd50;  Cin = 0; #10;
    $display("%8d %8d   %b | %8d    %b", A, B, Cin, Sum, Cout);

    A = 8'd255;  B = 8'd1;   Cin = 0; #10;
    $display("%8d %8d   %b | %8d    %b", A, B, Cin, Sum, Cout);

    A = 8'd200;  B = 8'd100; Cin = 0; #10;
    $display("%8d %8d   %b | %8d    %b", A, B, Cin, Sum, Cout);

    $finish;

end

endmodule