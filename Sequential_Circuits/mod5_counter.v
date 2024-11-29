`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 07:02:04 PM
// Design Name: 
// Module Name: mod5_counter
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


module mod5_counter(
    input clk,reset_n,udi,load,
    input [2:0]d_in,
    output reg [2:0]q_out
    );
    always@(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            q_out <= 0;
        else
        begin
            if(load)
                q_out <= d_in;
            else if(udi)
            begin
                if(q_out == 3'b100)
                    q_out <= 3'b000;
                else
                    q_out <= q_out + 1;
            end
            else
            begin
                if(q_out == 3'b000)
                    q_out <= 3'b100;
                else
                    q_out <= q_out - 1;
            end
        end
    end
endmodule
