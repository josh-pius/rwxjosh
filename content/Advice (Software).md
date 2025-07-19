### General
- A concept in [[Aspect Oriented Programming (AOP)]]
- A specific point in the execution of a program where an aspect can be applied (e.g., method execution, object creation).
- The action taken by an [[Aspect (Software)]] at a particular [[Join Point (Software)]]. Types of advice include:
	- Before Advice: Runs before a method is executed.
	- After Advice: Runs after a method is executed.
	- Around Advice: Wraps a method execution, allowing actions before and after the method.


### Advice Types in Spring
Source: [[ChatGPT]]
1. [[@Before (AOP) (Java)]] – runs before the method
2. [[@After (AOP) (Java)]] – runs after the method, regardless of outcome
3. [[@AfterReturning (Java)]] – runs after successful method completion
4. [[@AfterThrowing (Java)]] – runs if method throws exception
5. [[@Around (Java)]] – wraps the method, can control execution


### Execution Order of Advices
Source: [[ChatGPT]]
1. @Around
2. @Before
3. Target Method
4. @AfterReturning / @AfterThrowing
5. @After

