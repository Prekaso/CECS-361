`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 06:18:12 PM
// Design Name: 
// Module Name: ArrMult_4bit_tb
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


module ArrMult_4bit_tb(
    );
    // Create registers and wires and variables
    reg [3:0] a_tb, b_tb;
    reg [7:0] result;
    wire [7:0] prod_tb;
    integer i;
   
    // Duration for each bit        
    localparam period = 20;
            
    // Instantiate the module
    ArrMult_4bit uut(.a(a_tb), .b(b_tb), .prod(prod_tb));
    
    initial begin        
        for(i = 0; i < 256; i = i + 1) begin
            {a_tb, b_tb} = i;
            result = a_tb * b_tb;
            #period;
            if(result == prod_tb) begin
                $display(a_tb, " ", b_tb, " ", " passed.");
            end else begin
                $display(a_tb, " ", b_tb, " ", " failed.");
            end
        end
        $finish;
    end
endmodule
