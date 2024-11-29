`define DATA_WIDTH 32
module Moore_1110(
    input d_in,
    input clk,
    input reset_n,
    input      [`DATA_WIDTH - 1 : 0]data_in,
    output reg [`DATA_WIDTH - 1 : 0]data_out,
    output reg q_out
    );
    parameter state_0 = 3'b000;
    parameter state_1 = 3'b001;
    parameter state_2 = 3'b010;
    parameter state_3 = 3'b011;
    parameter state_4 = 3'b100;
    reg [2:0]present_state,next_state;

    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n) begin
            q_out <= 1'b0;
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end
    
    always @(*)
    begin
        case(present_state)
        
            state_0 : begin
             if(d_in)
                next_state=state_1;
             else
                next_state=state_0;
             end
             
            state_1 : begin
             if(d_in)
                next_state=state_2;
             else
                next_state=state_0;
             end
             
            state_2 : begin
             if(d_in)
                next_state=state_3;
             else
                next_state=state_0;
             end
             
            state_3 : begin
             if(d_in)
                next_state=state_3;
             else
                next_state=state_4;
             end
            state_4 : begin
             if(d_in)
                next_state=state_1;
             else
                next_state=state_0;
             end
            default : next_state = state_0;
        endcase
    end
    
    always @(present_state)
    begin
        case(present_state)
            state_0 : q_out = 1'b0;
            state_1 : q_out = 1'b0;
            state_2 : q_out = 1'b0;
            state_3 : q_out = 1'b0;
            state_4 : q_out = 1'b1;
            default : q_out = 1'b0;
        endcase
    end
    always@(posedge clk, negedge reset_n)
    begin
        if(!reset_n) begin
            data_out <= 32'b0;
        end
        else begin
            if(q_out) begin
                data_out <= data_in;
            end
            else begin
                data_out <= data_out;
            end
        end
    end    
endmodule
