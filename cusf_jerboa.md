---
layout: page
title: Jerboa
subtitle: Long duration superpressure balloon (WIP)
---
![Populated Jerboa boards](/img/jerboa.jpg)

[GitHub repository](https://github.com/cuspaceflight/jerboa)

The aim of this project is to build a superpressure balloon capable of flying round the world by remaining at high altitude for several weeks (or even months). A 'traditional' latex balloon expands as its altitude increases i.e. as the external pressure decreases - eventually the balloon bursts. By using a plastic foil envelope that does not stretch, a balloon can be designed to reach an equilibrium altitude where it becomes neutrally buoyant.

![Welded plastic balloon](/img/plastic_balloon.jpg)  
*Attempt at welding a plastic balloon. A '[mylar balloon](https://en.wikipedia.org/wiki/Mylar_balloon_(geometry))' geometry is achieved by welding two circles together*

The maximum payload capacity for the balloon is dependent on the volume of the largest plastic balloon CUSF is able to manufacture (roughly 1m diameter circles). This is relatively small compared to the volume of a typical latex balloon at high altitude &mdash; this means that the payload must be extremely lightweight, around 20 grams. I therefore designed a small (2x5cm) lightweight tracker, Jerboa (named after some of the smallest rodents in the world) for this mission.

Since the payload will be required to operate for several weeks, it has been designed to be powered by a solar power module - this module will use a supercapacitor as an energy storage device, rather than a lithium battery, as batteries do not respond well to being charged at subzero (-40&deg;C) temperatures.

![Solar panel characterisation](/img/jerboa_solar_panel_test.jpg)
*Measuring the I-V curve of solar cells*

An [Si4460](https://www.silabs.com/products/wireless/proprietary/ezradiopro-ism-band-transmitters-recievers-transceivers/device.si4460) transceiver has been used for this board; the transmitter output can be switched between 434MHz and 144MHz quarter wave ground plane antennae (via filtering and matching circuitry) so that the payload can transmit using both [UKHAS style RTTY](https://ukhas.org.uk/guides:tracking_guide) and [APRS](https://en.wikipedia.org/wiki/Automatic_Packet_Reporting_System) when possible/allowed.

![Jerboa 144MHz antenna](/img/jerboa_antenna.jpg)

![Jerboa 144MHz antenna S11 plot](/img/jerboa_antenna_s11.jpg)  
*Rough characterisation of 144MHz antenna S11. Divide x-axis by 10...*