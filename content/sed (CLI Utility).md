### General
- The command name sed is derived from stream editor. Here, stream refers to data being passed via shell pipes. Thus, the command's primary functionality is to act as a text editor for stdin data with stdout as the output target. It is now common to use sed on file inputs as well as in-place file editing.
- Sed has various commands, **substitute** command is the most commonly used operation
- [[sed (CLI Utility)]] is [[Turing Completeness (Computer Science)|turing complete]] ([proof](https://catonmat.net/proof-that-sed-is-turing-complete))

### Sed vs Ex Commands
https://superuser.com/questions/1244960/are-ex-vim-ex-mode-and-sed-categorically-different-utilities-or-two-different-pr#:~:text=One%20major%20difference%20between%20ex,outputs%20it%20on%20the%20go.

### Idiomatic Delimiter
- The character that follows the `s` is the delimiter
	- The standard is `/` but you can use anything
	- History on why `/` is the standard: https://old.reddit.com/r/commandline/comments/3lhgwh/why_did_people_standardize_on_using_forward/cvgie7j/
- Alternative delimiter might be useful if you need to replace an actual `/`  and hate escaping
- For [[#Print Command|printing]] things are different, the first delimiter needs to be escaped
```bash
# here ; is used as the delimiter
$ printf '/home/joe/1\n/home/john/1\n' | sed -n '\;/home/joe/;p'
/home/joe/1
```

### -f Flag: Accept Input File/Stdin
1. `-f script-file` - Add the contents of the script file to the command to be executed
	1. Use `-f-` to get input from [[Stdin (Unix)]]
2. A useful example of this that I've seen is
	1. `sed 's|(.+) (.+)|s/\1/\2/g' replacement.txt | sed -f- file.txt`
	2. The sed is used to generate sed commands  from a file and those commands are passed in via [[Stdin (Unix)]] to sed again to be executed on a another file

### -E Flag
2. `-E` Enables [[Extended Regular Expression (ERE)]]
	1. Older versions of sed use `-r`

### Regex
 ![[Regex (Sed)]]
### Multiple Expressions
- Multiple substitutions can be done using the `-e` flag
	- `sed -E -e 's/ //g' -e 's/IN/& '`
	- `&` means the entire match
- It can also be done by separating commands using `;` like this 
	- `sed -E 's/ //g; s/IN/&/' test.txt`


### Multiple Files
- `-s` option is used to treat each file passed to it as separate individual streams rather than concatenating them into one stream
```
# without -s, there is only one first line for the concatenated contents
# the F command inserts filename of the current file at the given address
$ sed '1F' greeting.txt ip.txt
greeting.txt
Hi there
Have a nice day
    * sky
    * apple

# with -s, each file has its own address
# this is like the 'cat' command but including the filename as the header
$ sed -s '1F' greeting.txt ip.txt
greeting.txt
Hi there
Have a nice day
ip.txt
    * sky
    * apple

```

### Mapping
- When you need to map one or more characters with another set of corresponding characters you can use the `y` command
- `y/src/dst/` Transliterates any character in the pattern space which matches any of the source characters with the corresponding characters in the dest-chars
- Example to make all vowels uppercase
	- `sed 'y/aeiou/AEIOU/' file`


### In-Place File Editing
- WARNING: Be very careful when editing in-place, and use the backup option to be safe
- `-i` is used to update the file in place
- `-i.<prefix>` is used to create a backup
	- Eg. `-i.orig` applied to a file named `ip.txt` will create a backup file called `ip.txt.orig`
- Multiple files can be edited in place
	- `sed -i.bkp 's/bad/good/' f1.txt f2.txt`
- Prefix backup name
	- Using the `*` character in the argument to `-i` will ensure that `*` gets replaced with the input filename
	- `sed -i'bkp.*' 's/green/yellow' colors.txt`
	- This can be used to place backups in a different directory
		- `sed -i'backups/*' 's/good/nice' f1.txt f2.txt`


### Selective Filtering
- REGEX Filtering
	- A `/REGEX/FLAGS` portion can be used as a conditional expression to allow commands to execute only for lines that match a mattern
	- Eg. `sed '/2/ s/,/-/g` - Only substitute comma with hyphen if the line contains 2
- If you want to act on lines not matched
	- eg `sed '/2/! s/,/-/g'`
- The feature of sed is what I need to be more aware about, I'm sure I've had the need for just this but hacked my way though some other less good solution
- If the second filter condition doesn't match it will print from first condition to the last line


### Delete Command
- Use the `d` command to delete filtered lines
	- eg. `print f 'sea\neat\ndrop\n' | sed '/at/d'`, will print only sea and drop
- Negative filter
	- `print f 'sea\neat\ndrop\n' | sed '/at/!d'` will print only eat
	- Using an address is optional
		- `sed '!d' file` would be equivalent to [[cat (Linux Command)|cat]] file

### Print Command
- To print filtered lines use the `p` command. By default all lines are printed so this command only makes sense with `-n` which turns off default printing
- `sed -n '/warm/p' rhymes.txt`
- When provided as a flag to a substitute command it prints the line only is substitution succeeds
- Filter + substitution + print
	- `sed -n '/the/ s/ark/ARK/gp' rhymes.txt` 
- Using `!p` with `-n` is equivalent to using `d` command


### Quit Command
- `q` command causes sed to exit immediately. Remaining commands and input lines will not be processed
- `sed '/say/q' rhymes.txt` - Quits after an input line containing 'say' is found
- Command `Q` is similar but won't print the matching line
- If you want to read lines from the bottom and then stop when it hits pattern you can use this combination
	- `tac rhymes.txt | sed '/an/q' | tac`
- Exit status
	- You can optionally provide an exit status (0 to 255 ) along with the quit command
	- `printf 'sea\n\eat\ndrop\n' | sed '/at/q2'`. If you do `echo $?` you'll get 2

### Print File Name Command
- The `F` command prints the file name
```bash
sed -s '1F' greetings.txt
```

### Multiple Commands
- Commands can be specified more than once by separating them using `;` or using the `-e` option
- Eg.
	- Print all input lines as well as modified lines:
	- `sed -n -e 'p' -e 's/at/AT/p'`
	- `sed -n 'p; s/at/AT/p'`
- If you want to execute multiple commands for a common filter use `{}` to group the commands, you can also nest these
	- `sed '/e/{s/s/*/g; s/t/*/g}'`
	- `sed -n '/the/{s/for/FOR/gp; /play/{p; s/park/PARK/gp}} rhymes.txt`
- Command grouping is an easy way to construct conditional AND of multiple search strings.
	- `sed -n '/ark/{/play/p}'` same as [[grep (CLI Utility)|grep]] 'ark' rhymes.txt | grep 'play'
	- `sed -n '/the/{/for/{/urn/p}}' rhymes.txt` Same as grep 'the' rhymes.txt | grep 'for' | grep 'urn'
	  `sed -n '/for/{/sky/!p}' rhymes.txt` - Same as `grep 'for' rhymes.txt | grep -v 'sky'`
	- Grouping is a way to construct conditional AND of multiple search strings
- Warning: Don't use [[#Multiple Commands]] to construct conditional OR, it can duplicate output, use [alternation](https://learnbyexample.github.io/learn_gnused/breere-regular-expressions.html#alternation) instead
```bash
$ sed -ne '/play/p' -e '/ark/p' rhymes.txt
go play in the park
go play in the park
come back before the sky turns dark
```


### Print only Filtered Lines
- Use the `p` command
	- Eg. `sed -n '/warm/p' rhymes.txt` 

### Line Addressing
- This is familiar to me from [[VIM (Editor)]]
- Line numbers can be used as filtering criteria
```bash
# here, 3 represents the address for the print command
# same as: head -n3 rhymes.txt | tail -n1
# same as: sed '3!d'
$ sed -n '3p' rhymes.txt
go play in the park
```
- `$` Indicates the last line of the input
	- `sed -n '$p' rhymes.txt` - Print last line
- For large files use [[#Quit Command|q]] to avoid  processing unnecessary input lines
```bash
$ seq 3542 4623452 | sed -n '2452{p; q}'
5993
$ seq 3542 4623452 | sed -n '250p; 2452{p; q}'
3791
5993

# here is a sample time comparison
$ time seq 3542 4623452 | sed -n '2452{p; q}' > f1
real    0m0.005s
$ time seq 3542 4623452 | sed -n '2452p' > f2
real    0m0.121s
$ rm f1 f2
```
- Replicate functionality of [[head (Linux Command)]]
``` bash
# same as: seq 23 45 | head -n5
$ seq 23 45 | sed '5q'
23
24
25
26
27
```
- Regex and line numbers can be mixed
	- `sed '6,/utter/p' rhymes.txt`
- Special Case: First address can be 0 is the second is a regex. This is useful to match against the first line of the file
	- `$ sed -n '0,/cozy/p' rhymes.txt`

### (=) Command
- The = command will display line numbers of matching lines
```bash
# gives both the line number and matching lines
$ grep -n 'the' rhymes.txt
3:go play in the park
4:come back before the sky turns dark
9:Try them all before you perish

# gives only the line number of matching lines
# note the use of the -n option to avoid default printing
$ sed -n '/the/=' rhymes.txt
3
4
9
```
- The match can also be printed alongside it
```bash
$ sed -n '/what/{=; p}' rhymes.txt
2
listen to what I say

$ sed -n '/what/{p; =}' rhymes.txt
listen to what I say
2
```

### Relative Addressing
- The [[grep (CLI Utility)]] command has an option `-A` that allows you to view lines that come _after_ the matching lines
-  The `sed` command provides a similar feature when you prefix a `+` character to the number used in the second address
```bash
# match a line containing 'the' and display the next line as well
# won't be same as: grep -A1 --no-group-separator 'the'
$ sed -n '/the/,+1p' rhymes.txt

# the first address can be a line number too
# helpful when it is programmatically constructed in a script
$ sed -n '6,+2p' rhymes.txt
```


### Arithmetic Progression
- [[Arithmetic Progression (Mathematics)]]
- You can construct an arithmetic progression with start and step values separated by the `~` symbol. `i~j` will filter lines numbered `i+0j`, `i+1j`, `i+2j`, `i+3j`, etc. So, `1~2` means all odd numbered lines and 5~3 means 5th, 8th, 11th, etc. 
```bash
# print even numbered lines 
$ seq 10 | sed -n '2~2p'

# delete lines numbered 2+0*4, 2+1*4, 2+2*4, etc (2, 6, 10, etc) $ seq 7 | sed '2~4d'
```


### Multiple Of
- If `i,~j` is used (note the `,`) the closest line number which is a multiple of `j` will mark the end address
```bash
# here, closest multiple of 4 is the 4th line
$ seq 10 | sed -n '2,~4p'
```


### Internals
[[Internals (Sed)]]
### n and N Commands
- There are cases when you want a command to handle a string that contains multiple lines. The address range option gives you the ability to act upon a group of lines
	- It is recommended to use [[awk (CLI Utility)]] and [[Perl (Programming Language)]] for such scenarios
- The [[Internals (Sed)|Pattern Space (Sed)]] generally contains only a single line of input, at least in the examples so far. By using `n` and `N` you can change the contents of the [[Internals (Sed)|Pattern Space (Sed)]] and use commands upon entire contents of this buffer
- `n` when auto-print is disabled that is (`-n`) flag is applied, replaces the [[Internals (Sed)|Pattern Space (Sed)]] with the next line of input, 
	- Basically instead of applying the pattern on the line that matched, you can apply the pattern on the line after that
```bash
# if a line contains 't', replace pattern space with the next line
# substitute all 't' with 'TTT' for the new line thus fetched
# note that 't' wasn't substituted in the line that got replaced
# replaced pattern space gets printed as -n option is NOT used here
$ printf 'gates\nnot\nused\n' | sed '/t/{n; s/t/TTT/g}'
gates
noTTT
used
```
- `N` Add a newline to the pattern space, then append the next line of input to the pattern space.
```bash
# append the next line to the pattern space
# and then replace newline character with colon character
$ seq 7 | sed 'N; s/\n/:/'
1:2
3:4
5:6
7
```
- `sed 'N; $!N; y/\n/-/' file` - Really powerful command to join groups of kj3 lines at a time
	- `N` : This command appends the next line of input to the pattern space. Essentially, it reads two lines at a time instead of one.
	- `$!N` for all lines except the last one, append the next line to the [[Internals (Sed)|Pattern Space (Sed)]]

### Case Insensitive Matching
- `I` flags allows to match pattern case insensitively
```bash
# match 'cat' case insensitively and replace it with 'dog' 
$ printf 'Cat\ncOnCaT\nscatter\ncot\n' | sed 's/cat/dog/I'
```
 - When in other command like [[grep (CLI Utility)]] the small `i` is used, here in sed we use the capital `I` because `i` is used for a different purpose

### Changing Case in the Replacement Section
| Sequence | Description                                                            |
| -------- | ---------------------------------------------------------------------- |
| \E       | indicates the end of case conversion                                   |
| \l       | convert the next character to lowercase                                |
| \u       | convert the next character to uppercase                                |
| \L       | convert the following characters to lowercase (overridden by \U or \E) |
| \U       | convert the following characters to uppercase (overridden by \L or \E) |
- Changing case of only a single character
```bash
# match only the first character of a word
# use & to backreference the matched character
# \u would then change it to uppercase
$ echo 'hello there. how are you?' | sed 's/\b\w/\u&/g'
Hello There. How Are You?

# change the first character of a word to lowercase
$ echo 'HELLO THERE. HOW ARE YOU?' | sed 's/\b\w/\l&/g'
hELLO tHERE. hOW aRE yOU?

# match lowercase followed by underscore followed by lowercase
# delete the underscore and convert the 2nd lowercase to uppercase
$ echo '_fig aug_price next_line' | sed -E 's/([a-z])_([a-z])/\1\u\2/g'
_fig augPrice nextLine
```
- Changing case of multiple characters at a time
```bash
# change all alphabets to lowercase 
$ echo 'HaVE a nICe dAy' | sed 's/.*/\L&/' have a nice day 
# change all alphabets to uppercase 
$ echo 'HaVE a nICe dAy' | sed 's/.*/\U&/' HAVE A NICE DAY 
# \E will stop further conversion 
$ echo 'fig_ aug_price next_line' | sed -E 's/([a-z]+)(_[a-z]+)/\U\1\E\2/g' fig_ AUG_price NEXT_line 
# \L or \U will override any existing conversion 
$ echo 'HeLLo:bYe gOoD:beTTEr' | sed -E 's/([a-z]+)(:[a-z]+)/\L\1\U\2/Ig' hello:BYE good:BETTER
# uppercase first character of a word 
# and lowercase rest of the word characters 
# note the order of escapes used, \u\L won't work 
$ echo 'HeLLo:bYe gOoD:beTTEr' | sed -E 's/[a-z]+/\L\u&/Ig' Hello:Bye Good:Better 
# lowercase first character of a word 
# and uppercase rest of the word characters 
$ echo 'HeLLo:bYe gOoD:beTTEr' | sed -E 's/[a-z]+/\U\l&/Ig' hELLO:bYE gOOD:bETTER
```

### Global Replace
- By default, the substitute command will replace only the first occurrence of matching portions. Use the `g` flag to replace all the matches.


### Change only The Nth Occurrence
- Change only the 3rd occurance
```bash
echo "qqqq" > file
sed 's/q/Q/3' file
# give you qqQq
```
- If you want to change only from the nth to last occurrence you can do this. For example when n=3
```bash
sed 's/an/in/2g' text.txt
```
- If you want to match the the last but Nth occurance of `,`
```bash
# generic version, where {N} refers to last but N
$ echo "$s" | sed -E 's/(.*),((.*,){3})/\1[]\2/'
car,art,pot[]tap,urn,ray,ear
```

### Print Flag
- Already see here [[#Print Command]]

### Write to File
- The `w` flag helps to redirect contents to a specified filename. 
- This flag applies to both the filtering and substitution commands. 
- You might wonder why not simply use shell redirection? As `sed` allows multiple commands, the `w` flag can be used selectively, allow writes to multiple files and so on.
```bash
# do not use -n if output should be displayed as well as written to a file 
$ printf '1,2,3,4\na,b,c,d\n' | sed 's/,/:/gw cols.txt' 1:2:3:4 a:b:c:d 
$ cat cols.txt 1:2:3:4 a:b:c:d
```
- For multiple output files, use `-e` to separate the commands. Don't use `;` between the commands as it will be interpreted as part of the filename!
```
$ seq 20 | sed -n -e 's/5/five/w 5.txt' -e 's/7/seven/w 7.txt' 
$ cat 5.txt five 1five 
$ cat 7.txt seven 1seven
```

| Command      | Meaning                                                    | Scope                                    |
| ------------ | ---------------------------------------------------------- | ---------------------------------------- |
| `w filename` | **Write the entire current pattern space** to a file       | Always (if line matches or is reached)   |
| `W filename` | **Write only the part of the line matched by the pattern** | Only works inside a `s///W` substitution |

### Executing External Commands
- The `e` flag helps you to use the output of a shell command. The external command can be based on the pattern space contents or provided as an argument.
- Note: The substitution is first applied and the the result is executed
```bash
# replace entire line with the output of a shell command
$ printf 'Date:\nreplace this line\n' | sed 's/^replace.*/date/e'
Date:
Monday 29 May 2023 04:09:24 PM IST
```

```
$ echo "1 5 10" | sed -E 's/^([0-9]) ([0-9]).*/seq \1 \2/e'
1
2
3
4
5

```

- When `p` flag is used order is important, you mostly want to order it `ep` 
 - Here's an example where the command is provided as an argument. In such cases, the command's output is inserted before the matching line.
```bash
$ printf 'show\nexample\n' | sed '/am/e seq 2' 
show 
1 
2 
example
```


### Multiline Mode
- I think the point of this flag is to be able to operate as if on dealing with different lines even when the lines are joined together with `N` command
- The `m` (or `M`) flag will change the behavior of `^`, `$` and `.` metacharacters.
	- Note: `m` and `M` behave the same there is no difference
- This comes into play only if there are multiple lines in the pattern space to operate with, for example when the `N` command is used.
- When the `m` flag is used the [[Dot (Regex Metacharacter)]] metacharacter will not match the newline character
	- I you still want to match across lines you can use `(\s|\S)*`
```bash
# without 'm' flag . will match the newline character
$ printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/H.*e/X/'
X Day

# with 'm' flag . will not match across lines
$ printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/H.*e/X/gm'
X
X Day

```
- The `^` and `$` anchors will match every line's start and end locations when the `m` flag is used.
- The `` \` `` and `\'` anchors will always match the start and end of the entire string, irrespective of single or multiline mode.
	- These are similar to`\A` and `\Z` anchors found in other regex flavors
- If you want to match across lines


### Variable Substitution
- When you put the command in double quotes you can have shell variables in the command
```bash
$ start=6; step=1
$ sed -n "${start},+${step}p" rhymes.txt
There are so many delights to cherish
Apple, Banana and Cherry
```
- However it can be risky to put the entire command in double quotes if the shell variable not just numbers, in this case it's safer to put just the part you want substituted in double quotes
- Simply putting string with single and double quotes next to each other concatenates them
```bash
# ! is special within double quotes
# !d got expanded to 'date -Is' from my history and hence the error
$ word='at'
$ printf 'sea\neat\ndrop\n' | sed "/${word}/!d"
printf 'sea\neat\ndrop\n' | sed "/${word}/date -Is"
sed: -e expression #1, char 6: extra characters after command

# use double quotes only for the variable substitution
# and single quotes for everything else
# the command is concatenation of '/' and "${word}" and '/!d'
$ printf 'sea\neat\ndrop\n' | sed '/'"${word}"'/!d'
eat

```
- In some cases preprocessing of input maybe needed before it can be used, selection of delimited matters as well
```bash
# error because '/' inside HOME value conflicts with '/' as the delimiter
$ echo 'home path is:' | sed 's/$/ '"${HOME}"'/'
sed: -e expression #1, char 7: unknown option to `s'
# using a different delimiter will help in this particular case
$ echo 'home path is:' | sed 's|$| '"${HOME}"'|'
home path is: /home/learnbyexample

# but you may not have the luxury of choosing a delimiter
# in such cases, escape all delimiter characters before variable substitution
$ home=${HOME//\//\\/}
$ echo 'home path is:' | sed 's/$/ '"${home}"'/'
home path is: /home/learnbyexample

```
- If you're getting the input from an external input there are security consideration that need to be made [see](https://unix.stackexchange.com/q/297122/109046)

### Escaping Metacharacters
- For example if you want to substitute with a literal `&` you need to escape it so that sed does to interpret as the backreference for entire matched string
```bash
# escape all occurrences of & to insert it literally
$ c1=${c//&/\\&}
$ echo 'a and b and c' | sed 's/and/['"${c1}"']/g'
a [&] b [&] c
```

### Command Substitution
- Using output of shell commands as part of `sed`
```bash
# note that the trailing newline character of the command output gets stripped
$ echo 'today is date.' | sed 's/date/'"$(date -I)"'/'
today is 2023-05-30.
```

### `-z` Command Line Option
- The `-z` option causes lines to be separated based on the ASCII [[NUL (ASCII Character)|NUL]] character instead of the newline character.
- Handy when processing input separated by [[NUL (ASCII Character)|NUL (ASCII Character)]] characters
- See [[NUL (ASCII Character)#Benefits of NUL]]
- Even if the input does not have a NUL character `-z` is useful if you want to process all the input as one line
	- There is an exercise in [[sedexercises (TUI Exercise)]] that can be solved with this approach
- Note: [[#Handling NUL]]

### `-s` Command Line Option
- [[#Multiple Files]]
- Using `-s` will cause [[sed (CLI Utility)]] to treat multiple files separately instead of treating them as single concatenated input. This is useful if you want line number addressing to be effective for each input file. When `-i` option is active `-s` is implied
```bash
# with -s, each file has its own address
# F command inserts filename of the current file at the given address
$ sed -s '1F' greeting.txt ip.txt
greeting.txt
Hi there
Have a nice day
ip.txt
    * sky
    * apple
```


### Files as a source of sed commands
- You can use `-f` to pass the file with commands
	- There are many benefits, like you can use single-quotes directly, won't clash with shell metacharacter
- You can add a [[Shebang (Unix)]] to be able to use the script like a commands
```
#!/usr/local/bin/sed -f
...

# ./executable.sed sample.txt
```
- not all options will work with [[Shebang (Unix)]] [see](https://stackoverflow.com/questions/4303128/how-to-use-multiple-arguments-for-awk-with-a-shebang-i-e)
### Comments
- When you run sed commands from a file you can use `#` to specify comments


### Append, Change and Insert
- Convenience commands
- These could be handled by the substitute command but more easy done with these
	- `a` appends the given string after the end of line for each matching address
	- `c` changes the entire matching address contents to the given string
	- `i` inserts the given string before the start of the line for each matching address
- For each command the string value is supplied after the command letter, any whitespace between the letter and string value are ignored
```bash
# same as: sed '2 s/$/\nhello/'
$ seq 3 | sed '2a hello'
1
2
hello
3

# same as: sed '/[24]/ s/.*/hello/'
$ seq 5 | sed '/[24]/c hello'
1
hello
3
hello
5

# same as: sed '2 s/^/hello\n/'
$ seq 3 | sed '2i hello'
1
hello
2
3
```
- When using multiple commands along with these things might get challenging as it will consider `;` `#` and even `{` to be part of the string
- So if you need to use multiple commands separate with a new line or `-e`

### Adding Content From Files
- [[Sundeep Agarwal (Learn By Example)(Programmer)]] goes into how to append, change and insert from a file
- The `r` and `R` commands use file content as the source string, which is always treated literally and can contain newline characters. 
- Thus, these two commands provide a robust way to add text literally. 
- However, these commands provide only the append functionality. 
- Other sed features will be used to construct change and insert variations.
- The `r` command accepts a file name argument and the entire content of the given file is added after each of the matching lines

```bash
$ cat ip.txt
    * sky
    * apple
$ cat fav_color.txt
deep red
yellow
reddish
brown

# space between r and filename is optional
# add entire content of 'ip.txt' after each line containing 'red'
$ sed '/red/r ip.txt' fav_color.txt
deep red
    * sky
    * apple
yellow
reddish
    * sky
    * apple
brown

```
- To use a command output as the input file source, you can use `/dev/stdin` as the filename. However, once the content of `/dev/stdin` is exhausted, you won't get any more data. So, using `/dev/stdin` is not always functionally equivalent to providing a filename. 
- You can use 0 as the address to insert file contents before the first line
- To emulate the **change** command's functionality there's no easy way but to delete the line already present in the location
```bash
# replace only the 2nd line
# order is important, first 'r' and then 'd'
# note the use of command grouping to avoid repeating the address
$ items='    * blue\n    * green\n'
$ printf '%b' "$items" | sed -e '2 {r /dev/stdin' -e 'd}' ip.txt
    * sky
    * blue
    * green
```
- If you want to **insert** the easiest way is to use the `e` command, these external commands get inserted first
```bash
$ sed '/red/e cat ip.txt' fav_color.txt
    * sky
    * apple
deep red
yellow
    * sky
    * apple
reddish
brown

```
Note: Inserting before the line with with `r` is challenging since `r` executes at the end of the cycle. If you want to insert use `/REGEX/e cat <file>` instead

### Append Line by Line Using R
- The `R` command is very similar to the `r` command. But instead of reading the entire file content, `R` will read one line at a time from the source file when the address matches. If the entire file has already been consumed and another match is found, `sed` will proceed as if the next line to read was empty.
```bash
$ sed '/red/R ip.txt' fav_color.txt
deep red
    * sky
yellow
reddish
    * apple
brown

# interleave contents of two files
$ seq 4 | sed 'R /dev/stdin' fav_color.txt
deep red
1
yellow
2
reddish
3
brown
4
```


### Branch Commands
- Labels are specified by prefixing a command with `:label` where `label`  is the name given to be referenced elsewhere

| Command   | Description                                                               |
| --------- | ------------------------------------------------------------------------- |
| `b label` | unconditionally branch to the specified label                             |
| `b`       | Skip rest of commands and start next cycle                                |
| `t label` | branch to the specified label on successful substitution                  |
| `t`       | on successful substitution, skip rest of the commands and start new cycle |
| `T label` | branch to specified label if substitution fails                           |
| `T`       | If substution fails, skip rest of the commands and start the next cycle   |
- Note that for the t command, any successful substitution since the last input line was read or a conditional branch will count. 
	- So, you could have few failed substitutions and a single successful substitution in any order and the branch will be taken. 
	- Similarly, the T command will branch only if there has been no successful substitution since the last input line was read or a conditional branch.

### if-then-else
- Refer [[#Branch Commands]]
- A example  when you might need branch is a file with a column of integers where you need to change positive numbers to negative and negative to position (remove `-`)
- The branching commands previously discussed would help you set up a kind of if-else logic
- In the below example the if condition is `/^-/`, when satisfied it will hit `b` which skips the else condition, but if the condition is not met then it will only execute the else condition, you can set this up to be a if-else_if-else as well

```bash
# empty REGEXP section will reuse last REGEXP match, in this case /^-/
# also note the use of ; after {} command grouping
# 2nd substitute command will execute only if a line doesn't start with -
$ sed '/^-/{s///; b}; s/^/-/' nums.txt
-3.14
20000
51
-4567
```
- Good example of `T`
```bash
# 2nd substitution will work only if the 1st one succeeds
# same as: sed '/o/{s//-/g; s/d/*/g}'
$ printf 'good\nbad\n' | sed 's/o/-/g; T; s/d/*/g'
g--*
bad

# append will work if any of the substitution succeeds
$ printf 'fig\ngood\nbad\nspeed\n' | sed 's/o/-/g; s/a/%/g; T; a ----'
fig
g--d
----
b%d
----
speed
```


### Loops
- Refer [[#Branch Commands]]
- When branching commands are used without label arguments, `sed` will skip rest of the script and starts processing the next line from input. By marking a command location with a label, you can branch to that particular location when required.
- In such cases, `sed` is still processing the current pattern space.
```bash
# The below example replaces all consecutive digit characters from the start of line with * characters. 
#:a labels the substitute command as a and ta would branch to this label if the substitute command succeeds. 
# Effectively, you get a looping mechanism to replace the current line as long as the substitute condition is satisfied.

# same as: perl -pe 's/\G\d/*/g'
# first, * is matched 0 times followed by the digit 1
# next, * is matched 1 times followed by the digit 2
# then, * is matched 2 times followed by the digit 3
# and so on until the space character breaks the loop
$ echo '12345 hello42' | sed -E ':a s/^(\**)[0-9]/\1*/; ta'
***** hello42

# here, the x character breaks the loop
$ echo '123x45 hello42' | sed -E ':a s/^(\**)[0-9]/\1*/; ta'
***x45 hello42
# no change as the input didn't start with a number
$ echo 'hi 12345 hello42' | sed -E ':a s/^(\**)[0-9]/\1*/; ta'
hi 12345 hello42


```
- [[awk (CLI Utility)]] and [[Perl (Programming Language)]] are better suited for field processing, but in some cases sed might be convenient because the rest of the text processing is already being done in sed.
-  The looping construct also helps to emulate certain advanced regular expression features not available in `sed` like [[Lookaround (Regex)|lookarounds]]
	- https://learnbyexample.github.io/sed-lookarounds/


### Processing Lines Bound By Distinct Markers
- Uniform markers
	- Process all the group of lines including markers: 
		- `sed -n '/start/,/end/p' uniform.txt`
	- Process all the group of lines but excluding the lines matched by markers
		- `sed -n '/start/,/end/{//! s/^/* /p}' uniform.txt`
	- Processing all the group of lines but excluding the ending marker
		- `sed -n '/start/,/end/{/end/!p}' uniform.txt`
	- Processing all the group of lines but excluding the starting marker.
		- `sed -n '/start/,/end/{/start/!p}' uniform.txt`
	- Processing all input lines except the group of lines bound by the markers.
		- `sed '/start/,/end/d; s/$/./' uniform.txt`
	- Processing all input lines except the group of lines between the markers
		- `sed '/start/,/end/{//!d}' uniform.txt`
	- Similar to above but include the starting marker.
		- `sed '/start/,/end/{/start/!d}' uniform.txt`
	- Similar to above +1, but include the ending marker.
		- `sed '/start/,/end/{/end/!d}' uniform.txt`

### Gotchas and Tricks
- Use single quotes to enclose the script on the command line to avoid potential conflict with shell metacharacters.
- Be careful when working with DOS style line ending. Match `\r` optionally if you think you might need a script in a DOS system. `...(\r?)$...`
- Command grouping and `-e`: 
	- Some commands (for example, the s command) can be terminated with a semicolon or } (command grouping). But commands like a and r will treat them as part of the string argument. You can use a literal newline to terminate such commands or use the -e option as shown below.
- If you want to do non-greedy matching switch to a tool like [[Perl (Programming Language)]]
	- `perl -pe '<pattern>'`
- [[ripgrep (CLI Utility)]] can do search and replace and is a alternative to [[sed (CLI Utility)]]
	- You can use `rg --passthru -N 'search' -r 'replace' file` to emulate `sed 's/search/replace/g' file`
- Compiling sed script
	- https://github.com/lhoursquentin/sed-bin
	- This project allows to translate `sed` to [[C (Programming Language)]] to be able to compile the result and generate a binary that will have the exact same behavior as the original `sed` script

### Ampersand (&) 
- `\0` and `&` Represents the entire match

### Replacing Text
- You can read a file and output to STDOUT with text replaced using
```bash
sed "s/<old-text>/<new-text>/" file1
```
- If you want to make the change in the file itself use the `-i` command

### Slashes
- If you want to change slash to double slash you can use `,` as a delimited instead of `/`, this lets you do this
```bash
echo "//" | sed 's,/,//,g'
# ////
```
- Another real example I've seen `s#.*/##`
	- Here `#` is used instead of `/`
	- It converts `some-library-thing/1.0.10` to `1.0.10`

### Multiple Files
- If you want to edit multiple files with similar filename in place you can try something like this
- This is more of a [[Bash (Programming Language)|Bash (Shell)]] [[Globbing (Bash)]] feature than a feature of [[sed (CLI Utility)]]
```bash
sed -i -e 's/Hello/hello/' test*
```


### Multiple Commands to Sed
```bash
 echo "qqqq" | sed 's/q/Q/3; s/q/Q/2'
```

### Flags
- Flags are also known as modifiers
- `-i` In place, make the change to the file itself
- `-i.bak` will edit the file in place but also create a backup of the original

### Delete a Line or Range of lines From A File
- This is how you'd delete the 5th line in-place
```bash
sed -i '5d' file. txt
sed -i '$d' file. txt # This is how you'd delete the last line
sed -i '5,10d' file. txt
```


### Path
- Print path with newline instead of delimiter [[Path (Linux)]]
```bash
echo $PATH | sed 's/:/\n/g'
```
- `\r` works in when I run `:s/,/\n/g` it in [[VIM (Editor)]] but doesn't for some reason in the terminal

### Handling NUL
- [[sed (CLI Utility)]] struggles to replace [[NUL (ASCII Character)|NUL]] 
- When I tried to substitute NUL with newline it didn't work
- [[ChatGPT]] said the following: 
	- "The issue with sed is that it does not handle NUL characters (`\x00`) natively, as it treats input as a stream of text and doesn't support null-terminated characters. To work around this, you can use [[awk (CLI Utility)]] or [[Perl (Programming Language)]], which handle NUL characters better."
- Even [[Sundeep Agarwal (Learn By Example)(Programmer)]] used `tr '\0' '\n'` to substitute [[NUL (ASCII Character)]] in the solution to [[sedexercises (TUI Exercise)]]


### Insert/Append Text From File
- If you have a file with some text that needs to be inserted somewhere based on a particular line in the file you're processing you need to go about it two ways based on whether you're inserting before the line or if you're appending after the line
- For inserting before the line you need to use `e cat <file>`
```bash
# Example
sed '/0x6000/e cat hex.txt' replace.txt

0xA0 0x5000
start: 0xA0, func1: 0xA0
end: 0xFF, func2: 0xB0
restart: 0xA010, func3: 0x7F
0xB0 0x6000
0xFF 0x7000
```
- For appending after the line you need to use `r <file>`
```bash
# Example

sed '/0x6000/r hex.txt' replace.txt

0xA0 0x5000
0xB0 0x6000
start: 0xA0, func1: 0xA0
end: 0xFF, func2: 0xB0
restart: 0xA010, func3: 0x7F
0xFF 0x7000
```

### Metadata
2024-09-12 11:03
- I've been trying to get better at using [[sed (CLI Utility)]] by going through [[Learn By Example (Site)]]'s ebook on Sed
- The learning paid off today when I needed to do a repeated task at work. 
- It probably saved me more than 40 mins worth of work
- The one thing I couldn't figure out to do was how I could add a particular line from another file on to the file I'm working on, the challenge was the line needed to be added in the right place and that would depend on what comes before and after it
	- I'm sure it possible with sed but seemed tedious
	- Perhaps [[awk (CLI Utility)]] or [[Perl (Programming Language)]] would have helped

2024-09-13 21:47
- Need to continue from "Escaping metacharacters" section (https://learnbyexample.github.io/learn_gnused/shell-substitutions.html#escaping-metacharacters)

2024-09-13 22:59
- Created some anki cards
- Need to continue from [[#Case Insensitive Matching]]

2024-09-16 01:13
- Need to continue from [loops](https://learnbyexample.github.io/learn_gnused/control-structures.html#loop)

2024-09-26 10:24
- Created Anki cards till [[#Executing External Commands]], probably need one more card that tests me with an example
- In terms of study I’m still stuck at [[#Loops]]


2024-10-08 01:29
- Done working through [[Learn By Example (Site)]] sed ebook
- Now need to add more cards to anki and drill
- Also need to complete [[sedexercises (TUI Exercise)]]


2024-10-10 00:34
- Need to continue making cards from [[#Adding Content From Files]]

2024-10-14 23:44
- Completed all of Learn by example material and made anki cards based on my notes

2024-12-01 14:46
- Came useful at work again

2025-01-01 22:00
- Learning [[sed (CLI Utility)]] came in useful today as well
- To make the script testable I need to make some changes such as [[Bash (Programming Language)#Handling Source vs Run]] and changing paths
	- Instead of doing this manually each time I wrote a `copy.sh` script that copied the file but also modified it using sed commands to be testable. the sed commands were put in a separate  file and sourced from it using `-f`
	- I used some sed advanced features like `r` , using delimiters other than '/' (because I was updating a path), braces `{}` to hold multiple commands
	- A gotcha I needed to watch out for is to start the next command on the next line after an `r` command so it doesn't think that it's part of the file name

2025-02-03 10:19
- Used sed to solve an [[Exercism (Site)]] bash question; the question wanted you to take a string and convert it to an [[Acronymn (Linguistics)]]
```bash
echo "$1"  \
| sed -E  -e 's/[^a-zA-Z]*(\w)[^- ]*/\1/g' -e 's/(\s|-)*//g' \
| tr 'a-z' 'A-Z'
```

2025-05-18 11:48
- Commands are fading from memory, started doing the anki deck again a few weeks back


### Replace Section With Markers With Contents of File 

- Used this to swap the type of [[Apache Kafka]] container being used in my [[Docker Compose (Software)]] so that o could run it locally 
- The new line after the `r` command is intentional and it wouldn’t work without it

```bash
lead='^### BEGIN GENERATED CONTENT$'
tail='^### END GENERATED CONTENT$'
sed -e "/$lead/,/$tail/{ /$lead/{p; r insert_file
        }; /$tail/p; d }"  existing_file
```

### Hold Space
- A Temporary clipboard
- A separate temporary storage area. You can store or retrieve data from it using specific commands (h, H, g, G, x).
- Use it when you want to 
	- Remember a line for later
	- Swap with the current line
	- Append or copy content between lines

### Pattern Space
- The current line being processed. All matching, substitutions, and most commands operate on this.

### Commands on Hold Space

| Command | Action                                      |
| ------- | ------------------------------------------- |
| `h`     | Copy pattern space → hold space (overwrite) |
| `H`     | Append pattern space → hold space           |
| `g`     | Copy hold space → pattern space (overwrite) |
| `G`     | Append hold space → pattern space           |
| `x`     | Swap pattern space ↔ hold space             |
- Note: H first appends a new line to the hold space and then appends the contents of the pattern space


### Related
[[When to use grep, sed, awk, perl]]


### Sources
https://learnbyexample.github.io/learn_gnused/introduction.html - Almost everything on this page is from this source
