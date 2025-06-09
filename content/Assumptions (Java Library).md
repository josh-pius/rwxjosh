### General
- A precondition check
- Assumptions is one the features of [[JUnit 5 (Java Testing Library)]], and the JUnit 5 Assumptions are collections unity methods that support conditional-based test case executions of software applications. 
- One more thing Assumptions are used whenever don't want to continue the execution of given test methods, And the Assumptions run test cases only if the conditions are evaluated to be true. 


### Example
```java
@Test @DisplayName("pop() on empty stack skipped by precondition failure")
void callPopOnEmptyStack_protected() {
	int size = stack.size();

	// Pre-condition violation: Only continue if stack is not empty
	assumeTrue(size > 0, "Stack must not be empty");

	// We wanted to test the pop method, but only if the precondition is true
	String value = stack.pop();

	// Post-condition: Should be one less item than before
	assertAll(
			() -> assertEquals(size - 1, stack.size()),
			() -> assertEquals("element", value)
	);
}
```

### Metadata
2024-11-25 23:30
- Heard about this first from [[Kenneth Kousen (Programmer)|Ken Kousen (Programmer)]] [here](https://youtu.be/MC25AvWqFok?si=WWnXoLL1uwspC0zQ)