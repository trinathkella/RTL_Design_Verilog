`define N 4
module Nbit_counter(
    input clk,
    input reset_n,
    input opcode,
    output reg [`N-1:0]q_out
    );
    always @ (posedge clk, negedge reset_n)
    begin
        if(!reset_n) begin
            q_out <= 0;
        end
        else begin
            if(opcode) begin
                q_out <= q_out + 1;
            end
            else begin
                q_out <= q_out - 1;
            end
        end
    end
endmodule
