---
aliases:
  - Word Boundaries (Regex)
---
### General
- The metacharacter `\b` is an anchor like the caret and the dollar sign.
- It matches at a position that is called "word boundary"
- There are three different positions that qualify as word boundaries:
	- Before the first character in the string, if the first character is a word character.
	- After the last character in the string, if the last character is a word character.
	- Between two characters in the string, where one is a word character and the other is not a word character.
 - Exactly which characters are word characters depends on the regex flavor you’re working with.
	 - In most flavors, characters that are matched by the short-hand character class \w are the characters that are treated as word characters by word boundaries.
	 - [[Java (Programming Language)]] is an exception. Java supports Unicode for `\b` but not for `\w`.
- `\B` on the other hand matches every position that `\b` does not


### `\<` and `\>`
- `\<` and `\>` can be used to indicate end of word as well. `\b` is preferred as it is more commonly used in other regular expression implementations
	- I've used `\<` and `\>` in [[VIM (Editor)]]
- These work slightly differently from `\b`: Read [here](https://learnbyexample.github.io/learn_gnused/gotchas-and-tricks.html#word-boundary-differences) to see the difference
### Sources
https://www.regular-expressions.info/wordboundaries.html
https://learnbyexample.github.io/learn_gnused/gotchas-and-tricks.html#word-boundary-differences