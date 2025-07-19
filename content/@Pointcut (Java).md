### General
- [[Annotation (Java)]], allows you to create reusable pointcut expressions in [[Spring AOP (Spring Module)]]

### Example
- You can define a pointcut expression like this 
```java
@Pointcut("within(@org.springframework.stereotype.Repository *)")
public void repositoryClassMethods() {}
```
- Then you can use it across many [[Advice (Software)|Advice]]
```java
@Around("repositoryClassMethods()")
public Object measureMethodExecutionTime(ProceedingJoinPoint pjp) throws Throwable {
    ...
}
```