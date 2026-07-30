module register_16 (

    input  logic        clk,
    input  logic        rst,
    input  logic [15:0] D,

    output logic [15:0] Q

);

    genvar i;

    generate
        for(i = 0; i < 16; i++) begin : REG_BITS

            d_flip_flop DFF (
                .clk(clk),
                .rst(rst),
                .D(D[i]),
                .Q(Q[i])
            );

        end
    endgenerate

endmodule