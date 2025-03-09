### General
- Cache of recent Virtual Address to Physical address mappings
- The name is confusing and according to OSTEP a better name would be “Address Translation Cache”
- The TLB is part of the chip’s [[Memory Management Unit (MMU) (Computer Hardware)|MMU]], so it is a hardware cache of translations
- The TLB cache is stored in a cache on the chip since there are limits on how big this memory can be the TLB has limited records it can store
### Makes Virtual Memory Possible
- [[Paging  (OS Concept)]] without the TLB is incredibly slow 
- OSTEP claims that [[Translation Lookaside Buffer (TLB) (OS Concept)|TLB]]  is what makes virtual memory possible
- The TLB is built on the premise that in the common case, translations are found in the cache 


### Algorithm
- The below code block illustrates what the algorithm that uses [[Translation Lookaside Buffer (TLB) (OS Concept)]] with [[Paging  (OS Concept)]] might look like, assuming a linear page table and hardware managed TLB
- To me it looks similar to how we do [[Memoization (Algorithms)]] in [[Dynamic Programming]] algorithms
	- You first check if it's present in cache otherwise you find the value put it in cache and then rerun the block
- We see the two paths for TLB hit and TLB miss
```c
VPN = (VirtualAddress & VPN_MASK) >> SHIFT
(Success, TlbEntry) = TLB_Lookup(VPN)
if (Success == True) // TLB Hit
	if (CanAccess(TlbEntry.ProtectBits) == True)
		Offset = VirtualAddress & OFFSET_MASK
		PhysAddr = (TlbEntry.PFN << SHIFT) | Offset
		Register = AccessMemory(PhysAddr)
	else
		RaiseException(PROTECTION_FAULT)
else // TLB Miss
	PTEAddr = PTBR + (VPN * sizeof(PTE))
	PTE = AccessMemory(PTEAddr)
	if (PTE.Valid == False)
		RaiseException(SEGMENTATION_FAULT)
	else if (CanAccess(PTE.ProtectBits) == False)
		RaiseException(PROTECTION_FAULT)
	else
		TLB_Insert(VPN, PTE.PFN, PTE.ProtectBits)
		RetryInstruction()
```

### Spatial Locality
- [[Spatial Locality (Caching)]]
- Consider an number array (entries stored contiguously) with each number of size 4-bytes in pages of size 16 bytes
- Imagine there is a loop that accesses these array entries one by one
- Each page may have up to four number entries
- The first access of the virtual address of the first address will be a TLB miss
- However assuming that the next number is also present in the same page the next number accessed would be a TLB hit and so on until we reach the end of the page
- This benefit of special locality results in our TLB hit rate being pretty high even if every address accessed here has never been  accessed before 
- One might imagine that if the [[Paging  (OS Concept)|page]] size was even bigger we'd see even fewer misses, typical [[Page Size (OS Concept)|page sizes]] are more like 4KB and not 16 bytes like in the example


