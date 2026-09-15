`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 07:27:49 PM
// Design Name: 
// Module Name: blinking_led
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


module blinking_led #(
    parameter CLK_CYCLES_PER_TOGGLE = 62500000
)(
    input wire sys_clk,
    input wire rst,
    input wire led_en,
    output reg led_out = 1'b0
    );
    
    reg[$clog2(CLK_CYCLES_PER_TOGGLE)-1:0] count = 26'b0;
    always @(posedge sys_clk) begin
        if(rst || !led_en) begin
            count <= 1'b0;
            led_out <= 1'b0;
            end
        else if(count < CLK_CYCLES_PER_TOGGLE - 1) begin
            count <= count + 1;
            end
        else begin
            count <= 1'b0;
            led_out <= ~led_out;
            end
    end
    
endmodule
