`timescale 1ns/1ps

module tb_register_16;

    //-------------------------------------------------
    // Testbench Signals
    //-------------------------------------------------

    logic        clk;
    logic        rst;
    logic [15:0] D;
    logic [15:0] Q;

    //-------------------------------------------------
    // Instantiate DUT
    //-------------------------------------------------

    register_16 DUT (
        .clk(clk),
        .rst(rst),
        .D(D),
        .Q(Q)
    );

    //-------------------------------------------------
    // Clock Generation (10 ns Period)
    //-------------------------------------------------

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //-------------------------------------------------
    // Test Cases
    //-------------------------------------------------

    initial begin

        $dumpfile("waves/register_16.vcd");
        $dumpvars(0, tb_register_16);

        // Apply Reset
        rst = 1;
        D   = 16'h0000;
        #10;

        // Release Reset
        rst = 0;

        // Test 1
        D = 16'h1234;
        #10;

        // Test 2
        D = 16'hABCD;
        #10;

        // Test 3
        D = 16'hFFFF;
        #10;

        // Test 4
        D = 16'h0000;
        #10;

        // Test 5
        D = 16'h55AA;
        #10;

        // Test 6
        D = 16'hA5A5;
        #10;

        $finish;

    end

    //-------------------------------------------------
    // Monitor
    //-------------------------------------------------

    initial begin

        $monitor(
            "Time=%0t clk=%b rst=%b D=%h Q=%h",
            $time, clk, rst, D, Q
        );

    end

endmodule