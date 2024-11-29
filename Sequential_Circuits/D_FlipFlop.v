module D_flipflop(
    input      data_in,
    input      clk,
    input      reset_n,
    output reg q_out
    );
    always @ (posedge clk , negedge reset_n)
    begin
        if(!reset_n) begin
            q_out <= 1'b0;
        end
        else begin
            q_out <= data_in;
        end
    end
endmodule
