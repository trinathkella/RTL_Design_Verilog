module ALU
#
(
    parameter DATA_WIDTH = 8,
    parameter ADDRESS_WIDTH = 4
)
(
    input [DATA_WIDTH - 1 : 0]a_in,
    input [DATA_WIDTH - 1 : 0]b_in,
    input [ADDRESS_WIDTH-1:0]opcode,
    output [DATA_WIDTH-1:0]result_out,
    output carry
);
    reg [DATA_WIDTH:0]result_temp;
    always @ (*)
    begin
        case(opcode)
            4'b0000 : result_temp = a_in;
            4'b0001 : result_temp = a_in + b_in;
            4'b0010 : result_temp = a_in + b_in + 1;
            4'b0011 : result_temp = a_in - b_in;
            4'b0100 : result_temp = a_in - b_in - 1;
            4'b0101 : result_temp = a_in + 1;
            4'b0110 : result_temp = a_in - 1;
            4'b0111 : result_temp = b_in;
            4'b1000 : result_temp = a_in | b_in;
            4'b1001 : result_temp = a_in ^ b_in;
            4'b1010 : result_temp = a_in & b_in;
            4'b1011 : result_temp = ~a_in;
            default : result_temp = 'b0;
        endcase
    end
    assign {carry,result_out} = result_temp;
endmodule
