module Full_Adder(
    input a_in,b_in,c_in,
    output sum,carry_out
    );
    wire sum_out;
    wire c1,c2;
    //Using Module Instantiations
    Half_Adder HA1(
        .a_in(a_in),
        .b_in(b_in),
        .sum(sum_out),
        .carry_out(c1)
    );
    Half_Adder HA2(
        .a_in(sum_out),
        .b_in(c_in),
        .sum(sum),
        .carry_out(c2)
    );
    assign carry_out = c1 | c2;
endmodule
