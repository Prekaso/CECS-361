`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Authored by Dylan Dang
// Created on April 27, 2022
//
// Edited on May 1, 2022 - added debounce and preset modules
//////////////////////////////////////////////////////////////////////////////////

module top(
    input clk_100MHz,           // 100MHz from Nexys A7
    input reset,                // btnC
    input start,                // btnU
    input stop,                 // btnD
    input increment,
    input decrement,
    input place100,
    input placeSec,
    input placeMin,
    input potato,
    input pizza,
    input sec30,
    output [0:6] seg,           // 7 segments
    output dp,                  // decimal point
    output [7:0] an             // 8 anodes
    );
    
    wire [3:0] hr_10s, hr_1s, min_10s, min_1s, sec_10s, sec_1s, sec100_10s, sec100_1s;
    wire [2:0] RGB, RGB1;
    
    timer t(
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .start(start),
        .stop(stop),
        .increment(increment),
        .decrement(decrement),
        .place100(place100),
        .placeSec(placeSec),
        .placeMin(placeMin),
        .potato(potato),
        .pizza(pizza),
        .sec30(sec30),
        .hr_10s(hr_10s), 
        .hr_1s(hr_1s), 
        .min_10s(min_10s), 
        .min_1s(min_1s), 
        .sec_10s(sec_10s), 
        .sec_1s(sec_1s), 
        .sec100_10s(sec100_10s), 
        .sec100_1s(sec100_1s),
        .RGB(RGB),
        .RGB1(RGB1)
        );
    
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
        .digit(an)      
        );
         
endmodule