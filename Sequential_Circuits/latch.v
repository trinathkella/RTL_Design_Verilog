`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 10:36:06 PM
// Design Name: Intentional Latch
// Module Name: latch
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


module latch #(parameter n=8)(
    input [n-1:0]d_in,
    input en_in,
    output reg [n-1:0]d_out
    );
    //priority logic
    always@(*)
    begin                       // parallel logic
        if(en_in)               //case(en)
            d_out <= d_in;           //begin    
    end                                 //1'b1 : d_out <= d_in
endmodule                               //end
//Latch Using MUx
//assign d_out = (en) ? (d_in) : (d_out);
//When Output is given as input then, it will generate unintentional latch