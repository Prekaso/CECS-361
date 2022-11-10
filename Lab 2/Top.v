`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Jose Aceves & Amin Rezaei
// Create Date: 08/30/2020 03:53:05 PM
// Design Name: 361_Lab2
// Module Name: Top
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module top(
    input clk,
    input reset,
    input [1:0] sel,
    output [2:0] RGB,
    output [2:0] LED
    );
    
    // Define nesseary wires here.
    wire in_out;
    wire [2:0] sol;
    
    Solver S0(.clk(clk), .reset(reset), .in(in_out), .RGB(RGB), .solution(sol), .LED(LED));      
        
    CNF cnf0(.A(sol[2]), .B(sol[1]), .C(sol[0]), .sel(sel), .out(in_out));
endmodule