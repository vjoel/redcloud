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

With RedShift, simulations run in a single process, single thread, and are completely deterministic (results do not depend on internal arbitrary details such as the order in which components are traversed).

Contact
=======

Joel VanderWerf, vjoel@users.sourceforge.net, @JoelVanderWerf.

License and Copyright
========

Copyright (c) 2014, Joel VanderWerf

License for this project is BSD. See the LICENSE file for the standard BSD license.
