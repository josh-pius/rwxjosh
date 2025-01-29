### General
- A [[Side Channel Attack (Cybersecurity)]]
- Often mentioned alongside [[Meltdown Attack (Cybersecurity)]], [[Spectre Attack (Cybersecurity)]] is the more problematic of the two
- The general weakness exploited in each of these attacks is that the [[Central Processing Unit (CPU)|CPUs]] found in modern systems perform all sorts of crazy behind-the-scenes tricks to improve performance. 
- One class of technique that lies at the core of the problem is called [[Speculative Execution (OS Concept)]], in which the CPU guesses which instructions will soon be executed in the future, and starts executing them ahead of time. 
- If the guesses are correct, the program runs faster; if not, the CPU undoes their effects on architectural state (e.g., [[Register (Computer Hardware)|registers]]) and tries again, this time going down the right path. 
- The problem with speculation is that it tends to leave traces of its execution in various parts of the system, such as processor [[CPU Cache (Computer Hardware)|Processor Caches (Computer Hardware)]], branch predictors, etc. 
- And thus the problem: as the authors of the attacks show, such state can make vulnerable the contents of memory, even memory that we thought was protected by the [[Memory Management Unit (MMU) (Computer Hardware)|MMU]].


### Official Paper
https://spectreattack.com

### Kernel Page Table Isolation
-  [[Kernel Page-Table Isolation (Cybersecurity)]] 

### Simple Video Explanation
https://youtu.be/q3-xCvzBjGs?si=RoQBUuJwRdOe8fmi by [[Jad Joubran (Youtuber)]]

### Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]