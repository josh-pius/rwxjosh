### General
- Often contracted as `au`
- You can specify commands to be executed automatically when an event occurs in VIM this can be anything from  reading or writing a file, to  entering or leaving a buffer or window, or even when exiting Vim. 
- For **example**, you can create an autocommand to set the 'cindent' option for files matching *.c.  You can also use autocommands to implement advanced features, such as editing compressed files (see |gzip-example|).  The usual place to put autocommands is in your .vimrc or .exrc file.
	- WARNING: Using autocommands is very powerful, and may lead to unexpected side effects.  Be careful not to destroy your text. - It's a good idea to [do](https://vimdoc.sourceforge.net/htmldoc/diff.html#do) some testing on an expendable copy of a file first.
	  For example: If you use autocommands to decompress a file when starting to
	  edit it, make sure that the autocommands for compressing when [writing](https://vimdoc.sourceforge.net/htmldoc/editing.html#writing) work
	  correctly.
  - A better explanation can be found here [[Learn Vimscript the Hard Way (Tutorial)]]

### Problem
- Say you have an autocommand that echoes "Hello world" when opening a buffer
- If you run the same command twice it will create one more autocommand, so that next time you open a buffer "Hello world" prints twice
- This is a major problem since we source our [[Vimrc (Config File)]] file often and each time it is sourced it created duplicate autocmds
- The solution to this is [[#Grouping Autocommands]]


### Grouping Autocommands
- You can group autocommands using `augroup`
```vim
:augroup testgroup
:    autocmd!
:    autocmd BufWrite * :echom "Foo"
:    autocmd BufWrite * :echom "Bar"
:augroup END
```
- `autocmd!` is optional but for most cases needed. This line clears other autocommands in the group so that it won't create duplicates

### Defining Autocommands
- Note: The "[:autocmd](https://vimdoc.sourceforge.net/htmldoc/autocmd.html#:autocmd)" command cannot be followed by another command, since any '|' is considered part of the command.
```
:au[tocmd] [group] {event} {pat} [nested] {cmd}
```
- Add {cmd} to the list of commands that Vim will execute automatically 
	- on {event} for a file matching
	- {pat} |autocmd-patterns|.
	- Vim always adds the {cmd} after existing autocommands, so that the autocommands execute in the order in which	they were given.  See |autocmd-nested| for [nested].



### Autocommand to Autowrite For A Particular File Format
```
autocmd TextChanged,TextChangedI *.rkt if &modified | silent! write | endif
```