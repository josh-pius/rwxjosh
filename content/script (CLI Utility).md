### General
- Make typescript of terminal session

### Metadata
2024-07-30 09:09
- Recommended by [[ChatGPT]] when I was unable to grep output from [[strace (Linux Command)]]
- [[unbuffer (CLI Utility)]] worked but this didn't
- This was chatgpt's example
```
script -q -c "my_command" /dev/null | grep "search_term"
```
