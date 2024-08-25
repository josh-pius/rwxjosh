### General
- Any file that you have opened in Vim that is stored in the memory for editing and is referred to a a buffer
	- The green progress bar in YouTube videos is an excellent example of a buffer
	- Technically speaking, a buffer is anything that is loaded into the memory which is going to be used in the immediate future
- Note: Ideally speaking you shouldn't use [[Tmux (Terminal Multiplexer)]] to switch between files when you're working with many file, instead the approach should be to use buffers instead. It's the more "VIM" way to do things
	- [[Rwxrob (Youtuber)]] had a video that seemed to disagree 


### Warning
- [[Rwxrob (Youtuber)]] points out how vim buffers have a limit and truncate beyond that limit
- Anytime you're copying ensure you copy to a temp file and then copy from that temp file to the location you want

### Creating New Buffers
 - `:edit <filename>` or `:e <filename>` - Used for opening a file to edit, in an **active** Vim session
	 - VIM will immediately load that file in the active buffer, i.e. it will be displayed to you on the screen instead of whatever else was there previously
 - `:badd <filename>` or `:bad <filename>` - The file you specify will be loaded into the buffer, in the background
	 - It won't switch to that file



### List Buffers
- There are multiple command that help to list our buffers
```
:ls
:files
:buffers
```
- If the buffer is active in the current window it will show a `%` before the file
- Some more information about a buffer is also shown by the following flags:
	- `%` : Buffer which is in the current window
	- `#` : Alternate buffer (the last file which was most recently edited in the current window)
	- `a` : Active buffer (the file which is being edited in the current window)
	- `h` : Hidden buffer (buffer with unsaved modifications but is not being displayed in any window)
	- `u` : Unlisted buffer (files that are not open in Vim but are present in the current working directory; use `:ls!` to view this)
	- `-` : Buffer with 'modifiable' set to off
	- $=$ : A read-only buffer
	- `+` : A modified buffer (buffer with changes that are not written to disk)
	- `x` : A buffer that has read errors

### Deleting Buffer
- `:bdelete <filename>` `:bd <filename>` - Is used to delete 
- Deleting multiple buffers at once
	- `:1,4bd` - you can delete a range of buffers, here 1,2,3,4


### Moving Between Buffers
- Switch using buffer number
	-  `:buffer3` or `:b3` - Switch to 3rd buffer
- Switch to next buffer
	- `:bnext` or `:bn`
- Switch to previous buffer
	- `:bprevious` or `:bp`
- Switch to first buffer
	- `:bfirst` or `:bf`**
- Switch to last buffer
	- `:blast` or `bl`
- Switch to buffer by files name
	- `:b {filename}`


### Hiding Buffers
 - When you try to switch between buffers when you have modified the active buffer, Vim will ask if you want to discard changes or save them, before switching to another buffer.
 - That can be quite annoying. To disable that message (per buffer, per session), use the `:set hidden` command.
 - This will keep the changes "in memory". Changes that you made will not be discarded, nor will they be written to disk. They will be "saved in the buffer", to be handled later on.
 - If you want this to be automatically applied to every file, it is best that you add the following line to your 'vimrc' file:
	 - `set hidden`

### Other Useful Commands
- `:ball` Open all buffers in window each in it's own horizontal split 
- `:vertical ball` Open all buffers in window each in it's own horizontal split 


### Executing Command In All Buffers
- `bufdo {cmd}`: Executes {cmd} for all buffers



### Source
https://linuxhandbook.com/vim-buffers/