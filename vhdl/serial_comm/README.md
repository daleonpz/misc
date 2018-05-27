# Title: Serial communication

The goal is to communicate two FPGAs using a serial communication, in this case is based on SPI.

## FPGA ports:
- 135: external clock with a jumper based freq selector (1, 5, 10, 100, 1K, 10K, 100K, 1M)hz
- 106, 110-115: 7-segment display
- 17, 19, 22, 30: Debounced buttons
- 51-92: Port 2 
- 137-180: Brevia Port

## Idea:
The goal is to push in the FPGA master  any combination of debounced buttons, for example _0101_, and the 7-segment display of the FPGA slave should decimal number of the combination, in this case is 5. 
The communication protocol is based on SPI. Thus, this will be our setting: 

- Clk from FPGA master will be used as SPI clk
- Transmit a 4-bit data packet 

In blocks:

BUTTONS --> SPI --> CONVERT BIN TO 7SEG --> DISPLAY

## Buttons
Since they are debounced buttons, there is no need for a debouncing circuit. 

## SPI
The communication will be only in one direction, so we will need only two lines.
One for the SPI clock and the other for transmition from FPGA master to FPGA slave.
- TX: to be done
- RX: to be done 

## Converter 
The implementation will be done by **with ... select ... when**.




