`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Jose Aceves & Amin Rezaei
// Create Date: 08/30/2020 04:25:12 PM
// Design Name: 361_Lab2
// Module Name: Top_tb
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Top_tb();

reg clk_tb, rst_tb;
reg [1:0] sel_tb;
wire [2:0] RGB_tb, LED_tb;

top uut(.clk(clk_tb), .reset(rst_tb), .sel(sel_tb), .RGB(RGB_tb), .LED(LED_tb));

always #10 clk_tb = ~clk_tb;

integer i;

initial begin
    clk_tb = 0; rst_tb = 1;
    #20;
    rst_tb = 0;
    for(i = 0; i < 4; i = i + 1) begin
        sel_tb = i;
        rst_tb = 1;
        #20;
        rst_tb = 0;
        #180;
    end
end
endmodule