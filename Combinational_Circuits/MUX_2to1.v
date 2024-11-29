`define DATA 4
module Mux_2to1(
    input [`DATA-1:0]a_in,b_in,
    input sel_in,
    output reg [`DATA-1:0]y_out
    );
    //Priority Logic
    always @ (*)
    begin
        if(sel_in == 1'b1) begin
            y_out = b_in;
        end
        else begin
            y_out = a_in;
        end
    end
    //Parallel Logic
    /*
        always @ (*)
        begin
            case(sel_in)
                1'b1 : y_out = b_in;
                1'b0 : y_out = a_in;
            endcase
        end
    */
endmodule
