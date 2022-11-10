`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers:  Jose Aceves & Amin Rezaei 
// Create Date: 11/10/2020 10:24:05 AM
// Design Name: 361_Lab5
// Module Name: Top_Module
//////////////////////////////////////////////////////////////////////////////////

module Top_Module
(
    input A, B, C, 
    output [2:0] RGB, RGB1
);

wire F0_expected, F0_given, F1_expected, F1_given, Final;

// Innstatiane the given circuit and the expected circuit Here.
   Circuit_Expected ttu(.A(A),.B(B),.C(C),.F0(F0_expected),.F1(F1_expected));
   Circuit_SA1 tut(.A(A),.B(B),.C(C),.F0(F0_given),.F1(F1_given));

assign Final = (F0_given ^ F0_expected) | (F1_given ^ F1_expected);

assign RGB = (Final) ? 3'b101 : 3'b000; // Represent color of your choice when Final=1;
assign RGB1 = (Final) ? 3'b101 : 3'b000;


endmodule