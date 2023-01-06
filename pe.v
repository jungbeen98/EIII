`timescale 1ns / 1ps
module pe(
    input         clk,
    input         reset_n,
    input  [3:0]  i_weight,
    input  [7:0]  i_activation,
    output [31:0] o_calculated
);

wire [31:0] o_bit_shifted;

bit_shifter u_bit_shifter(
    .clk           (clk),
	.reset_n       (reset_n),
	.i_weight      (i_weight),
	.i_activation  (i_activation),
	.o_bit_shifted (o_bit_shifted)
);

accumulator u_accumulator(
    .clk           (clk),
    .reset_n       (reset_n),
    .i_bit_shifted (o_bit_shifted),
    .o_accumulated (o_calculated)
);

endmodule