#!/bin/bash
cd ./content
sed -i '/### Notes Statistics/,$d' index.md
echo "### Notes Statistics" >> index.md
printf -- '- Total Notes Count: ' >> index.md
ls \
| sed '/index.md/d' \
| wc -l >> index.md


### Books
echo "### Books" > "Books.md"

ls \
| grep -e "(Book)" \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "Books.md"

echo "### Books" >> index.md
echo "Books.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md



### Mathematics
echo "### Mathematics" > "Mathematics.md"

ls \
| grep -e "(Mathematics)" -e "(Linear Algebra)" -e "(Statistics)" -e "(Probability)" -e "(Set Theory)" \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "Mathematics.md"

echo "### Mathematics" >> index.md
echo "Mathematics.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md


### Operating Systems
echo "### Operating Systems" > "Operating Systems.md"

ls \
| grep -e "(OS Concept)" -e "(OS)" \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "Operating Systems.md"

echo "### Operating Systems" >> index.md
echo "Operating Systems.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md

### VIM
echo "### VIM" > "VIM.md"

ls \
| grep -e "(VIM)"  \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "VIM.md"

echo "### VIM" >> index.md
echo "VIM.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md

# Linux Commands
echo "### Linux Commands" > "Linux Commands.md"

ls \
| grep "(Linux Command)"\
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "Linux Commands.md"

echo "### Linux Commands" >> index.md
echo "Linux Commands.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md

### CLI Utilities
echo "### CLI Utilities" > "CLI Utilities.md"

ls \
| grep -e "(CLI Utility)" \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "CLI Utilities.md"

echo "### CLI Utilities" >> index.md
echo "CLI Utilities.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md

### Finance
echo "### Finance" > "Finance.md"

ls \
| grep -e "(Finance)" -e "(Portfolio Management)" \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "Finance.md"

echo "### Finance" >> index.md
echo "Finance.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md


### Programming Language
echo "### Programming Language" > "Programming Language.md"

ls \
| grep -e "(Programming Language)"  \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "Programming Language.md"

echo "### Programming Language" >> index.md
echo "Programming Language.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md




### Regex
echo "### Regex" > "Regex.md"

ls \
| grep -e "(Regex)" -e "(regex)"  \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> "Regex.md"

echo "### Regex" >> index.md
echo "Regex.md" \
| sed 's/.md//g'  \
| sed 's/.*/- [[&]]/' \
>> index.md


# ls \
# | sort -t '(' -k3,3n -k2,2r \
# | sed '/index.md/d' \
# | sed 's/.md//g'  \
# | sed 's/.*/- [[&]]/' \
# >> index.md
