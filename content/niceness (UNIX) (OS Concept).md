### General
- A concept unique to [[UNIX (OS)]]  (AFAIK, authors of [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] also say its unique to UNIX
- Niceness  is not a concept in all [[CPU Scheduling (OS Concept)#CPU Scheduling Algorithms]]
	- So far I only know of [[Completely Fair Scheduler (CFS) (OS Concept)]] that has this concept but there may be others.
- The default value for niceness of a process is 0, but it can be set anywhere from -20 to +19
- Each of the values in this range is associated with a weight (OSTEP shows the mapping) and those weights get used to compute the timeslice that process gets
- A negative value mean the process will be less “nice” which mean it will receive more CPU time


### Relative Priority
- Niceness does not define a processes absolute priority rather it is a relative priority
- Two processes with niceness -5 and 0 (a difference of 5) would be scheduled exactly the same as two processes with niceness 5 and 10