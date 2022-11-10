`timescale 1ns / 1ps


module Solver_tb();

reg clk, rst, in_tb;
wire [2:0] RGB_tb, LED_tb, SOL_tb;

Solver uut(.clk(clk), .reset(rst), .in(in_tb), .RGB(RGB_tb), .solution(SOL_tb), .LED(LED_tb));

always #10 clk = ~clk;

initial begin
    clk = 0; rst = 1;
    #20;
    rst = 0;
    
    in_tb = 1'b0;
    #200
    
    in_tb = 1'b1;
    #50
    
    $finish;
end
endmodule
