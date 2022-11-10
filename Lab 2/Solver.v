`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Jose Aceves & Amin Rezaei 
// Create Date: 08/30/2020 03:45:30 PM
// Design Name: 361_Lab2
// Module Name: Solver
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Solver(
    input clk, 
    input reset,
    input in,
    output reg [2:0] RGB,
    output reg [2:0] solution,
    output reg [2:0] LED
    );

    always@(posedge clk, posedge reset) begin
        if(reset) begin
            solution <= 3'b0;
            LED <= solution;
            RGB <= 3'b001; //RGB Code for Red.
        end
        else if(in) begin
            // Insert logic here for the case when a solution is found.
            LED <= solution;
            RGB <= 3'b010; //RGB Code for Green.    
        end
        else begin 
            // Insert logic here to iterate to the next test expression
            // when a solution has not yet been found. 
            // Hint: update LEDs and RGB here as well.
        solution <= solution + 3'b1;
        LED <= 3'b000;
        RGB <= 3'b001;
        end   
    end
endmodule