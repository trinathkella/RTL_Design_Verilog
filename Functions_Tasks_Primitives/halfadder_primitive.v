`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 06:30:53 PM
// Design Name: 
// Module Name: halfadder_primitive
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


module halfadder_primitive(
    output s_out,c_out,
    input a_in,b_in
    );
    xor s1(s_out,a_in,b_in);
    and c1(c_out,a_in,b_in);
endmodule
