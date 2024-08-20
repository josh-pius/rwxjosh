### General
- More here [[Mockito#Argument Captor]]
- Convenience annotation to create an argument captor without initializing it



### Example
```java
@Captor
private ArgumentCaptor<SomeClass> captor;

...
verify(this.someService).someMethod(captor.capture());
captor.getValue()

```