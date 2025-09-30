### General
- To configure [[Spring Security (Spring Module)]] create a bean with this return type with [[HttpSecurity (Spring Security) (Java)]] as an input to the bean method
- [[HttpSecurity (Spring Security) (Java)]] is the Spring security lambda DSL that lets you define authorization rules


### Layers of Indirection
Source: https://docs.spring.io/spring-security/reference/servlet/architecture.html
- One might be tempted to think that [[SecurityFilterChain (Spring Security) (Java)]] is a subchain of  server [[FilterChain (Java Servlet Class)]] 
- This I leant is far from the truth
- Servlet containers are not aware of spring context, in fact Spring bootstraps it’s context in response to an intimation (via [[ContextLoaderListener (Spring) (Java)]]) from the servlet container that it has created the servlet container (which includes all the [[Filter (Java Servlet Class)|filters]])
- To handle this spring registers a filter of type [[DelegatingFilterProxy (Spring Class)]], this filters internally references a bean which will actually have the filter logic
- In the case of [[SecurityFilterChain (Spring Security) (Java)]], the bean it references is a [[FilterChainProxy (Spring)]], as the name suggests instead of a single filter it actually references a whole chain of filters. This chain is the [[SecurityFilterChain (Spring Security) (Java)]]

Servlet Filter (DelegatingFilterProxy) ->
Referenced Bean (FilterChainProxy) -> 
SecurityFilterChain

### Replaces 
[[WebSecurityConfigurerAdapter (Spring Security) (Java)]]