---
aliases:
  - $RANDOM (Bash Variable)
---

### General
- You can use this variable to generate a random numbers in bash between 0 and 32767


### Average of Random Numbers
- For learning purposes I was playing around with this along with [[xargs (Linux Command)]] , [[sed (CLI Utility)]] and [[bc (CLI Utility)]] to create a script that summed up a 100 random numbers
```bash
for i in {1..100}; do echo $RANDOM; done \
| xargs echo \
| sed 's/ /+/g' \
| bc
```
- With a bit of modification I was able to do the average of a bunch of random numbers
```bash
for i in {1..10000}; do echo $RANDOM; done \
| xargs echo \
| sed -e 's/ /+/g' -e 's/^/(/' -e 's/$/)\/10000/' \
| bc
```