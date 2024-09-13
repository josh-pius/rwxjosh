### General
- A wrapper over [[VIM (Editor)]] that helps you do diff
- You can use this as the diff tool in git: `git difftool --tool=vimdiff`
- Or use it directly `vimdiff file1 file2`


### colorscheme
- if the colors make things unreadable run `:colorscheme evening`
 - or this `:colorscheme darkblue`
- Update (2024-09-10 22:43): I still found the above two unreadable
	- Found this [answer](https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff) which gave a good color scheme here's what you need to do 
- Add the following to `~/.vim/colors/mycolorscheme.vim`
```vimscript
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
```
- With this added you'll be able to switch to this [[colorscheme (VIM)]] using `:colorscheme mycolorscheme`
- To use this by default add this in your [[Vimrc (Config File)]]
```vimscript
if &diff
	colorscheme mycolorscheme
endif
```


### Copying Changes From One File to Another
- Ultimately vimdiff just gives you the two files in two panes
- You can use this to help you to selectively copy changes from one file to the other
### Metadata
2024-08-16 14:56
- I've tried it once before at work, used it again today and it helped me find why a test was breaking