`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 03:29:32 PM
// Design Name: Shift Register 3bit
// Module Name: threebit_shiftreg
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


module threebit_shiftreg(
    input clk,reset_n,d_in,
    output reg q_out
    );
    reg temp1,temp2;
    always@(posedge clk,negedge reset_n)
    begin
        if(!reset_n)
        begin
            temp1 <= 1'b0;
            temp2 <= 1'b0;
            q_out <= 1'b0;
        end
        else
        begin
            temp1 <= d_in;
            temp2 <= temp1;
            q_out <= temp2;
                //or
            /*q_out <= temp2;      temp2 <= temp1; 
            temp2 <= temp1;    or  q_out <= temp2;
            temp1 <= d_in;         temp1 <= d_inConcurrency*/      
        end
    end
endmodule
