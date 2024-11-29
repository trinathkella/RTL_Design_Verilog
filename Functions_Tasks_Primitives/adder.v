module adder_8bit_func #(parameter n = 8)(
    input [n-1:0]a_in,b_in,
    output [n-1:0]s_out,
    output c_out
    );
    function addition (input [n-1:0]a_in,b_in);
    begin
        addition = a_in + b_in;
    end
    endfunction
    assign {c_out,s_out} = addition(a_in,b_in);
endmodule
