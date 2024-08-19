### General
Source: [[Operating Systems Three Easy Pieces (OSTEP) (Book)]]
- A term introduced in OSTEP, it's another fancy word for the [[Proxy (Design Pattern)]] but here hardware is responsible for doing work
- An example of this is hardware will **interpose** on each memory access and translate each virtual address issued by the process to a physical address
- A benefit of this is [[#Transparency]]


### Transparency
- Transparency in this context is different from it's usual meaning
	- It maybe better to call it implementation hiding. For example, the process does not know about how the [[Address Translation (OS Concept)]] happens, the interface abstracts all that detail away