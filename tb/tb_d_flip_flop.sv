`timescale 1ns/1ps

module tb_d_flip_flop;

    logic clk;
    logic rst;
    logic D;
    logic Q;

    //-------------------------------------------------
    // Instantiate DUT
    //-------------------------------------------------

    d_flip_flop DUT (
        .clk(clk),
        .rst(rst),
        .D(D),
        .Q(Q)
    );

    //-------------------------------------------------
    // Clock Generation (10 ns period)
    //-------------------------------------------------

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //-------------------------------------------------
    // Stimulus
    //-------------------------------------------------

    initial begin

        $dumpfile("waves/d_flip_flop.vcd");
        $dumpvars(0, tb_d_flip_flop);

        // Apply Reset
        rst = 1;
        D   = 0;
        #10;

        // Release Reset
        rst = 0;

        D = 1;
        #10;

        D = 0;
        #10;

        D = 1;
        #10;

        D = 1;
        #10;

        D = 0;
        #10;

        $finish;

    end

    //-------------------------------------------------
    // Monitor
    //-------------------------------------------------

    initial begin
        $monitor(
            "Time=%0t clk=%b rst=%b D=%b Q=%b",
            $time, clk, rst, D, Q
        );
    end

endmodule