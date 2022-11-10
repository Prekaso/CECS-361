`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// CECS 361 Final Project - Timer module w/ preset and increment/decrement modules
// Authored by Dylan Dang
// Created on April 27, 2022
//
// Edited on May 1, 2022 - added preset modules, removed hours place
//////////////////////////////////////////////////////////////////////////////////

module timer(
    input clk_100MHz,
    input reset,
    input start,
    input stop,
    input increment,
    input decrement,
    input place100,
    input placeSec,
    input placeMin,
    input potato,
    input pizza,
    input sec30,
    output [3:0] hr_10s, hr_1s, min_10s, min_1s, sec_10s, sec_1s, sec100_10s, sec100_1s,
    output reg [2:0] RGB, RGB1
    );
    
    // Button Debouncing
    reg a, b, c, d, e, f, g, h, i, j, k, l;
    wire w_start, w_stop, w_incr, w_decr;
    
    always @(posedge clk_100MHz) 
    begin
        a <= start;
        b <= a;
        c <= b;                
    end
    assign w_start = c;
    
    always @(posedge clk_100MHz)
    begin
        d <= stop;
        e <= d;
        f <= e;
    end
    assign w_stop = f;
    /*
    always @(posedge clk_100MHz) 
    begin
        g <= increment;
        h <= g;
        i <= h;                
    end
    assign w_incr = i;
    
    always @(posedge clk_100MHz) 
    begin
        j <= decrement;
        k <= j;
        l <= k;                
    end
    assign w_decr = l;
    */
    // Start/Stop && Increment/Decrement register
    reg ss = 0, id = 0;
    wire w_ss, w_id;

    // Start/Stop register control, it is essentially an SR Latch
    always @*
        if(w_start) begin
            ss = 1;
            RGB = 3'b101;
            RGB1 = 3'b101;
        end
        else if(w_stop) begin
            ss = 0;
            RGB = 3'b110;
            RGB1 = 3'b110;
        end
    
    assign w_ss = ss;
   
   // Increment/Decrement register control
   /*
    always @*
        if(w_incr)
            id = 1;
        else if(w_decr)
            id = 0;
    
    assign w_id = id;
    */
    
    // Create the 100 Hz generator to drive the counters
    reg [18:0] ctr_reg = 0; // 19 bits to cover 500,000
    reg r_100Hz = 0;
    wire clk_100Hz;
    
    always @(posedge clk_100MHz or posedge reset)
        if(reset) begin
            ctr_reg <= 0;
            r_100Hz <= 0;
        end
        else
            if(ctr_reg == 499_999) begin  // 100MHz / 100Hz / 2 = 500,000
                ctr_reg <= 0;
                r_100Hz <= ~r_100Hz;
            end
            else
                ctr_reg <= ctr_reg + 1;
    
    assign clk_100Hz = r_100Hz;
    
    // Registers for each counter
    reg [6:0] sec100_ctr = 0;
    reg [5:0] sec_ctr = 0;
    reg [5:0] min_ctr = 0;
    reg [6:0] hr_ctr = 0;
    
    // 1/100s of seconds reg control
    always @(posedge clk_100Hz or posedge reset)
        if(reset)
            sec100_ctr = 0;
        else
            if(w_ss) begin
                if(sec100_ctr > 0 && sec_ctr == 0)
                    sec100_ctr <= sec100_ctr - 1;  
                if(min_ctr > 0 && sec_ctr > 0)
                    sec100_ctr <= sec100_ctr - 1;
                if(sec100_ctr > 0 && sec_ctr > 0)
                    sec100_ctr <= sec100_ctr - 1;              
                if(sec100_ctr == 0 && sec_ctr > 0)
                    sec100_ctr <= 99;
            end
            else 
                if(w_ss == 0) begin
                    if(increment && place100)
                        sec100_ctr <= sec100_ctr + 1;
                    if(decrement && place100)
                        sec100_ctr <= sec100_ctr - 1;
                end
                    
       
    // seconds reg control            
    always @(posedge clk_100Hz or posedge reset)
        if(reset)
            sec_ctr = 0;
        else     
            if(w_ss) begin
                if(min_ctr > 0 && sec_ctr == 0 && sec100_ctr == 0)
                    sec_ctr <= 59;
                if(sec_ctr > 0 && sec100_ctr == 0)
                    sec_ctr <= sec_ctr - 1;
                if(min_ctr == 0 && sec_ctr == 0 && sec100_ctr == 0)
                    sec_ctr <= 0; 
             end  
             else 
                if(w_ss == 0) begin
                    if(increment && placeSec)
                        sec_ctr <= sec_ctr + 1;
                    if(decrement && placeSec)
                        sec_ctr <= sec_ctr - 1;
                    if(potato)
                        sec_ctr <= 20;
                    if(pizza || sec30)
                        sec_ctr <= 30;
                end
    
    // minutes reg control            
    always @(posedge clk_100Hz or posedge reset)
        if(reset)
            min_ctr = 0;
        else
            if(w_ss) begin
                if(min_ctr > 0 && sec_ctr == 0 && sec100_ctr == 0)
                    min_ctr <= min_ctr - 1;
                if(min_ctr == 0)
                    min_ctr <= 0;
            end
            else
                if(w_ss == 0) begin
                    if(increment && placeMin)
                        min_ctr = min_ctr + 1;
                    if(decrement && placeMin)
                        min_ctr = min_ctr - 1;
                    if(potato)
                        min_ctr = 5;
                    if(pizza)
                        min_ctr = 2;
                end
                 
    // hours reg control            
    always @(posedge clk_100Hz or posedge reset)
        if(reset)
            hr_ctr = 0;
        else
            if(w_ss) begin
                hr_ctr <= 0;
                //if(sec100_ctr == 0 && sec_ctr == 0 && min_ctr == 0)
                    //if(hr_ctr == 0)
                        //hr_ctr <= 0;
                    //else
                       // hr_ctr <= hr_ctr - 1;  
            end
            else
                if(w_ss == 0) begin
                    hr_ctr <= 10;
                end
                    
    // Binary to BCD conversion for output signals
    assign sec100_10s = sec100_ctr / 10;
    assign sec100_1s  = sec100_ctr % 10;
    assign sec_10s    = sec_ctr / 10;
    assign sec_1s     = sec_ctr % 10;
    assign min_10s    = min_ctr / 10;
    assign min_1s     = min_ctr % 10;
    assign hr_10s     = hr_ctr / 10;
    assign hr_1s      = hr_ctr % 10;
    
    
endmodule