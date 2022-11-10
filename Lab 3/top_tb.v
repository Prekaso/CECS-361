`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Dylan Dang 
// Create Date: 3/15/22
// Design Name: 361_Lab3
// Module Name: top_tb
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Top_tb();

reg a_tb, b_tb, c_tb, d_tb, e_tb;
wire out1_tb, out2_tb, eq_tb;
integer i;

top uut(.a(a_tb), .b(b_tb), .c(c_tb), .d(d_tb), .e(e_tb), .out1(out1_tb), .out2(out2_tb), .eq(eq_tb));

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