`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 06:04:27 PM
// Design Name: 
// Module Name: count_1s
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


module count_1s#(parameter n = 8)(
    input [n-1:0]d_in,
    output reg [n-5:0]count
    );
    integer i;
    always@(*)
    begin
        count = 0;
        for(i=0;i<n;i=i+1)
        begin
            if(d_in[i] == 1'b1)
                count = count+1;
            else
                count = count + 0;
        end
    end
endmodule
