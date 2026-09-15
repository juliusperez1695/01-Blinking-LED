`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2026 01:57:20 PM
// Design Name: 
// Module Name: tb_rgb_led_top
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


module tb_rgb_led_top;
    
    // instantiate I/O test signals
    reg sys_clk;
    reg rst;
    reg[2:0] sw;
    wire[2:0] rgb_out;
    
    // instantiate rgb_led
    rgb_led_top #(
        .CLK_CYCLES_PER_TOGGLE(5)
    )UUT_rgb_led_top(
        .sys_clk(sys_clk),
        .rst(rst),
        .sw(sw),
        .rgb_out(rgb_out)
    );
    
    // generate system clock
    initial begin
        sys_clk = 1'b0;
        forever #(4) sys_clk = ~sys_clk;
    end
    
    
    initial begin
        // Test Case #1:  Reset LED
        rst = 1'b1; sw[0] = 1'b0; sw[1] = 1'b0; sw[2] = 1'b0;
        #100
        
        // Test Case #2:  Turn on Red LED
        rst = 1'b0; sw[0] = 1'b1; sw[1] = 1'b0; sw[2] = 1'b0;
        #200
        
        // Test Case #3:  Turn on Green LED
        rst = 1'b0; sw[0] = 1'b0; sw[1] = 1'b1; sw[2] = 1'b0;
        #200
        
        // Test Case #4:  Turn on Blue LED
        rst = 1'b0; sw[0] = 1'b0; sw[1] = 1'b0; sw[2] = 1'b1;
        #200
        
        // Test Case #5:  Set any two switches - confirm LED remains off
        rst = 1'b0; sw[0] = 1'b0; sw[1] = 1'b1; sw[2] = 1'b1;
        #200
        
        #1000 $finish;
        
    end

endmodule
