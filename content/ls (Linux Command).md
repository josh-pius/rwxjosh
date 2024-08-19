### General
- "List Directories" command

### Flags
- `-a`: All. Shows you hidden files as well
- `-l`: Long. Shows you detailed list of files in long format
- `-i`: Inode. Prints [[Inode (Linux)]] number of file as well
- `-R`: Recursively list directory content
- `-t`: Sort by modification time, newest first
- `-1` Return all the files in one column
- `-F` Appends a character to each filename indicating the type of file
	- `/` Directory
	- `*` Executable file
	- `@` Symbolic Link
	- etc
- `-h` To see files sizes in human readable format
- `-A` Exclude the `.` and `..` Files



### Hidden Directories
```
ls -a /
```