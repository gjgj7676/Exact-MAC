`timescale 1ns/1ps

module tb_braun_multiplier_4x4;

    logic [3:0] A;
    logic [3:0] B;
    logic [7:0] Product;

    integer i, j;
    integer errors;

    // DUT
    braun_multiplier_4x4 uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin

        $dumpfile("waves/braun_multiplier_4x4.vcd");
        $dumpvars(0, tb_braun_multiplier_4x4);

        errors = 0;

        $display("--------------------------------------------");
        $display("Testing 4x4 Braun Multiplier");
        $display("--------------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin

                A = i;
                B = j;

                #10;

                if (Product !== (i * j)) begin
                    $display("ERROR : A=%0d B=%0d Expected=%0d Got=%0d",
                              i, j, (i*j), Product);
                    errors = errors + 1;
                end

            end
        end

        $display("--------------------------------------------");

        if (errors == 0)
            $display("All 256 test cases PASSED!");
        else
            $display("FAILED! Total Errors = %0d", errors);

        $display("--------------------------------------------");

        $finish;

    end

endmodule