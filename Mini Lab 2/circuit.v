`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2022 06:13:37 PM
// Design Name: 
// Module Name: circuit
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


module circuit(
    input a, clk,
    output reg [3:0] q    
    );
    
    always @(*) begin
        q = q + 3'b001;
        if (a) begin
            q = 3'b100;
        end
        else if (q == 3'b111) begin
            q = 3'b0;
        end
    end    
endmodule
