module braun_multiplier_8x8 (
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic [15:0] Product
);

    // Partial Products
    logic pp [7:0][7:0];

    // Intermediate Sum Signals
    logic S [1:42];

    // Intermediate Carry Signals
    logic C [1:55];

    // Generate 64 Partial Products
    genvar i, j;

    generate
        for (i = 0; i < 8; i = i + 1) begin : ROW
            for (j = 0; j < 8; j = j + 1) begin : COL
                assign pp[i][j] = A[j] & B[i];
            end
        end
    endgenerate

        // Product Bit P0
    assign Product[0] = pp[0][0];

    // HA1
    half_adder HA1 (
        .A(pp[0][1]),
        .B(pp[1][0]),
        .Sum(Product[1]),
        .Cout(C[1])
    );

        // FA1
    full_adder FA1 (
        .A(pp[1][1]),
        .B(pp[2][0]),
        .Cin(C[1]),
        .Sum(S[1]),
        .Cout(C[2])
    );

    // FA2
    full_adder FA2 (
        .A(pp[2][1]),
        .B(pp[3][0]),
        .Cin(C[2]),
        .Sum(S[2]),
        .Cout(C[3])
    );

    // FA3
    full_adder FA3 (
        .A(pp[3][1]),
        .B(pp[4][0]),
        .Cin(C[3]),
        .Sum(S[3]),
        .Cout(C[4])
    );

    // FA4
    full_adder FA4 (
        .A(pp[4][1]),
        .B(pp[5][0]),
        .Cin(C[4]),
        .Sum(S[4]),
        .Cout(C[5])
    );

    // FA5
    full_adder FA5 (
        .A(pp[5][1]),
        .B(pp[6][0]),
        .Cin(C[5]),
        .Sum(S[5]),
        .Cout(C[6])
    );

    // FA6
    full_adder FA6 (
        .A(pp[6][1]),
        .B(pp[7][0]),
        .Cin(C[6]),
        .Sum(S[6]),
        .Cout(C[7])
    );

        // HA2
    half_adder HA2 (
        .A(pp[7][1]),
        .B(C[7]),
        .Sum(S[7]),
        .Cout(C[8])
    );

        // HA3
    half_adder HA3 (
        .A(pp[0][2]),
        .B(S[1]),
        .Sum(Product[2]),
        .Cout(C[9])
    );

        // FA7
    full_adder FA7 (
        .A(pp[1][2]),
        .B(S[2]),
        .Cin(C[9]),
        .Sum(S[8]),
        .Cout(C[10])
    );

    // FA8
    full_adder FA8 (
        .A(pp[2][2]),
        .B(S[3]),
        .Cin(C[10]),
        .Sum(S[9]),
        .Cout(C[11])
    );

    // FA9
    full_adder FA9 (
        .A(pp[3][2]),
        .B(S[4]),
        .Cin(C[11]),
        .Sum(S[10]),
        .Cout(C[12])
    );

    // FA10
    full_adder FA10 (
        .A(pp[4][2]),
        .B(S[5]),
        .Cin(C[12]),
        .Sum(S[11]),
        .Cout(C[13])
    );

    // FA11
    full_adder FA11 (
        .A(pp[5][2]),
        .B(S[6]),
        .Cin(C[13]),
        .Sum(S[12]),
        .Cout(C[14])
    );

    // FA12
    full_adder FA12 (
        .A(pp[6][2]),
        .B(S[7]),
        .Cin(C[14]),
        .Sum(S[13]),
        .Cout(C[15])
    );

    // FA13
    full_adder FA13 (
        .A(pp[7][2]),
        .B(C[8]),
        .Cin(C[15]),
        .Sum(S[14]),
        .Cout(C[16])
    );

        // HA4
    half_adder HA4 (
        .A(pp[0][3]),
        .B(S[8]),
        .Sum(Product[3]),
        .Cout(C[17])
    );

        // FA14
    full_adder FA14 (
        .A(pp[1][3]),
        .B(S[9]),
        .Cin(C[17]),
        .Sum(S[15]),
        .Cout(C[18])
    );

    // FA15
    full_adder FA15 (
        .A(pp[2][3]),
        .B(S[10]),
        .Cin(C[18]),
        .Sum(S[16]),
        .Cout(C[19])
    );

    // FA16
    full_adder FA16 (
        .A(pp[3][3]),
        .B(S[11]),
        .Cin(C[19]),
        .Sum(S[17]),
        .Cout(C[20])
    );

    // FA17
    full_adder FA17 (
        .A(pp[4][3]),
        .B(S[12]),
        .Cin(C[20]),
        .Sum(S[18]),
        .Cout(C[21])
    );

    // FA18
    full_adder FA18 (
        .A(pp[5][3]),
        .B(S[13]),
        .Cin(C[21]),
        .Sum(S[19]),
        .Cout(C[22])
    );

    // FA19
    full_adder FA19 (
        .A(pp[6][3]),
        .B(S[14]),
        .Cin(C[22]),
        .Sum(S[20]),
        .Cout(C[23])
    );

    // FA20
    full_adder FA20 (
        .A(pp[7][3]),
        .B(C[16]),
        .Cin(C[23]),
        .Sum(S[21]),
        .Cout(C[24])
    );

        // HA5
    half_adder HA5 (
        .A(pp[0][4]),
        .B(S[15]),
        .Sum(Product[4]),
        .Cout(C[25])
    );

        // FA21
    full_adder FA21 (
        .A(pp[1][4]),
        .B(S[16]),
        .Cin(C[25]),
        .Sum(S[22]),
        .Cout(C[26])
    );

    // FA22
    full_adder FA22 (
        .A(pp[2][4]),
        .B(S[17]),
        .Cin(C[26]),
        .Sum(S[23]),
        .Cout(C[27])
    );

    // FA23
    full_adder FA23 (
        .A(pp[3][4]),
        .B(S[18]),
        .Cin(C[27]),
        .Sum(S[24]),
        .Cout(C[28])
    );

    // FA24
    full_adder FA24 (
        .A(pp[4][4]),
        .B(S[19]),
        .Cin(C[28]),
        .Sum(S[25]),
        .Cout(C[29])
    );

    // FA25
    full_adder FA25 (
        .A(pp[5][4]),
        .B(S[20]),
        .Cin(C[29]),
        .Sum(S[26]),
        .Cout(C[30])
    );

    // FA26
    full_adder FA26 (
        .A(pp[6][4]),
        .B(S[21]),
        .Cin(C[30]),
        .Sum(S[27]),
        .Cout(C[31])
    );

    // FA27
    full_adder FA27 (
        .A(pp[7][4]),
        .B(C[24]),
        .Cin(C[31]),
        .Sum(S[28]),
        .Cout(C[32])
    );

        // HA6
    half_adder HA6 (
        .A(pp[0][5]),
        .B(S[22]),
        .Sum(Product[5]),
        .Cout(C[33])
    );

        // FA28
    full_adder FA28 (
        .A(pp[1][5]),
        .B(S[23]),
        .Cin(C[33]),
        .Sum(S[29]),
        .Cout(C[34])
    );

    // FA29
    full_adder FA29 (
        .A(pp[2][5]),
        .B(S[24]),
        .Cin(C[34]),
        .Sum(S[30]),
        .Cout(C[35])
    );

    // FA30
    full_adder FA30 (
        .A(pp[3][5]),
        .B(S[25]),
        .Cin(C[35]),
        .Sum(S[31]),
        .Cout(C[36])
    );

    // FA31
    full_adder FA31 (
        .A(pp[4][5]),
        .B(S[26]),
        .Cin(C[36]),
        .Sum(S[32]),
        .Cout(C[37])
    );

    // FA32
    full_adder FA32 (
        .A(pp[5][5]),
        .B(S[27]),
        .Cin(C[37]),
        .Sum(S[33]),
        .Cout(C[38])
    );

    // FA33
    full_adder FA33 (
        .A(pp[6][5]),
        .B(S[28]),
        .Cin(C[38]),
        .Sum(S[34]),
        .Cout(C[39])
    );

    // FA34
    full_adder FA34 (
        .A(pp[7][5]),
        .B(C[32]),
        .Cin(C[39]),
        .Sum(S[35]),
        .Cout(C[40])
    );

        // HA7
    half_adder HA7 (
        .A(pp[0][6]),
        .B(S[29]),
        .Sum(Product[6]),
        .Cout(C[41])
    );

        // FA35
    full_adder FA35 (
        .A(pp[1][6]),
        .B(S[30]),
        .Cin(C[41]),
        .Sum(S[36]),
        .Cout(C[42])
    );

    // FA36
    full_adder FA36 (
        .A(pp[2][6]),
        .B(S[31]),
        .Cin(C[42]),
        .Sum(S[37]),
        .Cout(C[43])
    );

    // FA37
    full_adder FA37 (
        .A(pp[3][6]),
        .B(S[32]),
        .Cin(C[43]),
        .Sum(S[38]),
        .Cout(C[44])
    );

    // FA38
    full_adder FA38 (
        .A(pp[4][6]),
        .B(S[33]),
        .Cin(C[44]),
        .Sum(S[39]),
        .Cout(C[45])
    );

    // FA39
    full_adder FA39 (
        .A(pp[5][6]),
        .B(S[34]),
        .Cin(C[45]),
        .Sum(S[40]),
        .Cout(C[46])
    );

    // FA40
    full_adder FA40 (
        .A(pp[6][6]),
        .B(S[35]),
        .Cin(C[46]),
        .Sum(S[41]),
        .Cout(C[47])
    );

    // FA41
    full_adder FA41 (
        .A(pp[7][6]),
        .B(C[40]),
        .Cin(C[47]),
        .Sum(S[42]),
        .Cout(C[48])
    );

        // HA8
    half_adder HA8 (
        .A(pp[0][7]),
        .B(S[36]),
        .Sum(Product[7]),
        .Cout(C[49])
    );

        // FA42
    full_adder FA42 (
        .A(pp[1][7]),
        .B(S[37]),
        .Cin(C[49]),
        .Sum(Product[8]),
        .Cout(C[50])
    );

    // FA43
    full_adder FA43 (
        .A(pp[2][7]),
        .B(S[38]),
        .Cin(C[50]),
        .Sum(Product[9]),
        .Cout(C[51])
    );

    // FA44
    full_adder FA44 (
        .A(pp[3][7]),
        .B(S[39]),
        .Cin(C[51]),
        .Sum(Product[10]),
        .Cout(C[52])
    );

    // FA45
    full_adder FA45 (
        .A(pp[4][7]),
        .B(S[40]),
        .Cin(C[52]),
        .Sum(Product[11]),
        .Cout(C[53])
    );

    // FA46
    full_adder FA46 (
        .A(pp[5][7]),
        .B(S[41]),
        .Cin(C[53]),
        .Sum(Product[12]),
        .Cout(C[54])
    );

    // FA47
    full_adder FA47 (
        .A(pp[6][7]),
        .B(S[42]),
        .Cin(C[54]),
        .Sum(Product[13]),
        .Cout(C[55])
    );

    // FA48
    full_adder FA48 (
        .A(pp[7][7]),
        .B(C[48]),
        .Cin(C[55]),
        .Sum(Product[14]),
        .Cout(Product[15])
    );


endmodule