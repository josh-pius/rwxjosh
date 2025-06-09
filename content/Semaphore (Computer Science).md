### General
- A synchronization mechanism.
- Helps two or more processes or threads to communicate 
- Uses signaling
- One often needs both [[Mutex (Synchronization Primitive)|Locks (Computer Science)]] and [[Condition Variable (Software)|condition variables]]  to solve a broad range of problems, [[Edsger Dijkstra (Computer Scientist)]] was one of the first to realize this (OSTEP qualifies this statement).


### Definition
- An object with an integer value that we can manipulate with two routines (in the [[POSIX]] standard these routines are)
	- `sem_wait()` (in the original paper called `P()`)
	- `sem_post()` (in the original paper called `V()`)
- Before we can use a semaphore we need to initialize it, the value we use to initialize matter and influence the behavior
- Initializing a [[Semaphore (Computer Science)]] in [[C (Programming Language)]]
```c
#include<semaphore.h>
sem_t s;
sem_init(&s, 0, 1);
```
- The third argument is the integer with which it is initialized, 
- The second argument is less important and indicates that the semaphore is shared between [[Thread (OS Concept)|threads]]
	- In all the OSTEP examples we'll always set it to 0, but it can take other values if you for example want to share the semaphore between [[Process (Computing)|processes]]


### How to use a Semaphore
 - The behavior of each method is summarized below.
 ```c
 int sem_wait(sem_t *s) {
	 decrement the value of semaphore s by one
	 wait if value of semaphore s is negative
 }
 int sem_post(sem_t *s) {
	 increment the value of semaphore s by one
	 if there are one or more threads waiting, wake one
 }
```
- `sem_wait()` will return right away if the value of the semaphore is zero or higher (OSTEP typo says one or higher) else will cause the caller to suspend execution. Multiple threads may call into this method and thus all be queued waiting to be woken
- `sem_post()` simply increments the value of the semaphore and wakes up any waiting threads 
- The value of the [[Semaphore (Computer Science)]] when negative is equal to the number of waiting threads

### Lock : Binary Semaphore
- You can create a [[Mutex (Synchronization Primitive)|Lock (Computer Science)]] from a [[Semaphore (Computer Science)]], called a binary semaphore
- Because [[Mutex (Synchronization Primitive)|Locks]] have only two states (held and not held) we sometimes call a semaphore used as a lock a binary semaphore
	- If you're using semaphore only in this binary fashion it could be implemented in a simpler manner than the generalized semaphore
```c
sem_t m;
sem_init(&m, 0, 1); // setting it to 1 makes it a lock

//Using it as a lock
sem_wait(&m);
// critical section here
sem_post(&m);
```
- Only a single thread: Let's imagine a scenario where one [[Thread (OS Concept)]] tries to acquire the lock, it calls `sem_wait()` it will decrement the semaphore changing it's value to 0. Since this not a negative value, it will not wait and proceed. After it completes the section it will call `sem_post()` and restore the value of the semaphore to 1
- Two threads: Similar to above say the first thread acquires the lock calling `sem_wait()` and the value of the semaphore is 0, now if another thread tries to enter the [[Critical Section (Software)]] by calling `sem_wait()` it will decrement the value of semaphore to -1 and thus wait (putting itself to sleep and relinquishing the processor). When the first completes running it will call `sem_post()` incrementing the value back to 0 and waiting up the waiting thread
- Based on my understanding the increment/decrement operation must happen before the sleep/wake otherwise it would lead to concurrency issues


