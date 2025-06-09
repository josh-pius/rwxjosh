### General
- A class that does not have a name
- Anonymous classes enable you to make your code more concise. 
- They enable you to declare and instantiate a class at the same time. 
- They are like local classes except that they do not have a name. Use them if you need to use a local class only once.
- Similar to dummy objects in [[Javascript (Programming Language)]]
- When used with the `var` keyword it gives you access to the [[Non-Denotable Type (Java)]]


### Lambdas
- There are cases where a anonymous class can be written as an [[Lambda (Java)]] but not always
- Lambda's implement [[Functional Interfaces (Java)]] but anonymous classes can implement any interface

### Example
Consider the instantiation of the frenchGreeting object:
```java
HelloWorld frenchGreeting = new HelloWorld() {
	String name = "tout le monde";
	public void greet() {
		greetSomeone("tout le monde");
	}
	public void greetSomeone(String someone) {
		name = someone;
		System.out.println("Salut " + name);
	}
};
```
### Sources
https://docs.oracle.com/javase/tutorial/java/javaOO/anonymousclasses.html