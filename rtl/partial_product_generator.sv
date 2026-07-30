module partial_product_generator (
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic [63:0] pp
);

    // Row 0 (B[0])
    assign pp[0] = A[0] & B[0];
    assign pp[1] = A[1] & B[0];
    assign pp[2] = A[2] & B[0];
    assign pp[3] = A[3] & B[0];
    assign pp[4] = A[4] & B[0];
    assign pp[5] = A[5] & B[0];
    assign pp[6] = A[6] & B[0];
    assign pp[7] = A[7] & B[0];

    // Row 1 (B[1])
    assign pp[8]  = A[0] & B[1];
    assign pp[9]  = A[1] & B[1];
    assign pp[10] = A[2] & B[1];
    assign pp[11] = A[3] & B[1];
    assign pp[12] = A[4] & B[1];
    assign pp[13] = A[5] & B[1];
    assign pp[14] = A[6] & B[1];
    assign pp[15] = A[7] & B[1];

    // Row 2 (B[2])
    assign pp[16] = A[0] & B[2];
    assign pp[17] = A[1] & B[2];
    assign pp[18] = A[2] & B[2];
    assign pp[19] = A[3] & B[2];
    assign pp[20] = A[4] & B[2];
    assign pp[21] = A[5] & B[2];
    assign pp[22] = A[6] & B[2];
    assign pp[23] = A[7] & B[2];

    // Row 3 (B[3])
    assign pp[24] = A[0] & B[3];
    assign pp[25] = A[1] & B[3];
    assign pp[26] = A[2] & B[3];
    assign pp[27] = A[3] & B[3];
    assign pp[28] = A[4] & B[3];
    assign pp[29] = A[5] & B[3];
    assign pp[30] = A[6] & B[3];
    assign pp[31] = A[7] & B[3];

    // Row 4 (B[4])
    assign pp[32] = A[0] & B[4];
    assign pp[33] = A[1] & B[4];
    assign pp[34] = A[2] & B[4];
    assign pp[35] = A[3] & B[4];
    assign pp[36] = A[4] & B[4];
    assign pp[37] = A[5] & B[4];
    assign pp[38] = A[6] & B[4];
    assign pp[39] = A[7] & B[4];

    // Row 5 (B[5])
    assign pp[40] = A[0] & B[5];
    assign pp[41] = A[1] & B[5];
    assign pp[42] = A[2] & B[5];
    assign pp[43] = A[3] & B[5];
    assign pp[44] = A[4] & B[5];
    assign pp[45] = A[5] & B[5];
    assign pp[46] = A[6] & B[5];
    assign pp[47] = A[7] & B[5];

    // Row 6 (B[6])
    assign pp[48] = A[0] & B[6];
    assign pp[49] = A[1] & B[6];
    assign pp[50] = A[2] & B[6];
    assign pp[51] = A[3] & B[6];
    assign pp[52] = A[4] & B[6];
    assign pp[53] = A[5] & B[6];
    assign pp[54] = A[6] & B[6];
    assign pp[55] = A[7] & B[6];

    // Row 7 (B[7])
    assign pp[56] = A[0] & B[7];
    assign pp[57] = A[1] & B[7];
    assign pp[58] = A[2] & B[7];
    assign pp[59] = A[3] & B[7];
    assign pp[60] = A[4] & B[7];
    assign pp[61] = A[5] & B[7];
    assign pp[62] = A[6] & B[7];
    assign pp[63] = A[7] & B[7];

endmodule