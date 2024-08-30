### General
- Strengths
	- Excellent with text processing
- Weakness:
	- Hard to read
- If you want to write powerful scripts concisely perl is preferred

### Why Learn Perl
https://stackoverflow.blog/2022/07/06/why-perl-is-still-relevant-in-2022/


### Read-Only
- Old-time Linux dev once told me that [[Perl (Programming Language)]] was write-only and not meant to be read because of how concise it is

### Why Perl
- [[Rwxrob (Youtuber)]] said that the reason Perl was created was because the Unix world couldn't get it together and decide on a common standard for regular expression
- The [[Regular Expression (Regex)]] introduced by perl was so good that most languages adopted their variety of regular expression


### Overthewire Leviathan
- I came across a [[Perl (Programming Language)]] script when I was looking for a solution to level 4 of leviathan
- This script is used to convert a binary number string to ASCII characters
	- The next levels passwords was converted to binary so I have to decode it this way
```
perl -lpe '$_=pack"B*",$_'
```

### Learn By Example: Curated Resources For Perl
https://learnbyexample.github.io/curated_resources/perl.html
