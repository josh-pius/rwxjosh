### General
- Based on [[Future (Java)]]
- But better for coordination
- It implements two [[Interfaces (Java)]]: [[Future (Java)]] and [[CompletionStage (Java)]]


### Methods Inherited From Completion Stage
- See methods in [[CompletionStage (Java)#Methods]]


### Wait Till All Completable Futures In Collection Completes
- You can use `CompletableFuture.allOf(completableFutures).join()` to wait till all [[CompletableFuture (Java)]] complete
	- This will not give you the return value though
- If you want that you need to do this. Here the join that happens for each isn't waiting rather it's just used to retrieve the value
```java
CompletableFuture.allOf(completableFutures).join();
Arrays.stream(completableFutures)
	.map(CompletableFuture::join)
	.forEach(System.out::println);
```
- If any [[CompletableFuture (Java)]] throws  an exception, the `allOf(...).join()` will throw a [[CompletionException (Java Exception)]], if you don't want this then define the `exceptionally()` exception handler
- If you have a stream of completable futures instead of making it a list (which the `allOf`) method does not accept you can directly convert it into an [[Array (Java)]] with [[Streams Api (Java)]]

```java
CompletableFuture<?>[] array = list.stream()
    .toArray(CompletableFuture[]::new);
```

### Completing the CompleteableFuture
1. `get()` blocks, declares [[ExecutionException (Java Exception)]], [[InterruptedException (Java Exception)]]
	1. Both are [[Checked Exception (Java)]] and a pain to handle in streams so `join()` might be preferred instead
2. `join()` blocks, declares ([[Unchecked Exception (Java)|unchecked]]) [[CompletionException (Java Exception)]]
3. You can wait for it to be "quiescent"
	1. The moment you call a method like `supplyAsync` the thread and processing has already started
	2. The common [[ForkJoinPool (Java)]] is composed of [[Daemon Threads (Java)]], if nothing is running the threads terminate. You could call `get()` which would block the main thread until the threads in the pool are done or else you can change the timeout so that the main thread **does** not finish before our threads finish

```java
ForkJoinPool.commonPool()
.awaitQuiescence(1, TimeUnit.SECONDS);
```

### Completion Exception
- If a task throws exception during run, when the `join()` method is called it will throw the [[CompletionException (Java Exception)]]  which encapsulates the thrown exception
- You can check if a task completed with exception using `isCompletedExceptionally()` method
- If you don't like that and would rather create a handler for the scenario where a exception is thrown you can use the `exceptionally()` method
```java
CompletableFuture<Void> future2 = CompletableFuture.runAsync(() -> {
    System.out.println("Task 2 started");
    throw new RuntimeException("Task 2 failed");
}).exceptionally(ex -> {
    System.out.println("Exception in Task 2: " + ex.getMessage());
    return null;
});
```

### Timeout
- You can use the `.orTimeout(2,TimeUnit.SECONDS)` to timeout a [[CompletableFuture (Java)]]
- In this case it does not kill or interrupt the running thread, instead it completes the [[CompletableFuture (Java)]] exceptionally with a `TimeoutException`
- If you want to ensure the thread is stopped after timeout you need to manage it yourself typically by calling `future.cancel(true)`, you can check if it is complete



### Sources
https://youtu.be/x5akmCWgGY0?si=HE0-UnjXCufYAiIW by [[Kenneth Kousen (Programmer)]]
