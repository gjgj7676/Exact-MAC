`timescale 1ns/1ps

module tb_partial_product_generator;

    logic [7:0] A;
    logic [7:0] B;
    logic [63:0] pp;

    partial_product_generator uut (
        .A(A),
        .B(B),
        .pp(pp)
    );

    initial begin
        $dumpfile("waves/partial_product_generator.vcd");
        $dumpvars(0, tb_partial_product_generator);

        A = 8'b00000011;   // 3
        B = 8'b00000101;   // 5
        #10;

        $display("A = %b", A);
        $display("B = %b", B);
        $display("Partial Products = %b", pp);

        $finish;
    end

endmodule