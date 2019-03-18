---
layout: page
title: Pulsar Hybrid Rocket Engine
subtitle: a.k.a Shadowfax
---

<iframe style="display: block; margin: auto;" width="560" height="315" src="https://www.youtube-nocookie.com/embed/RYhfGLZWWco" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[*Blog post*](https://www.cuspaceflight.com/blog/cambridge-university-spaceflight-fire-britain-s-largest-ever-nitrous-hybrid-rocket)

In response to the explosion of the off-the-shelf solid rocket motor used in Martlet III, CUSF decided to build our own hybrid rocket engine for use in Martlet IV. This engine was designed to be large enough to be useful in our attempts to break the UK amateur rocketry altitude record \([over 10km](http://www.ukra.org.uk/records/glance) as of 23rd Feb 2019\) and is believed to be the largest nitrous hybrid rocket ever fired in the UK \(53,855Ns\).

I was personally responsible for writing the firing control software that allows an operator to actuate the various valves (and ignition system) built into the rocket. A [PyQt](https://riverbankcomputing.com/software/pyqt/intro) GUI is presented to the user, displaying telemetry data from [CUSF's solenoid valve controller](https://github.com/cuspaceflight/hybrid-ignition) and providing buttons to open/close each firing channel. The program is a multi-process Python script, with USB I/O, writing to logfiles and the GUI frontend handled in three separate processes, improving performance (on a multi-core processor) and reliability in the event that a process should crash. Each process utilises a producer-consumer thread architecture to buffer data sent between processes. Whilst not rigorously tested, the program appears capable of handling more than 20 USB packets per second on a 1.6GHz Intel i5-5250U CPU.

The source code can be found [here](https://github.com/cuspaceflight/m4-gcs) though it's not particularly useful without the associated hardware...

![GUI screenshot](/img/m4-gcs.png)
*Screenshot of the GUI in action. Valve firing channels are arranged in two banks of five channels each.*