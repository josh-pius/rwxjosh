### General
- A [[Class (Java)]] from `java.util.concurrent`
- Used to [[Synchronization (Java)|synchronize]] a set of threads. 
- Each thread calls `barrier.await()` and is blocked there until all the other (based on the number passed into the `CyclicBarrier()` constructor also call the method. When they're all there the lock releases all blocked [[Thread (OS Concept)]]s
- Because it's cyclic, the barrier will close again and you can open it by calling `await` again
- [[Jose Paumard (Programmer)]] says one should prefer parallel [[Streams Api (Java)|Java Streams (Java)]] if it supports the use case
### Example
- You specify the number of threads that will wait on it then then each thread needs to call `barrier.await()`
```java
var barrier = new CyclicBarrier(3);

Runnable task = () -> {
	try {
		//do something
	} catch (Exception e) {
		// application exceptions
	} finally {
		barrier.await();
	}
};
```


### Sources
https://youtube.com/shorts/buNKW3eYMvE?si=bjc6P3BrWM8dbEC9 by [[Java (Youtuber)]]