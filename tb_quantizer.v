`timescale 1ns / 1ps
module tb_quantizer;

reg         clk;
reg         reset_n;
reg  [31:0] r_max;
reg  [31:0] r_activation;
wire [7:0]  w_index;

integer i;

quantizer u_quantizer(
    .clk(clk), .reset_n(reset_n),
    .i_max(r_max), .i_activation(r_activation),
    .o_index(w_index)
);

// clk gen
always
    #5 clk = ~clk;

initial begin
//initialize value
$display("initialize value [%d]", $time);
    reset_n      = 1;
    clk          = 0;
	r_max        = 32'h 437F0000; // 255
	r_activation = 32'h 41CC0000; // 25.5

// reset_n gen
$display("Reset! [%d]", $time);
# 50
    reset_n = 0;
# 10
    reset_n = 1;
# 10

/*
@(posedge clk);
    for(i=0; i<3; i = i+1) begin
        @(negedge clk);
        r_activation = r_activation + 0.3;
    end
*/

# 100
$display("Finish! [%d]", $time);
//$fclose(fd);
$finish;

end

endmodule