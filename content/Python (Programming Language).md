### General
- Named after Monty Python

### Command Line utility
- If I ever want to create python command line utilities using Python the [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] simulation exercise scripts are a good reference
- Each simulation program takes arguments in both single and double dash format, allows for defaults, does processing, error handling etc.
	- It uses the [[OptionParser (Python Class)]]

### Python From the Command Line
- You can pipe stuff into python as follows

```
echo “Here is a string, we need to find all words of length 4” | python -c “import sys,re;match-re.findal(r’\b\w{4}\b’sys.stdin.readline()); print(match if match else ‘’”)
```

### My First Python Textbook
[[Core Python Programming (Book)]] 
### Python List Functions
[[Python List Functions]]
1. Extend
2. Sort
	1. [[Example Use of Key in Python Sort]]
3. List Comprehension (Very Powerful)
4. List Slicing

### Python Sets
[[Python Set Functions]]
1. Intersection

### Itertools
[[Itertools (Python Library)]]
1. Accumulate


### Functools
[[Python Functools Functions]]
1. Reduce

### Dictionary 
[[Dictionary (Python)]]
1. OrderedDict

## Scope
[[nonlocal keyword]]

#### Return Non-None with Or Operator
```python
a = 5
b = None
print(a or b) # Will return 5
```
- If both are non-none it will return the first value
- Used in [[236. Lowest Common Ancestor of a Binary Tree]]


#### len() has O(1) Complexity
- len() runs in constant time since python maintains the length of the array


#### Min
[[Advanced Python Min Function]] You can use key along with min or max to be able to specify what you want min or max of just like sort

#### Heapq
[[Python Heapq]]


### Unpacking Operator
[[Python Unpacking Operator]]


### Libraries
[[Pandas (Python Library)]]

### 25 Nooby Python Habits
[[25 Nooby Python Habits]]

### Code Execution Visualization
https://pythontutor.com/render.html#mode=display



### Python From Commandline
- You can quickly create a python program and run it from the linux command line using the [[Shebang (Unix)]]
```
#!/usr/bin/python3
for i in range(10):
	print(i);
```


### Raw String
- Use the format `r"Some String"` if you want to pass a raw string

- This is useful especially when you want to pass a windows path as any `\` in the path get considered an escape sequence


### Getting Dependency Version
Source: [[Brian Kirkpatrick (Youtuber)]]
- If you have a python project and it runs on your machine and you want to see the version of the dependencies you use you can do this
- Run `python` and run the commands
	- `import <someLibrary>`
	- `<someLibrary>.__version__`
- You can add these to the [[requirements.txt (Python)]]
- If your [[gevent (Python Library)]] version is 23.0, in your requirements file you can put down `gevent >=23.9`, including the minor version but not the patch (?) version