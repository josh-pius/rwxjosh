--- aliases:
  - Bash (Shell)
---

### General
- One of the best [[Shell Interactivity (Command Line)|Interactive Shells]] because of how powerful it it is but bemoans how gplv3 has caused it to get used less 

### Bash Shebang
- Regardless of what shell you're on (eg. zsh)
- You can ensure your script is run with bash by adding the [[Shebang (Unix)]] on the first line
``` 
#!/bin/bash
```

### Variables
- For user declared variables it's good practice to use lower case
- Assign value to variable
```
myname="Josh"
```
- Accessing variable
```
echo $myname
```

#### Default Variables
- There are default variables in the environment
- Usually a variable in all Caps is a system variable
- `$USER` is one of them that stores the user you're currently logged in as

### And, Ampersand and `&` in Linux
Source: https://www.linux.com/training-tutorials/and-ampersand-and-linux/
- `&` can be used to push a command to the background
- This can be useful for long running commands like copying files recursively so it doesn't tie your terminal up for hours `cp -R original/dir/ backup/dir/ &`
- Bash will still push print stdout even if it's in background

### Ampersands and File Descriptors in Bash
Source: https://www.linux.com/training-tutorials/ampersands-and-file-descriptors-bash/

### Math
- You can perform math using `expr` 
- Examples:
	- `expr 10 + 2`
	- `expr 10 + 2`
	- `expr 10 + 2`
	- `expr 10 \* 2` - For multiplication you need to escape the asterix

### Multi-Line 
- To span a bash command more than one line
```
command1 args1 args2 ......\
args10 args11 ..... \
args 20 .....
```

### Subshell
- [[Subshell (Bash)]]
- Commands within parentheses `(command1;command2;..)` run within subshell
- Running commands in a subshell like this example `files=$(ls)`, is a good way to assign a variable the output of a command

