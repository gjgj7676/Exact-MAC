`timescale 1ns/1ps

module tb_braun_multiplier_8x8;

    logic [7:0] A;
    logic [7:0] B;
    logic [15:0] Product;

    integer i, j;
    integer errors;

    braun_multiplier_8x8 uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin

        $dumpfile("waves/braun_multiplier_8x8.vcd");
        $dumpvars(0, tb_braun_multiplier_8x8);

        errors = 0;

        $display("----------------------------------------------");
        $display("Testing 8x8 Braun Multiplier");
        $display("----------------------------------------------");

        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin

                A = i;
                B = j;

                #1;

                if (Product !== (i * j)) begin
                    $display("ERROR : A=%0d B=%0d Expected=%0d Got=%0d",
                             i, j, (i*j), Product);
                    errors = errors + 1;
                end

            end
        end

        $display("----------------------------------------------");

        if (errors == 0)
            $display("All 65536 test cases PASSED!");
        else
            $display("FAILED! Total Errors = %0d", errors);

        $display("----------------------------------------------");

        $finish;

    end

endmodule