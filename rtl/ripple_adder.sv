module ripple_adder (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic       Cin,

    output logic [7:0] Sum,
    output logic       Cout
);

    logic c1;
    logic c2;
    logic c3;
    logic c4;
    logic c5;
    logic c6;
    logic c7;

    full_adder FA0 (
        .A   (A[0]),
        .B   (B[0]),
        .Cin (Cin),
        .Sum (Sum[0]),
        .Cout(c1)
    );

    full_adder FA1 (
        .A   (A[1]),
        .B   (B[1]),
        .Cin (c1),
        .Sum (Sum[1]),
        .Cout(c2)
    );

        full_adder FA2 (
        .A   (A[2]),
        .B   (B[2]),
        .Cin (c2),
        .Sum (Sum[2]),
        .Cout(c3)
    );

    full_adder FA3 (
        .A   (A[3]),
        .B   (B[3]),
        .Cin (c3),
        .Sum (Sum[3]),
        .Cout(c4)
    );

    full_adder FA4 (
        .A   (A[4]),
        .B   (B[4]),
        .Cin (c4),
        .Sum (Sum[4]),
        .Cout(c5)
    );

    full_adder FA5 (
        .A   (A[5]),
        .B   (B[5]),
        .Cin (c5),
        .Sum (Sum[5]),
        .Cout(c6)
    );

    full_adder FA6 (
        .A   (A[6]),
        .B   (B[6]),
        .Cin (c6),
        .Sum (Sum[6]),
        .Cout(c7)
    );

    full_adder FA7 (
        .A   (A[7]),
        .B   (B[7]),
        .Cin (c7),
        .Sum (Sum[7]),
        .Cout(Cout)
    );
    

endmodule