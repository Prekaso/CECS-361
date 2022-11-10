`timescale 1ns / 1ps

module fib_beh(
    input en, input clk, input rst,
    output [15:0] out
);

reg [15:0] reg0, reg1;

assign out = reg0 + reg1;

always @(posedge clk, posedge rst) begin
    if(rst) begin
        reg0 = 0;
        reg1 = 1;
    end 
    else if(en) begin
        reg0 <= reg1;
        reg1 <= out;
    end
end
endmodule