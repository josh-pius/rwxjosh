### General
- When a program requires a system resource, it sends a request for that resource to the kernel by making a system call.
- To specify the exact system call a system call number is usually assigned to each system call
	- This level of [[Indirection (Software Concept)]] serves as a means of protection. The user cannot specify an exact address to jump to but rather must request a particular service via number

### Types of System Calls
The system calls are divided into five categories:
1. Process management system calls
	1. [[fork (System Call)]]
	2. [[exec (System Call)]]
	3. [[wait (System Call)]]
	4. [[exit (System Call)]]
2. File management system calls
	1. [[open (System Call)]]
	2. [[read (System Call)]]
	3. [[write (System Call)]]
	5. [[close (System Call)]]
3. Device management system calls
	1. [[IOCTL (Unix)]]
	2. nmap
4. Network management system calls
	1. socket
	2. bind
	3. listen
	4. accept
	5. connect
	6. send
	7. recv
5. System information system calls
	1. getpid
	2. getppid
	3. getuid
	4. getgid
	5. uname
	6. sysinfo
	7. time

### List
1. [[fork (System Call)]]
2. [[exec (System Call)]]
3. [[wait (System Call)]]
4. [[open (System Call)]]
4. [[write (System Call)]]
4. [[close (System Call)]]