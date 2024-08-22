### General
- A trap table, specifically for [[System Calls (Software)]], is a table of function pointers that point to the system call handler routines.
- It is primarily used to handle system calls, which are software-triggered interrupts that transition the CPU from user mode to kernel mode to execute operating system functions.
- The [[Kernel Stack (OS Concept)]] sets up the trap table at boot time
- The trap tables must be set up by the OS at boot time, and make sure that they cannot be readily modified by user programs. All of this is part of the [[Limited Direct Execution (OS Concept)]] protocol which runs programs efficiently but without loss of OS control.