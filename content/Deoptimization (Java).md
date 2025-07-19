### General
- Deoptimization in the [[JVM (Java)]] refers to the process by which the Java Virtual Machine (JVM) reverts optimized code back to a less optimized or interpreted form during execution

  

### Why does it happen?
The JVM uses a [[Just-In-Time Compilation (JIT)]] (JIT) compiler to optimize hot code paths at runtime. However, sometimes the assumptions the JIT made during optimization turn out to be invalid. When that happens, the JVM must “deoptimize” and fall back to a safe, less optimized execution path.

  
### Common reasons for deoptimization

1. Speculative optimizations fail  
    The JIT makes assumptions like:  
	- A method is always inlined because it only ever calls one implementation.
	- A type check always succeeds.  
    If these assumptions are later invalidated (e.g., a new class is loaded that overrides a method), the JVM must deoptimize.
2. Uncommon traps  
    The JVM inserts guards into optimized code to detect rare conditions (e.g., null checks or type mismatches). If one of these rare cases is encountered, it triggers deoptimization.
3. Code invalidation  
    Changes like dynamic class loading or class redefinition (e.g., via instrumentation or HotSwap) can force deoptimization of already compiled code.
4. Tiered compilation  
    The JVM might compile code with a lower-tier compiler (C1) first, and later deoptimize and recompile it with a more aggressive compiler (C2) based on more profiling data.

  

  

  

  

  

### What happens during deoptimization?

- The JVM stops executing the optimized code.
- It reconstructs the interpreter state from the current state of optimized machine code.
- Control is transferred back to the interpreter or a less optimized version of the method.

This process is non-trivial, especially because the JVM has to map machine-level registers and inlined frames back to the original Java stack frames.

  

  

  

  

### Why is deoptimization useful?

- It allows aggressive optimizations without risking correctness.
- It enables adaptive optimization, tuning performance based on runtime behavior.
- It supports dynamic features of Java like reflection and dynamic class loading.

  

### Tools to observe deoptimization
- Use the JVM flag:
```
-XX:+PrintDeoptimization
```