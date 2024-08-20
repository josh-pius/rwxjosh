### General
- In the simplest case **strace** runs the specified _command_ until it  exits.
- It intercepts and records the [[System Calls (Software)]] which are called by a process and the signals which are received by a  process.
- The name of each system all, its arguments and its return value are printed on standard error or to the file specified with the **-o** option.
- If you want to pipe output and you're not able to try  [[unbuffer (CLI Utility)]]


### Flags
- `-c`  Use this flag to just see a summary of the system calls including the time it took for each
- `-o <filename>` You can save output to file
	- Needed since you can't pipe the output


### Program Introspection
- Strace can be used to find what system calls a program makes
`strace <program>`

### Metadata
2024-07-30 08:57
- Saw the system calls made by a java program using [[strace (Linux Command)]] today
- I wanted to grep the output but it wasn't working, [[ChatGPT]] suggested using [[unbuffer (CLI Utility)]] and it worked

### Related
[[Ltrace (Linux Command)]]