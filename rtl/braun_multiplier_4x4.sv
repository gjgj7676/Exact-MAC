module braun_multiplier_4x4 (
    input  logic [3:0] A,
    input  logic [3:0] B,
    output logic [7:0] Product
);

    // Partial Products
    logic pp00, pp01, pp02, pp03;
    logic pp10, pp11, pp12, pp13;
    logic pp20, pp21, pp22, pp23;
    logic pp30, pp31, pp32, pp33;

    // Intermediate Sums
    logic S1, S2, S3, S4;
    logic S5, S6;

    // Intermediate Carries
    logic C1, C2, C3, C4;
    logic C5, C6, C7, C8;
    logic C9, C10, C11;

    // Partial Product Generation
    assign pp00 = A[0] & B[0];
    assign pp01 = A[1] & B[0];
    assign pp02 = A[2] & B[0];
    assign pp03 = A[3] & B[0];

    assign pp10 = A[0] & B[1];
    assign pp11 = A[1] & B[1];
    assign pp12 = A[2] & B[1];
    assign pp13 = A[3] & B[1];

    assign pp20 = A[0] & B[2];
    assign pp21 = A[1] & B[2];
    assign pp22 = A[2] & B[2];
    assign pp23 = A[3] & B[2];

    assign pp30 = A[0] & B[3];
    assign pp31 = A[1] & B[3];
    assign pp32 = A[2] & B[3];
    assign pp33 = A[3] & B[3];

// Product Bit P0
assign Product[0] = pp00;

// HA1
half_adder HA1 (
    .A(pp01),
    .B(pp10),
    .Sum(Product[1]),
    .Cout(C1)
);


// FA1
full_adder FA1 (
    .A(pp11),
    .B(pp20),
    .Cin(C1),
    .Sum(S1),
    .Cout(C2)
);

// FA2
full_adder FA2 (
    .A(pp21),
    .B(pp30),
    .Cin(C2),
    .Sum(S2),
    .Cout(C3)
);

// HA2
half_adder HA2 (
    .A(pp31),
    .B(C3),
    .Sum(S3),
    .Cout(C4)
);

// HA3
half_adder HA3 (
    .A(pp02),
    .B(S1),
    .Sum(Product[2]),
    .Cout(C5)
);

// FA3
full_adder FA3 (
    .A(pp12),
    .B(S2),
    .Cin(C5),
    .Sum(S4),
    .Cout(C6)
);

// FA4
full_adder FA4 (
    .A(pp22),
    .B(S3),
    .Cin(C6),
    .Sum(S5),
    .Cout(C7)
);

// FA5
full_adder FA5 (
    .A(pp32),
    .B(C4),
    .Cin(C7),
    .Sum(S6),
    .Cout(C8)
);

// HA4
half_adder HA4 (
    .A(pp03),
    .B(S4),
    .Sum(Product[3]),
    .Cout(C9)
);

// FA6
full_adder FA6 (
    .A(pp13),
    .B(S5),
    .Cin(C9),
    .Sum(Product[4]),
    .Cout(C10)
);

// FA7
full_adder FA7 (
    .A(pp23),
    .B(S6),
    .Cin(C10),
    .Sum(Product[5]),
    .Cout(C11)
);

// FA8
full_adder FA8 (
    .A(pp33),
    .B(C8),
    .Cin(C11),
    .Sum(Product[6]),
    .Cout(Product[7])
);

endmodule