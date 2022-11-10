`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2022 06:21:20 PM
// Design Name: 
// Module Name: Circuit_Expected_tb
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


module Circuit_Expected_tb();

    reg A, B, C;
    wire F0, F1;
    integer i;
    
    localparam period = 20;
    
    Circuit_Expected uut(.A(A), .B(B), .C(C), .F0(F0), .F1(F1));
    
    // Check all the possile cases. There are three inputs. Thus, there should be 8 cases.
    initial begin
    for ( i = 0; i < 8; i = i + 1) begin
        {A, B, C} = i;
        #period;
        end
        $finish;
    end
endmodule
