`timescale 1ns / 1ps


module fib_tb(
    );
    
    reg clk_tb, rst_tb, en_tb;
    wire[15:0] out1, out2;
    
    fib_beh uut(.clk(clk_tb), .rst(rst_tb), .en(en_tb), .out(out1));
    fib_str utt(.clk(clk_tb), .rst(rst_tb), .en(en_tb), .out(out2));
    
    always #10 clk_tb = ~clk_tb;
    always #10 en_tb = ~en_tb;
    
    initial begin
       clk_tb = 0;
       rst_tb = 1;
       en_tb = 0;
       #20;
       rst_tb = 0;
    end
    
endmodule