### Single and Double Quotes
- **Literal Strings**: Everything enclosed in single quotes is treated as a literal string. This means that special characters within the single quotes are not treated as such; they are just characters. This includes characters like `$` (used for variable expansion), backticks (used for command substitution), and `\` (used as an escape character).
- **Double Quotes**: Allows for variable expansion and command substitution eg. `$(date)`. Allows for escape characters. 

### For Loop
- For loops come in many flavors
	- Traditional For Loop
	- For-Each Loop
		- For each iterating over a list
		- For-Each using command output
		- For-Each iterating over an array
- For loops support nested loops
- Word Splitting
	- Bash splits the list in the for-each style loop based on the `IFS` (Internal Field Separator) variable. By default, `IFS` includes space, tab, and newline.
- Loop Control
	- `break` and `continue` can be used to break out or continue to next iteration respectively
- [[Globbing (Bash)]]
	- You can use glob patterns like `*.txt` to match filenames
```bash
for file in logfiles/*.log 
do
	tar -czvf  $file.tar.gz $file                                      
done
  ```
- You can use [[Brace Expansion (Bash)]] in for loops
```bash
for var in {1..99}
do
	command1
	command2
	command3
done
```
- C-like For Loop
```bash
for ((i=1; i<$numbers; i++))
do
	command1
	command2
done
```
- For each iterating over a list
```bash
for item in [list]
do
    # Commands using $item
done
```
- Another example of iterating over a list
```
for name in Alice Bob Charlie
do
    echo "Hello, $name"
done

```
- For-Each using command output
```bash
for file in $(ls)
do
    echo "File: $file"
done

```
- For-Each iterating over an array
```bash
arr=("apple" "banana" "cherry")
for fruit in "${arr[@]}"
do
    echo "Fruit: $fruit"
done

```

### Case Statements
- Basic syntax of case statement
	- **`pattern`**: A pattern against which `$variable` is matched. It can be a string, a number, a wildcard pattern, etc.
	- **`;;`**: This marks the end of the command list for a particular pattern.
	- **`*)`**: The default case (similar to `else` in an `if` statement). It's executed if none of the patterns match. This is optional.
	- **`esac`**: This ends the `case` statement (it's `case` spelled backward).
- Pattern Matching
	- Patterns are matched in the order they are defined.
	- You can use wildcards (like `*` and `?`) in patterns for glob-style pattern matching.
	- To match multiple patterns with the same set of commands, separate the patterns with `|`.
- No Default Break
	- Unlike some other languages, you don’t need a `break` statement to prevent the execution from falling through to the next case—this is automatically handled.
- Using Regular Expressions
	- `case` statements do not support regular expressions directly. They use glob-style pattern matching. For regex, you'd typically use `[[ $variable =~ regex ]]` within an `if` statement.
- **Using `;;&` and `;&`:*
	- Bash 4.0 introduced `;;&` to fall-through to the next pattern and `;&` to continue testing patterns after a match. These are less commonly used but offer more flexibility.
```bash
case $variable in
    pattern1|pattern2)
        # Commands for pattern1
        ;;
    pattern3)
        # Commands for pattern2
        ;;
    *)
        # Default case
        ;;
esac
```


### If Condition
- General syntax
```bash
if cond
then
	command1
elif cond2
then
	command2
else
	command3
fi
```
- The conditions which use the [[#Single Square Bracket]] in use the [[test (Linux Command)]] implicitly
	- You can run `man test` to view  more options
- You can create conditions using [[#Numeric Relational Operators]]; [[#String Relational Operators]] [[#Files Test Operators]] etc.
- Negating a condition: You can negate a condition by adding a `!` before it
	- `[ ! $mynum -eq 200 ]` - Evaluates to true only if it's not 200
	- `-ne` would be a better way to do this
- Useful conditions:
	- `-f` To check if a file exists
- A condition with `[]` 


#### Terse Alternative to If
- Saw [[Luke Smith (Youtuber)]] do this [here](https://youtu.be/p0KKBmfiVl0?si=MN96iOx0v23bZhCO)
- Which this is terse syntax, this does not work well if you're doing if-else, and isn't very readable, so restrict it's use to personal scripts
```bash
# Instead of
# if [ -z "$EDITOR" ]; then
#	 EDITOR=nano
# fi
[ -z "$EDITOR" ] && EDITOR=nano
```

### Single Square Bracket
- **`[]` (Single Square Brackets):**
- This is the traditional test command borrowed from the Unix shell, [[Bourne Shell (sh)|sh]].
- It is [[POSIX]]-compliant and will work in any [[Bourne Shell (sh)|Bourne]]-like shell.
- This syntax supports basic file and string tests, and it's essential to leave spaces around the brackets.
- For example: `[ -f /path/to/file ]` checks if a file exists.


### Double Square Bracket
Note: Had to escape the equal sign in backtick since dataview threw an error
- **`[[]]` (Double Square Brackets):**
- This is a more modern alternative introduced by the [[Korn shell (ksh)]] and adopted by Bash and other modern shells.
- It's not POSIX-compliant and will not work in all Unix shells.
- It provides more advanced features, like pattern matching with $==$ and `!=` inside the brackets.
- For example: `[[ -f /path/to/file ]]` is similar to the single-bracket version, but you can also do things like `[[ $variable \=\= z* ]]` to check if a variable starts with the letter "z".
- It's generally more forgiving about syntax. For instance, you don't need to quote variables inside double brackets to prevent word splitting.
- In summary `[]` is more portable across different shells, while `[[]]` provides more advanced features and a safer, more forgiving syntax but is specific to newer shells like Bash and Korn shell.

### Numeric Relational Operators
1. **-eq**: Equal to (`[ $a -eq $b ]` is true if `$a` is equal to `$b`).
2. **-ne**: Not equal to (`[ $a -ne $b ]` is true if `$a` is not equal to `$b`).
3. **-gt**: Greater than (`[ $a -gt $b ]` is true if `$a` is greater than `$b`).
4. **-ge**: Greater than or equal to (`[ $a -ge $b ]` is true if `$a` is greater than or equal to `$b`).
5. **-lt**: Less than (`[ $a -lt $b ]` is true if `$a` is less than `$b`).
6. **-le**: Less than or equal to (`[ $a -le $b ]` is true if `$a` is less than or equal to `$b`).

### String Relational Operators
1.  == / =   : Equal to (`[ "$a" = "$b" ]` is true if $a is the same as $b).
2. `!=`: Not equal to (1 is true if $a is not the same as $b).
3. `<`: Less than, in ASCII alphabetical order (`[[ "$a" < "$b" ]]` is true if $a comes before $b in the ASCII alphabet).
4. `>`: Greater than, in ASCII alphabetical order `([[ "$a" > "$b" ]]` is true if $a comes after $b in the ASCII alphabet). Note: For the < and > operators within `[[ ]]`, it's recommended to escape them as `\<` and `\>` or use them within quotes to avoid shell interpretation as redirections.
5. `-z`: String is null, that is, has zero length (`[ -z "$a" ]` is true if the length of string $a is zero).
6. `-n`: String is not null (`[ -n "$a" ]` is true if the string $a has a non-zero length).


### Files Test Operators
1. **-e**: Checks if a file exists. True if the file exists.
2. **-f**: Checks if the file exists and is a regular file (not a directory or device).
3. **-d**: Checks if the file exists and is a directory.
4. **-s**: Checks if the file exists and is not empty (has a size greater than zero).
5. **-L**: Checks if the file exists and is a symbolic link.
6. **-r**: Checks if the file exists and is readable by the current user.
7. **-w**: Checks if the file exists and is writable by the current user.
8. **-x**: Checks if the file exists and is executable by the current user.
9. **-b**: Checks if the file exists and is a block special file (like a physical device).
10. **-c**: Checks if the file exists and is a character special file (like a terminal or modem).
11. **-p**: Checks if the file exists and is a named pipe (FIFO).
12. **-S**: Checks if the file exists and is a socket.
13. **-G**: Checks if the file exists and is owned by the current user's group.
14. **-O**: Checks if the file exists and is owned by the current user.
15. **-h** or **-L**: Checks if the file exists and is a symbolic link.
16. **-u**: Checks if the file exists and has its set-user-id bit set.
17. **-g**: Checks if the file exists and has its set-group-id bit set.
18. **-k**: Checks if the file exists and has its sticky bit set.
19. **-t**: Checks if the file descriptor is open and refers to a terminal.

### Exit Codes
- The exit code for the previous command is stored in the `$?` variable
- `0` is considered **success** and any non-zero value is failure
- This is useful when we're writing scripts
- If you're writing a script and want it to return different exit codes for different scenarios you can use `exit <some-number>`
- The exit statement is also useful to exit a bash script
- If you're writing a script and there's an error condition due to which you need to exit with non-zero value, ensure the non-zero values differ for different error conditions so that later those exit codes can be used to take decisions on how to respond to those errors

### Comments
```
# this is a comment in bash
```


### While Loop
``` bash
while cond
do
	<some commands>
done


while [ condition ]; do commands; done
```

### Where to Store Your Scripts
Source: [[Learn Linux TV (Youtuber)]]
- As per [[Filesystem Hierarchy Standard (FHS)]] if you have a [[Bash (Programming Language)]] script that you execute often you should put it under `/usr/local/bin`
- This is a common place to put system-wide accessible user scripts. If you have scripts that you want to be accessible to all users and they are not part of the standard system software, `/usr/local/bin` is an appropriate directory. This directory is typically included in the user's `PATH`, so scripts here can be run from anywhere without specifying the full path.
```bash

# Moving script
sudo mv ./myscript.sh /usr/local/bin/myscript

# To prevent any other user overwriting script
chown root:root /usr/local/bin/myscript
```
- Based on what I'm seeing in [[Path (Linux)]] another location you can put commonly executed scripts in is `~/.local/bin`, this has the higest precedence in the path

### Data Streams
- There are three data streams in Linux systems: [[Stdin (Unix)]], [[Stdout (Unix)]] and [[Stderr (Unix)]]
- When you redirect output to a file from [[Stdout (Unix)]] using `>`, that's actually short hand for `1>` (see [[File Descriptors (Linux)]])
- `2>` is for standard error
- `&>` / `1> /dev/null 2>&1` is for both standard out and standard error, sometimes it's also written as 

### Read From Input Into Variable
```bash
read var
echo "The var is $var"
```

### Display Contents of Var
```bash
echo $var
```

### Functions
- One of the quirks of [[Bash (Programming Language)]] is that brackets (parentheses) are not required when calling functions
- Passing Values
	- The arguments passed in order are accessed using `$1`, `$2` etc
	- The number of arguments passed is accessed via the `$#` variable
	- `$@` and `$*` are used to reference all arguments passed to the function, with subtle differences in how they behave when quoted.
		- 
- Return values
	- A Bash function doesn't return values in the traditional programming sense. Instead, it returns an exit status (0 for success, non-zero for failure). Use `return` to exit a function with a specific status.
	- To "return" a value, you typically output it to `stdout` (e.g., using `echo`), and then capture it when calling the function (e.g., `result=$(my_function)`).
- Variable Scope
	- By default, variables in Bash are global. If you define a variable inside a function without declaring it as local, it's accessible outside the function.
	- To declare a local variable within a function, use the `local` keyword: `local my_var="value"`.
- Recursion
	- Functions in Bash can be recursive, but recursion is not commonly used due to stack size limitations and potential performance issues.
- Default Values
	- Bash doesn't support default argument values in the function definition. You can implement this manually inside the function.
- Function Overwriting
	- If you define a function with the same name more than once, the latter definition will overwrite the previous one.
- Returning String
	- To "return" a string from a function, you can `echo` the string and capture it using command substitution.
- Alternative syntax
	- Bash functions can also be defined with the `function`
```bash
#!/bin/bash

# Function definition
function greet() {
    local name=$1
    echo "Hello, $name!"
}

# Function definition overriding previous function
greet() {
    local name=$1
    echo "Hello, $name!"
}

# Calling the function
result=$(greet "Alice")
echo $result


```

### Best Practices for Scripts
- According to [[Learn Linux TV (Youtuber)]] For any script it's best practice to use fully qualified command names. 
	- Eg. Using `/usr/bin/echo` instead of just `echo`
	- You can use [[which (Linux Command)]] command to find fully qualified path
	- One reason for this is security, someone could create another malicious version of `echo` and that could be executed instead of the regular echo
	- the other reason is due to [[Path (Linux)]] variable. You might have echo in your PATH but the shell executing it might not, so to avoid any errors it's best to specify the full path
- If you're running a script and want to debug it by seeing the command which is running and it's argument printed then use `#!/usr/bin/bash -x` 

### Command Separator
- Semicolon allows putting more than one command on a line 
```bash
if [ -x "$filename"]; then
	echo "File $filename exists."; cp $filename $filename.bak
fi
```

### Arrays
`arr=()`	Create an empty array
`arr=(1 2 3)`	Initialize array
`${arr[2]}`	Retrieve third element
`${arr[@]}`	Retrieve all elements
`${!arr[@]}`	Retrieve array indices
`${#arr[@]}`	Calculate array size
`arr[0]=3`	Overwrite 1st element
`arr+=(4)`	Append value(s)
`str=$(ls)`	Save ls output as a string
`arr=( $(ls) )`	Save ls output as an array of files
`${arr[@]:s:n}`	Retrieve n elements starting at index s

### Printf
- Syntax: `printf [-v var] format [arguments]`
- The `-v` option tells `printf` not to print the output but to assign it to the variable

### Basic Calculator
Reference: https://www.geeksforgeeks.org/bc-command-linux-examples/
- Linux provides the expr and bc command to do arithmetic operations

```bash
# Example usages
echo "10^2" | bc

x=`echo "12+5" | bc`
echo $x

echo "var=10;var^=2;var" | bc
```

### Echo
- Use `-n` flag to prevent echo from adding new line

### Declare

- Creating an associative array called `a`
```bash
declare -A a
```

### Bash Koans
[[Bash Koans]]

### Explain Shell
- This website explains bash commands
- https://explainshell.com/


### Pushd/Popd/dirs
- If you're working in a directory and need to move to another directory you can use the `pushd` command to push the current directory into a stack, you can have multiple directories in that stack which can each be accessed via `pushd -0` (-0 for the first item in stack)
- You can see the stack using `dirs`
- Remove from stack using `popd`
- [[Pushd (Linux Command)]], [[Popd (Linux Command)]], [[Dirs (Linux Command)]]

### Job Control
- If you're in [[VIM (Editor)]] or another process you can "minimize" it using `Ctrl + Z`
- You can then see all such minimized processes using `bg`
- You can bring the process back using `fg` use the flag `-<number>` to bring back the process based on it's number into foreground

### PATH
- In you're config files if you're appending to the the PATH variable you using do it this way
```
PATH="${GRADLE_USER_HOME}/gradle-${GRADLE_VERSION}/bin:${PATH}";
```

### Resource Utilization  - btop/htop
- Both tools use to see the resource utilization of the PC
- `btop` might not be available since it's a [[C++ (Programming Language)]] project but an alternative `bashtop` would be available (both are the same but `btop` is faster)
- [[Htop (CLI Utility)]]


### Chaining Commands
- You can chain commands using `&&` and `||`
- If you want to execute a second command if the first succeeds use `&&`'
- If you want to execute a command if the first does not succeed use `||`


### Installing C++ Project
- There are a lot of [[C++ (Programming Language)]] projects that build a binary for Linux.
- Most of them you can quickly build from source by going its project folder and running
```
mkdir build && cd build && cmake .. && make && make install
```


### Minimize Shell/ Fg/ Bg
- If you're working in [[VIM (Editor)]] or another process you can quickly "minimize" the window using `Ctrl + Z`, it pushes that window to the background
- You can see all such background windows with `bg`
- You can bring the window you want forward using `fg` or if there is a specific process use the number `fg -3`  here the flag `-<number>` is used to bring back the process based on it's number into foreground
- [[fg (Linux Command)]], [[Bg (Linux Command)]]

### Execute Commands
```
source ~/.bashrc
```
- If you've made changes to a config file and don't want to restart you can explicitly runt the config file using above command

### Parameter Expansion
[[Parameter Expansion (Bash)]]

### Search Shell History
- You can do `Ctrl + r` in the shell to reverse search through the command history
- You can cycle to previous commands using `Ctrl + r` again and again
- Unfortunately it's only in one direction and you can cycle back to the next command. 
	- If you really need that there is a stack overflow answer out there with an alias you can use to achieve the same result

### View Realtime Updates To A File
- The follow option on [[tail (Linux Command)]]allows you to view real time changes to a file
```
tail -f /var/log/updater.log
```


### Set -o
[[Set (Bash Command)]]
- This command shows what is enabled in the shell
- For example it shows if the `vi` mode is enabled in the shell


### Minimal Bash Script Template
https://betterdev.blog/minimal-safe-bash-script-template/


### /etc/bash.bashrc
- System wide `.bashrc` file that runs for any user logging in


### Debugging Bash
- If you're running a script and want to debug it by seeing the command which is running and it's argument printed then use `#!/usr/bin/bash -x` 

### Decreased Usage
- [[Bash (Programming Language)]] once ubiquitous, is now  waning in popularity due to [[GNU General Public License (GPL)|GP3]]
- [[Z Shell (zsh)]] is now used on [[MacOS (Operating System)]]


### Scripting Best Practices
1. Don't make scripts depend on other scripts, it makes them less portable 
2. Put the entire script in a function that way it's easier to copy and modify
```
#!/bin/sh

greet () {
	date
	echo hello "$1"
}
greet "$@"
```
3. Prefer making small scripts their own files rather than put them in [[Bashrc (Config File)]]. The reason for this is portability. If you’re have to use [[Bourne Shell (sh)]] you can still call the stand alone scripts in the file but you can’t call bash specific functions or aliases defined in the [[Bashrc (Config File)]]

### Escape Character
- A non-quoted backslash `\` is the Bash escape character. It preserves the literal value of the next character that follows, with the exception of newline.
- **metacharacter**: A character that, when unquoted, separates words. A metacharacter is a space, tab, newline, or one of the following characters: `|`, `&`, `;`, `(`, `)`, `<`, or `>`.
- So if you're creating a new file with space say "new file.txt" you ca do `touch new\ file.txt` to ensure that it doesn't create two files, `new` and `file.txt`
- Characters like `;` can also be escaped. `echo apple;cherry`

### Quoting
Source: https://learnbyexample.github.io/cli-computing/shell-features.html

#### Single Quotes
- Enclosing characters in single quotes (`'`) preserves the literal value of each character within the quotes. A single quote may not occur between single quotes, even when preceded by a backslash.

#### Double Quotes
- Enclosing characters in double quotes (`"`) preserves the literal value of all characters within the quotes, with the exception of `$`, `` ` ``, `\`, and, when history expansion is enabled, `!`.

#### ANSI C Quoting
- **Words in the form "$'STRING'" are treated in a special way**. The word expands to a string, with backslash-escaped characters replaced as specified by the ANSI-C standard. Backslash escape sequences can be found in the Bash documentation.
- I accidently created a weird file with escape characters that I couldn't delete, I had to use this approach to be able to even [[cat (Linux Command)]] the file and then to delete it 
```
cat $'g\e\e"q'
```
- You can also use `echo -e` or `printf` to have escape characters printed

### Colors
- A useful script called `termcolors` in can print out a list of popular color ansi escape codes
- You can make a line a particular color using it
```
printf "${yellow} This line is yellow ${reset}\n"
```
- You can use the `colorstrip` script to see how many colors are supported in your terminal settings

### Globbing
[[Globbing (Bash)]]

### Wildcards
[[Globbing (Bash)#Wildcards]]

### Brace Expansion
[[Brace Expansion (Bash)]]


### History Expansion
[[history expansion (Bash)]]
- The feature that allows for `!!` among other things

