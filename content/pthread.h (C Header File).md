### General
- [[Linux (OS Family)]] [[header files (C Programming)]] That provides an interface for [[Thread (OS Concept)]] operations
- The interface is defined by the [[POSIX]] standard

### Thread Creation
```C
#include <pthread.h>
int
pthread_create(pthread_t      *thread,
		 const pthread_attr_t *attr,
			   void           *(*start_routine)(void*),
			   void           *arg);
```
- The first argument here is a [[Structures (C Programming)]] of type pthread_t, we need to pass this structure to this call
- The second argument is the attributes the thread might have, some examples include setting the [[Stack Memory (OS Concept)|stack]] size or perhaps information about the scheduling [[Priority (OS Concept)]] of the thread. 
	- An attribute is initialized with a separate call to pthread attr init(); see the manual page for details. However, in most cases, the defaults will be fine; in this case, we will simply pass the value NULL in.
- The third argument is the most complex, it is a [[Function Pointer (C Programming)]] that tells the thread which function to run. The Argument and return type are `void *` this is a [[Void Pointer (C Programming)]] the reason this type is used is because `void *` can take or return any data type
- The last parameter is the argument being passed to the function

### Thread Completion
- You can use this method to wait for a thread to complete
```c
int pthread_join(pthread_t thread, void **value_ptr);
```
- The first argument is the thread, the second is a pointer to the return value that you expect to get back.
- One thing to take care of, ensure that you're not returning a pointer to something allocated in in the thread's call [[Stack Memory (OS Concept)|stack]], if you do then the value will get automatically deallocated 
	- Luckily [[GNU Compiler Collection (GCC)|gcc (C Compiler)]] would give you warnings in this case
```c
void *mythread(void *arg) {
	 myarg_t *args = (myarg_t *) arg;
	 printf("%d %d\n", args->a, args->b);
	 myret_t oops; // ALLOCATED ON STACK: BAD!
	 oops.x = 1;
	 oops.y = 2;
	 return (void *) &oops;
}
```
- Threads don't always have to call join. For example a multi-threaded web server might create a number of worker threads, and then use the main thread to accept requests and pass them to the workers, indefinitely.


### Locks
- Functions used to provide [[Mutual Exclusion (Mutex) (Software)]] to [[Critical Section (Software)]] via locks
```c
int pthread_mutex_lock(pthread_mutex_t *mutex);
int pthread_mutex_unlock(pthread_mutex_t *mutex)
```
- The intent of the code is as follows: if no other [[Thread (OS Concept)]] holds the lock when [[PThreads (Linux)]] mutex lock() is called, the thread will acquire the lock and enter the critical section. 
- If another thread does indeed hold the lock, the thread trying to grab the lock will not return from the call until it has acquired the lock (implying that the thread holding the lock has released it via the unlock call). 
- Of course, many threads may be stuck waiting inside the lock acquisition function at a given time; only the thread with the lock acquired, however, should call unlock.
- Example
```c
pthread_mutex_t lock;
pthread_mutex_lock(&lock);
x = x + 1; // or whatever your critical section is
pthread_mutex_unlock(&lock);
```
- This code has two issues
	- The one things missing in this example is lack of initialization. All locks must be initialized in order to guarantee that they have the correct values to begin with. One way to do this is using `PTHREAD_MUTEX_INITIALIZER`. Doing so sets the lock to the default values and makes it usable. Dynamic way it to call `pthread_mutex_init()` at runtime
		-  Static:      `pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;`
		- Dynamic: `int rc = pthread_mutex_init(&lock, NULL); assert(rc == 0);`
			- The first arg is the lock the second is a optional set of attributes
	- The second issue is that it fails to check error codes when calling lock and unlock. Like any library routine even these can fail. This failure could allow multiple threads into a [[Critical Section (Software)]]
		- A way to handle this is to use wrapper method that assert the routine succeeded (OSTEP code has a header that does this)
- An example wrapper
```c
// Keeps code clean; only use if exit() OK upon failure
void Pthread_mutex_lock(pthread_mutex_t *mutex) {
	int rc = pthread_mutex_lock(mutex);
	assert(rc == 0);
}
```
- Variants of `pthread_mutex_lock` (OSTEP recommends to avoid both except in few cases)
	- `trylock` returns failure if the lock is already held
	- `timedlock` returns failure after a timeout, it becomes a `trylock` if timeout is 0
```c
int pthread_mutex_trylock(pthread_mutex_t *mutex);
int pthread_mutex_timedlock(pthread_mutex_t *mutex, struct timespec *abs_timeout);
```

### Condition Variables
- [[Condition Variable (Software)]] are useful when some kind of signaling must take place between threads, if one [[Thread (OS Concept)]] is waiting for another to do something before it can continue.
- 
- Two primary routines are used by programs wishing to interact in this way:
```c
int pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex);
int pthread_cond_signal(pthread_cond_t *cond);
```
- Similar to [[#Locks]] you can initialize `pthread_cond_t` in two ways
	- `pthread_cond_init()` or `PTHREAD_COND_INITIALIZER`
- One has to have a lock associated with the condition and the lock should be held
	- This is done to prevent [[Race Condition (Concurrent Programming)]]
- Example
```c
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

Pthread_mutex_lock(&lock);
while (ready == 0)
	Pthread_cond_wait(&cond, &lock);
Pthread_mutex_unlock(&lock);
```
- In this code, after initialization of the relevant lock and condition, a [[Thread (OS Concept)]] checks to see if the variable ready has yet been set to something other than zero. If not, the thread simply calls the wait routine in order to sleep until some other thread wakes it
	- The wait call takes lock as argument because it **releases** the lock when putting the thread to sleep, if it didn't the other thread that wakes this thread would never be able to acquire the lock. It also **re-acquires** the lock before returning after being woken
- Why not use `if` instead of `while`?
	- There are pthread implementations that spuriously wake up waiting threads. if we don't recheck in such a case the waiting  thread will this that the condition has not changed even though it has not. Waiting threads will re-check the condition inside a while loop 
	- It is safer to view waking up as a hint that something might have changed and not an absolute fact
- The code to wake this thread would run in some other thread and looks like this
```c
Pthread_mutex_lock(&lock);
ready = 1;
Pthread_cond_signal(&cond);
Pthread_mutex_unlock(&lock)
```

- Why not just a simple flag instead of a [[Condition Variable (Software)]]?
	- For example, we could rewrite the waiting code above to look more like this in the waiting code
		- Firstly it performs poorly as it spins for a long time wasting [[CPU Cycle (Computer Hardware)]]
		- Second it is error prone (OSTEP points to a study that shows that it's hard to do it right this way and roughly half of the examples studied were buggy)
```c
while (ready == 0)
; // spin
```
- The associated signaling code would look like this:
```c
ready = 1;
```

### Sources
[[Operating Systems Three Easy Pieces (OSTEP) (Book)]]