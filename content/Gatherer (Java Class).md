### General
- Enhancement to [[Streams Api (Java)]]

### Methods
1. fold
2. mapConcurrent
3. scan
4. windowFixed
5. windowSliding

### Deep Dive on Gatherers 
Source: https://youtu.be/v_5SKpfkI2U?si=VSTBcxRLujAWCpQb by [[Java (Youtuber)]] speaker [[Viktor Klang (Software Engineer)]]
- There are some requirements that you cannot just existing stream API for
- [[Collectors (Java Class)]] don't meet the requirements either
- Gatherers are a sequences of JEPs
	- [[JEP-461]]
	- [[JEP-473]]
	- [[JEP-485]]
- Interface similar to collectors: `java.util.stream.Gatherer<T, A, R>` but individual interfaces differ
	- `Supplier<A> initializer()`
	- `Integrator<A, T, R> integrator()`
	- `BinaryOperator<A> combiner()`
	- `BiConsumer <A, Downstream<R>> finisher()`