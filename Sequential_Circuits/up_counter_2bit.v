`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 03:56:36 PM
// Design Name: 
// Module Name: up_counter_2bit
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


module up_counter_2bit(
    input reset_n,clk,
    output reg [1:0]q_out
    );
    always@(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            q_out <= 0;
        else
            q_out <= q_out + 1;
    end
endmodule
