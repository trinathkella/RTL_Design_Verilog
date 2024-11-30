`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 21:52:52
// Design Name: 
// Module Name: seq_10101_mealy_ol
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_10101_mealy_ol(
  input d_in,
  input clk,reset_n,
  output reg q_out
);
  parameter state_0 = 3'b000;
  parameter state_1 = 3'b001;
  parameter state_2 = 3'b010;
  parameter state_3 = 3'b011;
  parameter state_4 = 3'b100;
  
  reg present_state,next_state;
    always@(posedge clk,negedge reset_n)
    begin
        if(!reset_n)
            present_state <= state_0;
        else
            present_state <= next_state;
    end
    always@(*)
    begin
        case(present_state)
            state_0 : next_state = (d_in) ? state_1 : state_0;
            state_1 : next_state = (!d_in) ? state_2 : state_1;
            state_2 : next_state = (d_in) ? state_3 : state_0;
            state_3 : next_state = (!d_in) ? state_4 : state_1;
            state_4 : next_state = (d_in) ? state_1 : state_0;
            default : next_state = state_0;
         endcase
    end
    always@(*)
    begin
        case(present_state)
            state_0 : q_out = 1'b0;
            state_1 : q_out = 1'b0;
            state_2 : q_out = 1'b0;
            state_3 : q_out = 1'b0;
            state_4 : q_out = (d_in)?1'b1:1'b0;
            default : q_out = 1'b0;
        endcase
    end
endmodule
