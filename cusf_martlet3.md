---
layout: page
title: Martlet III
subtitle: Solid fuel rocket
---

<iframe style="display: block; margin: auto;" width="560" height="315" src="https://www.youtube-nocookie.com/embed/Gd7abIqnEvc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Project page on CUSF website](https://www.cuspaceflight.com/hybrid-rocket-engines)

This rocket was a solid fuel rocket following a boosted dart configuration &mdash; the idea being that once the fuel had burnt away, the thin metal dart attached to the top of the rocket would detach from the booster and continue to apogee. The avionics payload consisted of a stack of boards, with each performing a different function (communicating via CAN bus) - this improved system reliability since subsystems could fail without affecting the rest of the stack, and also made it easy to divide work (PCBs and firmware) amongst team members.

A secondary project, [TOAD](https://github.com/cuspaceflight/m3-avionics/tree/master/TOAD), aimed to track the position of the rocket using the time-of-flight of radio packets travelling from the rocket to ground based receivers, synchronised via GPS. Unfortunately, the hardware appeared to be too inaccurate to produce meaningful data.

We travelled to Black Rock desert, Nevada in September 2017 to launch Martlet III (due to altitude restrictions in the UK).

![On the road near Black Rock desert](/img/black_rock_mountain.JPG)
*On the road near Black Rock desert*

![Martlet III ascent](/img/m3_ascent.jpg)
*Liftoff! Photo credit: [Ada Coghen](https://twitter.com/adacoghen)*

Unfortunately, the off-the-shelf solid fuel motor used in the rocket exploded a few seconds into the flight. Whilst the first stage avionics was destroyed, the dart was undamaged and safely parachuted back down from an apogee of \~5km.

![Explosion of the first (booster) stage](/img/dartSurvival.png){: .center-image }
*Moments after the explosion. The remains of the booster can be seen falling away from the dart. Photo credit: [Ada Coghen](https://twitter.com/adacoghen)*

![Recovering the second stage](/img/m3dart_recovery.jpg)
*Recovery of the second stage (with some of the first stage attached)*

Personally, I [worked](https://github.com/cuspaceflight/m3-avionics/commits?author=Gregox273) on the PCB designs for the rocket's:  
- Telemetry board: [u-blox MAX-M8Q](https://www.u-blox.com/en/product/max-m8-series) GNSS module and [Si4460](https://www.silabs.com/products/wireless/proprietary/ezradiopro-ism-band-transmitters-recievers-transceivers/device.si4460) transceiver, with additional circuitry to clock/trigger radio transmissions using the u-blox's PPS signal for use with TOAD.  
[GitHub link](https://github.com/cuspaceflight/m3-avionics/tree/master/m3radio/pcb_r2)
- IMU board: originally this consisted of an [MPU9250](https://www.invensense.com/products/motion-tracking/9-axis/mpu-9250/) accelerometer working in parallel with an [ADIS16405](https://www.analog.com/en/products/adis16405.html), however damage to the ADIS' ribbon cable meant that it was removed in a subsequent revision of the board.  
[GitHub link](https://github.com/cuspaceflight/m3-avionics/tree/master/m3imu/pcb)

![Avionics boards](/img/m3avionics_adam_greig.jpg)

![Assembled avionics stack](/img/m3avionics_stack_adam_greig.jpg){: .center-image }
*Top: avionics boards. Bottom: assembled avionics stacks; both stages of the rocket contained their own avionics stack. Photo credit: [Adam Greig](https://www.flickr.com/photos/randomskk/albums/72157668754848453) [(CC BY-SA 2.0)](https://creativecommons.org/licenses/by-sa/2.0/)*


I also wrote firmware for many of the boards in the avionics stack, as well as a GUI and post-processing software for TOAD (in Python):

![TOAD GUI](/img/toad_gui.png)