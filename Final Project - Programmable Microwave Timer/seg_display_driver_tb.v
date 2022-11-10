`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Dylan Dang
// 
// Create Date: 05/01/2022 
// Module Name: seg_display_driver_tb
// 
//////////////////////////////////////////////////////////////////////////////////

module seg_display_driver_tb();
    reg clk_100MHz, reset;
    reg [3:0] hr_10s, hr_1s, min_10s, min_1s, sec_10s, sec_1s, sec100_10s, sec100_1s;
    wire [0:6] seg;
    wire dp;
    wire [7:0] digit;
    integer i;  
    localparam period = 20;
    
    seg_display_driver sdd(
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .hr_10s(hr_10s), 
        .hr_1s(hr_1s), 
        .min_10s(min_10s), 
        .min_1s(min_1s), 
        .sec_10s(sec_10s), 
        .sec_1s(sec_1s), 
        .sec100_10s(sec100_10s), 
        .sec100_1s(sec100_1s),
        .seg(seg),
        .dp(dp),       
        .digit(digit)      
        );
        
    always begin
        #5 clk_100MHz = ~clk_100MHz;
        #5 reset = 0;
    end
    
    initial begin
        for(i = 0; i < 100; i = i + 1) begin
            {hr_10s, hr_1s, min_10s, min_1s, sec_10s, sec_1s, sec100_10s, sec100_1s} = i;
        #period;
        end 
        $finish;  
    end
endmodule
