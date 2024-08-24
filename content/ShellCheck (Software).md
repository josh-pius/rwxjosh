### General
- _ShellCheck_ is an open source static analysis tool that automatically finds bugs in your shell scripts.
- [[Rwxrob (Youtuber)]] calls it the best thing in the last 20 years for unix operations people
- Can be used to check the safety and syntax of [[Bourne Shell (sh)]] and [[Bash (Programming Language)]] scripts
- Has some powerful parsing, written in [[Haskell (Programming Language)]]

### Disable
- [[Rwxrob (Youtuber)]] was able to get shell check to ignore certain errors by adding a comment with this kind of format 
- Here SC2049 is a particular rule
```
# shellcheck disable=SC2049
```