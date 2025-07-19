### General
- Great CLI utility for handling [[Javascript Object Notation (JSON)|JSON]], with it's own [[Functional Programming (Programming Paradigm)|Functional Language]]
- [[ijq (CLI Utility)]] is the same but interactive
- For [[YAML]]: [[yq (CLI Utility)]]
- For [[HTML (Software)]]: [[pup (CLI Utility)]]
- The original implementation of jq was in [[Haskell (Programming Language)]] before being immediately ported to [[C (Programming Language)]] for performance reasons


### JQ Playground Online
https://jqterm.com/?query=.
https://jqplay.org/



### Official Manual
https://jqlang.github.io/jq/manual/

### Flags
- `-c` Compact the data
- `-r` Raw output
- `-n` tells `jq` to use 'null' as the single input value (effectively saying "don't expect any input") (saw it used here https://qmacro.org/blog/posts/2022/03/25/understanding-jq's-reduce-function/)
	- Super useful when you just want to play around with a raw jq command, something I've done during writing commands to test with toy examples before I use it in a script

### Passing Data
- Like with any other filter you can pass data from a file or from [[Stdin (Unix)]]
```
echo "{"foo":"bar"}" | jq .
jq . < file.jsonwsl
```

### Just Print the JSON
- `.` is the identity operator
```bash
jq . my.json
```

### Object Identifier-Index
Source: [[#Official Manual]]
- Assuming the json has a key `foo` the simplest useful filter is `.foo`
- A filter of the form `.foo.bar` is equivalent to `.foo | .bar`
- This syntax does not work if the key starts with a number of has spaces or special characters, in which case you need to surround by double-quotes `."foo$"` or `.["foo$"]`

### Array Index
Source: [[#Official Manual]]
- When the index value is an integer `.[<number>]` can index arrays. Arrays are zero-based, so `.[2]` returns the third element.
- Negative indices are allowed with -1 referring to the last element, -2 second last and so on


### Array/String Slice
Source: [[#Official Manual]]
- `.[<number>:<number>]` syntax can be used to return a subarray or substring of a string.

### Array/Object Value Iterator
Source: [[#Official Manual]]
- If you use the `.[index]` syntax but omit the index entirely, it will return all of the elements of the array.
- Running `.[]` with the input `[1,2,3]` will produce the numbers as three separate results, rather than a single array. A filter of the form `.foo[]` is equivalent to `.foo | .[]`
- If used on an object it will return all the values of the object


### Comma
Source: [[#Official Manual]]
- If two filters are separated by a comma, then the same input will be fed into both and the two filters' output value streams will be concatenated in order: first, all of the outputs produced by the left expression, and then all of the outputs produced by the right. For instance, filter `.foo, .bar`, produces both the "foo" fields and "bar" fields as separate outputs.
- If the command contains pipes you may need to wrap the command in parentheses

### Pipe
- The pipe operator combines two filters by feeding the output of the one on the left into the input of the one on the right
- If the one on the left produces multiple results, the one on the right will be run for each of those results. So, the expression `.[] | .foo` retrieves the "foo" field of each element of the input array. This is a cartesian product, which can be surprising.


### Object Construction
- Like JSON, `{}` is for constructing objects (aka dictionaries or hashes), as in: `{"a": 42, "b": 17}`.
- Putting parentheses around the key means it will be evaluated as an expression. 
- Example `{(.user): .titles}` returns `{"stedolan": ["JQ Primer", "More JQ"]}`


### Recursive Descent
- The `..` recursively descends and produces every value, it is the same as the zero argument recurse built-in function
- It didn't work as per my expectations though, I figured that I'd be able to find the value of any nested field quickly using `.. | .key` but that didn't work
- The manual says that it is particularly useful in conjection with the **path**() built-in command and "?" operator. Not sure how though

### Addition
- The operator `+` takes two filters, applies them both to the same input, and adds the results together. What "adding" means depends on the types involved:
- **Numbers** are added by normal arithmetic.
- **Arrays** are added by being concatenated into a larger array.
- **Strings** are added by being joined into a larger string.
- **Objects** are added by merging, that is, inserting all the key-value pairs from both objects into a single combined object. If both objects contain a value for the same key, the object on the right of the `+` wins. (For recursive merge use the `*` operator.)

### Subtraction
- The `-` operator can be used on arrays to remove all occurances of the second array form the first, it can also be used for normal arithmetic

### Multiplication, Division, Modulo
- Multiplying a string by a number produces the concatenation of that string that many times. `"x" * 0` produces `""`.
- Dividing a string by another splits the first using the second as separators.
 - Multiplying two objects will merge them recursively: this works like addition but if both objects contain a value for the same key, and the values are objects, the two are merged with the same strategy.

### Conditional Expressions
- Prior to v1.6 else clause is mandatory, it's no longer mandatory from and after 1.7
```jq
if . < 50 then "small" else big end
```

```jq
42 | if . < 33 then "small"
     elif . < 66 then "medium"
     else "big"
     end
# => "medium"
```
 - The only "false" values in [[Jq (CLI Utility)]] are false and null
	 - Everything else including empty string, 0, array , object are true

### Boolean Operators/Logical Operators
- `and` and `or` are boolean operators that can be used to build complex expressions
- To negate use `not`

### Variables
- **Variable assigmnent** follows this rule: a _variable assignment_ is an expression that looks like: `expr as $varname`
- Variables must begin with `$`
- The filter outputs the input, setting the variable is a side-effect
- The scope of the variable is "lexical" -- the variable will be in scope for the rest of the pipeline. Variables defined in functions (we'll get to functions later) are "local" to the [[#User Defined Functions|function]].
- Multiple variables may be declared using a single `as` expression by providing a pattern that _matches the structure of the input_ (this is known as "destructuring").
```
[1, 2, 3] as [$a, $b, $c] 

4 as $x | 7 as $y | {$x, $y}    # => {"x":4, "y": 7}
```

### Alternative Operator `//`
Source: [[Exercism (Site)]]
- The expression `a // b` outputs `b` if `a` is false or null, otherwise it outputs `a`.
In the context of setting a variable, this is very handy for providing a default value:

```
(.input.theAnswer // 42) as $answer 
```




### Built-in Functions and Operators
1. abs
2. length
	1. The length of a **number** is its absolute value.  
	2. The length of an **array** is the number of elements 
	3. The length of an **object** is the number of key-value pairs.
3. keys, keys_unsorter
	1. The keys are sorted "alphabetically", by unicode codepoint order.
	2. When `keys` is given an array, it returns the valid indices for that array: the integers from 0 to length-1.
	3. The `keys_unsorted` function is just like `keys`, but if the input is an object then the keys will not be sorted, instead the keys will roughly be in insertion order.
4. has()
	1. Takes an index or key
	2.  Returns whether the input object has the given key, or the input array has an element at the given index.
5. in()
	1.  Inversed version of `has`.
6. map(), map_values()
	1. For any filter `f`, `map(f)` and `map_values(f)` apply `f` to each of the values in the input array or object, that is, to the values of `.[]`.
	2. map_values() returns only first value, it also returns objects if input is object
7. pick
	1.  Return only keys, nested keys or indexes that you specify
8. path(path_expression)
	1. Outputs an array representation of a path expression
9. del(Path_expression)
	1. Removes a key and it's corresponding value from an object
10. getpaths(PATHS)
	1. Given array representations of paths it returns those values
11. setpath(PATHS; value)
	1. The builtin function `setpath` sets the `PATHS` in `.` to `VALUE`.
12. delpaths(PATHS)
	1. The builtin function `delpaths` deletes the `PATHS` in `.`. `PATHS` must be an array of paths
13. to_entries
	1. . If `to_entries` is passed an object, then for each `k: v` entry in the input, the output array includes `{"key": k, "value": v}`.
14. from_entries 
	1. `from_entries` does the opposite conversion,
15. with_entries
	1.  shorthand for `to_entries | map(f) | from_entries`
16. select(boolean_expression)
	1. The function `select(f)` produces its input unchanged if `f` returns true for that input, and produces no output otherwise.
17. halt
	1. Stops the jq program with no further outputs. jq will exit with exit status `0`.
18. paths(node_filter)
	1. `paths` outputs the paths to all the elements in its input (except it does not output the empty list, representing . itself).
	2. `paths(f)` outputs the paths to any values for which `f` is `true`. That is, `paths(type == "number")` outputs the paths to all numeric values.
19. add
	1. The filter `add` takes as input an array, and produces as output the elements of the array added together.
20. any(condition), any(generator; condition)
	1. The filter `any` takes as input an array of boolean values, and produces `true` as output if any of the elements of the array are `true`.
	2. The `any(generator; condition)` form applies the given condition to all the outputs of the given generator.
		1. Example: `any(.[]; .>100)`
21. all(condition), all(generator; condition)
	1. Similar to above but check if all are true
22. flatten, flatten(depth)
	1. The filter `flatten` takes as input an array of nested arrays, and produces a flat array in which all arrays inside the original array have been recursively replaced by their values. You can pass an argument to it to specify how many levels of nesting to flatten.
23. range(upto), range(from; upto), range(from; upto; by)
	1. The `range` function produces a range of numbers
	2. The numbers are produced as separate outputs. Use `[range(4; 10)]` to get a range as an array.
	3. Note: See how `;` is used to separate the arguments this is because `,` is a special operator used to join streams
24. tonumber
	1. The `tonumber` function parses its input as a number. It will convert correctly-formatted strings to their numeric equivalent, leave numbers alone, and give an error on all other input.
25. tostring
	1. The `tostring` function prints its input as a string. Strings are left unchanged, and all other values are JSON-encoded.
26. type
	1. The `type` function returns the type of its argument as a string, which is one of null, boolean, number, string, array or object.
27. sort, sort_by(path_expression)
	- The sort functions sorts its input, which must be an array. Values are sorted in the following order:
		- null
		- false
		- true
		- numbers
		- strings, in alphabetical order (by unicode codepoint value)
		- arrays, in lexical order
		- objects
	- sort_by may be used to sort by a particular field of an object, or by applying any jq filter. sort_by(f) compares two elements by comparing the result of f on each element. When f produces multiple values, it firstly compares the first values, and the second values if the first values are equal, and so on.
	- ` . |reverse` can be used to reverse the sorted order
28. group_by(path_expression)
	1. `group_by(.foo)` takes as input an array, groups the elements having the same `.foo` field into separate arrays, and produces all of these arrays as elements of a larger array, sorted by the value of the `.foo` field.
29. min, max, min_by(path_exp), max_by(path_exp)
	1. Find the minimum or maximum element of the input array.
30. unique, unique_by(path_exp)
	1. The `unique` function takes as input an array and produces an array of the same elements, in sorted order, with duplicates removed.
31. reverse
	1. This function reverses an array.
32. contains(element)
	1. The filter `contains(b)` will produce true if b is completely contained within the input.
	2. A string B is contained in a string A if B is a substring of A.
	3. An array B is contained in an array A if all elements in B are contained in any element in A.
	4. An object B is contained in object A if all of the values in B are contained in the value in A with the same key. All other types are assumed to be contained in each other if they are equal.
33. inside
	1. The filter `inside(b)` will produce true if the input is completely contained within b. It is, essentially, an inversed version of `contains`.
34. combinations, combinations(s)
	1. Outputs all combinations of the elements of the arrays in the input array. If given an argument `n`, it outputs all combinations of `n` repetitions of the input array.
	2. This seems like it might be super useful
35. split(str)
	1. Splits an input string on the separator argument.
36. join(str)
	1. Joins the array of elements given as input, using the argument as separator.
37. while(cond; update)
	1. The `while(cond; update)` function allows you to repeatedly apply an update to `.` until `cond` is false.
	2. Example: `jq '[while(.<100; .*2)]'`
38. repeat(exp)
	1. The `repeat(exp)` function allows you to repeatedly apply expression `exp` to `.` until an error is raised.
	2. Not able to find good uses for this
39. until(cond; next)
	1. The `until(cond; next)` function allows you to repeatedly apply the expression `next`, initially to `.` then to its own output, until `cond` is true
	2. Example: `jq '1 | until(.>1000, .*2)'`
40. recurse(f), recurse(f; condition)
	1. The `recurse(f)` function allows you to search through a recursive structure, and extract interesting data from all levels
	2. If I'm working with a recursive JSON this might be useful but otherwise I don't think it would be very useful
41. walk(f)
	1. The `walk(f)` function applies f recursively to every component of the input entity. When an array is encountered, f is first applied to its elements and then to the array itself; when an object is encountered, f is first applied to all the values and then to the object.
	2. If you have an array of arrays this can be useful to sort the inner arrays
	3. Example
		1. Input: `[ { "_a": { "__b": 2 } } ]`
		2. Script: `jq 'walk( if type == "object" then with_entries( .key |= sub( "^_+"; "") ) else . end )'`
		3. Output: `[{"a":{"b":2}}]`
42. transpose
	1. Transpose a possibly jagged matrix (an array of arrays). Rows are padded with nulls so the result is always rectangular
	2. Seems useful
43. `\(exp)` - String interpolation
	1. Inside a string, you can put an expression inside parens after a backslash. Whatever the expression returns will be interpolated into the string.
44. `builtins`
	1. Returns a list of all builtin functions in the format `name/arity`. Since functions with the same name but different [[Arity (Computer Science)|arity]] are considered separate functions, `all/0`, `all/1`, and `all/2` would all be present in the list.
	2. Example `jq -n 'builtins'`

### User Defined Functions
- You can define your own **custom functions** in `jq` to encapsulate whatever logic you need.
- _Functions_ act just like builtins: they take an input and emit zero, one or more outputs.
- Below is an example of a user defined function
```jq
# no arguments                    
def funcname: expression;         
                                  
# or with arguments               
def funcname(args): expression;   
```
- Note functions arguments are separated by [[semicolon (Keyboard character)]] not comma
- Function _arguments_ are filters, not values. In this sense, they act like what other languages describe as callbacks: Using the `add_mul` function as an example:
```jq
10 | add_mul(. + 5; . - 2)    # => 200   
```
- Sometimes you'll want to "materialize" an _argument_ into a variable:
```jq
def my_func(arg):       
    arg as $arg         
    | other stuff ...   
;                       

```
- There's a shorthand for this:
```jq
def my_func($arg):    
    other stuff ...   
;                     
```
- _Functions_ can use the same name with different [[Arity (Computer Science)|Arity (Mathematics)|arities]].
	- The builtin [`range`](https://jqlang.github.io/jq/manual/v1.7/#range) function demonstrates this: `range/1`, `range/2` and `range/3` all co-exist.

```jq
# Task 2: calculate the number of working items produced per minute
def working_items_per_minute:
  # remove the constant and implement this function
  if   . >= 10 then 0.77 * . * 221
  elif . >=  9 then 0.8  * . * 221
  elif . >=  5 then 0.9  * . * 221
  else . * 221
;
```
- Importing functions from another file
	- Here the `needs_license` function was declared in the `vehicle-purchase.jq` file
	- Note the use of [[here-strings (Bash)]] here
```
run jq -R 'include "vehicle-purchase"; needs_license' <<< 'car'
```

### Recursion
- [[Recursion (Programming)]]: [[Jq (CLI Utility)]] performs [[Tail Recursion (Programming)|Tail Call Optimization (TCO)]] but only for 0-arity functions

### Regex
- See [[Regular Expression (Regex)|Regex]]
- jq incorporates the [[Oniguruma (Regex Library)]] regex library that is largely compatible with Perl v5.8 regexes. (i.e. [[Perl-compatible Regular Expression (PCRE)]])
- jq does not have any special syntax for regular expressions. They are simply expressed as strings. That means that any backslashes in the regular expression need to be escaped in the string.
	- For example, the digit character class (\d) must be written as `\\d`.
- When you need to know if a string matches a pattern, use the test filter.
```
STRING | test(REGEX)
STRING | test(REGEX; FLAGS)
STRING | test([REGEX, FLAGS])
```
- When you need to extract the substring that actually matched the pattern, use the match filter. Outputs nothing if no match, else outputs an object with various properties if there is
```
STRING | match(REGEX)
STRING | match(REGEX; FLAGS)
STRING | match([REGEX, FLAGS])

# Example
jq -n '"(+45) 659-771-594" |  match("\\d{3}-\\d{3}-\\d{3}") | .string'

```
- Similar to the match filter, the capture filter returns an object if there was a match.
```
STRING | capture(REGEX)
STRING | capture(REGEX; FLAGS)
STRING | capture([REGEX, FLAGS])

# Example
"JIRAISSUE-1234" | capture("(?<project>\\w+)-(?<issue_num>\\d+)")
# => {
#      "project": "JIRAISSUE",
#      "issue_num": "1234"
#    }

```
- The scan filter is similar to match with the "g" flag.
```
STRING | scan(REGEX)
STRING | scan(REGEX; FLAGS)

# Example
"Goodbye Mars" | scan("[aeiou]")
# => "o"
#    "o"
#    "e"
#    "a"
```
- If you know the parts of the string you want to keep, use match or scan. If you know the parts that you want to discard, use split.
```
STRING | split(REGEX; FLAGS)
```
- The 1-arity split filter treats its argument as a fixed string.
	- To use a regex with split, you must provide the 2nd argument; it's OK to use an empty string.
- The sub and gsub filters can transform the input string, replacing matched portions of the input with a replacement string.
	 - To replace just the first match, use sub. To replace all the matches, use gsub.
	 - The replacement text can refer to the matched substrings; use named captures and string interpolation.
```
STRING | sub(REGEX; REPLACEMENT)
STRING | sub(REGEX; REPLACEMENT; FLAGS)
STRING | gsub(REGEX; REPLACEMENT)
STRING | gsub(REGEX; REPLACEMENT; FLAGS)

# Example
"Some 3-letter acronyms: gnu, csv, png"
| gsub( "\\b(?<tla>[[:alpha:]]{3})\\b";     # find words 3 letters long
        "\(.tla | ascii_upcase)" )          # upper-case the match
# => "Some 3-letter acronyms: GNU, CSV, PNG"
```
- Flags
	- `g` - Global search (find all matches, not just the first)
	- `i` - Case insensitive search
	- `m` - Multi line mode ('.' will match newlines)
	- `n` - Ignore empty matches
	- `p` - Both s and m modes are enabled
	- `s` - Single line mode ('^' -> '\A', '$' -> '\Z')
	- `l` - Find longest possible matches
	- `x` - Extended regex format (ignore whitespace and comments)


### Converting to/From Json
- The `@foo` syntax can be used to format and escape strings
1. `@text`
2. `@json` - Serializes input as json
3. `@html` -Applies HTML/XML escaping, by mapping the characters `<>&'"` to their entity equivalents `&lt;`, `&gt;`, `&amp;`, `&apos;`, `&quot;`.
4. `@uri` -Applies percent-encoding, by mapping all reserved URI characters to a `%XX` sequence.
5. `@csv`
6. `@base64` -The input is converted to [[Base64 (Encoding)]] as specified by RFC 4648.
7. `@base64d`
8. `@tsv` - The input must be an array, and it is rendered as [[Tab Separated Values (TSV)]] (tab-separated values). Each input array will be printed as a single line. Fields are separated by a single tab (ascii `0x09`). Input characters line-feed (ascii `0x0a`), carriage-return (ascii `0x0d`), tab (ascii `0x09`) and backslash (ascii `0x5c`) will be output as escape sequences `\n`, `\r`, `\t`, `\\` respectively.
9. `@sh` - The input is escaped suitable for use in a command-line for a [[POSIX]] shell. If the input is an array, the output will be a series of space-separated strings

### Dates
- The `fromdateiso8601` builtin parses datetimes in the ISO 8601 format to a number of seconds since the [[Unix Epoch]] (1970-01-01T00:00:00Z). The `todateiso8601` builtin does the inverse.
	- `fromdate` and `todate` are aliases
- This seems super useful for work
- `echo "\"2024-01-01T00:00:00Z\"" | jq 'fromdateiso8601'` - 1704067200


### SQL-Style Operators
[[SQL-Style Operators (jq)]]

### Comparisons
- ==  and `!=` can be used for equality comparison
- >, >=, <=, < 
	- The comparison operators >, >=, <=, < return whether their left argument is greater than, greater than or equal to, less than or equal to or less than their right argument (respectively).

### Conditionals
- `if A then B else . end`
	- `else`  is optional. `if A then B end` is the same as `if A then B else . end`.

### Logical Operators
- jq supports the normal Boolean operators `and`, `or`, `not`

### reduce
- The reduce syntax in jq allows you to combine all of the results of an expression by accumulating them into a single answer.
- Article explaining the reduce function: https://qmacro.org/blog/posts/2022/03/25/understanding-jq's-reduce-function/
- This method of dividing the problem into smaller pieces can also be described as "reducing towards the base case."
- Reduce is a way to combine all the elements of a data structure into a single value. The process iterates over the data structure, applying a function to each element to update the accumulated result.
- In jq, this process is implemented in the reduce filter. In other languages, it might be called "fold", "fold-left", "inject", or "aggregate".
- Syntax
```
reduce STREAM_EXPRESSION as $var (INITIAL_VALUE; UPDATE_EXPRESSION)
```
- Example: 
```jq
[10, 20, 30, 40] | reduce .[] as $n (0; . + $n)  # Adding numbers
reduce .[] as $elem ([]; [$elem] + .)   #reversing an array
 # Adding together all values of json object
{"apple": 10, "banana": 16, "carrot": 4}                        
| . as $obj                                                     
| reduce (keys | .[]) as $key (0; . + $obj[$key])     # => 30   

```
- The `add` builtin is actually implemented with reduce, but uses "null" as the initial state (any data type can be added to null).


### halt_error
```
def array_reverse:
  "Implement this as a recursive function." | halt_error;
```


### Math with JQ
- `echo 1 | jq '(. + 2)*5' 1` outputs 15
- `echo [1,2,3] | jq '.[] |(. + 2)*5'` outputs 15, 20, 25
- `echo [1,2,3] | jq '[ .[] | . *2 ]` stores output in an array [[#Array Construction]]

### Extraction
```json
{
	"timestamp": 1234567890,
	"report": "Age Report",
	"results": [
		{ "name": "John", "age": 43, "city": "TownA" },
		{ "name": "Joe",  "age": 10, "city": "TownB" }
	]
}
```
- To extract top level attributes “timestamp” and “report” 
	- `jq '. | {timestamp, report}'`
- To extract name and age of each “results” item
	- `jq '.results[] | {name, age}`
- To extract name and age as text values instead of JSON
	- `jq -r '.results[] | {name, age} | join(" ")'`

### Filtering
```bash
# Get age for 'John'
jq '.results[] | select(.name == "John") | {age}'          
# Get complete records for all 'Joe' aged 10
jq '.results[] | select((.name == "Joe") and (.age = 10))' 
# Get complete records for all names with 'Jo'
jq '.results[] | select(.name | contains("Jo"))'           
# Get complete records for all names matching PCRE regex 'Joe\+Smith
jq '.results[] | select(.name | test("Joe\\s+Smith"))'     
```
- Avoid `null` output when accessing non-existing keys
```bash
jq '.mykey | select(. != null)'
```
### JSON to CSV Conversion
Source: https://www.baeldung.com/linux/json-csv
- See [[Comma Separated Values (CSV)]]
- Motivation: I usually use Excel to achieve this but was wondering if I could do it more easily on the command line
- Tried an example json (example 2 [here](https://opensource.adobe.com/Spry/samples/data_region/JSONDataSetSample.html)) where it's a JSON array and managed to convert to csv using just [[Jq (CLI Utility)]]
	- `jq -r '.[] | [.color, .value] | @csv' data.json > data.csv`
- The key part to this is `| @csv` to convert to csv and `-r` so that it doesn't escape quotes and surround in quotes


### Array Construction
- Use `[]` to collect all the results into a json array
- Example: [[#Math with JQ]](3)




### Keys
- List the top levels keys of a json
- `jq 'keys' file.json`


### Jq Written in Jq
- Jq implemented using jq
https://github.com/wader/jqjq


### Set Operations Using JQ
1. Union
```
jq -n '[1, 2, 3] + [3, 4, 5] | unique'
```

2. Intersection
```
jq -n '[1, 2, 3] as $a | [3, 4, 5] | map(select(IN($a[])))'
```
3. Difference
```
jq -n '[1, 2, 3] - [2, 3, 4]'
```

4. Symmetric difference
 ```
 jq -n '([1, 2, 3] - [2, 3, 4]) + ([2, 3, 4] - [1, 2, 3]) | unique'
```



### Parsing Issue Control Characters U+000x
- One way I found to resolve this error is to select all the  text in VIM and join it using `J`
- After then when I did `:%!jq` it worked

### Summarize Keys At All Levels
- To recursively extract keys from nested objects, you can use a more advanced jq filter
```
jq 'paths | map(tostring) | join(".")' file.json

```


### Recursively Find All Objects in JSON with A Given Key
- If you want to find all objects in a nested [[Javascript Object Notation (JSON)|JSON]]  that have a particular key or value, you can use a search pattern. For example, to find all keys named city anywhere in the JSON:
```bash
jq '.. | objects | select(has("city"))' file.json
```

### Remove All Keys Except ones That you Want From a Nested JSON
- Say you have a structure like this
```json
{
  "ABC": { "100": 20.3, "200": 32.4 },
  "DEF": { "100": 23.3, "200": 12.4 }
} 
```

- You can  remove all key-values except 100 using this command
```sh
jq 'with_entries(.value |= { "100": .["100"] })'
```


### Find Index of Null Value in JSON Array
```sh
echo '[1,2,null, 4, null]' | jq 'indices(null)'
```



### $ARGS
- In jq, $ARGS is a special variable that provides access to command-line arguments passed to jq using the --arg or --argjson options, as well as the filenames when processing multiple files
- `$ARGS` is an object with the following structure
```json
jq -cn '$ARGS' --args "Hello" "World"

{
  "positional": [...], // An array of positional arguments
  "named": {...}       // An object containing named arguments
}
```

- You can even pass another JSON as an argument 

```json
map='{"1": "GOOD", "2": "BAD"}'
api='{"name": "someJob", "status": "1"}'

echo "$api" | jq --argjson map "$map" '.status = $map[.status]'
```


### JSON Diff
[[Javascript Object Notation (JSON)|JSON]]
- Be default tools like [[vimdiff (Diff Tool)]] compare diffs line by line, and JSONs files though semantically the same might order things differently
- To ensure you get a proper diff you can use [[Jq (CLI Utility)]] to sort the JSON files and then run a diff through it
```
jq -S . file1.json > sorted1.json
jq -S . file2.json > sorted2.json
diff -u sorted1.json sorted2.json

```


### JSON diff and patch
- There is a more specialized tool for JSON diff and patch
	- [[jd (CLI Utility)]]

### Mastering JQ
Source: [[Sundeep Agarwal (Learn By Example)(Programmer)]] newsletter
https://codefaster.substack.com/p/mastering-jq-part-1-59c
	
### Sources
https://lzone.de/cheat-sheet/jq

