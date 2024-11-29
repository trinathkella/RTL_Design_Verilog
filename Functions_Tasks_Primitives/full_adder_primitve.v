`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 06:33:56 PM
// Design Name: 
// Module Name: full_adder_primitve
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


module full_adder_primitve(
    output s_out,c_out,
    input a_in,b_in,c_in
    );
    wire s1,c1,c2;
    halfadder_primitive h1(s1,c1,a_in,b_in);
    halfadder_primitive h2(s_out,c2,s1,c_in);
    or o(c_out,c1,c2);
endmodule
