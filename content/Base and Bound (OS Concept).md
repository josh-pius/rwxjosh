### General
Source: [[Operating Systems Three Easy Pieces (OSTEP) (Book)]]
- One of the first and simplest approaches for [[Address Translation (OS Concept)|Hardware-based Address Translation (OS Concept)]] in machines of late 1950s
- This technique is also called dynamic relocation, in contrast to an older approach called static relocation which had a fixed offset and not protection
	- With dynamic realocation we can move the address space even after the process has started running
- The base and bounds registers are hardware structures on the chip (one pair per [[Central Processing Unit (CPU)|CPU (Computer)]]). People call the part of the processor that helps with address translation the [[Memory Management Unit (MMU) (Computer Hardware)]]

### Implementation
- Two [[Register (Computer Hardware)|registers]] are used
	- **Base** register
	- **Bounds** register
- Together they allow the OS to place the process' [[Address Space (OS Concept)]] anywhere in physical memory
- When any memory reference is generated by the process it is translated by the process as follows:
	- $\text{physical address} = \text{virtual address} + \text{base}$
- The bounds register helps with protection, checking if the virtual address is within bounds
- Example
	- Address Space size: 16KB
	- Base Register: 32 KB
	- Bounds Register: 16KB
	- When the process requests for virtual address 0, it uses physical address 32KB
	- When the process requests virtual address 15 KB it returns physical address 47
	- If the process request virtual address 17KB, that is more than the bounds registers so exception would get thrown

### Bounds Registers Alternative Mental Model
- There are two ways bounds register maybe conceptualized
	- It holds the size of the address space
	- It holds the physical address at the end of the [[Address Space (OS Concept)]]
- In the latter case we would first compute the physical address before comparing with the base
- Both approaches are equivalent; OSTEP prefers the former


### Context Switching
- When a context switch occurs and the [[Central Processing Unit (CPU)|CPU (Computer)]] switches to another process the OS must save the values in the registers to a per-process structure like **process structure** or **process control block (PCB)**
- The [[Operating System (OS)|OS]] is also responsible for loading the right values to the register when the process is brought back into memory


### Moving Address Spaces
- **Important**: When a process is stopped it is possible for the OS to move the stopped process' [[Address Space (OS Concept)]] from one location to another. The OS copied the address space to the new location, it then updates the saved base register to so that it points to the new location. When the process resumes it is oblivious that its at a completely new place in memory



### Disadvantages
- One of the disadvantages of this approach is [[Internal Fragmentation (OS Concept)]]