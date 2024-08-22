### General
- Read [[CPU Scheduling (OS Concept)]] first, this note is specific to multiprocessor scheduling


### The Problem With Cache
- Modern CPUs have stopped becoming faster so now the push it to have more and more CPUs packed into the same computer
- Ensuring all these [[Central Processing Unit (CPU)|CPU (Computer)]]s work efficiently needs us to consider multiprocessor scheduling
- Multiprocessor scheduling is harder than single processor scheduling
- The fundamental difference between single-CPU and mulit-CPU hardware lies in the use of hardware [[CPU Cache (Computer Hardware)|caches]] and how data is shared across multiple processes.
	- See [[Caching (Software)#Notion of Locality]]
- When a program updates a variable's value (say) it updates this in the cache first before writing to memory, if during this time another process runs and rereads the same address it would get the wrong value. A problem known as [[Cache Coherence (Software)]]
- The basic solution involves monitoring memory access. One way to do this on a bus-based system is [[Bus Snooping (Software)]]
	- All the cache are connected to the bus and the bus has the intelligence to invalidate cache or update it when things change

### Locking
- [[Bus Snooping (Software)]] by itself isn't enough though. Even with this issue sorted the program might have concurrency issues and so we need to have synchronization via [[Mutex (Computing)|locking]]
	- Locking comes at a cost, it reduces performances as one CPU now has to wait for the other. Access to a synchronized data structure becomes quiet slow


### Cache Affinity
- [[Cache Affinity (Software)]] 

### Linux Multiprocess Scheduler
[[CPU Scheduling (OS Concept)#Linux Multiprocess Schedulers]]