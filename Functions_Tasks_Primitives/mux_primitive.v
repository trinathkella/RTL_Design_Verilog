`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 06:28:01 PM
// Design Name: 
// Module Name: mux_primitive
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


module mux_primitive(
    output y_out,
    input a_in,b_in,s_in
    );
    wire y1,y2,y3;
    not n1(y1,s_in);
    and a1(y2,y1,a_in);
    and a2(y3,s_in,b_in);
    or o(y_out,y2,y3);
endmodule
