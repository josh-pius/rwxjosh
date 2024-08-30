### General
- Had this as a subject in my first year at college
- I had done [[C++ (Programming Language)]] a superset language in school before this
- [[C (Programming Language)]] was created to help create [[UNIX (OS)]]/Linux
- [[Rwxrob (Youtuber)]] said that C will be inseparable tied with Unix/Linux as all [[System Calls (Software)]] use C

### History
- Developed by [[Dennis Ritchie (Programmer)]] in 1972 at [[Bell Labs (Research Company)]]

### Learning C
- There seem to be a lot of hardcore programmers who swear by C
- [[VoxelRifts (Youtuber)]] mentions how he become a more faster Java programmer by working in C for a couple of months. Check out his video "My 2 years of Learning C in 9 mins"
- **A Proper C Starting Point Codebase**: The same youtuber recommends writing your own base layer of functions that you need so that you don't have to use any libraries at all
	- A helpful Youtube channel that helps with that goal is [[Mr. 4th Programming (Youtuber)]]
	- [[VoxelRifts (Youtuber)]] has his codebase at https://github.com/PixelRifts/c-codebase

### Boolean Types
- `0` means false and non-zero means true
	- eg. 1 and -37 are true, 0 is false

### Beej's Guides
- I've used Beej's [[Beej's Guide to Network Programming (Book)]]
- He has tutorials for C as well which I think are worth using if I'm planning to learn it in more detail
	- https://beej.us/guide/bgc/
	- https://beej.us/guide/bgclr/


### Linux Daemon In C
- I think this video is helpful to learn C by just watching this guy write code
https://youtu.be/9nDYYc_7sKs?si=j5vyMBTYU-X6jQJp

### C Versions
- C has come a long way over the years, and it had many named version numbers to describe which dialect of the language you’re using.
- These generally refer to the year of the specification.
- The most famous are C89, C99, C11, and C2x. We’ll focus on the latter in this book.
 - C89 is called [[American National Standards Institute (ANSI)|ANSI]] C
### Preprocessor Directive
1. `#include` - Tells the C Preprocessor to pull the contents of another file and insert it into the code right _there_.
2. `#define`


### Comma Operator
- Here the former is one expression but the latter is two.
	- `x = 10, y = 20;` and `x = 10; y = 20;`
- This might seem trivial but matters since the comma expression gets used in things like the for loop
- `x=(1,2,3);` - Here x gets the value of the rightmost expression. So x is 3.
- One common place the comma operator is used is in `for` loops to do multiple things in each section of the statement `for (i = 0, j = 10; i < 100; i++, j++)`

### sizeof
[[sizeof (C Operator)]]

### Switch
- The `switch` command in C is far more restrictive than other languages.
- It works only with integer types
	- You can use it for character comparison because characters are secretly integers (ASCII)
	- You an also with it with [[enum (C)]]  because it an integer as well
- Etiquette of Fall Through: If you don't put a break it will fall through, ensure you add a command if fall-through is expected behavior

### Indirection Operator
[[Indirection Operator (C Programming)]]

### Address Operator 
[[Address Operator (&) (C Programming)]]

### Null Pointer
[[Null Pointer (C Programming)]]

### Null Character 
[[Null character (C Programming)]]


### Programming Philosophy In C
- By [[Eskil Steenberg (Programmer))]]
- [How I program C](https://youtu.be/443UNeGrFoM?si=ePz1PTfyFtz-i1_L)

### Rwxrob Resource
[[Head First C (Book)]]


### Crash Course By Mike Shah
https://www.youtube.com/playlist?list=PLvv0ScY6vfd8M-Mi_Vyrg7KgISTW3Sklt


### Programming C in VIM
https://nullprogram.com/blog/2022/06/26/#addendum-dont-exit-the-debugger
- This article talks about how to program C efficiently in [[VIM (Editor)]], leave [[GNU Debugger (gdb)]] running, use [[makefile (GNU Make)]] and vim's `:mak` command and 
