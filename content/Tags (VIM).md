### General
- Having tags enabled lets you navigate projects with just `Ctrl + ]` and `Ctrl + t`
- You can create the tags file using [[ctags (CLI Utility)]]
- Setting the tags option
	- If you open VIM from the root directory of the project VIM locates the tags file by default at `./tags`
	- if it's unable to detect then `set tags=./tags` sets the tag file
- Navigate using tags
	- You can hover over a function and press `Ctrl + ]` to jump to definition
	- You can use `:tag <tagname>` to jump to a specific tag
	- After jumping you can return using `Ctrl + t`
	- `Ctrl + ]` takes you to first tag that matches but if there's more than one and you'd like to select use `g Ctrl + ]`
- Search for tags
	- Use `:tselect <tagname>` to get a list of tags matching `<tagname>`
	- Use `:tjump <tagname>` to get vim to automatically jump when there's only one match or show a list when multiple matches
- Autocompletion
	- VIM can use tags for autocompletion. Press `Ctrl + P` or `Ctrl + N` to cycle through matching tags
- How to use tags in VIM to quickly jump to definition
	- https://dev.to/iggredible/how-to-use-tags-in-vim-to-jump-to-definitions-quickly-2g28