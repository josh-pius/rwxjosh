### Methods That Do Not Always Return Value
- [[Optionals (Java)]] did not exist before Java 8
- If we had a method that only returned a value in some circumstances our only choices were to return null or throw an [[Exception (Java Class)]]
1. According to [[Item 69 (Effective Java)]], exceptions should only be used for exceptional circumstances
	- This is because the operation to get the entire stack trace is expensive
2. The problem with returning a null is that it becomes part of the methods contract. 
	- Any client calling the method must first check the return value before doing an assignment
	- If value is assigned to a variable without a null check, it may later cause a NullPointerException at some point

- [[Optionals (Java)]] help us deal with these situations
- [[Optionals (Java)]] are immutable containers for the return value

### Relationship With Checked Exceptions
- [[Optionals (Java)]] are similar in spirit to [[Checked Exception (Java)]]
- Unlike null-checks which are often forgotten an optional must be checks for the value before using the value

### Best Practices
- You should not use optional if one of the values the method returns is null
	- This defeats the purpose of optionals, which is to do a forced null-check
- Container types like collections, maps, streams and arrays should not be wrapped in Optionals
- You should declare a method to return an optional if it might not be able to return a result and clients will have to perform special processing if no result is returned
- Don't use an optional as a key, value or element in a collection
- If you're returning an empty container, you should return the empty container by itself
	- No need to wrap in `Optional<List<T>>`



### Example
- Instead of throwing an error here violating [[Item 69 (Effective Java)]] we can do this instead
![[Pasted image 20221125132158.png]]
-----

![[Pasted image 20221125132233.png]]

### orElse and orElseThrow and orElseGet

- We we use [[Optionals (Java)]] we get to take advantage of this [[Syntactical sugar]]
![[Pasted image 20221125132835.png]]
- Here we're passing an exception factory not creating an exception
![[Pasted image 20221125132906.png]]

- If the default value that needs to be returned is expensive, we can pass a [[Supplier (Interface)(Java)|Supplier<T>]] that it invokes when it needs the default value


### Cost of Using Optionals

- Optionals are not a good fit for performance critical situations
	- Whether the use case is performance critical should be evaluated only after careful measurement ([[Item 67 (Effective Java)]])
- You should never return regular optionals for primitive types
	- This is because they first get boxed and then get boxed again into the optional structure
	- If you do need to have optional for primitive use OptionalInt, OptionalLong etc