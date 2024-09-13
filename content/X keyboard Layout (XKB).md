### General
- Related to [[X keyboard Layout (XKB)]]
- People modify their XKB (X Keyboard Extension) settings for several reasons, typically to customize how their keyboard behaves beyond the default layout provided by their operating system
	- Custom Keyboard Layouts: To type in multiple languages or create unique layouts suited to personal preferences.
	- Access to Special Characters: To easily map less common symbols or Unicode characters to specific keys.
	- Remapping Keys: For ergonomic reasons, or to fix or swap key functions (e.g., Caps Lock to Ctrl).
	- Creating Shortcuts or Macros: For improved productivity by assigning complex tasks to simple key combinations.
	- Disabling Unwanted Keys: To prevent accidental use of disruptive keys like Caps Lock or the Windows key.
	- Accessibility: To accommodate specific accessibility needs or simplify key combinations.


### Configuring XKB
https://people.uleth.ca/~daniel.odonnell/Blog/custom-keyboard-in-linuxx11


### Metadata
2024-09-05 14:23
- Came across it first here https://www.reddit.com/r/vim/comments/r6hu2/digraphs/
- I'm pretty sure this may not be the right place for this note but I'll refactor as I better understand this X11 stuff
- Here's the interaction that got me looking into this
```
You can also insert unicode characters by pressing Control+v, then u followed by a four digit unicode-code. For example, u2264 will give you the ≤ symbol. I like it to add unicode math symbols in my comments in programming code and while typing plain text. For a table of math symbols in unicode, see http://unicode.org/charts/PDF/U2200.pdf (PDF file, page 2).

I like doing that as well, but instead of relying on a vim feature I've modified the X keyboard layout (in /usr/share/X11/xkb) and added custom characters for the third and fourth levels (altgr+key and altgr+shift+key, respectively). The upside with doing it that way is that those shortcuts work in all programs, and not just vim. :3

Sounds handy; can you explain in some more detail how I can do the same?

The symbol files are in /usr/share/X11/xkb/symbols/. The format is loosely documented in this rather huge guide, but you don't have to read through all of it. It's a good place to look up stuff when you're curious what something in a symbols file means, though. The key "names" (like "p", "comma", "tab", "adiaeresis" and so on) are called "keysyms", and there's a list of them in /usr/include/X11/keysymdef.h. In addition to those, you can also use e.g. "U1234" as a keysym for the unicode character U+1234.
I also remember that these two resources has helped me before:
http://hektor.umcs.lublin.pl/~mikosmul/computing/articles/custom-keyboard-layouts-xkb.html
http://people.uleth.ca/~daniel.odonnell/Blog/custom-keyboard-in-linuxx11

Good luck, have fun. :-)
```
- I realized that [[Windows Subsystem For Linux (WSL)]] has this folder and I should be able to do it in WSL as well
### Resources
http://hektor.umcs.lublin.pl/~mikosmul/computing/articles/custom-keyboard-layouts-xkb.html
http://people.uleth.ca/~daniel.odonnell/Blog/custom-keyboard-in-linuxx11