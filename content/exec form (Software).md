### General
- In tools like [[Kubernetes (Software)|k8s]] and [[Docker (Software)]]’s [[Dockerfile (Docker)]] you often need to specify which command to run during startup
- You can provide it in two forms [[shell form (Software)]] and [[exec form (Software)]]
	-  shell form—For example, `ENTRYPOINT node app.js`
	-  exec form—For example, `ENTRYPOINT ["node","app.js"]`
- Actually **The difference** is whether the specified command **is invoked inside a shell or not**. 

- [[exec form (Software)]]
	1. Bypass the shell (no sh -c).
	2. Call the command directly using the equivalent of execvp() under the hood.
	3. Launch your command as PID 1 — crucial for signal handling and container lifecycl
	4.  Uses square brackets and double-quoted strings (JSON array). 
	5. Runs the command directly (no shell).
	6. More robust and predictable in containerized environments.
	7. Preferred for most use cases.

- [[shell form (Software)]]
	- Pros:
		- Convenient for quick, simple commands.
		- Supports shell syntax: You can use pipes (|), redirection (>, >>), &&, environment variable expansion ($VAR), etc.
		- Familiar to anyone writing shell scripts.
	 - Cons:
		- Runs in a shell — meaning the actual process you’re launching is a child of /bin/sh, not PID 1.
		- Signal handling: Docker sends signals (like SIGTERM) to PID 1. If your process is not PID 1 (e.g., it’s a child of the shell), it may not receive the signals properly.
		- Harder to override with docker run unless designed carefully.
		- Unexpected behavior: Shell quoting/escaping can trip you up, especially with complex arguments.