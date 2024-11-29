module Encoder(
    input [3:0]in,
    output reg [1:0]out
    );
    //priority encoder
    always @ (*)
    begin
        casez(in)
            4'b1zzz : out = 2'b11;
            4'bz1zz : out = 2'b10;
            4'bzz1z : out = 2'b01;
            4'bzzz1 : out = 2'b00;
            default : out = 2'bzz;
        endcase         
    end
endmodule
