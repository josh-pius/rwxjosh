### General
- An [[Annotation (Java)]] that's used to declare aliases for [[Annotation Attributes (Java)]]



### Example
```java
@CacheEvict(value={"someValue"})

...
public @interface CacheEvict {
	@AliasFor("cacheNames")
	String[] value () default {};
}
```
- `value` [[Annotation Attributes (Java)|annotation attribute]] is aliased by `cacheNames` using [[@AliasFor (Java)]]