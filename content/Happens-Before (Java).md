Source: https://www.youtube.com/watch?v=Z4hMFBvCDV4&list=PLhfHPmPYPPRk6yMrcbfafFGSbE2EPK_A6&index=4
### General
- In the [[Java Memory Model (JMM) (Java)]] the [[Happens-Before (Java)]] is a principle followed to ensure concurrency works properly by preventing reordering of instructions in some cases ([[Out of Order Execution (Java)]])
- [[Happens-Before (Java)]] relationship is applicable to
	- [[Volatile (Java)]]
	- [[Synchronized (Java Keyword)]]
	- Concurrent Collections
	- Thread Operations (join, start)
	- final fields(special behariour)



### Happens Before In Volatile (Important Example)
Happens-Before makes the following guarantee about reordering:

- When reordering any **write** to a variable that happened before a write to a [[Volatile (Java)]], will remain before the write to the volatile variable.
- When reordering any **read** of a [[Volatile (Java)]] variable that is located before read of some non-volatile or volatile variable, is guaranteed to happen before any of the subsequent reads.
**Example**
- In the below example, writerThread(), all the writes to variables happen before write to x(no reordring allowed), once the write to x(volatile variable) is done all the values are flushed to main memory making it accessible to other threads
	- **Note: It's all the variable values not just the volatile variables that are flushed to main memory when the write to volatile variable is done**
- In the below example, readerThread(), the read of volatile variable x happens before any of the other reads(reordering prohibited). When x is read, all other variables are also refreshed from main memory
	- **Note: It's all the variable values not just the volatile variables that are read when x is read**
![[Pasted image 20221004135401.png|500]]

### Happens-Before in Synchronization Block
See [[Synchronized (Java Keyword)]]
- One difference from above is that the synchronized needs be used on same object not different objects for it to work
- Refer to Resource for more info

In case of synchronization block, happens before states that for reordering:
- Any **write** to a variable that happens before the exit of a synchronization block is guaranteed to remain before the exit of a synchronization block.
- Entrance to a synchronization block that happens before a read of a variable, is guaranteed to remain before any of the reads to the variables that follow the entrance of a synchronized block.


### Video Explanation
https://youtube.com/shorts/iW8YzPJff1k?si=KMrcF9Khk22Y_-I3 by [[Jose Paumard (Programmer)]]

### Resource
https://www.geeksforgeeks.org/happens-before-relationship-in-java/ (Best explanation)