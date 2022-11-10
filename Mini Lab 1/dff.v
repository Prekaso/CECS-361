`timescale 1ns / 1ps

module dff(
    input clk,
    input [15:0] d,
    input rst, 
    input default_value,
    output reg [15:0] q    
);

always @(posedge clk, posedge rst) begin
    if(rst) q <= default_value;
    else q <= d;
end

endmodule
