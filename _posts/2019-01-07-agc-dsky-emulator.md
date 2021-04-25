---
layout: post
title: Handheld Apollo 11 AGC/DSKY Emulator
gh-repo: Gregox273/Embedded-AGC-DSKY-emulator
gh-badge: [star,watch,fork,follow]
---
<!-- *[GitHub repo](github.com/Gregox273/Embedded-AGC-DSKY-emulator)* -->
The aim of [this project](https://github.com/Gregox273/Embedded-AGC-DSKY-emulator) was to emulate the Apollo Guidance Computer (AGC) and DSKY user interface on a handheld physical device running the machine code from the Apollo lunar missions (tested with Luminary099, the software that ran in the Apollo 11 LM). This involved designing custom PCBs (finished in stylish lunar white) featuring:

- [STM32F072RBT6](https://www.st.com/en/microcontrollers-microprocessors/stm32f072rb.html) 48MHz microcontroller.
- Micro USB socket for power (draws less than 500mA, so USB 2.0 compatible) and flashing the microcontroller using DFU.
- SWD interface for programming and debugging.
- [WS2812B](https://www.kitronik.co.uk/pdf/WS2812B-LED-datasheet.pdf) single-wire digital LEDs.
- [MPU9250](https://www.invensense.com/products/motion-tracking/9-axis/mpu-9250/) IMU (not yet integrated into the Apollo emulator).
- Multiplexed keypad and 7-segment displays.
- UART port for further expansion.

[![Apollo AGC/DSKY emulator](/img/agc_dsky.jpg)]()
*DSKY lamp test routine on the right, my own hardware test program on the left (showing accelerometer x,y,z acceleration register contents)*

![Unpopulated PCBs](/img/dsky_board_unpopulated.jpg)
*Unpopulated PCBs*

The firmware is built upon the vast body of work done by the [VirtualAGC project](https://www.ibiblio.org/apollo/). As well as transcribing  many of the original Apollo schematics and software printouts into digital form, the project has produced the yaAGC emulator, a desktop C application that emulates the AGC, and yaYUL, an Apollo assembler. My project took the binary '[core rope](https://en.wikipedia.org/wiki/Core_rope_memory)' output of yaYUL, rearranging some memory banks before storing it in the STM32's flash memory. A ported version of yaAGC running on the microcontroller could then step through the instructions in the Apollo binary. My code maps yaAGC's I/O channels to the physical hardware on the board.

<!-- ![Lamp test GIF](/img/dsky_lamp_test.gif){: .center-image } -->
<iframe style="display: block; margin: auto;" width="560" height="315" src="https://www.youtube-nocookie.com/embed/7s1hY1GGdyk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
*Running the lamp test routine*

***Note: This project would not have been possible without the work of Ron Burkey and everyone else involved with the VirtualAGC project (and of course the people who designed the original at the Charles Stark Draper Laboratory and NASA). Take a look at their work here: [www.ibiblio.org/apollo/index.html](https://www.ibiblio.org/apollo/index.html)***

Areas to improve:
- Use a faster processor or optimise the code. Unfortunately, the STM32F072RBT6 appears to be too slow to run the emulator in real time. For example, when viewing the 'mission' time, the second counter increments at less than one second per second.
- Use DMA (e.g. DMA SPI) to write to the LEDs, rather than pausing the emulator.
- Include option to feed IMU data into the emulator.
- Connect to a spaceflight simulator such as [NASSP](http://nassp.sourceforge.net/wiki/Main_Page) over USB. This would allow the device to take part in a landing simulation...
