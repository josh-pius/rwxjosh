### General
- Has to do with concurrency 32 bits vs 64 bits machines
- Some types are stored on 64 bits, in 64 bit machine, that is one operation but on 32 bit machine you need two write operations, but in multithreaded env, the thread can be interrupted and some other thread can see the value in it's intermediate state
- Can be prevented using [[Synchronization (Java)]] but it comes at a cost


### Sources
https://youtube.com/shorts/CJGZBdOdBiw?si=U1ZiunaUQ758-Vxm by [[Java (Youtuber)]]