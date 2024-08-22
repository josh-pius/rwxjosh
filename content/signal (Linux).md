### General
- Signals in Linux are a form of inter-process communication that is used to notify a process that a particular event has occurred. 
- They are essentially messages that are sent to a process by the operating system, another process, or the process itself, to indicate that a specific event has occurred which usually requires some kind of action or response.
- There are various types of signals defined in Linux. Each signal has a name that begins with "SIG" and a corresponding integer value
	- Example: `SIGINT` , `SIGKILL`, `SIGTERM`, [[SIGSEGV (Linux Signal)]], `SIGHUP`
- Read more here `man 7 signal`


### Keystrokes For Common Signals
- For convenience, in most UNIX shells, certain keystroke combinations are configured to deliver a specific signal to the currently running process; for example, control-c sends a SIGINT (interrupt) to the process (normally terminating it) and control-z sends a SIGTSTP (stop) signal thus pausing the process in mid-execution (you can resume it later with a command, e.g., the [[fg (Linux Command)]] built-in command found in many shells)