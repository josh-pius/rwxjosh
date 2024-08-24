### General
- This notion is simple: a process, when run on a particular [[Central Processing Unit (CPU)|CPU (Computer)]], builds up a fair bit of state in the caches (and TLBs) of the CPU. The next time the process runs, it is often advantageous to run it on the same CPU, as it will run faster if some of its state
- Is already present in the caches on that CPU. If, instead, one runs a process on a different CPU each time, the performance of the process will be
- Worse, as it will have to reload the state each time it runs (note it will run correctly on a different CPU thanks to the cache coherence protocols of the hardware, protocols such as [[Bus Snooping (Software)]]). 
- Thus, a multiprocessor scheduler should consider cache affinity when making its scheduling decisions, perhaps preferring to keep a process on the same CPU if at all possible.