### Condition Variable Using Semaphore
- This is possible but pretty hard to get right, (see more here [[#Implementing Semaphores]])
### Semaphore For Ordering
- [[Semaphore (Computer Science)|Semaphores]] are also useful to order events in a concurrent program. For example, a thread may wish to wait for a list to become a non-empty so that it can delete an element from it
- In this pattern of usage we often find one [[Thread (OS Concept)]] waiting for something to happen, and another thread making that something happen and then signaling that it has happened, thus waking the waiting thread. 
- In this case we are using the semaphore as an **ordering** primitive (similar to our use of [[Condition Variable (Software)]]) 
- The parent calls `sem_wait()` and the child calls `sem_post()`
- the initial value of the [[Semaphore (Computer Science)]] is 0
```c
sem_t s;
 void *child(void *arg) {
	 printf("child\n");
	 sem_post(&s); // signal here: child is done
	 return NULL;
 }
 int main(int argc, char *argv[]) {
	 sem_init(&s, 0, X); // what should X be?
	 printf("parent: begin\n");
	 pthread_t c;
	 Pthread_create(&c, NULL, child, NULL);
	 sem_wait(&s); // wait here for child
	 printf("parent: end\n");
	 return 0;
 }
```
- The desired output is 
```
parent: begin
child
parent: end
```
- There are two possible scenarios in this case
	- In the first case the parent creates the child thread but it has not run and sits in the ready queue. In this case the parent calls `sem_wait()` decrements value to -1, goes to sleep since it's a negative value. The child thread then gets scheduled, it runs, calls `sem_post()` incrementing value to 0 and then wakes up the parent
	- In the second case the parent creates the child thread and a [[Context Switching (OS Concept)]] happens to the child thread. In this case the child thread runs, calls `sem_post()` incrementing value to 1 and completes. The parent thread then runs, it calls `sem_wait()` it decrements value from 1 to 0 and **does not sleep** since value is non-negative. In this case too it achieves the desired effect


### The Value of A Semaphore
- I found this section of [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] very insightful
-  We’ve now seen two examples of initializing a semaphore . 
- In the first case, we set the value to 1 to use the semaphore as a [[Mutex (Synchronization Primitive)|Lock (Computer Science)]]; in the second, to 0,  to use the semaphore  for  ordering. So what’s the general rule for  semaphore initialization? 
- One simple way to think about it, thanks to [[Perry Kivolowitz (Computer Scientist)]], is to consider the number of resources you are willing to give away immediately after initialization. 
- With the lock, it was 1, because you are willing to  have the [[Mutex (Synchronization Primitive)|Lock (Computer Science)]] locked (given away) immediately after initialization. 
- With the ordering case, it was 0, because there is nothing to give away at the start; only when the child thread is done is the resource created, at which point,  the value is incremented to 1. Try this line of thinking on future [[Semaphore (Computer Science)]] problems, and see if it helps.

### The Producer-Consumer (Bounded Buffer) Problem
- See [[Producer-Consumer Problem (OS Concept)]]
- First Attempt: Based on our previous insights we know we'll need two [[Condition Variable (Software)]], and now that we know a [[Semaphore (Computer Science)]] can replace a condition variable we can try just using two semaphore full and empty which will be used to indicate when a buffer entry has been empties or filled respectively.
```c
sem_t empty;
sem_t full;

void *producer(void *arg) {
    int i;
    for (i = 0; i < loops; i++) {
        sem_wait(&empty);           // Line P1
        put(i);                     // Line P2
        sem_post(&full);            // Line P3
    }
}

void *consumer(void *arg) {
    int tmp = 0;
    while (tmp != -1) {
        sem_wait(&full);            // Line C1
        tmp = get();                // Line C2
        sem_post(&empty);           // Line C3
        printf("%d\n", tmp);
    }
}

int main(int argc, char *argv[]) {
    // ...
    sem_init(&empty, 0, MAX);       // MAX are empty
    sem_init(&full, 0, 0);          // 0 are full
    // ...
}

```
- OSTEP then goes on to show various issues with this implementation, one of them is that there's no mutex around the get() and put() methods, next how naively wrapping the whole block with the mutex causes a [[Deadlock (Software)]] so instead it is only put around the [[Critical Section (Software)]]. Eventually both producer and consumer sections looks like this
```c
 void *producer(void *arg) {
 int i;
	 for (i = 0; i < loops; i++) {
		 sem_wait(&empty); // Line P1
		 sem_wait(&mutex); // Line P1.5 (lock)
		 put(i);           // Line P2
		 sem_post(&mutex); // Line P2.5 (unlock)
		 sem_post(&full);  // Line P3
	 }
 }

```
- Regarding this final snipped the authors say this
> The result is a simple and working bounded buffer, a commonly-used pattern in multi threaded programs. Understand it now; use it later. You will thank us for years to come. Or at least, you will thank us when the same question is asked on the final exam, or during a job interview.


### Reader-Write Locks
- [[Reader-Writer Lock (Computer Science)]]
- The code is pretty simple. If some [[Thread (OS Concept)]] wants to update the data structure in question, it should call the new pair of synchronization operations: `rwlock_acquire_writelock()`,  to acquire a write lock, and `rwlock_release_writelock()`, to release it. 
- Internally, these simply use the `writelock` [[Semaphore (Computer Science)]] to ensure that only a single writer can acquire the lock and thus enter the [[Critical Section (Software)]] to update the data structure in question
 - More interesting is the pair of routines to acquire and release read locks. When acquiring a read lock, the reader first acquires lock and then increments the readers variable to track how many readers are currently inside the data structure. 
 - The important step then taken within `rwlock_acquire_readlock()` occurs when the first reader acquires the lock; in that case, the reader also acquires the write lock by calling `sem_wait()` on the `writelock` semaphore, and then releasing the lock by calling `sem_post()`. 
 - Thus, once a reader has acquired a read lock, more readers will be allowed to acquire the read lock too; however, any thread that wishes to acquire the write lock will have to wait until all readers are finished; the last one to exit the [[Critical Section (Software)]] calls `sem_post()` on `writelock` and thus enables a waiting writer to acquire the lock.
```c
typedef struct _rwlock_t {
    sem_t lock;         // binary semaphore (basic lock)
    sem_t writelock;    // allow ONE writer/MANY readers
    int readers;        // #readers in critical section
} rwlock_t;

void rwlock_init(rwlock_t *rw) {
    rw->readers = 0;
    sem_init(&rw->lock, 0, 1);
    sem_init(&rw->writelock, 0, 1);
}

void rwlock_acquire_readlock(rwlock_t *rw) {
    sem_wait(&rw->lock);
    rw->readers++;
    if (rw->readers == 1) // first reader gets writelock
        sem_wait(&rw->writelock);
    sem_post(&rw->lock);
}

void rwlock_release_readlock(rwlock_t *rw) {
    sem_wait(&rw->lock);
    rw->readers--;
    if (rw->readers == 0) // last reader lets it go
        sem_post(&rw->writelock);
    sem_post(&rw->lock);
}

void rwlock_acquire_writelock(rwlock_t *rw) {
    sem_wait(&rw->writelock);
}

void rwlock_release_writelock(rwlock_t *rw) {
    sem_post(&rw->writelock);
}

```

 - This approach works (as desired), but does have some negatives, especially when it comes to fairness. In particular, it would be relatively easy for readers to [[Starvation (OS Concept)|starve]]writers
	 - A more sophisticated solution would be  to prevent more readers from entering the lock once a write is waiting
	- I check with [[ChatGPT]] what this solution might look like, it suggested adding one more semaphore lock called `readTry` that would prevent new readers if a thread is writer thread is waiting
```c
	void rwlock_acquire_readlock(rwlock_t *rw) {
    sem_wait(&rw->readTry);           // prevent if writer is waiting
    sem_wait(&rw->lock);
    rw->readers++;
    if (rw->readers == 1)
        sem_wait(&rw->writelock);     // first reader blocks writers
    sem_post(&rw->lock);
    sem_post(&rw->readTry);           // allow other readers
}

void rwlock_acquire_writelock(rwlock_t *rw) {
    sem_wait(&rw->readTry);           // block new readers
    sem_wait(&rw->writelock);         // wait for active readers
    // now writer has exclusive access
}

void rwlock_release_writelock(rwlock_t *rw) {
    sem_post(&rw->writelock);
    sem_post(&rw->readTry);           // allow readers again
}



```

- **Caution**:  [[Reader-Writer Lock (Computer Science)]] often add more overhead (especially with more sophisticated implementations), and thus do not end up speeding up performance as compared to just using simple and fast locking primitives . Either way, they showcase once again how we can use [[Semaphore (Computer Science)]] in an interesting and useful way


### Dining Philosophers
[[Dining Philosophers Problem (Computer Science)]]


### Thread Throttling
- The specific problem is this: how can a programmer prevent “too many” [[Thread (OS Concept)|threads]] from doing something at once and bogging the system down?
- First we need to define what "too many" is with a number
-  Let’s consider a more specific example. 
	- Imagine that you create hundreds of threads to work on some problem in parallel. 
	- However, in a certain part of the code, each thread acquires a large amount of memory to perform part of the computation; let’s call this part of the code the memory-intensive region. 
	- If all of the threads enter the memory-intensive region at the same time, the sum of all the memory allocation requests will exceed the amount of physical memory on the machine. 
	- As a result, the machine will start thrashing (i.e., [[Swapping (OS Concept)]] pages to and from the disk), and the entire computation will slow to a crawl.
-  By initializing the value of the semaphore to the maximum number of threads you wish to enter the memory-intensive region at once, and then putting a `sem_wait()` and `sem_post()` around the region, a semaphore can naturally throttle the number of threads that are ever concurrently in the dangerous region of the code.


### Implementing Semaphores
- You can build a simple [[Semaphore (Computer Science)]] using a [[Mutex (Synchronization Primitive)|Lock (Computer Science)]], [[Condition Variable (Software)]] and a state variable to track the value
	- The tradeoff with this implementation is that we don't maintain the invariant that the value of the semaphore, when negative, reflects the number of waiting threads; indeed, the value will never be lower than zero. This behavior is easier to implement and matches the current [[Linux (OS Family)]] implementation.
```c
typedef struct __Zem_t {
    int value;
    pthread_cond_t cond;
    pthread_mutex_t lock;
} Zem_t;

// only one thread can call this
void Zem_init(Zem_t *s, int value) {
    s->value = value;
    Cond_init(&s->cond);
    Mutex_init(&s->lock);
}

void Zem_wait(Zem_t *s) {
    Mutex_lock(&s->lock);
    while (s->value <= 0)
        Cond_wait(&s->cond, &s->lock);
    s->value--;
    Mutex_unlock(&s->lock);
}

void Zem_post(Zem_t *s) {
    Mutex_lock(&s->lock);
    s->value++;
    Cond_signal(&s->cond);
    Mutex_unlock(&s->lock);
}

```
- Curiously, building [[Condition Variable (Software)]] out of semaphores is a much trickier proposition. Some highly experienced concurrent programmers tried to do this in the [[Windows (Operating System)]] environment, and many different bugs ensued

### Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]
https://youtu.be/p0SKPpC5r9U?si=S9oK4DIf0RFCwyQX