### General
- A fuzzy search to help you search through your file


### Open A File Using Fzf
- If you just run `fzf` it will allow you to fuzzy search through all the files recursively in the directory that you're in and return the full path of the file you're looking for
- If you'd like to open result of what you searched for in fzf in VIM use `vim $(fzf)`

### Filter
- You can filter your search for files directly in fzf or through another application
- Example
	- `vim $(fzf --filter='.java')`

### Multiselect
- If you add the `-m` flag fzf allows you to multiselect
- Use tab to select and shift+tab to deselect
- Below command lets you select multiple files and pipes it to [[Xargs (Linux Command)]] to remove all of them
```
ls | fzf -m | xargs rm
```

### Preview
- You can run a command and preview the result on the file you're hovering on in fzf
- To preview use the `--preview` flag
- `{}` gets substituted with the file name
- [[Bat (CLI Utility)]]
```
fzf --preview "cat {}"
fzf --preview "batcat {}"
```
- If you have binary files in the mix
```bash
fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {})'
```

### Fzf popup Window
```
fzf --height 40% --width 80% --border
```

### Metadata
- https://www.youtube.com/watch?v=2OHrTQVlRMg
2024-02-13 04:52
- Used Fzf in a bash script I created for work
2024-02-15 01:00
- Discovered Fzf's multiselect and preview features


### Neovim FZF
https://www.youtube.com/watch?v=1TAtjr2o0X4&list=PLOe6AggsTaVsIlC4Nil-hkr5odM8SZDSt&pp=iAQB
