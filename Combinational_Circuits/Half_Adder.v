module Half_Adder(
    input a_in,b_in,
    output sum,carry_out
    );
    //Logical
    //assign sum = a_in ^ b_in;
    //assign carry_out = a_in & b_in;
    //Using Arithmetic Operator and concatenation
    assign {carry_out, sum} = a_in + b_in;
endmodule
