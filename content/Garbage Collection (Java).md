
### Types
- [[JVM (Java)]] has four types of _GC_ implementations:
	- Serial Garbage Collector
	- Parallel Garbage Collector
	- CMS Garbage Collector
	- [[G1  (Java Garbage Collector)]] Garbage Collector
- Further reading on the same: https://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/index.html

### JVM Parameters Controlling GC
[[JVM (Java)#Garbage Collector Algorithm Parameter]]
[[JVM (Java)#Garbage Collector Logging Parameter]]

### JVM Generations
- See [[JVM (Java)]]
- The [[Heap Memory (JVM)]] parts are: [[Young Generation (Java)]], [[Old Generation (Java)|Old or Tenured Generation]], and [[Metaspace (JVM)|PermGen (Formerly) (JVM)]]



### Get GC Stats
[[jstat (JDK Tool)#GC Statistics]]
- Field meanings

| **Column** | **Description**                      | **Interpretation**                                            |
| ---------- | ------------------------------------ | ------------------------------------------------------------- |
| `S0C`      | Survivor Space 0 Capacity (KB)       | Current size of **Survivor Space 0** in KB.                   |
| `S1C`      | Survivor Space 1 Capacity (KB)       | Current size of **Survivor Space 1** in KB.                   |
| `S0U`      | Survivor Space 0 Usage (KB)          | Memory used in **Survivor Space 0** in KB.                    |
| `S1U`      | Survivor Space 1 Usage (KB)          | Memory used in **Survivor Space 1** in KB.                    |
| `EC`       | Eden Space Capacity (KB)             | Current size of **Eden Space** in KB.                         |
| `EU`       | Eden Space Usage (KB)                | Memory used in **Eden Space** in KB.                          |
| `OC`       | Old Generation Capacity (KB)         | Current size of the **Old Generation** in KB.                 |
| `OU`       | Old Generation Usage (KB)            | Memory used in the **Old Generation** in KB.                  |
| `MC`       | Metaspace Capacity (KB)              | Capacity of the **Metaspace** in KB.                          |
| `MU`       | Metaspace Usage (KB)                 | Memory used in the **Metaspace** in KB.                       |
| `CCSC`     | Compressed Class Space Capacity (KB) | Capacity of the **Compressed Class Space** in KB.             |
| `CCSU`     | Compressed Class Space Usage (KB)    | Memory used in the **Compressed Class Space** in KB.          |
| `YGC`      | Young GC Count                       | Number of **Young Garbage Collections** since JVM startup.    |
| `YGCT`     | Young GC Time (sec)                  | Total time spent in **Young GC** since JVM startup (seconds). |
| `FGC`      | Full GC Count                        | Number of **Full Garbage Collections** since JVM startup.     |
| `FGCT`     | Full GC Time (sec)                   | Total time spent in **Full GC** since JVM startup (seconds).  |
| `GCT`      | Total GC Time (sec)                  | Total time spent in **all GC events** (seconds).              |


### Interpreting GC Stats
Source: [[ChatGPT]]
- Survivor Space Analysis:
	- S0C = 1024 KB, S1C = 1024 KB: The two Survivor spaces are equally sized.
	- S0U = 512 KB, S1U = 0 KB: Half of Survivor Space 0 is used, and Survivor Space 1 is empty.
	- Implication: Objects are being moved to the Old Generation or cleared.
- Eden Space Analysis:
	- EC = 2048 KB, EU = 1536 KB: 75% of Eden space is used.
	- Implication: When Eden is full, a Young GC will occur.
- Old Generation Analysis:
	- OC = 8192 KB, OU = 6144 KB: The Old Generation is using 75% of its allocated space.
	- If OU continues to grow, it indicates that objects are being promoted from Eden to Old Gen and not being garbage collected.
- [[Metaspace (JVM)]] Analysis:
	- MC = 1024 KB, MU = 512 KB: Metaspace is using 50% of its capacity.
	- If MU is consistently close to MC, consider increasing -XX:MaxMetaspaceSize.
- GC Analysis:
	- YGC = 12, YGCT = 0.345 sec: 12 Young GCs have occurred, taking a total of 0.345 seconds.
	- FGC = 1, FGCT = 0.075 sec: 1 Full GC has occurred, taking 0.075 seconds.
	- GCT = 0.420 sec: Total GC time across both Young and Full GCs.

