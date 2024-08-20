### General
- The OS is a program like any other so when the OS lets another program to run on the CPU, the OS itself isn’t running anymore. How then does the OS control the running process as we’d expect
- One approach is for the process to be cooperative and yield control to the OS at sone interval, this can be explicitly does by the running process using a yield system call. But it can also happen implicitly when it process makes a needed system call which would give the OS control allowing the OS to decide whether it wants to let the process to continue or switch to another process
- What happens if the process is poorly designed or malicious and keeps running without yielding or making [[System Calls (Software)]]. 
- It can happen and [[Timer Interrupt (OS Concept)]] is how we can prevent it. 
- The timer is started at boot time and lets a process run for some amount of time before the interrupt fires and transfers control back to the OS