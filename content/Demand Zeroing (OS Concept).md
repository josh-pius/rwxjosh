### General
- In a naive implementation, the OS responds to a request to add a page to your heap by finding a page in physical memory, zeroing it (required for security; otherwise you’d be able to see what was on the page from when some other process used it!), and then mapping it into your [[Address Space (OS Concept)]] (i.e., setting up the [[Page Table (OS Concept)]] to refer to that physical page as desired). 
- But the naive implementation can be costly, particularly if the page does not get used by the process.
- With demand zeroing, the OS instead does very little work when the page is added to your [[Address Space (OS Concept)]]; it puts an entry in the [[Page Table (OS Concept)]] that marks the page inaccessible. 
- If the process then reads or writes the page, a [[Trap (OS Concept)]] into the OS takes place. 
- When handling the [[Trap (OS Concept)]], the OS notices (usually through some bits marked in the “reserved for OS” portion of the page table entry) that this is actually a demand-zero page; at this point, the OS does the needed work of finding a physical page, zeroing it, and mapping it into the process’s address space. 
- If the process never accesses the page, all such work is avoided, and thus the virtue of demand zeroing.


### Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]