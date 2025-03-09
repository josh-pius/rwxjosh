### General
- Definition from OSTEP
	- One of the most important data structures in the memory management subsystem of a modern OS is the page table. 
	- In general, a page table stores virtual-to-physical address translations, thus letting the system know where each page of an address space actually resides in physical memory. 
	- Because each address space requires such translations, in general there is one page table per process in the system
- To record where each virtual page of an [[Address Space (OS Concept)]] gets mapped in physical memory the [[Operating System (OS)|OS]] maintains a per-process data structure called [[Page Table (OS Concept)]]
	- In linux the page table is part of the PCB the data structure that maintains per-process info [[Process Control Block (PCB) (OS Concept)#Page Table]]
- The major role of a [[Page Table (OS Concept)]] is address translation. It tells us which physical page each virtual page maps to 
- It is important to remember that the page table is a per-[[Process (Computing)|process]] [[Data Structures (Computer Science)|data structure]]
	- An exception to this is the inverted page table



### Page Table Storage
- Page tables can get very large compared to a [[Base and Bound (OS Concept)|base and bound pair]] of registers
- In a more realistic system with 32-bit address space and 4KB pages, the [[Virtual Page Number (VPN) (OS Concept)|VPN]]-offset based addressing ([[Paging  (OS Concept)#Translation]]) would result in a 20-bit VPN which is roughly $2^{20}$  translations. 
- Assuming we need 4 bytes to hold each page table entry, that's 4 MB needed for each page table. A 100 [[Process (Computing)|processes]] then would result in 400 MB of memory just for translations!
- Because page tables are so big, we don't keep any special on-chip hardware in the [[Memory Management Unit (MMU) (Computer Hardware)|MMU]] to store the page table instead we store the [[Page Table (OS Concept)|page tables]] in memory
- Page tables can themselves be stored in virtual OS virtual memory page (Fig 18.4 in OSTEP shows an example) 
	- The page table data structure is stored in a page frame in the OS memory
- Potential solutions to the problem of large page table size
	- [[#Smaller Tables]]
	- [[#Hybrid Approach Paging and Segments]]
	- [[#Multi-Level Page Table]]
	- [[#Inverted Page Table]]
	- [[#Swapping the Page Tables to Disk]]

### Structure of A Page Table
- Page table is used for translating a virtual page number to a physical frame number
- The simplest form is called a **linear page table**, which is just an array. The OS indexes the array by the virtual page number (VPN) and looks up the page-table entry (PTE) at that index in order to find the desired physical frame number ([[Physical Frame Number (PFN) (OS Concept)|PFN]])
- It's worth exploring what each Page Table Entry (PTE) contains
- **[[Valid Bit (OS Concept)]]**: Used to indicate whether the particular translation is valid. When the program starts running, it will have code, [[Heap Memory (OS Concept)|heap]] and [[Stack Memory (OS Concept)|stack]] at the other end. All the unused space in between will be marked invalid. If the process tries to access this invalid memory  it will generate a [[Trap (OS Concept)]] and the OS will likely terminate the process. The validation bit is crucial for supporting sparse [[Address Space (OS Concept)|address spaces]], we don't need to allocate physical frames for those pages and save a great deal of memory
- **[[Protection Bit (OS Concept)]]s**: Indicate whether the [[Paging  (OS Concept)|page]] could be read from, written to or executed from. Accessing a page in a way that is not allowed would generate a [[Trap (OS Concept)]] to the OS
- **[[Present Bit (OS Concept)]]**: Indicates whether this page is in physical memory or disk (i.e. whether it has been [[Swapping (OS Concept)|swapped out]])
- **[[Dirty Bit (OS Concept)]]**: Indicates whether the page has been modified since it was brought into memory
- **[[Reference Bit (OS Concept)]]/Accessed Bit**:  Used to track whether a page has been accessed and is useful in determining which pages are popular and thus should be kept in memory. Such knowledge is critical during **page replacement**.
- Below is a PTE for an x86 page table, you can read the Intel Architecture Manuals  for more details. (Note: Below image is missing valid bit refer pg 7 for the why)
![[x86 Page Table Entry.png]]

### Multiple Page Sizes
- Architectures like [[MIPS (RISC Architecture)]], SPARC, [[x86 (CPU Architecture)]] support multiple [[Page Size (OS Concept)|page sizez]] (See [[Linux (OS Family)#Large Page Support]] for more info on multiple page sizes in x86)
	- A small 4KB/8KB page
	- A large single page eg. Size 4MB can be used for special portions of the [[Address Space (OS Concept)]]. This type of large page is common in [[Database Management System (DBMS)]] and other high-end commercial applications
- Using multiple [[Page Size (OS Concept)|page sizes]] increases the complexity of the OS virtual memory manager


### Smaller Tables
- One of the problems as discussed [[#Page Table Storage|earlier]] with [[Page Table (OS Concept)|page tables]] is it's size
- One solution to this is bigger [[Paging  (OS Concept)|Pages]], this would decrease the number of bits allocated to [[Virtual Page Number (VPN) (OS Concept)]] and increase bits associated to [[Offset (OS Concept)]]
- One downside here is that big pages result in increased [[Internal Fragmentation (OS Concept)]] (Paging always resulted in some [[Internal Fragmentation (OS Concept)]])
- Due to such downsides most systems prefer to use small [[Page Size (OS Concept)|page sizes]] Eg. 4KB in [[x86 (CPU Architecture)]]


### Hybrid Approach: Paging and Segments
- One way to deal with the drawback of [[Page Table (OS Concept)|page tables]]: Their large size 
- Combine [[Paging  (OS Concept)]] and [[Segmentation (OS Concept)]]
- One of the creator of [[Multics (Operating System)]], [[Jack Dennis (Programmer)]] came up with the idea when he was working on it
- For the average process most of the page table is empty, unused and full of **invalid** entries
- Using the idea of [[Segmentation (OS Concept)]] we have separate [[Page Table (OS Concept)]] per logical segment (code, stack ,heap)
- The base register for the logical segment stores the [[Page Table (OS Concept)]] for each logical segment lives
	- Recall that in [[Segmentation (OS Concept)]] the base register pointed to an address
- The bound register tells us the size of each segment, that is 
- These registers are in the [[Memory Management Unit (MMU) (Computer Hardware)]]
- Example
	- Consider a 32-bit virtual address with 4KB pages, this address space can be split into 4 segments (even thought we'll only use 3 segments code heap and stack)
	- To determine which segment the address is for we'll use the top two bits of the [[Address Space (OS Concept)]]
	- In the MMU there are 3 pairs of base-bound registers, one pair for each segment. So there are 6 registers that get updated during a [[Context Switching (OS Concept)|context switch]]  of the process
	- How the address of the page table entry is derived is shown in OSTEP
- The main advantage we get here is because of the bounds register, saw there were only 3 pages in the code segment, then bounds registers would hold value 3. Memory accesss beyond these will generate an exception
- Disadvantages
	- Waste of page table if we end up with a large but sparsely used heap
	- Causes increase in [[External Fragmentation (OS Concept)]] ()

### Multi-Level Page Table
- One way to deal with the drawback of [[Page Table (OS Concept)|page tables]]: Their large size 
- Using multi-level table is one way we can reduce the invalid regions in[[Page Table (OS Concept)|Page tables]] 
	- This approach is so effective many modern systems use it (eg. [[x86 (CPU Architecture)]])
- The basic idea behind a multi-level page table is simple. 
	- First, chop up the page table into page-sized units; then, if an entire page of page-table entries (PTEs) is invalid, don’t allocate that page of the page table at all.
- To track whether a page of the page table is valid we use a new structure called [[Page Directory (OS Concept)]] the location of this data structure is held by a [[Page Directory Base Register (PDBR) (OS Concept)]]
	- The page directory can tell you where a page of a [[Page Table (OS Concept)]] is, or if that the entire page table contains no valid pages
- A [[Page Directory (OS Concept)]] entry has a valid bit and a [[Physical Frame Number (PFN) (OS Concept)]] similar to a page table entry (PTE)
	- The meaning of the valid bit in this case is that at least one PTE of the page table pointed to by this PDE is valid
- Advantages
	- Generally more compact and supports sparse address spaces
	- You don't need to have the entire page table in contiguous memory like with the linear page table (finding space for a large linear page table of say 4MB is not easy) 
	- Added a level of [[Indirection (Software Concept)]], this makes it possible to place page tables wherever we like in memory
- Disadvantages
	- Now two loads from memory are needs to get to the right translation information from page table (a [[Time-space Trade-off (Software)]]). We got smaller tables at the cost of performance
	- Complexity
![[Pasted image 20241114030429.png]]
- How it works
	- We use the first few bits of the virtual address as the Page-directory index (PDIndex) which can be used to find the page-directory entry with a simple calculation
		- `PDEAddr = PageDirBase + (PDIndex * sizeof(PDE))`
	- If the page directory entry is invalid we know the access is invalid and thus raise an exception.
	- If not we then go the the associated page table to find the page table entry (PTE) using the remaining bits of the [[Virtual Page Number (VPN) (OS Concept)]]
![[Pasted image 20241114032403.png]]

##### More than Two Levels
- We can have more than two levels in our page table.
- A goal when constructing a multi-level page table is to have the [[Page Table (OS Concept)]] to be small enough to fit into a single [[Paging  (OS Concept)|Page (OS Concept)]]. The [[Page Directory (OS Concept)]] can also get large and we'd like this to fit into a single page as well
- Say we have a 30 bit virutal address space our [[Page Size (OS Concept)]] is 512 bytes this means a 21-bit [[Virtual Page Number (VPN) (OS Concept)]] and each page table entry is 4 bytes, which means than you can fit a page table of size 128 on a single [[Paging  (OS Concept)|Page (OS Concept)]]
	- If it were just two level the  [[Page Directory (OS Concept)]] will then have $2^{14}$ entries. Assuming 4 bytes per [[Page Directory (OS Concept)]] entry, this will need 128 pages. This fails our goal of trying to make every piece of a multi-level page table fit into a page.
	- To fix this we can have another level by introducing another [[Page Directory (OS Concept)]]. Now we have:
		- PD 0
		- PD 1
		- PT 
	- To see how this works in the code refer to [[Operating Systems Three Easy Pieces (OSTEP) (Book)]]
### Inverted Page Table
- One way to deal with the drawback of [[Page Table (OS Concept)|page tables]]: Their large size 
- [[Inverted Page Tables (OS Concept)]]
- With this approach we don't have different page tables per [[Process (Computing)]] instead we have a single [[Page Table (OS Concept)]] that has an entry for each physical page. The entries of this Page table tell us which virtual page maps to a physical page
- A hash table is often built on top of this base structure for speed
- PowerPC is one example of an architecture that does this


### Swapping the Page Tables to Disk
- One way to deal with the drawback of [[Page Table (OS Concept)|page tables]]: Their large size 
- Some systems allows page tables in kernel virtual memory.
- This allows the system to [[Swapping (OS Concept)|Swap]] some of the page tables to disk when memory is running out
## Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]


