---
aliases:
  - Setting Options (VIM)
---
### General
- VIM Has many options
- There are two main kinds of options
	- Those that take a Boolean (true/false)
	- Those that take a value


### Toggling Boolean options
- You can "toggle" a boolean option using `!`
```
set number!
```


### Checking Options
- You can check the value of an option using `?`
```
:set number?
```

### Options with Values
- Options with values can be set as follows
```
:set numberwidth=4
```