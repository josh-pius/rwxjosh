### General
- By using _mktemp_, we can create unique temporary files. Also, **we can ensure that we will get the same functionality on different systems**. _mktemp_ will use the system-defined temporary directory
	- The temporary directory is usually `/tmp` in unix systems that follow [[Filesystem Hierarchy Standard (FHS)]]



### Examples
```
mktemp -d
```
- This creates a randomly named temporary directory, the directory inside which it creates can change based on system but usually `/tmp`, the created directory will look something like `/tmp/tmp.EP0cejIPBL`
- Used this in [[Over the Wire (CTF Site)]]