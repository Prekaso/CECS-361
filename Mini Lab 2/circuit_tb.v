`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2022 06:13:54 PM
// Design Name: 
// Module Name: circuit_tb
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


module circuit_tb();
    reg a_tb, clk_tb;
    wire [2:0]q_tb;
    
    circuit uut(.a(a_tb), .clk(clk_tb), .q(q_tb));
    
    always #20 clk_tb = ~clk_tb;
    
    initial begin
        clk_tb = 0; a_tb = 1'b1; 
        a_tb = 1'b1;
        #10;
        a_tb = 1'b0;
        #10;
        a_tb = 1'b1;
        #10;
    end
endmodule
