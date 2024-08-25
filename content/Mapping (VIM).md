### General
Source: [[Learn Vimscript the Hard Way (Tutorial)]]
- If there's one feature of Vimscript that will let you bend Vim to your will more than any other, it's the ability to map keys

### Basic Mapping
- Below is an example of Mapping in mode
- This mapping works in many modes (normal, insert etc)
```
:map - x
```

### Special Characters
- You can use `<keyname>` to tell vim about special characters in mapping
```
:map <space> viw
```
- You can also map modifier keys like Ctrl and Alt. This maps (Ctrl + d)
```vim
:map <c-d> dd
```

### Modal Mapping
- To be specific about which modes a mapping should work in you can use `nmap`, `vmap`, `imap`
```
:nmap \ dd
```
- Note: Modal Mappings work as per their mode. Example, typing Ctrl+d in insert mode would insert two "d" and NOT do a delete. This is expected since it's insert mode
```
:imap <c-d> dd
```
- If you do want to delete a line in insert mode you could do this instead
```vim
:imap <c-d> <esc>ddi
```
- Note: To unmap when using model commands you can use for normal mode `nunmap`,


### Side Effects of \*map Commands
- One downside of the `*map` commands is the danger of recursion. Another is that their behavior can change if you install a plugin that maps keys they depend on.

### Non-Recursive Mapping
- If you set the above mapping, and typed `\` it would actually run `dd`
- While this might sound like a good idea at first this kind of behavior gets really confusing and can result in a infinite loop freezing vim 
```vim
:nmap - dd
:nmap \ -
``` 
- Below is an example of a recursive map
```
:nmap dd O<esc>jddk
```
- Each of the `*map` commands has a `*noremap` version
- You should **ALWAYS** prefer nonrecursive variant over the normal counterpart


### Local Buffer Mapping
[[Learn Vimscript the Hard Way (Tutorial)]]

### Movement Mapping
- Pertaining to "operator-pending mappings" eg. `ci(`, `yt,`
- With the map below we can use `dp` to delete inside a parentheses, can think of the as "**d**elete  **p**arantheses"
```vim
:onoremap p i(
```
- The `onoremap` command tells Vim that when it's waiting for a movement to give to an operator and it sees `p`, it should treat it like `i(`
- With this mapping below if you're inside a function, and you type `db` it will delete all the way to the `return` statement
```vim
:onoremap b /return<cr>
```
- All the examples so far started at current cursor position, but you can create commands that are smarter. `dil(`  command would delete contents inside the previous parantheses
```vim
:onoremap il( :<c-u>normal! F)vi(<cr>
```



### Useful Mappings
- Map `-` to move line down in normal mode
```
:map - ddp
```