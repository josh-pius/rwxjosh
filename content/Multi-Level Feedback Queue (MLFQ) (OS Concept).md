### General
- A type of [[Scheduling Policy (OS Concept)]]
- [[Shortest Time to Completion First (STCF) (OS Concept)]] optimizes for average turnaround time
- Tries to creates an optimal solution between the [[Response Time (OS Concept)]] and [[Turnaround Time (OS Concept)]] tradeoffs
- It also finally help us do away with the assumption that we know long a job will run (an assumption we make in STCF), because in reality we have no idea how long a job will run
- [[Multi-Level Feedback Queue (MLFQ) (OS Concept)]] does scheduling based on rules and introduces the idea of queues and [[Priority (OS Concept)]]
- MLFQ is a learning algorithm and modifies the [[Priority (OS Concept)]] of a job based on observed behavior
- If a job relinquishes it’s control of the CPU to wait for an input from a keyboard that job is given/retained a high priority, as this is a characteristic of interactive jobs that they user is running (as compared to routine jobs or other background processes)
- If a job uses all the CPU intensely for long periods it’s priority is reduced



### Queues
- There are queues for each level of [[Priority (OS Concept)]] 


### Priority Boost
- To deal with [[Starvation (OS Concept)]] and the possibility that a program may transition over time from long-running to interactive we add rule 5, which states that at some interval $S$ we move all the jobs back to the queue with highest priority
- Doing this ensures that jobs that are at the lowest priority and potentially [[Starvation (OS Concept)|starved]] once again get a chance to run, it would also redo it’s prioritization  so that any job that has transitioned from slow-running to interactive would now be given higher priority.
- The question maybe asked how long should $S$ be, unfortunately this is one of those constants for which it’s hard to figure out an optimal value, seemingly requiring black magic to correctly set it. The authors of [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] for this reason refer to such constants as [[Voo-Doo Constants]]
### Rules
- Since each CPU implements it’s own variant of MLFQ these rules are to absolute, but just an example provided by [[Operating Systems Three Easy Pieces (OSTEP) (Book)]]  on one way MLFQ could be implemented
1. Rule 1: If Priority(A) > Priority(B); A runs B doesn’t
2. Rule 2: If Priority(A) == Priority(B); A and B run in [[Round Robin (OS Concept)]]
3. Rule 3: When a job enters the system it is placed at the highest priority
4. Rule 4: Once a job uses up it’s time allotment at a given level (regardless of how many times it has given up the CPU) it’s priority is reduced, that is it moves one queue down
	1. [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] initially introduces a different rule 4 first but then shows how that approach can allow people to game the scheduler
5. Rule 5: After some time period $S$, we move all the jobs to the topmost queue



### Varying Length Time-Slice Per Queue
- Many MLFQ implementations vary the time-slice length with the queue
- For highest priority queue the time slice is small as it needs to switch between interactive jobs and provide quick [[Response Time (OS Concept)]], low priority jobs have a longer time slice as they are known to be long running and CPU intensive
### Tuning MLFQ
- Tuning the MLFQ involves selecting the time to boost $S$
- Number of queues
- Time slice per queue

### Popular Examples
- [[Solaris (Operating System)]] scheduler uses 60 queues
- [[FreeBSD (Operating System)]] uses a [[Decay-usage scheduling (OS Concept)]]. It uses a formula to figure out a job’s current priority and the usage is decayed over time, boost is achieved in a different way than described above
- Some schedulers reserve the highest priority queues for [[Operating System (OS)]] jobs. Some others seek the users advice to set priority, the [[nice (Linux Command)]] for example can be used to set a process’ priority
- BSD Unix, Solaris,[[Windows NT Kernel]] and it’s derivatives use a form of MLFQ