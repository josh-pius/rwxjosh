### General
- With a “character class”, also called “character set”, you can tell the regex engine to match only one out of several characters. Simply place the characters you want to match between square brackets. If you want to match an a or an e, use `[ae]`. You could use this in gr`[ae]`y to match either gray or grey. 
- Very useful if you do not know whether the document you are searching through is written in American or British English.
- Example with [[sed (Linux Command)]]
```bash
# same as: sed -nE '/cot|cut/p' and sed -nE '/c(o|u)t/p'
$ printf 'cute\ncat\ncot\ncoat\ncost\nscuttle\n' | sed -n '/c[ou]t/p'
cute
cot
scuttle

# same as: sed -nE '/.(a|e|o)t/p'
$ printf 'meeting\ncute\nboat\nat\nfoot\n' | sed -n '/.[aeo]t/p'
meeting
boat
foot
```

### Character Class Metacharacters
- Character classes have their own metacharacters to help define the sets succinctly. 
- Metacharacters outside of character classes like `^`, `$`, `()` etc either don't have special meaning or have a completely different one inside the character classes.
- First up, the `-` metacharacter that helps to define a range of characters instead of having to specify them all individually.
	- Specific placement is needed to match character class metacharacters literally.
	 - Should be the first or the last character.
```bash
# same as: sed -E 's/[0123456789]+/-/g'
$ echo 'Sample123string42with777numbers' | sed -E 's/[0-9]+/-/g'
Sample-string-with-numbers

# whole words made up of lowercase alphabets and digits only
$ echo 'coat Bin food tar12 best' | sed -E 's/\b[a-z0-9]+\b/X/g'
X Bin X X X
```
- Next metacharacter is `^` which has to specified as the first character of the character class. It negates the set of characters, so all characters other than those specified will be matched. 
	- Handle negative logic with care, you might end up matching more than you wanted.
	- `^` should be other than the first character.
 