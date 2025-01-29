### General
- [[Structures (C Programming)]]
- Structure padding is the addition of some empty bytes of memory in the structure to naturally [[Data Structure Alignment (Software)|align]] the data members in the memory
- Very good examples here: https://www.geeksforgeeks.org/structure-member-alignment-padding-and-data-packing/
- **Every Structure Will Also have Alignment Requirements**: 
	- The big takeaway here is, not only do the data type in the structure need to be memory aligned, but the structure itself need to be memory aligned to ensure that the data types don't get misaligned when they're put in an array
- While this is one for performance reasons if your structs are set up poorly it can hurt performance by evicting [[Cache Line (OS Concept)|cache lines]] there are ways to avoid this using [[Data Oriented Design (Software)#Memory Footprint Reduction Strategies]]


### Example of Structure Alignment
```c
typedef struct structc_tag {
	char c;
	double d;
	int s;
} structc_t;
```
- [[char (C Data Type)]] is 1 byte, the size of double is 8 bytes, BUT the data alignment requirement for double is 8-bytes not 4-bytes, this is because even though the [[Word (Computer Architecture)|word size]] in a 32-bit architecture is 4-bytes, it is 8-bytes on a 64-bit system. 
- And the processor’s word size on a 32-bit machine is 4 bytes, many architectures and compilers still enforce an **8-byte alignment** for `double`. This ensures compatibility with 64-bit systems and avoids performance penalties.
- This explains why we need 7-byte padding instead of 3-byte to align the char and double
- The int has 4-byte alignment so no padding is necessary
- Put together `structc_t` needs 
	- `sizeof(char)`(1) + 7-byte padding + `sizeof(double)` + `sizeof(int)` = 1 + 7 + 8 + 4 = 20 bytes
- Now consider if you have an array of this struct, the first element would be fine but the next struct would start at the 20th byte, the double member would then be allocated on a address that is a multiple of 4 and not 8, this would conflict with the alignment requirement of a double.
- To avoid such misalignment the compiler introduces the alignment requirement for every structure. The alignment of the structure needs to be the alignment of the largest member of that structure, for nested structures the size of the largest inner structure will be the alignment of an immediate larger structure.
- A crazy example was shown in [[Andrew Kelly (Programmer)]]'s [talk](https://youtu.be/IroPQ150F6c?si=N8F28TcyfGBX3AwE)
```
struct {
	a : u32,
	b : u32,
	c : u64,
	d : bool,
};
```
- Here the natural alignment of the [[Structures (C Programming)|Struct (C Keyword)]] is 8 bytes, 2 x u32 = 8 bytes, u64 = 8 bytes, bool = 1 bit. In order to bring the size of the struct back to an alignment of 8-bytes you need to pad it it with (8 bytes - 1 bit). Taking the size from 17 all the way to 24.
	- For just 1 bit of information we're paying the cost of 64 bits


### Metadata
2025-01-18 11:33
- A few months ago when watching a video on [[Data Oriented Design (Software)]] this went over by head but now it makes much more sense 

### Sources
https://www.geeksforgeeks.org/structure-member-alignment-padding-and-data-packing/