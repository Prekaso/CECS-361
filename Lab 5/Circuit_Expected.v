`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Jose Aceves & Amin Rezaei 
// Create Date: 11/10/2020 10:01:51 AM
// Design Name: 361_Lab5
// Module Name: Circuit_Expected
//////////////////////////////////////////////////////////////////////////////////

module Circuit_Expected(
    input A,B,C,
    output F0,F1
    );
    wire w1, w2, w3;

    assign w1 = A^B;
    assign w2 = C&w1;
    assign w3 = A&B;
    assign F0 = C^w1;
    assign F1 = w2|w3;
endmodule