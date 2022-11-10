`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Dylan Dang
// Create Date: 09/19/2020 06:45:25 PM
// Design Name: 361_Lab3
// Module Name: Lab3_eq
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Lab3_eq(
    input A, B, C, D, E,
    output reg out
    );
    
    // Write the code for the simplified Boolean equation.
    always@(*)begin
    out = (!B & !C & !E) | (!A & B & C & !D) | (A & B & C & !E);
    end
endmodule