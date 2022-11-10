`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Jose Aceves & Amin Rezaei 
// Create Date: 11/10/2020 9:20:10 AM
// Design Name: 361_Lab5
// Module Name: Circuit_SA1_tb
//////////////////////////////////////////////////////////////////////////////////

module Circuit_SA1_tb();
    reg A, B, C;
    wire F0, F1;
    integer i;
    
    localparam period = 20;
    
    Circuit_SA1 uut(.A(A), .B(B), .C(C), .F0(F0), .F1(F1));
 
    // Check all the possile cases. There are three inputs. Thus, there should be 8 cases.
    initial begin
        for(i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i;
        #period;
        end
        $finish;
    end
endmodule