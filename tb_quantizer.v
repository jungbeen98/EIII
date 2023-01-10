`timescale 1ns / 1ps
module tb_quantizer;

reg         clk;
reg         reset_n;
reg  [31:0] r_max;
reg  [31:0] r_activation;
wire [7:0]  w_index;

//integer i;

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


// reset_n gen
$display("Reset! [%d]", $time);
# 10
    reset_n = 0;
# 80
    reset_n = 1;
# 10
	r_max        = 32'h 43800000; // 256
	r_activation = 32'h 41000000; // 8


# 100
$display("Finish! [%d]", $time);
//$fclose(fd);
$finish;

end

endmodule