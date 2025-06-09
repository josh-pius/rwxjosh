### General
- Started as an alternative to [[Java Enterprise Edition (JEE)]]
- Creator [[Roderick Johnson (Software Developer)]]

### Demystifying Spring Internals (Video)
https://youtu.be/LeoCh7VK9cg?si=o1o1Ia7LqbZHjhtk
- Really good video

### The Worst Framework Created (Video)
https://youtu.be/lsyZj6LBvVA?si=vDR4LBd7rr2daTgD
- The comments by a spring developer in the comments presents the opposite side, comparing it to enterprise Java which was way more terrible than spring


### Spring Boot
[[Spring Boot (Framework)]]

### Related Projects
[[Spring Web]]
[[Spring Security (Spring Module)]]

### Good Video 
https://www.youtube.com/watch?v=Ybfo8Dwactg

### Spring Related Anki Decks
https://github.com/vojtechruz/spring-core-cert-notes-4.2/blob/master/Spring%20Core%20Certification%20Notes%204.2.md



### Suggesting on Learning Spring From Quora

How can a person master the Spring framework in Java?
> There is not much to learn in Spring. It’s just a simple glue. What you really need to learn is the technologies that it glues: [[Java Database Connectivity API (JDBC)|JDBC]], Thread Locals (they are extensively used in Spring Tx & Spring DAO), runtime proxying with JDK dynamic proxy and CGLIB (used by Spring AOP), Servlets, etc.
>
>And for god sake don’t learn Spring Boot - it’s just a set of bad practices that look nice. Especially it’s bad for a newbie - it hides away everything that you actually need to see and touch.
>
>E.g. as a newbie you should learn all the things that are required to set up DB access: Transaction Manager, SessionFactory or EntityManagerFactory (if you use ORM), exception translation mechanisms, DB Pool, LazyConnectionDataSourceProxy, OpenSessionInView filter or interceptor (if you prefer to).
>
>But if you use SpringBoot, do you even know which of these mechanisms are in use and what they do? In order to become a grown-up programmer you need to know all these things and I doubt SpringBoot will help with this goal. Not to mention that in general the code in well-written projects is explicit - it doesn’t do unexpected magic.
>
>PS: you can take a look at [my course](https://github.com/qala-io/java-course "github.com") programme. It’s probably hard to move through it w/o assistance but at least it could give you a sense of what you should learn in the foreseeable future.

>For me it was 2 things  
a) Reading Spring In Action  
b) Debugging through Spring
>
There is a lot of "magic" in spring, and just trying to learn it from examples can confuse you. You need to understand how Spring core works to make sense of it all. A good book on Spring can definetly help you there. I would encourage anyone to start from Spring In Action
>
However, if you want to understand how SPring is built, you need to dig into it. If you are in the habit of using Maven with Eclipse, you get a wonderful freebie. The ,m2eclipse plugin automatically downloads sources of any maven dependency on demand. SO, let's say you are debugging through your servide layer. You step into a call that goes into Spring. Voila! Eclipse will download the java file for you. You can put break points in Spring, hibernate, apache commons. Anything really.
>
With the use of the debugger, I have figured out
>
a) How Spring and hibernate interact and added support for custom fields into hibernate  
b) Figured out the nitty gritty of BeanPostprocessors, and implemented my own custom property Injection  
c) Figured out how to build my own namepace  
d) Extended Spring Data to integerate with Spring ACL. Well that was the intent but we ended up taking short cuts. But it was still cool to build my own Spring Data Repository. It would basically inject a Criteria generated from the security related code and inject it into every method provided by Spring Data and also the custom methods annotated with @Query Some serious coolness in Spring Data, although it's a little hard to extend it.

>You should follow this you tube channel - [Almighty Java](https://www.youtube.com/channel/UC2l7YxjvTVtmZrHDoyQ0zrQ "www.youtube.com")
>
I am sure you will get some good knowledge about spring
>
[Spring Core - YouTube](https://www.youtube.com/playlist?list=PLZdfbI_OZWAPohJtLD8QBv78Eq4dBvq1g "www.youtube.com")
>
[Spring Advanced - YouTube](https://www.youtube.com/watch?v=0VX_tX4p9GY&list=PLZdfbI_OZWAO2jdjUL7wgoYvESm0XewE5 "www.youtube.com")
>
[Spring Boot - YouTube](https://www.youtube.com/playlist?list=PLhd_vL3a3i7ooy1uGc_mz5C4s9Y1Pt7WZ "www.youtube.com")

### Spring Projects
[[Spring Data for Apache Cassandra]]



## @ConfigurationProperties Annotation
Source: [[Build Book Tracking App (Tutorial)]] and https://www.baeldung.com/configuration-properties-in-spring-boot
```java
@Configuration 
@ConfigurationProperties(prefix = "mail") 
public class ConfigProperties { 
	private String hostName; 
	private int port; 
	private String from; 
	
	// standard getters and setters 
}
```

- To get this annotation to work you either need to:
	- Add the `@Configuration` annotation to the class as well
	- Or Add the `@EnableConfigurationProperties(ConfigProperties.class)` with the Classname passed as a parameter 
		- I've seen this working the other one not so much
- The `prefix` named argument in the annotation is used so that it picks up all the properties prefixed by that prefix

```
#Simple properties 
mail.hostname=host@mail.com 
mail.port=9000 
mail.from=mailer@mail.com
```
- The case of the property can be almost any anything since spring has relaxed rules regarding that
``` yml
mail.hostName
mail.hostname 
mail.host_name 
mail.host-name 
mail.HOST_NAME
```
- For example all of these properties will bind to the hostName field in the class
- You can even map nested properties refer to the baledung source for that
- ConfigurationProperties can be used even on a @Bean object to bind external properties to that instance
- You can add validation for properties with the [[Java Specification Requests (JSR)#JSR-303]] format annotations

### Validation

[[Validation (Spring)]]

### Bean Lifecycle Hooks
1. **@PostConstruct**
- After springboot starts up execute what's given in this method

```
@PostConstruct
public void start(){
	System.out.println("ApplicationStarted")
}
```
2. @PreDestroy


### @Transactional
[[@Transactional (Spring)]]

### Why Did Spring Stop Using Checked Exceptions
[[Checked Exception (Java)]]
![[Pasted image 20221220224634.png]]


### Spring Detailed Documentation
https://docs.spring.io/spring-framework/docs/current/reference/html/index.html

### Spring Framework EPUB Reference
https://docs.spring.io/spring-framework/docs/3.2.x/spring-framework-reference/epub/


### Useful Spring Article
https://www.marcobehler.com/guides/spring-framework



