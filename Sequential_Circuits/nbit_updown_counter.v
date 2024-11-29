`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 04:05:22 PM
// Design Name: 
// Module Name: nbit_updown_counter
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


module nbit_updown_counter #(parameter N = 4)(
    input reset_n,clk,up_down,
    output reg [N-1:0]q_out
    );
    always@(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            q_out = 0;
        else
        begin
            if(up_down)
                q_out <= q_out + 1;
            else
                q_out <= q_out - 1;
        end
    end
endmodule
