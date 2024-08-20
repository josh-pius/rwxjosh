### General
- Vim script (also called Vimscript or VimL) is the scripting language built into Vim

### Metadata
2023-11-16 11:48
- I've been going over the [[Learn Vimscript the Hard Way (Tutorial)]] for the past few days
- I think it's quiet well written

### Echoing
- You can echo text in VIM using `:echo "Hello, World"`
	- This text that shows up is ephemeral and once you click away is lost
- You can have text persist in memory if you use `:echom "Hello"`
- You can see the text saved in memory using `:messages`

### Comments
- You can create a comment in vimscript as follows using `"` character
```vim
" Make space more useful
nnoremap <space> za
```
- There are some caveats to this and this might not work 
	- Eg. If you add a comment inline in a line that is doing a mapping this will not be treated as a comment

### Variables
[[Variables (Vimscript)]]


### Conditionals
[[Conditionals (Vimscript)]]


### Multi-line Statements
- Sometimes you can't fit a piece of Vimscript on a single line of code.
- You can type it into many lines
```vim
:augroup testgroup
:    autocmd BufWrite * :echom "Baz"
:augroup END
```
- But doing this is tedious when you're typing commands manually
- Instead you can use `|` which is sort of like other languages `;` to separate different statements. Vim will treat that as two separate commands
```vim
:echom "foo" | echom "bar"
```



### Char2nr
Source: https://www.youtube.com/watch?v=e5FkKJyleDg&list=PL6XBsLhMC_hmw8eKhlrC8k7FfmNzDLw80&index=3
```
char2nr('a') - Returns the character's ASCII value
```


### Submatch
Source: https://www.youtube.com/watch?v=e5FkKJyleDg&list=PL6XBsLhMC_hmw8eKhlrC8k7FfmNzDLw80&index=3
- Refer https://vimdoc.sourceforge.net/htmldoc/change.html#:substitute
```
submatch(0)
```
- The whole matched text can be accessed with `submatch(0)`, the text matched with first pair of `()` can be matched with `submatch(1)`


### Docs
https://vimhelp.org/builtin.txt.html - List of all methods

### Vim Script Tutorial Playlist
https://www.youtube.com/watch?v=cg2ShY5cUZc&list=PLOe6AggsTaVv_IQsADuzhOzepA_tSAagN&pp=iAQB by [[Yuki Uthman (Youtuber)]]


### &modified
- An option variable that indicates whether the current buffer has been modified since the last save.

### Resources
VIM Script the Hard way : https://learnvimscriptthehardway.stevelosh.com/
Scripting in VIM: https://vimhelp.org/usr_41.txt.html#usr_41.txt

### Sources
[[Learn Vimscript the Hard Way (Tutorial)]]
