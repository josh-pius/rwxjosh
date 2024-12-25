### General
- The method passed in must be 
	- [[Static Methods (Java)|static]] 
	- Returns a [[Stream (Java Class)]], [[Array (Java)]], [[Iterable (Java)]], [[Iterator (Java)]]
### Examples
```java
@ParameterizedTest(name = "{0} is prime and less than 20")
@MethodSource("primesLessThan100")
void checkPrimesLessThan100(int arg){
	assertTrue(UtilityMethods.isPrime(arg));
}

private static IntStream primesLessThan100() {
	return IntStream.rangeClosed(2,100)
					.filter(UtilityMethods::isPrime);
}
```

- If you want to pass in multiple values. `Arguments.of()` takes a list of Objects as input so the you can pass in any type not just int(s) as shown below

```java
@ParameterizedTest(name = "max of {0} and {1} is {2}")
@MethodSource("maxWithArgsList")
void testMax(int x, int y, int max){
	assertTrue(max >= x && max >= y);
}

private static List<Arguments> maxWithArgsList() {
	return Arrays.asList(Arguments.of(2,1,2),
						 Arguments.of(7,3,7),
						 Argumetns.of(5,3,5));
}
```

