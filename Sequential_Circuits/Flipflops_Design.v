module flipflops(
    input a_in;
    input b_in,
    input clk,
    input reset_n,
    output reg q_out
    );
    reg q1,q2;
    always @ (posedge clk, negedge reset_n)
    begin
        if(!reset_n) begin
            q1 <= 1'b0;
            q2 <= 1'b0;
            q_out <= 1'b0;
        end
        else begin
            q1 <= a_in;
            q2 <= b_in;
            q_out <= !(q1&q2);
        end
    end
endmodule
