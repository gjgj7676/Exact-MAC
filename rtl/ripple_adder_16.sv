module ripple_adder_16 (
    input  logic [15:0] A,
    input  logic [15:0] B,
    input  logic        Cin,

    output logic [15:0] Sum,
    output logic        Cout
);

    logic [16:0] carry;

    assign carry[0] = Cin;

    genvar i;

    generate
        for(i = 0; i < 16; i++) begin : FA_STAGE
            full_adder FA (
                .A   (A[i]),
                .B   (B[i]),
                .Cin (carry[i]),
                .Sum (Sum[i]),
                .Cout(carry[i+1])
            );
        end
    endgenerate

    assign Cout = carry[16];

endmodule