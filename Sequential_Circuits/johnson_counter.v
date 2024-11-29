`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 06:56:11 PM
// Design Name: 
// Module Name: johnson_counter
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


module johnson_counter #(parameter N = 4)(
    input load,clk,reset_n,
    input [N-1:0]d_in,
    output reg [N-1:0]q_out
    );
    always@(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            q_out <= 0;
        else
        begin
            if(load)
                q_out <= d_in;
            else
                q_out <= {~q_out[0],q_out[3:1]};
        end
    end
endmodule
