#!/bin/bash
cd ./content
sed -i '/### Notes/,$d' index.md
echo "### Notes" >> index.md
printf "Count: " >> index.md
ls \
| sed '/index.md/d' \
| wc -l >> index.md
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
| grep "(CLI Utilities)"\
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


### Mathematics
echo "### Mathematics" > "Mathematics.md"

ls \
| grep -e "(Mathematics)" -e "(Linear Algebra)" \
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


# ls \
# | sort -t '(' -k3,3n -k2,2r \
# | sed '/index.md/d' \
# | sed 's/.md//g'  \
# | sed 's/.*/- [[&]]/' \
# >> index.md
