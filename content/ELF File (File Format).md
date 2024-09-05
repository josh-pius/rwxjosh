---
aliases:
  - ELF Binary (File Format)
---
al
### General
- ELF is short for Executable and Linkable Format. 
- **It’s a format used for storing binaries, libraries, and core dumps on disks in Linux and Unix-based systems.**
- Moreover, the ELF format is versatile. Its design allows it to be executed on various processor types. This is a significant reason why the format is common compared to other executable file formats
- Generally, we write most programs in high-level languages such as C or C++. These programs cannot be directly executed on the CPU because the CPU doesn’t understand these instructions. Instead, we use a compiler that compiles the high-level language into object code. Using a linker, we also link the object code with shared libraries to get a binary file.
- Once a ELF binary is created it's hard to tell the difference between a compiled piece of [[C (Programming Language)]] code and [[Go (Programming Language)|Golang (Programming Language)]] code (Source: [[Rwxrob (Youtuber)]])
	- Unless you're into forensics, then maybe you can 

### Examples
- Programs like [[ls (Linux Command)]] are [[ELF File (File Format)|ELF]] binaries

### Structure
- The ELF file is divided into two parts. 
- The first part is the ELF header, while the second is the file data.
- Further, the file data is made up of the Program header table, Section header table, and Data.
- The ELF header is always available in the ELF file, while the Section header table is important during link time to create an executable. On the other hand, the Program header table is useful during runtime to help load the executable into memory.

### ELF Header
- Found at the start of the file. Contains metadata about the file
	- For example, some of the metadata found in the ELF header includes information about whether the ELF file is 32-bit or 64-bit, whether it’s using little-endian or big-endian, the ELF version, and the architecture that the file requires.
	- In particular, the metadata in the ELF header helps different processor architectures to interpret the ELF file.
- You can use the `readelf -h` command to show the ELF header of a file (see [[readelf (Linux Command)]])
- More details about the ELF headers can be found in the source article

### Program Header Table
- The program header table stores information about segments. 
- Each segment is made up of one or more sections. 
- The kernel uses this information at run time. It tells the kernel how to create the process and map the segments into memory.
- To run a program, the kernel loads the ELF header and the program header table into memory. Secondly, it loads the contents that are specified in _LOAD_ in the program header table into memory, and it also checks if the interpreter is needed. Finally, the control is given to the executable itself or the interpreter if it’s available.
- We use the [[readelf (Linux Command)]] command with the -l option to display the program headers of an ELF file

### Section Header Table
- The section header stores information about sections. This information is used during dynamic link time, just before the program is executed.
- A linker links the binary file with shared libraries that it needs by loading them into memory. The linker’s implementation is specific to the operating system.
- We use the [[readelf (Linux Command)]] command with the -S option to display the information in the section header of a file
### Metadata
2023-12-25 18:46
- Came across this when I was looking into [[Shebang (Unix)]]
- I don't have a good understanding of most of this, need to dig in more 
### Sources
https://www.baeldung.com/linux/executable-and-linkable-format-file