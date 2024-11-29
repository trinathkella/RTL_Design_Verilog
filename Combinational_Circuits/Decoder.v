module Decoder(
    input [1:0]in,
    input en,
    output reg [3:0]out
    );
    always @ (*)
    begin
        if(en) begin
            if(in == 2'b00) begin
                out = 4'b001;
            end
            else if(in == 2'b01) begin
                out = 4'b0010;
            end
            else if(in == 2'b10) begin
                out = 4'b0100;
            end
            else begin
                out = 4'b1000;
            end
        end 
        else begin
        out = 4'b0000;
        end
   end
endmodule
