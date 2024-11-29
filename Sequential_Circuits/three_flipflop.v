`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 03:51:29 PM
// Design Name: 
// Module Name: three_flipflop
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


module three_flipflop(
    input a_in,b_in,reset_n,clk,
    output reg q_out
    );
    reg q1,q2;
    always@(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
        begin
            q1 <= 1'b0;
            q2 <= 1'b0;
            q_out <= 1'b0;
        end
        else
        begin
            q1 <= a_in;
            q2 <= b_in;
            q_out <= ~(q1 & q2);
        end
    end
endmodule
