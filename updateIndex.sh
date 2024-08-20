#!/bin/bash
cd ./content
sed -i '/### Notes/,$d' index.md
echo "### Notes" >> index.md

ls \
| sort -t '(' -k3,3n -k2,2r \
| sed '/index.md/d' \
| sed 's/.md//g'  \
| sed 's/.*/[[&]]/' \
>> index.md
