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


module EC_tb(
    );
    // Create registers and wires and variables
    reg a_tb, b_tb, c_tb, d_tb, e_tb;
    wire out1_tb, out2_tb, eq_tb;
    integer i;
   
    // Duration for each bit        
    localparam period = 50;
            
    // Instantiate the module
    top uut(.a(a_tb), .b(b_tb), .c(c_tb), .d(d_tb), .e(e_tb), .out1(out1_tb), .out2(out2_tb), .eq(eq_tb));
    
    initial begin        
        for(i = 0; i < 32; i = i + 1) begin
            {a_tb, b_tb, c_tb, d_tb, e_tb} = i;
            #period;
            if(eq_tb == 0) begin
                $display(a_tb, b_tb, c_tb, d_tb, e_tb, " passed.");
            end else begin
                $display(a_tb, b_tb, c_tb, d_tb, e_tb, " failed.");
            end
        end
        $finish;
    end
endmodule
