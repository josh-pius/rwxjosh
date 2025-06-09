Source: https://dzone.com/articles/cglib-missing-manual
### General
- Cglib is an [[Open-Source]] library that capable creating and loading class files in memory during Java runtime.
- To do that it uses Java bytecode generation library ‘asm’, which is a very low-level bytecode creation tool. I will not dig that deep in this article.

### Byte Code Instrumentation
- The byte code instrumentation library cglib is a popular choice among many well-known Java frameworks such as Spring and  [[Hibernate (JPA Framework)]] (not anymore uses [[JavaAssist (Java Library)]] instead)
-  Byte code instrumentation allows to manipulate or to create classes after the compilation phase of a Java application. Since Java classes are[[Dynamically Linked (Java)]] at run time, it is possible to add new classes to an already running Java program.


### Spring and CGLIB
https://www.youtube.com/watch?v=hskHMSlvm6U
- Good video on CGLIB
- Spring bundles it's own version of CGLIB to avoid conflicts
	- JPA and other projects use CGLIB
	- If the just included it as a dependency and each spring project needed it's own version of CGLIB  that would result in conflicting versions
- Spring used cglib for example when adding security constraints to your method calls.
	- Instead of calling your method directly, Spring security will first check if a specified security check passes and only delegate to your actual method after this verification


### Mockito and CGLIB
- Another popular use of cglib is within mocking frameworks such as [[Mockito (Java Library)]], where mocks are nothing more than instrumented class where the methods were replaced with empty implementations (plus some tracking logic).


### Built on ASM
- CGLIB is built on [[ASM (Java Library)]]

### Proxy Design Pattern
- Seems to be used to quickly implement [[Proxy (Design Pattern)]] a lot

### Enhancer
Source: https://dzone.com/articles/cglib-missing-manual
- The most used class in CGLIB library
- Allows you to create [[Proxy (Design Pattern)|Proxies]] for non-interface types
- Can be compared to the `Proxy` class in Java Standard Library
- When combined with `InvocationHandler` this becomes quiet powerful

### Related
https://dzone.com/articles/power-proxies-java