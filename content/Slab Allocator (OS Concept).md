### General
- A [[Memory Management (OS Concept)|Memory Allocation (OS Concept)]] approach that uses [[Segregated Lists (OS Concept)]]
- In this approach, when the kernel boots up, it allocates a number of [[#Object Caches]] for [[Kernel (OS Concept)]] objects hat are likely to be requested frequently (such as locks, file-system [[Inode (Linux)|inodes]], etc.); the object caches thus are each segregated [[Free List (Data Structure)|free lists]] of a given size and serve [[Memory Management (OS Concept)|Memory Allocation (OS Concept)]] and free requests quickly. 
- When a given cache is running low on free space, it requests some slabs of memory from a more general memory allocator (the total amount requested being a multiple of the [[Paging  (OS Concept)|page]] size and the object in question). Conversely, when the reference counts of the objects within a given slab all go to zero, the general allocator can reclaim them from the specialized allocator, which is often done when the VM system needs more memory. 
- The slab allocator also goes beyond most segregated list approaches by keeping free objects on the lists in a pre-initialized state. [[Jeff Bonwick (Programmer)]] shows that initialization and destruction of data structures is costly; by keeping freed objects in a particular list in their initialized state, the slab allocator thus avoids frequent initialization and destruction cycles per object and thus lowers overheads noticeably.

### Object Caches
- This term object cache threw me off initially, I was wondering if Linux has some kind of memory called object cache, but after searching I don’t think that’s the case
- When we talk about memory allocation it’s really referring to [[Random Access Memory (RAM)|RAM (Computer Memory)]] (anything in the RAM is faster than disk and is where applications cache in the first place)
- The kernel has a bunch  of object like [[Inode (Linux)|inodes]] that need to be accessed often and so there’s a dedicated list created for those in the RAM
- So it is literally a cache for these Kernel object


### Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]