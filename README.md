# Lab 1: Blinking LED

## Overview
This lab assignment involves the implementation of a blinking RGB LED which is enabled through a set of three switches onboard the Zybo Z7 FBGA development board.  Each color of the LED - red, green and blue - are one-hot encoded in the switch inputs, 001, 010 and 100 respectively.  All other combinations disable the LED.  For implementing this functionality, Verilog was the chosen HDL.

## Design Summary
Modules
- Blinking LED (Base)
    - Inputs:
        - sys_clk: used for logic timing
        - rst: if asserted during rising edge of sys_clk, LED output is disabled
        - led_en: if asserted during rising edge of sys_clk, LED output is enabled
    - Output:
        - led_out: logic signal to LED on Zybo Z7 dev board
- RGB LED (Top module)
    - Inputs:
        - sys_clk: used for logic timing
        - rst: if asserted during rising edge of sys_clk, rgb LED output is disabled
        - sw[2:0]: if one of the three switches is asserted during rising edge of sys_clk, respective LED color is enabled
    -Output:
        - rgb_out[2:0]: logic signal to each LED color on Zybo Z7 dev board
    - Instantiates the Blinking LED module

## Verification and Results
Test Cases for Blinking RGB LED
- Test Case 1: Reset LED
    - Description: Check that when the reset button is pressed, the LED remains disabled.
    - Results: After programming the FPGA, pressing the reset button was confirmed to disable the LED.  The simulation timing diagram also verifies the functionality of the reset signal at simulation-start.
- Test Case 2: Turn on Red LED
    - Description: Check that for sw[2:0] = {1,0,0}, the LED blinks red.
    - Results: Simulation timing diagram verifies only rgb_out[0] is high in this switch configuration.
- Test Case 3: Turn on Green LED
    - Description: Check that for sw[2:0] = {0,1,0}, the LED blinks green.
    - Results: Simulation timing diagram verifies only rgb_out[1] is high in this switch configuration.
- Test Case 4: Turn on Blue LED
    - Description: Check that for sw[2:0] = {0,0,1}, the LED blinks blue.
    - Results: Simulation timing diagram verifies only rgb_out[2] is high in this switch configuration.
- Test Case 5: Check Invalid Switch Configuration
    - Description: Check that for sw[2:0] = {0,1,1}, the LED is disabled.
    - Results: Simulation timing diagram verifies the LED is disabled under this condition.

## Known Issues and Limitations
The challenge here is understanding how to properly instantiate the blinking_led module for each led color along with the input/output signals for each color while considering the provided constraints file.  Additionally, the enable signals for each led color requires defining the combinational logic for the switches, as opposed to the base blinking_led module where using only one switch and one color made the logic more straight-forward.

## References
Past ECE 526/L (Verilog/SV) assignments were used as reference.
