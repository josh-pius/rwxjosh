### General
- Compressed OOPs (Ordinary Object Pointers) is a memory optimization used by the [[JVM (Java)]]  to reduce the size of object references on 64-bit JVMs, improving both memory usage and performance.


### Why it helps?
- On a 64-bit JVM:
	- Object references (pointers) are 64 bits (8 bytes).
	- This doubles the size of every reference compared to a 32-bit JVM (which uses 32-bit or 4-byte references).
	- Larger references = more memory consumption, especially in object-heavy applications.
- But most Java applications don’t need the full 64-bit address space (over 16 exabytes!).

### When Is It Enabled?
- By default:
	- Enabled on 64-bit JVMs when the heap size is ≤ ~32 GB.
	- Disabled automatically when the [[Heap Memory (JVM)]] exceeds that limit (but can be manually controlled).


### How 32 Gigs?
- On a 64-bit machine upto a heap size of 32 GB, you can use 4 bytes references with compressed OOPS
- But you might notice that 4 bytes is 32 bits and 32 GB is $2^{35}$  bytes, in order to make this work some clever thinking is involved, since Java is 8 bytes aligned all objects are padded to 8 bytes, which means the object starting addresses are always multiple of 8 and [[Binary (Number System)#Divisibility Tests]] that means that the last three digits in binary are always 0, you can use this fact to remove the last three digits and only store the remaining 32 bits
- When the address is retrieved to be used it needs to have those last three zeros added back (3 bitshift to the right)