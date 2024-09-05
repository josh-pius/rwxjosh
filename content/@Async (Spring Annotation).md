### General
- This annotation indicates that the method should run on a separate [[Thread (Java)]]
- The caller does not need to wait for this method to complete and can proceed with other tasks
- You need to first enable asynchronous processing using [[@EnableAsync (Spring Annotation)]]
- The method with this annotation can return void or `Future<T>`
	- In the latter case you can retrieve the result of the asynchronous operation at a later time
- Constraints
	- Method with this annotation must be public
	- Should not be called from the same class (because it would bypass the proxy and not execute asynchronously)
- By default spring uses SimpleAsyncTaskExecutor to run method with [[@Async (Spring Annotation)]], you can define your own executor and specify it in in the @Async annotation

