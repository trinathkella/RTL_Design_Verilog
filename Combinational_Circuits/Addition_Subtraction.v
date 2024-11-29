module nbit_add_sub #(parameter N = 4)(
    input [N-1:0]a_in,
    input [N-1:0]b_in,
    input opcode,
    output reg [N-1:0]sum_or_diff_out;
    output reg carry_or_borrow_out
    );
    reg [N-1:0]temp_out;
    always@(*)
    begin
        case(opcode)
            1'b0 : temp_out = b_in;
            1'b1 : temp_out = ~b_in;
        endcase
        {carry_or_borrow_out,sum_or_diff_out} = a_in + temp_out + opcode;     
    end
endmodule
