`define N 8
module generate_fa(
    input [`N-1:0] a_in,
    input [`N-1:0] b_in,
    input c_in,
    output [`N-1:0]sum_out,
    output carry_out
    );
    wire [`N-1:0]c;
    generate
    genvar i;
        Full_Adder f1(a_in[0], b_in[0], c_in, sum_out[0],c[0]);
        for(i = 1; i < `N; i = i + 1)
        begin
            Full_Adder f2(a_in[i], b_in[i], c[i-1], sum_out[i],c[i]);     
        end
    endgenerate
    assign carry_out = c[`N-1];
endmodule
