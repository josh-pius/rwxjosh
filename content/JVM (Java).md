### General
- Though it was initially developed for Java it is flexible enough to support other languages like
	- [[Scala (Programming Language)]]
	- [[Groovy (Programming Language)]]
	- [[Kotlin (Programming Language)]]

### Intuition
- A [Java Virtual Machine (JVM)](https://en.wikipedia.org/wiki/Java_virtual_machine) is an imaginary computer that has never been physically built as hardware. 
- A JVM runs programs compiled to its imaginary [instruction set](https://en.wikipedia.org/wiki/Instruction_set_architecture) written to storage as an [intermediate representation](https://en.wikipedia.org/wiki/Intermediate_representation) known as [bytecode](https://en.wikipedia.org/wiki/Bytecode).
- At runtime, the bytecode must be translated from the imaginary instruction set to the actual instruction set of the CPU of the host machine. 
- This can be done on-the-fly by an [interpreter](https://en.wikipedia.org/wiki/Interpreter_(computing)). Or the bytecode can be fully [compiled](https://en.wikipedia.org/wiki/Compiler) and [cached](https://en.wikipedia.org/wiki/Cache_(computing)#Software_caches), to run faster than through the interpreter, in a process known as  [[Just-In-Time Compilation (JIT)]].

### JVM Parameters
Sources: https://www.baeldung.com/jvm-parameters

#### View All (-XX) Options
- Running the command below print all options and their defaults
```java
java -XX:+UnlockDiagnosticVMOptions -XX:+PrintFlagsFinal -version
```

#### Explicit Heap Memory Parameter
-  [[Heap Memory (JVM)]] options
	- `-Xms` and `-Xmx`
	- Syntax
		- Min `-Xms<heap size>[unit]` 
		- Max `-Xmx<heap size>[unit]`
	- Here, **_unit_** denotes the unit in which we’ll initialize the memory (indicated by **_heap size_**). We can mark units as **_‘g’_** for GB, _**‘m’**_ for MB, and _**‘k’**_ for KB.
	- Example: `-Xms2G -Xmx5G` - Denotes minimum 2GB and max 5GB

#### Metaspace Memory Parameter
- Starting with Java 8, the size of [[Metaspace (JVM)]] isn’t defined. Once it reaches the global limit, JVM automatically increases it. However, to overcome any unnecessary instability, we can set Metaspace size with:
```
-XX:MaxMetaspaceSize=<metaspace size>[unit]
```

#### Young Generation Memory Allocation Parameter
- As per the Oracle guidelines, after total available memory, the second most influential factor is the proportion of the heap reserved for the [[Young Generation (Java)]]. By default, the minimum size of the YG is 1310 MB, and maximum size is unlimited.
```
-XX:NewSize=<young size>[unit] 
-XX:MaxNewSize=<young size>[unit]
```

#### Garbage Collector Algorithm Parameter
- See [[Garbage Collection (Java)]]
- For better stability of the application, choosing the right Garbage Collection algorithm is critical.
- There are different types of GC implementations
- We can choose the implementation we want with the below parameters:
``` java
-XX:+UseSerialGC
-XX:+UseParallelGC
-XX:+USeParNewGC
-XX:+UseG1GC
```

#### Garbage Collector Logging Parameter
- See [[Garbage Collection (Java)]]
- To strictly monitor the application health, we should always check the JVM’s _Garbage Collection_ performance. The easiest way to do this is to log the _GC_ activity in human readable format.
- Using the following parameters, we can log the _GC_ activity
```java
-XX:+UseGCLogFileRotation 
-XX:NumberOfGCLogFiles=< number of log files > 
-XX:GCLogFileSize=< file size >[ unit ]
-Xloggc:/path/to/gc.log
```

- **_UseGCLogFileRotation_** specifies the log file rolling policy, much like log4j, s4lj, etc. **_NumberOfGCLogFiles_** denotes the max number of log files we can write for a single application life cycle. **_GCLogFileSize_** specifies the max size of the file. Finally, _**loggc**_ denotes its location.
- One point to note here is that there are two more JVM parameters available (_**-XX:+PrintGCTimeStamps**_ and _**-XX:+PrintGCDateStamps**_) that we can use to print date-wise timestamps in the _GC_ log.
- For example, if we want to assign a maximum of 100 _GC_ log files, each having a maximum size of 50 MB, and we want to store them in the ‘_/home/user/log/’_ location, we can use the below syntax
``` java
-XX:+UseGCLogFileRotation  
-XX:NumberOfGCLogFiles=10
-XX:GCLogFileSize=50M 
-Xloggc:/home/user/log/gc.log
```

#### Handling Out of Memory Parameter
- See [[OutOfMemoryError (Java Exception)]]
- It’s very common for a large application to face an out of memory error, which in turn results in an application crash. 
- It’s a very critical scenario, and very hard to replicate to troubleshoot the issue.
- That’s why JVM comes with some parameters to dump heap memory into a physical file that we can use later to find leaks:
``` java
-XX:+HeapDumpOnOutOfMemoryError 
-XX:HeapDumpPath=./java_pid<pid>.hprof
-XX:OnOutOfMemoryError="< cmd args >;< cmd args >" 
-XX:+UseGCOverheadLimit
```
- **HeapDumpOnOutOfMemoryError** instructs the JVM to dump heap into a physical file in case of _OutOfMemoryError._
- **HeapDumpPath** denotes the path where the file will be written. Any filename can be given; however, if JVM finds a `<pid>` tag in the name, the process id of the current process causing the out of memory error will be appended to the file name with _.hprof_ format.
- **OnOutOfMemoryError** is used to issue emergency commands that will be executed in case of an out of memory error. We should use proper commands in the space of cmd args. For example, if we want to restart the server as soon as an out of memory occurs, we can set the parameter:
	- Example: `-XX:OnOutOfMemoryError="shutdown -r"`

#### Other Parameters
- There are quiet a few other parameters we well which can be found here https://www.baeldung.com/jvm-parameters

### Garbage Collection
- [[Garbage Collection (Java)]]

#WIP 


### A Deep Dive Into the JVM Start-up
 Source:  https://youtu.be/ED1oc7gn5uY?si=ZcuuUj_W6x0KZuf8
 - Comprehensive information can be found in the JVM specification
 - When you call `java HelloWorld` a JVM start-up process is kicked off by calling `JNI_CreateJavaVM()` a [[Java Native Interface (JNI)]] function
 - First thing that happens is parsing and validation of [[VM Arguments (Java)]] along with internal checking
 - A check of available system resources happens then, eg. check number of available processors, checking for available memory etc
 - The availability of memory determines which [[Garbage Collection (Java)]] gets used
	 - [[G1  (Java Garbage Collector)]] is the one used unless only single processor is used or memory is less than 1792 MB
 - Next the JVM sets up it's environment including HS perf (Hotspot performance) data
	 - This data can be used by profiling tools
	 - Stored in the temp directory in unix systems
 - Next the selection and configuring of the [[Garbage Collection (Java)|garbage collector]]
 - #WIP

### JVM Anatomy
- https://youtu.be/BeMi8K0AFAc?si=__4KculvB9e6d1rn
- Seems like a really good talk, I should check it out someday #ToDigDeeper 