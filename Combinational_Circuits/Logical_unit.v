module logic_unit #(parameter N=4)(
    input [N-1:0]a_in,b_in,
    input [1:0]opcode,
    output reg [N-1:0]y_out
    );
    
    always@(*)
    begin
        case(opcode)
            2'b00 : y_out = ~a_in;
            2'b01 : y_out = a_in | b_in;
            2'b10 : y_out = a_in & b_in;
            2'b11 : y_out = a_in ^ b_in;
        endcase
    end
endmodule
