### General
- Only applicable for multi-threaded applications
- i.e in the presence of multiple threads


### Cache Structure of Multi-core CPU
- If we consider speed the ordering of the various memories are
	- Registers  > L1 Cache > L2 Cache > L3 Cache > RAM
- The size of each memory is in the reverse order
![[Pasted image 20221004133312.png|500]]


### Visibility Issue
- Consider the below code, if the two tasks for writerThread and readerThread were running on two different [[Thread (Java)|threads]] then the reader thread would not read the right value since it does not have visibility into the variable in another thread due to local variables being stored in local cache
```Java
public class FieldVisbility{
	int x = 0;

	public void writerThread(){
		x = 1;
	}

	public void readerThread(){
		int r2 = x;
	}
}
```
![[Pasted image 20221004134037.png|400]]

### Java Solution: Volatile
![[Pasted image 20221004134206.png|300]]

![[Volatile (Java)#Internal Working]]