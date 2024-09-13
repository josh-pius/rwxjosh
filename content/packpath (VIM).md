### General
- The `packpath` in [[VIM (Editor)]] is a list of directories where VIM looks for it's runtime files, including plugins, [[colorscheme (VIM)|colorschemes]], scripts and other resources
- It's related to `rumtimepath` but specifically related to managing VIM [[packages (VIM)]]
	- Directories that match `/pack/*/start` get added to [[runtimepath (VIM)]] on startup and whatever is in the  runtimepath is what gets loaded

### How it works
- When you add directories to packpath, Vim looks for plugins inside subdirectories of these paths. 
- Each path contains a pack folder, which in turn contains:
	- `start/` (for plugins that are automatically loaded at startup)
	- `opt/` (for optional plugins that are loaded only when needed)
- **Default Values**: The packpath often defaults to the value of runtimepath, unless explicitly set. You can check the value of packpath by running: `:echo &packpath` or `:set packpath`
- To load plugins manually from the `/opt` directory use `:packadd <plugin_name>`

### Example of Directory Structure For Packpath
```
~/.vim/pack/vendor/start/
~/.vim/pack/vendor/opt/
```