### Temporal Locality
- [[Temporal Locality (Caching)]]
- If we continue with the example in [[#Spatial Locality]] and imagine that this array was accesses again we'd get the benefits of [[Temporal Locality (Caching)]]
- Since the entries are already present in the [[Translation Lookaside Buffer (TLB) (OS Concept)]] and they're accessed soon after the first access so there will be many TLB hits

### Who Handles TLB Miss
- In the olden days hardware had [[Complex-Instruction Set Computers  (CISC)|Complex Instruction Sets]] and TLB misses were handled by hardware
	- The hardware had to know exactly where the [[Page Table (OS Concept)|Page tables]] were located via a page table base [[Register (Computer Hardware)|register]] and it's exact format so that it could "walk" this table to find the correct translation. The current process' page table was stored in CR3 register
	- An example of this is the [[Intel (Company)|Intel]] [[x86 (CPU Architecture)|x86]] which uses a multi-level page-table
- More modern architectures use [[Reduced-Instruction Set Computer (RISC)|Reduced Instruction Sets]]
	- In this case we have software-managed TLB 
	- On TLB miss hardware raises an exception which pauses current instruction stream and raises the privilege  to [[Kernel Mode (OS Concept)]] and jumps to a [[Trap (OS Concept)]] handler
	- This trap handler is [[Operating System (OS)|OS]] code that handles the TLB miss. It looks up the instruction in the page table and runs privileged instructions to update the TLB and return from the trap
	- **Important**: Return from [[Trap (OS Concept)|trap]] instruction in this TLB miss case needs to return execution at the **same** instruction that caused the trap. Compare this with other return from [[Trap (OS Concept)|trap]] we've seen earlier which resumes execution from the instruction **after** the trap into the OS
		- Thus, depending on how a trap or exception was caused, the hardware must save a different [[Program Counter (PC) (CPU)]] when trapping into the [[Operating System (OS)]], in order to resume properly when the time to do so arrives.
	- Another thing to consider is How the TLB miss-handling code will run, the OS needs to be extra careful not to cause an infinite chain of TLB misses to occur. 
		- Many solutions exist; for example, you could keep TLB miss handlers in physical memory (where they are unmapped and not subject to address translation), or reserve some entries in the TLB for permanently-valid translations and use some of those permanent translation slots for the handler code itself; these wired translations always hit in the TLB.
- Advantages of software-based TLB
	- Flexibility: OS is free to choose any [[Data Structures (Computer Science)|data structure]] for the structure for the page table (with hardware based page tables the OS needs to know the register the table would be stored or in case of a multi-level page table it needs to know the structure as well)
	- Simplicity: With software based cache the hardware does not need to much. A trap is raised for TLB miss. The OS TLB miss handler takes care of it

### TLB Valid Bit $\neq$ Page Table Valid Bit
- See [[Page Table (OS Concept)]] 
 - Don’t confuse ”valid bit” in a page table with the one in a [[Translation Lookaside Buffer (TLB) (OS Concept)]]
- In a [[Page Table (OS Concept)]] when a page-table entry (PTE) has been marked invalid it means that the page has not yet been allocated by the process, it should not be accessed by a correctly working program. When a program tries to access a page marked invalid it raises a [[Trap (OS Concept)]] To the OS which in turn will kill the process
- A [[Translation Lookaside Buffer (TLB) (OS Concept)|TLB]] [[Valid Bit (OS Concept)]] in contrast simply refers to whether a TLB entry has a valid translation within it. 
	- When a system boots for example a common initial state for each TLB entry it to be set to invalid, because no address translation has been cached yet. 
	- TLB valid bits can be useful when doing [[Context Switching (OS Concept)|context switching]] as well. By setting all TLB entries to invalid you can ensure the about-to-be-run process does not accidentally use the virtual to physical translation of from a previous process.


### TLB Contents
- A typical TLB might have 32, 64, 128 entries and be what is called [[Fully Associative Cache (Software)]], which means that the translation could be stored anywhere and the TLB will search the entire TLB in parallel to find it
- A particular entry might look like this (see [[Virtual Page Number (VPN) (OS Concept)]], [[Physical Frame Number (PFN) (OS Concept)]])
	- `VPN | PFN | other bits`
- The other bits include
	- Valid bit -  Which tells you whether it's a valid translation or not
	- Protection bits - Determines how a page can be accessed (code pages maybe marked read and execute, whereas heap pages maybe marked read and write)
	- [[Address-Space Identifier (ASID) (OS Concept)]] 
	- Dirty Bit

### Context Switches
- The virtual to physical translations present in the TLB at a given time is only valid for that [[Process (Computing)]]
- When a context switch occurs OS needs some way to know not the use the previous processes' mappings
- One way of doing this is to **flush** the [[Translation Lookaside Buffer (TLB) (OS Concept)|TLB]], by setting the valid bit for all the entries to false before [[Context Switching (OS Concept)]]
	- When done using hardware this step could be executed automatically after the [[Page Table Base Register (PTBR) (OS Concept)]] is changed (it needs to change on [[Context Switching (OS Concept)]] anyways)
- The downside of the above approach it that it increases [[Cache Miss (Software)|cache misses]] if context switching happens too often, to avoid this some systems have a [[Address-Space Identifier (ASID) (OS Concept)]], (can think of this as a [[Process ID (PID) (OS Concept)]] even though it has fewer bits compared to it) so that it can remember which process the translation belonged to
	- When using this approach the hardware needs to remember the [[Address-Space Identifier (ASID) (OS Concept)]] associated with each [[Process (Computing)]] and some privileged register needs to be set with the ASID of the current process

### Sharing Pages
- When it comes to code [[Paging  (OS Concept)|pages]] (think binaries or shared libraries) between processes, even though the virtual address between processes for these pages are different they can be mapped to the same physical page
- This reduces number of physical pages and also memory overheads

### Replacement Policy
- [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] will look at more replacement policies in the context of [[Swapping (OS Concept)]]
- It mentions only two policies wrt TLB
- [[Least Recently Used (LRU) (Cache Replacement Policy)]]: Takes advantages of [[Temporal Locality (Caching)]], something that has not been accessed recently is a good candidate for eviction
- [[Random Replacement (Cache Replacement Policy)]] 


### Example of A Real TLB Entry
- We'll be looking at the [[MIPS R4000 (Microprocessor)]] which uses software managed [[Translation Lookaside Buffer (TLB) (OS Concept)|TLB]]
- [[MIPS R4000 (Microprocessor)]] supports a 32-bit [[Address Space (OS Concept)]] with 4KB [[Paging  (OS Concept)|Pages]]
	- Which means a 20-bit [[Virtual Page Number (VPN) (OS Concept)|VPN]] and 12-bit [[Offset (OS Concept)]]
- The TLB however has only 19 bits for the VPN, this is because user addressed only only come from half the address space, the rest is reserved for the [[Kernel (OS Concept)]]
- The [[Physical Frame Number (PFN) (OS Concept)]] is 24-bits which means it can support systems with upto 64 GB of (physical) main memory ($2^{24}\times$ 4KB pages)
	- I don't really understand how the 20-bit VPN can get translated to a 24 bit PFN, I would if it has to do with something like [[Physical Address Extension (PAE) (OS Concept)]]
- Some interesting bits
- [[Global bit (G) (OS Concept)]]: Used for pages that are globally-shared among processes
		- If set the [[Address-Space Identifier (ASID) (OS Concept)]] is ignored
	- [[Address-Space Identifier (ASID) (OS Concept)]]: Can be used to distinguish between [[Address Space (OS Concept)|address spaces]] of different processes) (8-bit)
	- [[Coherence Bits (OS Concept)]] (C): Determine how a page is cached by the hardware
	- [[Dirty Bit (OS Concept)]]: Marked when a page has been written to
	- [[Valid Bit (OS Concept)]]: Tells hardware if a valid translation is present at that location or not
	- Page Mask:  Helps supports multiple [[Page Size (OS Concept)|Page sizes]]

### Why Not A Huge TLB
- Fundamental laws like the laws of physics apply as you get larger which causes the cache itself to work slower
- If you want a fast cache you need to keep it small

### TLB Coverage
 - If the number of pages a program accesses in a short period of time exceeds the number of pages that fit into the TLB, the program will generate a large number of TLB misses, and thus run quite a bit more slowly. 
 - We refer to this phenomenon as exceeding the TLB coverage, and it can be quite a problem for certain programs




### Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]