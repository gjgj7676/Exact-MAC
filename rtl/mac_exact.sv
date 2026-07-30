module mac_exact (

    input  logic        clk,
    input  logic        rst,

    input  logic [7:0]  A,
    input  logic [7:0]  B,

    output logic [15:0] Acc,
    output logic        Overflow

);

    //------------------------------------------------------------
    // Internal Signals
    //------------------------------------------------------------

    logic [15:0] Product;
    logic [15:0] Sum;
    logic        Cout;

    //------------------------------------------------------------
    // 8×8 Braun Multiplier
    //------------------------------------------------------------

    braun_multiplier_8x8 MULT (

        .A(A),
        .B(B),
        .Product(Product)

    );

    //------------------------------------------------------------
    // 16-bit Ripple Carry Adder
    //------------------------------------------------------------

    ripple_adder_16 RCA (

        .A(Product),
        .B(Acc),
        .Cin(1'b0),

        .Sum(Sum),
        .Cout(Cout)

    );

    //------------------------------------------------------------
    // 16-bit Register (Accumulator)
    //------------------------------------------------------------

    register_16 ACC_REG (

        .clk(clk),
        .rst(rst),

        .D(Sum),
        .Q(Acc)

    );

    //------------------------------------------------------------
    // Overflow Flag
    //------------------------------------------------------------

    assign Overflow = Cout;

endmodule