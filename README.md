RedCloud
========

Simulation of data centers using dynamic networks of hybrid automata and continuous variables for request rates etc.

Installation
------------

To install as a gem:

    gem install redcloud

Applications
------------

Potential applications include:

* Capacity planning: long-term predictions of datacenter resource requirements.

* Dynamic scaling: short-term predictions; using current observations of requests coming into the system and the resource load of the system, predict the need to spin up (or down) additional computing and storage resources.

* Failure mode analysis: what kind of input spikes or component failures can lead to overall service degradation or system failure?

Implementation
--------------

RedCloud is based on [RedShift](https://github.com/vjoel/redshift), a simulation framework for dynamic networks of hybrid automata. RedShift generates fast C code from specifications written in a Ruby DSL. Features include discrete events and transitions, queues with Erlang-like pattern matching, synchronous and asynchronous composition of state machines, continuous variables governed by differential and algebraic equations, delay and differentiation, dynamic creation and connection of components, and dynamic reconfiguration of the connections (continuous and discrete) between components. The dynamic features are what make RedShift more than an open-source Simulink.

Simulations based on RedShift run in a single thread, in a single process, and are deterministic (results do not depend on internal arbitrary details such as the order in which components are traversed). RedShift also provides compile-on-demand hooks that can be used for logging, debugging, measurement, and intergration with other software. In principle, this means that RedCloud could be integrated into an actual data center, receiving inputs in real time, stepping the simulation, and sending outputs to control the production system.

RedCloud models computing infrastructure and events at a very high level of abstraction: there are no individual packets or bytes, there are no messages (or maybe just exceptional messages, such as control instructions, which can be modeled using RedShift's queues). Instead, we just use continuous variables to represent the rate of message arrival, or transaction requests, or HTTP requests, or .... Also, we use continuous variables to represent resources at a very abstract level: usage of CPU resources over time, for example.  The challenge of abstract modeling is how to capture the behavior of complex systems in terms of a few states and rules, and how to know what details can be safely omitted. The payoff is that a more abstract model is usually easier to calibrate and faster to simulate.

Example
-------

A very simple example showing what RedCloud is trying to do is [example/simple.rb](example/simple.rb).

Contact
=======

Joel VanderWerf, vjoel@users.sourceforge.net, @JoelVanderWerf.

License and Copyright
========

Copyright (c) 2014, Joel VanderWerf

License for this project is BSD. See the LICENSE file for the standard BSD license.
