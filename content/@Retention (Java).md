### General
- A Java [[Meta-Annotation (Java)]] that is used to specify how long an annotated annotation type is to be retained
- You specify as argument one of the following
	- `RetentionPolicy.SOURCE`: Retained in source code, discarded by compiler
	- `RetentionPolicy.CLASS`: Recorded in [[Class (File Type) (Java)|.class (File Type) (Java)]] generated by compiler but not retained by [[JVM (Java)]] at runtime. Mostly for tooling that works with [[Bytecode (Java)]] but does not need runtime access
	- `RetentionPolicy.RUNTIME`: Retained in [[Class (File Type) (Java)|.class (File Type) (Java)]] file but also available at runtime. This means it can be accessed via [[Java Reflection API|Reflection]] making it useful for frameworks that guide behavior during execution