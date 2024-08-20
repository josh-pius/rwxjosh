### General
- The tee command, used with a pipe, **reads standard input, then writes the output of a program to standard output and simultaneously copies it into the specified file or files**. 
- Use the tee command to view your output immediately and at the same time, store it for future use.
- [[Fzf (CLI Utility)]] shows you output of ls but output is also stored in the file
```
ls | tee file.txt | fzf
```