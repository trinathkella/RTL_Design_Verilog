module onebit_comparator(
    input a_in;
    input b_in,
    output g_out,
    output e_out,
    output l_out
    );
    //Three Conditions Less than | Greater Than | Equal to
    assign g_out = a_in & (~b_in);
    assign l_out = (~a_in) & b_in;
    assign e_out = ~(a_in ^ b_in);
endmodule
