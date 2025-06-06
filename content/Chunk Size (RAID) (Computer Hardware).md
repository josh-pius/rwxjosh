### General
- The size of the blocks in a [[Stripe (RAID) (Computer Hardware)]] on one disk


### Effect of Chunk Size of Performance
Source: [[Operating Systems Three Easy Pieces (OSTEP) (Book)]]
- Smaller chunk size 
	- Better Paralleism -> Faster writes
	- Longer positioning time -> Slower reads
- Larger chunk size
	- Less parallelism -> Slower Writes
	- Shorter positioning time -> Faster reads
- Chunk size mostly affects performance of the array. For example, a small chunk size implies that many files will get [[Striping (Computer Hardware)|striped]] across many disks, thus increasing the parallelism of reads and writes to a single file; however, the positioning time to access blocks across multiple disks increases, because the positioning time for the entire request is determined by the maximum of the positioning times of the requests across all drives.
- A big chunk size, on the other hand, reduces such intrafile parallelism, and thus relies on multiple concurrent requests to achieve high throughput. 
- However, large chunk sizes reduce positioning time; if, for example, a single file fits within a chunk and thus is placed on a single disk, the positioning time incurred while accessing it will just be the positioning time of a single disk.
- Thus, determining the “best” chunk size is hard to do, as it requires a great deal of knowledge about the workload presented to the disk system.  Most arrays use larger chunk sizes (e.g., 64 KB)

