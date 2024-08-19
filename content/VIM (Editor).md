### General
- Vim Command usually follows the structure
`[count] [operation] [text objects/motion]`

### Executing Bash in the Editor
- [[Rwxrob (Youtuber)]] calls this the magic wand of vim
- To Execute a bash command on a line use `:.!*bash*`
- If you want to execute a block use `:!}bash`
- Executing command from current line to a certain line number
	- Type `!:<line-Number><enter>`
	- After it shows you the correct prompt type the command (say `!sort`)
### History
- Successor of [[Vi (Editor)]]

### Insightful VIM Talk I Should Listen to
https://youtu.be/E-ZbrtoSuzw?si=dSeWu5l76Q_F_G-T

### Concepts
- [[#Buffers]]: In memory text of a file
- [[#Args List]]: These are the files as arguments when you opened vim
- [[#Splits]]: Viewport of buffer
- [[#Tabs]]: A collection of windows

### Relationship Between Tabs, Windows and Buffers
- [[Leeren (Youtuber)]] put it this [way](https://youtu.be/E-ZbrtoSuzw?si=XxmkThLHIvKUXu4A)
- Tabs are window containers
- Windows are buffer viewports
- Buffers are file proxies (and the arglist) 
- So Tabs are made up of windows, windows are made up or buffers/arglist

### Buffers
[[Buffers (VIM)]]

### Window
[[Window (VIM)]]
### Splits
[[Splits (VIM)]]
### Args List
[[Args List (VIM)]]

### Tabs
[[Tabs (VIM)]]

### Super Insightful Video on VIM Worth Watching Later
https://youtu.be/E-ZbrtoSuzw?si=kKjqknxZFLs760XQ by [[Leeren (Youtuber)]]
### Basic Navigation
1. **Basic Movements**:
    - `h`: Move left.
    - `j`: Move down.
    - `k`: Move up.
    - `l`: Move right.
2. **Word Movements**:
    - `w`: Move to the start of the next word.
    - `b`: Move to the start of the previous word.
    - `e`: Move to the end of the current/next word.
    - `ge`: Move to the end of the previous word.
3. **Line Movements**:
    - `0`: Move to the beginning of the line.
    - `^`: Move to the first non-blank character of the line.
    - `$`: Move to the end of the line.
    - `+`: Move to the first non-blank character of the next line.
    - `-`: Move to the first non-blank character of the previous line.
    - `g_`: Move to the last non-blank character of the line.
4. **Screen Movements**:
    - `H`: Move to the top of the screen.
    - `M`: Move to the middle of the screen.
    - `L`: Move to the bottom of the screen.
1. **Page Movements**:
    - `Ctrl-f`: Move forward one full screen.
    - `Ctrl-b`: Move back one full screen.
    - `Ctrl-d`: Move forward half a screen.
    - `Ctrl-u`: Move back half a screen.
2. **Paragraph/Section Movements**:
    - `}`: Move to the next paragraph or block of text.
    - `{`: Move to the previous paragraph or block of text.
    - `]]`: Move to the next section.
    - `[[`: Move to the previous section.
    - `(`: Move to previous sentence 
    - `)`: Move to next sentence 
3. **Matching Brackets**:
    - `%`: Move to the matching bracket ((), [], {}).
4. **Line Number**:
    - `G`: Move to the end of the file.
    - `gg`: Move to the beginning of the file.
    - `[number]G`: Move to the specified line number.
5. **Miscellaneous**:
    - `*`: Move to the next occurrence of the current word.
    - `#`: Move to the previous occurrence of the current word.
    - `f[char]`: Move to the next occurrence of [char] on the current line.
    - `F[char]`: Move to the previous occurrence of [char] on the current line.
    - `t[char]`: Move right before the next occurrence of [char] on the current line.
    - `T[char]`: Move right before the previous occurrence of [char] on the current line.
    - `;`: Repeat the last `f`, `F`, `t`, or `T` command.
    - `,`: Repeat the last `f`, `F`, `t`, or `T` command in the opposite direction.

### Vertical Scrolling
- `H,M,L` To move to High, Middle and Low of the screen
- `zt,zz,zb` Does not move the cursor but are used to control the positioning of the screen relative to the line where the cursor is located
- `Ctrl + U / Ctrl + D` to move half screen up and down
- `Ctrl + B / Ctrl + F` to move a full screen up or down
- `Ctrl + Y / Ctrl + E` - Used to scroll the text in the window without moving the cursor (Seems pretty useful)

### Horizontal Scrolling
- `zs` : Scrolls the screen horizontally so that the cursor is placed at the start (leftmost part) of the visible screen
- `zH`: Scrolls the window half a screen to the left, effectively centering the cursor horizontally if possible.
- `zh`: Scrolls the window view one character to the left.
- `zl`: Scrolls the window view one character to the right.
- `zH`: Scrolls half a screen to the left.
- `zL`: Scrolls half a screen to the right.
- `zszH` : Center the cursor horizontally. There's no direct equivalent for `zz` for horizontal centering but this hacky command works

### Editing
- `:e[dit] [++opt] [+cmd] {file}`
- `:fin[d][!] [++opt] [+cmd] {file}` - [[Leeren (Youtuber)]] says that this should be preferred over `:e`
- `gf` - Go to file
- `ctrl + ^` - Switch between buffers (Seems useful)

### Tags
- [[Tags (VIM)]]

### Mapping
[[Mapping (VIM)]]

### Tutorial
https://www.openvim.com/
https://danielmiessler.com/study/vim/


### Gamification
[[Gamification (Software)#VIM]]
- VIMGolf seems like a good way to learn for intermediate learners
 


### Advanced Vim Workflows
https://www.youtube.com/playlist?list=PLpkoC9yJXDKkm4MStIQoieUPwNjO4Rb_M


### Modes
1. [[#Insert Mode]]
2. Command Mode
3. Visual Mode
	1. Character
	2. Line
	3. Block
4. Replace Mode
5. Command line mode
6. Ex Mode
	1. Enter using `Q`

### Insert Mode
[[Insert Mode (VIM)]]

### Why Use Vim In Obsidian
https://levelup.gitconnected.com/the-top-one-reason-that-i-use-obsidian-for-pkm-unlocking-the-power-of-vim-bb314f20818e

### Cheatsheet
https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/cheatsheet

### word/WORD
- A WORD is always delimited by _whitespace_.
- A word is delimited by _non-keyword_ characters, which are configurable. Whitespace characters aren't keywords, and usually other characters (like `()[],-`) aren't, neither. Therefore, a word usually is smaller than a WORD; the word-navigation is more fine-grained. 


### Diff
- If you have two buffers open in a vertical split you can do a diff between them using `windo difft`
- You can diff two files using `vim -d <file1> <file2>` as well

### Commands
1. Quit - `:q`
2. Quit without saving `:q!`
3. Quit after saving `:wq`
4. Delete Character `x`
5. Delete line `dd`
6. Undo `u`
7. Undo changes on entire line `U`
8. Add line numbers `:set number`
9. Navigate to line x `:x`
10. Go to inset mode `i`
11. Go back to command mode `esc`
12. Paste from clipboard `+p`
13. Search forward in the file - `/`
	1. Next: `n`
	2. Prev: `N`
14. search backward in the file `?`
15. Move horizontally to the beginning of a word: `w`
16. Jump to end of a word: `e`
17. Jump to beginning of word backward: `b`
18. Jump to end of word backward: `ge`
19. Move horizontally to next occurrence particular letter: `f{character}`
20. Move horizontally to previous occurrence particular letter: `F{character}`
21. Go to next occurrence of prev command: `;`
22. Go to prev occurence of prev command: `,`
23. Move horizontally to right before next occurrence of particular letter: `t{character}`
24. Move horizontally to right before prev occurrence of particular letter: `T{character}`
25. Go to end  of page: `G`
26. Go to start of page : `gg`
27. Replace contents of quote `ca"`
28. Visual mode around quotes `va"`
	1. Select the quotation and puts in visual mode
29. Jump to surrounding bracket `[<bracket-type>` or `]<bracket-type>`
	1. Eg. `[{` ; `]}`
30. Navigate to line 10 `:10`
31. Repeat last change `.`
	1. This command is much more useful than I thought, say you do `diw`, you can repeat that with just `.`
	2. If you used `o` in normal mode to insert a new line and then exit insert mode, you can then repeat entering a new line with just `.`
32. Delete all lines that being with "var"
	1. `:g/var/d`
33. Search and replace one instance
	1. `:s/<search>/<replace>/g`
34. Search and replace all instances
	1. `:%s/<search>/<replace>/g`
35. [[#Marks]]
36. Go to previous change location `g;`
37. Go to newer change location `g,`
38. Get file info `g ctrl+g`
39. [[#g-Commands]]
40. Go to beginning of next method `]m` (Dependent on whether VIM has language specific navigation available)
41. Repeat an Ex command: `@:`
42. Delete till search term `d/<searchterm>` (similar to dt and df)


### "Visual Line" Commands
Source: https://www.youtube.com/watch?v=bQfFvExpZDU#:~:text=but%20we're%20going%20to,you%20other%20things%20like%20g.
- Not to be confused with visual line mode in vim
- When lines are very long VIM wraps them on the editor
- When you use `j` to go down it looks like it's jumping over multiples lines in this case which might be unexpected behavior for someone starting out in VIM

1. Move down/up a visual line `gj` / `gk`
2. Move to beginning or end of visual line `g0`/`g$`
3. Split up a visual line into multiple lines for one paragraph `gqq`
	1. You can combine this with motions, eg here it splits visual lines for 5 other paras below `gq5j`

### g-Commands
Source: https://www.youtube.com/watch?v=bQfFvExpZDU#:~:text=but%20we're%20going%20to,you%20other%20things%20like%20g.
1. Uncapitalize/Capitalize `gu`/`gU`/`g~`
	2. Usually can use `u` and `U` only in visual mode but with `g` you can use it with motions in normal mode
	3. Can be combined with motions, eg to capitalize to end of the line `gu$` 
	4. Capitalize three words `gU3W`
	5. Other examples: `gUU`,  `g~W`
2. Go to file `gf`
	1. Use `^` to return back
3. Go to previous selection `gv`
4. Join lines without space in between`gJ`
	1. `J` joins with space
5. Repeat substitution for an entire doc `g&`
	1. Sometimes you run a substitute command and forget to specify the full doc `:s/cat/dog`
	2. You can run `g&` to repeat the command for the entire doc
6. [[#"Visual Line" Commands]]

### Deleting
1. Delete the whole line `dd`
2. Delete two the word: `d2w`, `d2e`
3. Delete till end of line `d$`


### Undo/Redo
1. Undo a single action `u`
2. Undo all changes to line `U`
3. Redo `Ctrl + R`



### Substitute Command
1. To replace first occurrence on a line `:s/thee/the`
2. To replace all occurrences on a line `:s/thee/the/g`
3. To change every occurrence between two line `:#,#s/old/new/g`
	1. Where `#` are line numbers
4. To change every occurrence in whole file `:$s/old/new/g`
5. To find every occurrence ni whole file and prompt before substituting `:%s/old/new/gc`
	1. `c` for confirmation
6. Substitute character only in selected text and not the whole line- Use `\%V`
	1. `:s/\%V <patter>/<replce-text>/g`
	2. 2024-02-22 20:02 : Actually had to use this today at work
7. If you're searching with `/` and `?` can you substitutions using `cgn`, this will only change the text in the word that matches the search, once you replace you can hit `.` to repeat it (Super useful)
8. `\%(.....\)` is a [[Non-Capturing Group (Regex)]] (source: [[Denvaar (Youtuber)]])
9. [[#` ze` ` zs` Lookaround]] 
10. Join a list of numbers on every line into a single expression separated by `+`, without a `+` at the end
	1. `%s/\n\%($\)\@!/+`
	2. At it's most basic it replaces `\n` with `+` but does a [[Lookaround (Regex)]]


### `\ze` `\zs` Lookaround
[[Lookaround (Regex)#VIM ` zs` and ` ze`|Lookahead (Regex)]]
- [:help /\\zs](http://vimdoc.sourceforge.net/htmldoc/pattern.html#/\zs)
- [:help /\\ze](http://vimdoc.sourceforge.net/htmldoc/pattern.html#/\ze)


### Regex Lookaround
- Note: Not present in [[Vi (Editor)]]
![[Lookaround (Regex)#Classic Lookaround]]
### Useful Substitute Commands
1. Remove all blank lines - `%s/^$/d`
2. Remove all trailing spaces - `%s/\s\+$//e`
	- `:%s` to run `:substitute` over the range `%`, which is the entire buffer.
	- `\s` to match all whitespace characters.
	- `\+` to match 1 or more of them.
	- `$` to anchor at the end of the line.
	- The `e` flag to not give an error if there is no match (i.e. the file is already without trailing whitespace).

### Pattern
- `\%^` - Matches the start of a file
- `\%$`- Matches the end of a file

### Matching Parentheses Search
1. Use `%` while on a parentheses to go to matching parentheses

### Search
1. Use `/` to search forward and `?` to search backward
2. Use `n` and `N` to go back and forward in the search
3. Use `Ctrl + i` and `Ctrl + o` to go to older and newer positions
4. Replacing while searching, if you search for something and want to replace it hit `cgn` to edit the the string, then if you hit `.` it will replace the next occurrence and so on


- You can set the option to ignore case using
```
:set ic
# To Disable use
:set noic
```
- Option to highlight searched words (hlsearch)
```
:set hls
# To disable use
:nohlsearch
```
- If you want to ignore case for just one command use
```
/<word>\c
```
- Option to support incremental search
	- It shows you matches as you type
```
:set is
```
### Change Operator
1. To change until end of word use `ce`, deletes rest of word and goes into insert mode

### Cursor Location and File Status
1. Use `Ctrl + G` to see the cursor location and file status

### Writing Files
1. To save current file to a new file with new file name `:w <filename>`
2. You can remove the file using `:rm <filename>` 


### VIMRC
- Many expert VIM users have a well developed VIMRC with shortcuts and scripts they've taken years to put together
- VIMRC Best practices and tips; https://www.reddit.com/r/vim/wiki/vimrctips/


### People
- Ben Orenstein said you can reach out to him on twitter for VIM Advice

### LSP
- [[Language Server Protocol (LSP)]]


### Resources
https://www.youtube.com/watch?v=m9H1tce8Q64
- [# Ben Orenstein - Write code faster: expert-level vim (Railsberry 2012)](https://youtu.be/SkdrYWhh-8s)
	- Instead of `:w` mapped saving file to `Ctrl + S` to save time
https://www.youtube.com/watch?v=GYVbYCST_Yc




### Marks

[[Marks (VIM)]]
### VIM Magic
- https://www.youtube.com/watch?v=3yN6Q8I5KJA&t=411s


### VimTutor Speedrun
https://www.youtube.com/watch?v=y6VJBeZEDZU

### Flags
- You can open `vi` with different flags that do different things
	- `-p[N]` Open N windows side by side. When N is omitted one window for each file
	- `-d` Open in diff mode


### Put Output of Command Into VIM
```
:r !ls
```
- Adds output of [[ls (Linux Command)]] to the file



### Save only a paragraph in one file onto another file
- Use `v` to select the block of text from the source file
- Use the command below to write it to a file by name test
```
:w TEST
```

### Replace Mode
- Enter replace mode by using `R` 
- It's like when you're in insert mode in normal keyboard
- As you type it overwrites


### Jump Between Windows
```
Ctrl + W Ctrl + W  ## Yes Repeat the command twice
```



### See Possible commands and Autocomplete
- If you're looking for a particular command that starts with `e` but you can't remember it use 
```
:e
# Then hit Ctrl + D
```
- You can autocomplete commands using `TAB`

### Select All Lines
```
do ggVG
```


### Tabs
- Command line command to open file in another tab `:tabe file`
- Switch to next tab `gT`

### Open Files in Tabs
- If you want to open files in tabs you can use the flag `-p` for paged mode


### Java Development Environment
https://www.developersoapbox.com/command-line-only-spring-boot-development-using-vim/
https://www.youtube.com/watch?v=ssmFzoZS2G8
https://www.youtube.com/watch?v=zmnlpf4FtkE
https://www.youtube.com/watch?v=8q_VPqA-KLs
https://jqno.nl/post/2020/09/09/my-vim-setup/
https://dev.to/mafflerbach/vim-as-java-ide-3b1a
https://sookocheff.com/post/vim/neovim-java-ide/
https://www.quora.com/What-does-it-feel-like-to-code-in-Java-using-Vim-without-the-help-from-IDEs-like-Eclipse

### Semicolon and Sons' Advanced Vim Workflows
https://www.semicolonandsons.com/episode/Advanced-Vim-Workflows
- He also suggests some plugins that can help doing things better on VIM in the description

### Open Netrw Explorer
```
:Ex
```


### "Source"/Run a File
```
:so 
OR
:source
```


### Jumplist
- Navigating from one file to another is a jump
- You can see all the jumps you've made using
```
:jumps
```
You can go back and forward between jumps using `Ctrl + i` and `Ctrl + o`

### Changelist
- You can go forward and backward from your previous changes using `g;` and `g,`
- You can view all the changes you've made using
```
:changes
```


### Pipe Stdout to VIM
Source: https://youtu.be/pt36X1OJRG4
- The `-` stands for [[Stdin (Unix)]]
- You can open the last 150 lines of a log file in VIM this way 
```
file.log | tail -n 150 | vim -
```


### Text Objects
Source: [VIM A-Z: A Text Object for Every Letter in the Alphabet](https://youtu.be/JnD9Uro_oqc)  by [[Semicolon and Sons (Youtuber)]]
- To edit efficiently in Vim, you have to edit beyond individual characters. 
- Instead, edit by word, sentence, and paragraph. In Vim, these higher-level contexts are called **text objects**. Vim provides text objects for both plaintext and common programming language constructs. 
- You can also define new text objects using Vim script. Learning these text objects can take your Vim editing to a whole new level of precision and speed.
- TODO : **NEED TO GO OVER THIS**
- Fascinating video 
- Had some trouble getting it to work
- Need to go over it again once I have more time
- Also read this https://blog.carbonfive.com/vim-text-objects-the-definitive-guide/
- Also see https://youtu.be/Jaa-LGyagRA


### Regex
[[Regex (VIM)]]


### IDE Like Refactoring In VIM
Source: https://www.semicolonandsons.com/episode/IDE-like-refactors-snippets-tests-hover-docs-commenting-and-git
- Need to go over this video

### Powers In Insert Mode
- Really good video https://youtu.be/3TX3kV3TICU?si=CzK7YZFstq7kYY1s
- [[#Insert Mode Completion]]
- Context Aware Completion/keyword local completion: `^X ^P`
- Whole line completion: `^X ^L` if you follow by `^L` again it is context aware
### Registers
[[Registers (VIM)]]


### File Navigation
[[Netrw (VIM)]]


### Insert Mode Completion 
https://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion
| Number | Type                                       | Short Cut       |
| ------ | ------------------------------------------ | --------------- |
| 1.     | Whole lines                                | i_CTRL-X_CTRL-L |
| 2.     | keywords in the current file               | i_CTRL-X_CTRL-N |
| 3.     | keywords in 'dictionary'                   | i_CTRL-X_CTRL-K |
| 4.     | keywords in 'thesaurus', thesaurus-style   | i_CTRL-X_CTRL-T |
| 5.     | keywords in the current and included files | i_CTRL-X_CTRL-I |
| 6.     | tags                                       | i_CTRL-X_CTRL-] |
| 7.     | file names                                 | i_CTRL-X_CTRL-F |
| 8.     | definitions or macros                      | i_CTRL-X_CTRL-D |
| 9.     | Vim command-line                           | i_CTRL-X_CTRL-V |
| 10.    | User defined completion                    | i_CTRL-X_CTRL-U |
| 11.    | [[Omni Completion (VIM)]]                  | i_CTRL-X_CTRL-O |
| 12.    | Spelling suggestions                       | i_CTRL-X_s      |
| 13.    | keywords in 'complete'                     | i_CTRL-N        |


### Tag Stack
https://vimdoc.sourceforge.net/htmldoc/tagsrch.html#tag-stack
### Useful Tips
- [[ROT13 (Cryptography)]] in VIM: `ggg?G`
- Entire series of VIM Tips: https://www.youtube.com/playlist?list=PLOe6AggsTaVsdFEX7_U9k4YDyMMNb--zx


### Autocmd
[[Autocmd (VIM)]]


### Running Text Lines As Commands
Really cool
https://youtu.be/MquaityA1SM?si=65eoJIekG2ii0SFq
1. Regular Expressions


### Count Occurrence Of Word In File
```
%s/word//gn
```

- n is noOp


### Problem Solving With VIM
[[Advent of Code (Site)]]
https://www.youtube.com/watch?v=P7yTg1SdNNQ (Check it out)

- Join lines together `g/\d/-1j`


### Macro
[[Macros (VIM)]]


### Vimscript
[[Vimscript (Programming Language)]]


### Using Macros to Solve Advent of Code 
https://www.youtube.com/watch?v=mHO8M5ZrUek
- Learn all the commands used in this video


### Norm
- Say you want to use regex to find a bunch of words and then apply a action on then, you can use the norm command to do so
```
g/regex/norm dw
```
- You can run norm command by itself on a range of lines 
```
:%norm VU // Captitalize all lines
```

### Set Commands
[[Set Commands (VIM)]]

### Encryption
- VIM allows you to easily encrypt files using the `:X` command
- It uses [[Blowfish (Computer Security)]] encryption
- It asks you for a key to encrypt and the next time you open it'll ask for the same key

### You're Problem With VIM is that You Don't Grok Vi
- A very popular stackoverflow answer
https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118


### Loading VIM without Any Custom Configuration
- You can use this command to open VIM without any custom config
```
vim -u NONE <file>
```

### Adding Output of Bash Commands To Vim
- `!!` is a shortcut for `:.!`
- The below command can be used to insrt
```
:.!<bash-command>
```
- Note some characters need to be escaped eg. `%` represents file name so in the command use `\%` instead
	- This game me some trouble when I was trying to do something at work
- To append the output of some bash commands to a line use
```
:execute 'normal! A' . system('ls')
```
### Metadata
2023-12-29 18:58
- I was able to test out some of these features of [[#Tags]] by using [[ctags (CLI Utility)]] to create tags on the [[Anki]] python project
- This is significant as it bring me a step closer to enabling me to use VIM by itself for development
2024-01-30 23:27
- Gave a presentation at work today on [[VIM (Editor)]] see [[Vim Presentation For Work]]
- All of my manager's directs were in the meeting
2024-02-16 17:14
- Explored VIM folding commands and options today
- Didn't go into depth but just enough so that I could use it in intellij to unfold the imports
2024-02-22 20:02
- Had to use this at work today: Substitute character only in selected text and not the whole line- Use `\%V`
	1. `:s/\%V <patter>\%V/<replce-text>/g`
2024-04-04 15:50
- [[Rwxrob (Youtuber)]] recommends using searching over guessing the number of words to jump `d/<searchTerm>` over `d3e`
	- He also hates relative numbers and even lines numbers on screen
2024-04-24 23:27
- [[#Recovering A Swap File]] came in super handy today to recover .bashrc  as I almost lost it when  I overwrote it using curl

2024-05-12 13:00
- Never thought I'd care about digraphs but today I wanted to type the character `^R` and wasn't able to do so using `CTRL-V CTRL-R` most likely due to `CTRL-V` being tied to paste on my windows system
- [[#Digraphs]] came in handy in this scenario and allowed me to type the character

### Family Tree
- Fascinating relationship between [[VIM (Editor)]], [[Ed (Editor)]], [[Ex (Editor)]] , [[Vi (Editor)]], [[Neovim (Software)]], [[Sed (Linux Command)]], [[awk (CLI Utility)]], [[Perl (Programming Language)]]

### Autosave File In Vim
- Save a file every time it changes uses [[Autocmd (VIM)]]
```vimscript
autocmd TextChanged,TextChangedI <buffer> silent write
```

### Code Folding
- Manual Folding:
	- `zf{motion}`: Create a fold. The {motion} is how you move in Vim, so for example, zf20j creates a fold from the cursor down 20 lines.
	- You can do `zf}` to fold the paragraph
- **Opening and Closing Folds**:
	- `zo`: Open a fold at the cursor.
	- `zc`: Close a fold at the cursor.
	- `za`: Toggle a fold at the cursor (open if it's closed, close if it's open).
	- `zR`: Open all folds.
	- `zM`: Close all folds.
- **Creating Folds Based on Indentation**:
	- Set the fold method to indentation: `:set foldmethod=indent`. Then, folds can be created automatically based on the indentation level of your code.
- **Navigating Folds**:
	- `zk`: Move to the start of the current open fold.
	- `zj`: Move to the end of the current open fold.
	- `[z`: Move to the start of the previous fold.
	- `]z`: Move to the end of the next fold.
- . **Adjusting Fold Levels**:
    - `zm`: Increase the fold level (show less).
    - `zr`: Decrease the fold level (show more).
    - `zx`: Update folds to match the current fold level.
- **Syntax-Based Folding**:
    - Set the fold method to syntax: `:set foldmethod=syntax`. This method automatically creates folds based on the syntax of the programming language you are editing.
- **Expression Folds**:
    - Set the fold method to expression: `:set foldmethod=expr` and then define the fold expression with `:set foldexpr=...`. This allows for custom folding based on evaluating an expression for each line.

### Comments
```
"  This is a comment
```

### Source
[[source (Linux Command)]]
```
:source %
```


### Readonly
- You can open a file in read only mode using `:v` or `:view`
- From the CLI you can use `vim -R <file>`

### Repeating an Ex Command
```
@:
```


### Global And Inverse Global
- The `:g/<pattern>/<cmd>` and `:v/<pattern>/<cmd>` are two [[Ex (Editor)]] commands
- hese commands are not unique to Vim; they originate from Ex and are also present in Vi, the predecessor of Vim
- The `:g` command allows you to execute a command on all lines that match a given pattern. For example, `:g/pattern/d` would delete all lines containing "pattern".
- The `:v` command is similar to `:g` but operates on lines that do not match the pattern. So, `:v/pattern/d` would delete all lines that do not contain "pattern".
- `g/\d/-1j` Was [[Denvaar (Youtuber)]] used this to join a line with the previous line if it contained a number


### Copying And Pasting From Remote
https://www.reddit.com/r/vim/comments/k1ydpn/a_guide_on_how_to_copy_text_from_anywhere/
- Use [[Operating System Command (OSC)#OSC52|OSC52]], even [[Leeren (Youtuber)]] recommends this highly

### hidden
- `:set hidden` allows you to switch to another buffer without having saved the one you're on


### Recovering A Swap File
```
vim -r  <swap-file-name>
```
- Came in handy one time at work

### VIM and Ctags
https://youtu.be/GjhqSvfy7xw?si=bKWGllaXeRi1CjxX
### Converting Line Ending From CRLF to LF
- Often the file in VIM and type `:set ff=unix` and save, it gets saved in LF format
### Convert A Tab To 4 Spaces In A Python File
```
:%s/\t/    /g
```
- If you want vim to do this automatically you can use
```
set expandtab " Use spaces instead of tabs 
set tabstop=4 " Number of spaces tabs count for 
set shiftwidth=4 " Number of spaces to use for each step of (auto)indent 
set softtabstop=4 " Number of spaces per Tab
```

### Digraphs
- Digraphs are used to enter characters that normally cannot be entered by an ordinary keyboard, these are mostly printable non-ASCII characters. Digraphs are easier to enter than the decimal number that can be entered with `CTRL-V`
- View all Digraphs `:digraphs` and key combination to get them
	- To enter a digraph use `Ctrl + k`
- Insert `^R` , do `Ctrl-K` followed by `D2`


### Command Line Mode
- `:confirm qa` Similar to quit all but provides a prompt for every file that has unsaved changes
- `:ls`: Can be used instead of `:buffers`
- Use `:set hidden` if you want to switch to another buffer even if there are unsaved changes in the current buffer
- `q:` for the command line window. It can be quiet annoying when it shows up when you really wanted `:q`, quit with `:q`

### Resources
https://vim.fandom.com/wiki/Best_Vim_Tips
https://vimhelp.org/ (Official VIM docs)
https://learnbyexample.github.io/vim_reference/Introduction.html
https://www.youtube.com/playlist?list=PL8tzorAO7s0jy7DQ3Q0FwF3BnXGQnDirs (Playlist not sure if it's good)
https://youtu.be/Jaa-LGyagRA
https://www.youtube.com/playlist?list=PLOe6AggsTaVsdFEX7_U9k4YDyMMNb--zx
https://youtu.be/E-ZbrtoSuzw?si=dSeWu5l76Q_F_G-T


