### General
- A pointcut expression starts with a pointcut designator (PCD), which is a keyword telling [[Spring AOP (Spring Module)]] what to match. There are several pointcut designators, such as the execution of a method, type, method arguments, or annotation


### execution
- The primary Spring PCD is execution, which matches method execution join points:
```java
@Pointcut("execution(public String com.baeldung.pointcutadvice.dao.FooDao.findById(Long))")
```
- This example pointcut will exactly match the execution of the findById method of the FooDao class. 
	- This works, but it’s not very flexible. 
	- Suppose we’d like to match all the methods of the FooDao class, which may have different signatures, return types, and arguments. To achieve this, we can use wildcards:
	- Here the first wildcard matches any return value, the second matches any method name, and the (..) pattern matches any number of parameters (zero or more).
```java
@Pointcut("execution(* com.baeldung.pointcutadvice.dao.FooDao.*(..))")
```


### within
- Another way to achieve the same result as the previous section is by using the within PCD, which limits matching to join points of certain types:
```java
@Pointcut("within(com.baeldung.pointcutadvice.dao.FooDao)")
```
- We can also match any type within the com.baeldung package or a sub-package:
```java
@Pointcut("within(com.baeldung..*)")
```


### this and target
- **this**: this limits matching to join points where the bean reference is an instance of the given type
- **target**: limits matching to join points where the target object is an instance of the given type
- The former works when Spring AOP creates a CGLIB-based proxy, and the latter is used when a JDK-based proxy is created

Example: 

```java
public class FooDao implements BarDao {
    ...
}
```
- In this case, Spring AOP will use the JDK-based proxy, and we should use the target PCD because the proxied object will be an instance of the Proxy class and implement the BarDao interface:
```java
@Pointcut("target(com.baeldung.pointcutadvice.dao.BarDao)")
```
- On the other hand, if FooDao doesn’t implement any interface, or the proxyTargetClass property is set to true, then the proxied object will be a subclass of FooDao and we can use the this PCD:
```java
@Pointcut("this(com.baeldung.pointcutadvice.dao.FooDao)")
```


### args
- We can use this PCD for matching particular method arguments:
- This pointcut matches any method that starts with find and has only one parameter of type Long. If we want to match a method with any number of parameters, but still having the fist parameter of type Long, we can use the following expression:
```java
@Pointcut("execution(* *..find*(Long,..))")
```


### @target
- The @target PCD (not to be confused with the target PCD described above) limits matching to join points where the class of the executing object has an annotation of the given type:
```java
@Pointcut("@target(org.springframework.stereotype.Repository)")
```

### @args
- This PCD limits matching to join points where the runtime type of the actual arguments passed have annotations of the given type(s). Suppose that we want to trace all the methods accepting beans annotated with the [[@Entity (Java)]] annotation:
```java
@Pointcut("@args(com.baeldung.pointcutadvice.annotations.Entity)")
public void methodsAcceptingEntities() {}
```
- To access the argument, we should provide a JoinPoint argument to the advice:
```java
@Before("methodsAcceptingEntities()")
public void logMethodAcceptionEntityAnnotatedBean(JoinPoint jp) {
    logger.info("Accepting beans with @Entity annotation: " + jp.getArgs()[0]);
}
```

### @within
- This PCD limits matching to join points within types that have the given annotation:
```java
@Pointcut("@within(org.springframework.stereotype.Repository)")
```
- Which is equivalent to:
```java
@Pointcut("within(@org.springframework.stereotype.Repository *)")
```

### @annotation
- This PCD limits matching to join points where the subject of the join point has the given annotation. For example, we can create a @Loggable annotation:
```java
@Pointcut("@annotation(com.baeldung.pointcutadvice.annotations.Loggable)")
public void loggableMethods() {}
```


### Sources
https://www.baeldung.com/spring-aop-pointcut-tutorial