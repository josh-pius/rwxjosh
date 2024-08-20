### General
- The VM system is responsible for providing the illusion of a large, sparse, private address space to each running program; each virtual address space contains all of a program’s instructions and data, which can be referenced by the program via virtual addresses.
- The [[Operating System (OS)]], with some serious hardware help, will take each of these virtual memory references and turn them into physical addresses, which can be presented to the physical memory in order to fetch or update the desired information.
- The OS will provide this service for many processes at once, making sure to protect programs from one another, as well as protect the OS.
- The entire approach requires a great deal of mechanism (i.e., lots of low-level machinery) as well as some critical policies to work
- Seems related to [[Address Space (OS Concept)]]