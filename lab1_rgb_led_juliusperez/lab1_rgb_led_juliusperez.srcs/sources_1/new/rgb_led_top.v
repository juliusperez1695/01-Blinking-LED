`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2026 08:58:07 PM
// Design Name: 
// Module Name: rgb_led_top
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


module rgb_led_top#(
    parameter CLK_CYCLES_PER_TOGGLE = 62500000
)(
    input wire sys_clk,
    input wire rst,
    input wire[2:0] sw,
    output wire[2:0] rgb_out
    );
    
    // use combinational logic for switch - color relation
    wire red_led_en, green_led_en, blue_led_en;
    
    assign red_led_en = sw[0]==1 && sw[1]==0 && sw[2]==0;
    assign green_led_en = sw[0]==0 && sw[1]==1 && sw[2]==0;
    assign blue_led_en = sw[0]==0 && sw[1]==0 && sw[2]==1;
    
    // instantiate three blinking_led's (r,g,b)
    blinking_led #(
        .CLK_CYCLES_PER_TOGGLE(CLK_CYCLES_PER_TOGGLE)
    ) Red(
        .sys_clk(sys_clk),
        .rst(rst),
        .led_en(red_led_en),
        .led_out(rgb_out[0])
    );
    
    blinking_led #(
        .CLK_CYCLES_PER_TOGGLE(CLK_CYCLES_PER_TOGGLE)
    ) Green(
        .sys_clk(sys_clk),
        .rst(rst),
        .led_en(green_led_en),
        .led_out(rgb_out[1])
    );
    
    blinking_led #(
        .CLK_CYCLES_PER_TOGGLE(CLK_CYCLES_PER_TOGGLE)
    ) Blue(
        .sys_clk(sys_clk),
        .rst(rst),
        .led_en(blue_led_en),
        .led_out(rgb_out[2])
    );
    
endmodule
