Source: https://www.youtube.com/watch?v=lX0PzE0Dho0&t=2s
### General
- Introduces in Java 8
- Represent functionalities, have a single abstract method, enable lambdas

### Key Differences
Source: [[ChatGPT]]
1. **Result Type**:
    - `Function`, `Callable`, `Supplier`, and `Comparator` return values.
    - `Consumer` and `Runnable` do not return values.
    - `Predicate` returns a boolean value.
2. **Input Arguments**:
    - `Function`, `Consumer`, `Predicate`, and `Comparator` take input arguments.
    - `Supplier`, `Runnable`, and `Callable` do not take input arguments.
3. **Action vs Computation**:
    - `Runnable` and `Consumer` are focused on performing actions.
    - `Function`, `Predicate`, `Supplier`, and `Callable` are focused on computation and returning results.
4. **Multithreading Use**:
    - `Runnable` and `Callable` are heavily used in multithreading with `ExecutorService`.

Source: [[ChatGPT]]

| Interface    | Input     | Output       | Method      | Typical Use Case                        |
| ------------ | --------- | ------------ | ----------- | --------------------------------------- |
| `Function`   | Yes (`T`) | Yes (`R`)    | `apply()`   | Transforming one value to another.      |
| `Consumer`   | Yes (`T`) | No           | `accept()`  | Performing an action with side-effects. |
| `Runnable`   | No        | No           | `run()`     | Running a task with no input or output. |
| `Callable`   | No        | Yes (`V`)    | `call()`    | Running a task that produces a result.  |
| `Comparator` | Yes (`T`) | Yes (`int`)  | `compare()` | Comparing two objects for sorting.      |
| `Predicate`  | Yes (`T`) | Yes (`bool`) | `test()`    | Evaluating a condition or filtering.    |
| `Supplier`   | No        | Yes (`T`)    | `get()`     | Supplying or generating a value.        |

### Examples

[[Runnable (Interface)(Java)]]
[[Callable (Interface)(Java)]]
[[Comparator (Java)]]
[[Function (Interface)(Java)]]
[[Predicate (Interface)(Java)]]
[[Consumer (Interface)(Java)]]
[[Supplier (Interface)(Java)]]


### Benefits of Functional Interfaces
Source: [[ChatGPT]]
1. Readability
```java
Predicate<Integer> isEven = num -> num % 2 == 0;

// Reuse in different contexts
System.out.println(isEven.test(4)); // true
List<Integer> evens =  List.of(1, 2, 3, 4)
						   .stream()
						   .filter(isEven)
						   .toList(); // [2, 4]

```
2. Integration with APIs
	1. Many Java APIs, especially Streams and [[Optionals (Java)]], are designed to work seamlessly with functional interfaces.
3. Extensibility and Composition
	1. Functional interfaces can be combined or extended for more complex logic.
```java
Predicate<Integer> isPositive = n -> n > 0;
Predicate<Integer> isEven = n -> n % 2 == 0;
Predicate<Integer> isPositiveEven = isPositive.and(isEven);

System.out.println(isPositiveEven.test(4)); // true
System.out.println(isPositiveEven.test(-2)); // false

```
4. Compatibility with Existing Java Features
	1. [[Method Reference (Java)]]: Functional interfaces allow method references `Class::methodName`, which are concise and more readable.
	2. [[@FunctionalInterface (Java Annotation)]]: Functional interfaces can be annotated with @FunctionalInterface, signaling the compiler to enforce that the interface has a single abstract method.
5. Strong typing
	1. Functional interfaces enforce strong typing, making your code more robust. When you define a lambda, the type of the arguments and the return value are inferred from the functional interface.