`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers:  Dylan Dang
// Create Date: 09/19/2020 06:20:43 PM
// Design Name: 361_Lab3
// Module Name: lab3_tb
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Lab3_tb();
reg a_tb, b_tb, c_tb, d_tb, e_tb;
wire out_tb;
integer i;

localparam period = 1;

Lab3 uut (.A(a_tb), .B(b_tb), .C(c_tb), .D(d_tb), .E(e_tb), .Out(out_tb));

initial begin
    // You can either test all the cases one by one or find a better way using loops
    a_tb = 0;
    b_tb = 0; 
    c_tb = 0; 
    d_tb = 0; 
    e_tb = 0;
    
    for (i = 0; i < 32; i = i + 1) begin
    {a_tb, b_tb, c_tb, d_tb, e_tb} = i;
    #10;
    end
    $finish;
end
endmodule