---
aliases:
  - Hardware-based Address Translation (OS Concept)
---
### General
Source: [[Operating Systems Three Easy Pieces (OSTEP) (Book)]]
- This mechanism translates physical memory address to the [[Process (Computing)|process]]' [[Address Space (OS Concept)]] via [[Interposition (OS Concept)]]
- Essential for virtualizing memory, creating the illusion that the program has it's own private memory, also protects programs from accidentally writing into another program's memory


### Hardware Support
- To support address translation you need to have the hardware support
	- [[Kernel Mode (OS Concept)]]/ [[User Mode (OS Concept)]] difference by using some kind of processor status word
	- [[Base and Bound (OS Concept)]] registers in [[Memory Management Unit (MMU) (Computer Hardware)]]
	- Ability to translate virtual addresses to check if within bounds
	- Privileged instruction to register exceptions handlers
	- Ability to raise exception 


### Freelist
- [[Free List (Data Structure)]]
- A simple data structure that is used to store available [[Address Space (OS Concept)|address spaces]]
	- It's not the only data structure that can be used for this purpose but it's the one [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] focuses on
- The [[Operating System (OS)|OS]] is responsible for keeping free memory [[Address Space (OS Concept)]] in the free list, it is also responsible to reclaim this memory from the process when its done and add it back to [[Free List (Data Structure)]]


### Approaches
1. [[Base and Bound (OS Concept)]]