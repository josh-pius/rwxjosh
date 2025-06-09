### General
- In [[Java (Programming Language)]], the term effectively final refers to a variable that is not explicitly declared as [[final (Java Keyword)]] but whose value does not change after it is initialized. 
	- Such variables behave as though they were declared [[final (Java Keyword)]].
- It is crucial for [[Lambda (Java)]] expressions and [[anonymous class (Java)]] because they can only capture final or [[Effectively Final (Java Concept)]] variables from their enclosing scope.


### Example
Source: [[ChatGPT]]
- Example 1: Variable is Effectively Final
```java
public class EffectivelyFinalExample {
    public static void main(String[] args) {
        String message = "Hello, World!"; // Effectively final variable

        Runnable runnable = () -> System.out.println(message); // Allowed
        runnable.run();
    }
}
```
- message is effectively final because its value is never reassigned after initialization.
- Example 2: Variable Is Not Effectively Final
```java
public class NotEffectivelyFinalExample {
    public static void main(String[] args) {
        String message = "Hello, World!";

        message = "Hello, Java!"; // Reassigned, so not effectively final

        Runnable runnable = () -> System.out.println(message); // Compilation error
    }
}
```

- The variable message is reassigned, so it is no longer effectively final, and using it in the lambda results in a compilation error.
