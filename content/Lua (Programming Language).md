### General
- Lua has three fundamental mechanisms "one for each major aspect of programming"
	- [[#Tables]]
	- [[#Closures]]
	- [[#Coroutines]]
- Apparently [[Lua (Programming Language)]] is used to write world of warcraft extensions/addons/plugins according to [[Brian Kirkpatrick (Youtuber)]]
	- https://youtu.be/HxVYMMhYQ_M?si=oSm0TOUgB0asghuQ
### Documentation In Minutes
https://learnxinyminutes.com/docs/lua/




### Tables
- Tables are the "object" or container datastructure: they represent both lists and maps, you can extend them to represent your own datatypes and change their behavior using metatables (like Python's "datamodel").

### Closures
- EVERY scope in Lua is a closure: a function is a closure, a module is a closure, a do block (lua-do) is a closure--and they all work the same. A Lua module is literally just a big closure discovered on the "path" (where your modules are found: package.cpath).


### Coroutines
- Stackful coroutines enable cooperative multithreading, generators, and versatile control for both Lua and its host (Nvim).


### Function
Lua functions can be called in multiple ways. Consider the function:
```lua
local foo = function(a, b)
    print("A: ", a)
    print("B: ", b)
end
```
The first way to call this function is:
```lua
foo(1, 2)
-- ==== Result ====
-- A: 1
-- B: 2
```
In Lua, any missing rguments are passed as `nil`, and extra parameters are silently discarded
```lua
foo(1)
-- ==== Result ====
-- A: 1
-- B: nil
```

### Lua-Patterns
- Lua intentionally does not support regular expressions, instead it has limited "patterns" lua-pattern which avoid the performance pitfalls of extended regex.
- Lua scripts can also use Vim regex via vim.regex().

### Modules
Source: https://neovim.io/doc/user/lua.html#lua-module-load
- Modules are searched for under the directories specified in ['runtimepath'](https://neovim.io/doc/user/options.html#'runtimepath')
- in the order they appear. Any "." in the module name is treated as a directory separator when searching. 
	- For a module `foo.bar`, each directory is searched for `lua/foo/bar.lua`, then `lua/foo/bar/init.lua`.



### Commands
- Commands execute a Lua chunk from either the command line (:lua, :luado) or a file (:luafile) on the given line/range. As always in Lua, each chunk has its own scope (closure), so only global variables are shared between command calls. 
- The lua-stdlib modules, user modules, and anything else on package.path are available.
- `:lua` :lua `{chunk}` Executes Lua chunk `{chunk}`. If `{chunk}` starts with "=" the rest of the chunk is evaluated as an expression and printed. `:lua =expr` or `:=expr` is equivalent to `:lua print(vim.inspect(expr))`.
```vim
#Example to see the Lua Version
:lua print(_VERSION)
# To see LuaJIT version
:lua =jit.version
```

- :lua << \[trim\] \[`{endmarker}`\] `{script}` `{endmarker}` Executes Lua script `{script}` from within Vimscript
```vim
function! CurrentLineInfo()
lua << EOF
local linenr = vim.api.nvim_win_get_cursor(0)[1]
local curline = vim.api.nvim_buf_get_lines(
        0, linenr - 1, linenr, false)[1]
print(string.format("Current line [%d] has %d bytes",
        linenr, #curline))
EOF
endfunction
```




### Resources
https://neovim.io/doc/user/lua.html#lua-concepts