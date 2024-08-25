### General
-  In Vim, the argument list (args list) is a collection of files you specify when starting Vim or when you explicitly define it during a Vim session. 
- This list provides a convenient way to work with multiple files.
- Args came before buffers and so are more fundamental
	- This is why moving to next file in args list (`:n`) is easier than moving to next file in buffers (`:bn`)

### Commands
- `:args` shows current list of files in args list
- `:argsdo {cmd}` Allows you to execute command across all files in args list 
- `:arga {filename}` Add `{filename}` to arg list
- `argl {files}` Make a local arg copy via `{files}`
- `:n` Go to next file based on args list
- `:argd {filename}` - Delete file from argument list
- `:argd *` - Remove all files from argument list

### Purpose
- Though your buffer list grows as more files are opened your args list remains fixes