### General
- An improvement over the generic [[Free List (Data Structure)]]
- The basic idea is simple: if a particular application has one (or a few) popular-sized request that it makes, keep a separate list just to manage objects of that size; all other requests are forwarded to a more general memory allocator.
- The benefits of such an approach are obvious. By having a chunk of memory dedicated for one particular size of requests, fragmentation is much less of a concern; moreover, allocation and free requests can be served quite quickly when they are of the right size, as no complicated search of a list is required.

### Challenges
- Just like any good idea, this approach introduces new complications into a system as well. 
- For example, how much memory should one dedicate to the pool of memory that serves specialized requests of a given size, as opposed to the general pool? One particular allocator, the [[Slab Allocator (OS Concept)]] by [[Uber (Company)|uber]]-engineer [[Jeff Bonwick (Programmer)]] (which was designed for use in the [[Solaris (Operating System)]] [[Kernel (OS Concept)]]), handles this issue in a rather nice way 


### Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]