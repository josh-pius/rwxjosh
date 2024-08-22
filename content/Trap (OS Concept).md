### General
- A trap changes the mode of an OS to a [[Kernel (OS Concept)]] routine. Here, the OS executes some actions and returns the control to the process it was executing before. 
- Moreover, the trap handler is synchronous. When the OS detects a trap, it pauses the user process. As soon as the [[System Calls (Software)| System call]] is completed, the OS resumes and continues the execution of the user processes (it’s possible that it switches to another process as well)
- Th trap instruction saves [[Register (Computer Hardware)]] state carefully,changes the hardware status to [[Kernel Mode (OS Concept)]], and jumps into the OS to a pre-specified destination: the [[Trap Table (OS Concept)]].
