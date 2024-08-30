### General
- Language I use primarily
- Java uses [[Applicative-Order (Evaluation Strategy)]]


### Misc
Source: [Top 22 Java Libraries and APIs Every Programmer Should Learn in 2022](https://medium.com/javarevisited/20-essential-java-libraries-and-apis-every-programmer-should-learn-5ccd41812fc7) 

Refer  https://www.youtube.com/watch?v=DC5wtYGQ7XE by [[Java Brains]] which will help plan the path

1. Java Core Language Concepts
2. [[JSP and Servlets]]
3. [[Maven (Build Tool)]]
4. [[Spring (Java Framework)]]
5. [[Java Reflection API]]
6. [[Generics (Java)]]
7. Parallel Processing (Akka Framework)
8. [[Java File Handling]]
9. [[Java Handling JSON]]
10. [[Servlet (Java Interface)]] - Fundamental in understanding how frameworks like spring make REST connections possible
11. [[Logging (Java)]]
12. [[Google Guava]] (Useful Libraries for Java Developers) 
13. [[Apace Commons]] (Useful Libraries for Java Developers)
14. [[Apache POI (Java Library)]] (Useful library when working with [[Microsoft Excel]])
15. [[Java Email API]]
16. [[Java HTML Parsing]]
17. [[Java Networking]]
18. [[Concurrency (Java)]]
19. [[Effective Java (Book)]]
20. Book on advanced Java: https://enos.itcollege.ee/~jpoial/allalaadimised/reading/Advanced-java.pdf
	1. Has sections on writing annotations processor, Java agents
21. Java Reactive Programming



### Road Map
- In order to gain greater competence in Java I need to gain an in-depth understanding of the Java Core Libraries
1. Java.net
2. Java.nio
3. Java.lang
4. Java.util
5. Java.concurrency

### Compiling A Java Class
[[Javac#Compiling a Java Class|Compiling a Java Class]]


### Tasks to Master In Java
[[Tasks To Master In Any Programming Language]]


### View ByteCode of a Compiled Java Class
[[Javap]]

### Good Books On Java
[[Effective Java (Book)]]
[[Concurrency In Practice (Book)]]

### Good Youtube Channels
[Defog Tech](https://www.youtube.com/c/DefogTech) (Good series on [[Concurrency (Java)]])
https://www.youtube.com/c/DouglasSchmidt/playlists
[[Java Brains]] (Good for beginners but I've outgrown it for the most part)

### Chain Compilation (I made this term up)
Source: https://www.youtube.com/watch?v=o_MouGNA1AE
- If you compile a java class file say "main" that uses other java classes files with [[Javac]] then it first complies the other classes it uses and them compiles the class "main"

### Linking Java Classes In Different Directories
Source: https://www.youtube.com/watch?v=o_MouGNA1AE
- If you're running a program that uses java classes, and the classes are in different directories. Then you can explicitly mention all the relevant directories in the classpath and it would be able to run the files
```
java -cp ..;. Main
```

- `-cp` stands for class path and we're passing it as a `;`- separated list.
- Here it's looking at the current directory `.` and the directory above it `..`

### Package Java Class files into a Jar
Source: https://www.freecodecamp.org/news/tar-command-linux-tar-cvf-tar-xvf/ ;
https://www.youtube.com/watch?v=o_MouGNA1AE

```
jar cvf MyCoolLib.jar Greeter.class Pythogoras.class
```
- Here two class files are packaged into the jar
- the c tells tar to create a new archive,
- v sets the screen output to verbose so we'll get updates, and
- f points to the filename I’d like to give the archive.

### JSP (Java Specification Requests)
[[Java Specification Requests (JSR)]]

### JLS (Java Language Specification)
[The Java® Language Specification (oracle.com)](https://docs.oracle.com/javase/specs/jls/se8/html/index.html)

### Types In Java
[[Types (Java Programming)]] 
	[[Reference Data Types (Java)]]
	[[Object Types (Java)]]

### Java Agents
[[Java Agents]]


### JAR File
[[JAR (File Format)]]
### Dynamic Proxy
[[Dynamic Proxy (Java)]]

### ClassLoader
[[ClassLoader (Java)]]


### Things to Research
1. [[ClassLoader (Java)]]
2. [[ClassPath File (Java)]]
3. Finish taking notes from this https://www.youtube.com/watch?v=ZzJ3qkPR9WA

### Dynamically Linked
[[Dynamically Linked (Java)]]

### Reading Input
```
Scanner scanner = new Scanner(System.in);
String name = scanner.nextline();
```

### Personal Java Projects
[[Personal Java Projects]]

### Low-Latency Applications In Java
Source: https://stackoverflow.blog/2021/02/22/choosing-java-instead-of-c-for-low-latency-systems/
- My manager during a meeting argued how more recently Java is being preferred over more machine centric languages like [[C (Programming Language)]] and [[C++ (Programming Language)]]. I looked up more info online
- I read this article on it that made a case for the same
	- The article does not deny that C/C++ are better at making things faster, rather it argues that the disadvantages of a lack of maintainability makes writing in C/C++ less desirable if building, maintaining and publishing more features is important to you
	- The article also points out how some of the bigger bottle necks like network latency overshadow  latency due to execution time, these bottle necks are common no matter what language you use
	- Finally if there is a piece of java code you application spends 90% of it's time in it can be optimized, this isn't easy but it is doable to get similar performance to C/C++.

### Great Article On Java and Databases
- An article by [[Marco Behler (Programmer)]] on the various Libraries and APIs for working with DBs in Java: https://www.marcobehler.com/guides/java-databases


### Developing Java On The Command Line
https://youtu.be/BUMfwBEdsoA?si=n0xHHhw9tyhvUD6p
### Resources
https://github.com/qala-io/java-course
https://java-programming.mooc.fi/
