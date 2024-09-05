---
aliases:
  - Escape Sequence Sets (Regex)
---

### General
- Since certain character classes are used often, a series of shorthand character classes are available.
- [[Sundeep Agarwal (Learn By Example)(Programmer)]] calls it Escape Sequence Sets


### Digit Character
- `\d` is short for `[0-9]`. In most flavors that support Unicode, `\d` includes all digits from all scripts.
	- Notable exceptions are [[Java (Programming Language)]], [[Javascript (Programming Language)]], and [[Perl-compatible Regular Expression (PCRE)]]. These [[Unicode (Software)]] flavors match only ASCII digits with `\d`.


### Word Character
- `\w` stands for “word character”. It always matches the ASCII characters `[A-Za-z0-9_]`. Notice the inclusion of the underscore and digits. In most flavors that support Unicode, `\w` includes many characters from other scripts. 
- There is a lot of inconsistency about which characters are actually included. Letters and digits from alphabetic scripts and ideographs are generally included
- `\W` matches all non-word characters (recall duality seen earlier, like `\b` and `\B`)

### Whitespace Character
- `\s` stands for “whitespace character”. 
- Again, which characters this actually includes, depends on the regex flavor. 
- In all flavors discussed in this tutorial, it includes `[ \t\r\n\f]`. 
- That is: `\s` matches a space, a tab, a carriage return, a line feed, or a form feed.
- `\S` matches all non-whitespace characters


### Sources
https://www.regular-expressions.info/shorthand.html