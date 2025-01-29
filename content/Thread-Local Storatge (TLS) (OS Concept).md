### General
- Thread-local storage (TLS) is a mechanism that allows data to be stored in a way that is specific to a single [[Thread (OS Concept)]]. 
- Each thread that accesses a thread-local variable has its own, independent copy of that variable. 
- This means that changes made to the variable by one thread are not visible to other threads, ensuring thread safety and avoiding unintended interactions between threads.