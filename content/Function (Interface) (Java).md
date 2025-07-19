### General
- **Purpose**: Represents a function that takes an input and produces an output.
- **Method**: `R apply(T t)`
- Use **Case**: Transformation or mapping of one value to another.

### Example
- Function used for mapping
```java
List<String> names = List.of("Tom", "Jerry");
List<Integer> lengths = names.stream()
							 .map(name -> name.length())
							 .collect(Collectors.toList());
```


### Functional Composition
- [[Composition (Functional Programming)]]
- Using Function<T, R>.andThen() and .compose() to chain transformations:
```java
f.andThen(g); // g(f(x))
```
