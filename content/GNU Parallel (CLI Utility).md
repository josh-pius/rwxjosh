### General
Sources: [[OMGenomics (Youtuber)]]
- Something [[ThePrimegen (YouTuber)]] said people need to learn
- A package that helps you build and execute shell scripts form standard input in parallel
- I've only explored the basis there's probably a lot more I can do with this utility

### Design
https://www.gnu.org/software/parallel/parallel_design.html
- It's a [[Perl (Programming Language)]] script in a single file

### Cool Example of GNU Parallel
https://www.gnu.org/software/parallel/parallel_examples.html#example-finding-the-lowest-difference-between-files  (Capturing only a few below)
1. Finding the lowest difference between files
```
parallel --tag 'diff {1} {2} | wc -l' ::: * ::: * | sort -nk3
```


### Cheat Sheet
https://www.gnu.org/software/parallel/parallel_cheat.pdf
### Flags
`--verbose` - See more info on what's running. Very useful if you're running scripts
`--jobs` or `-j` - You can it to limit number of jobs running at a time eg. `-j4`
`-S` running command on remote severs

### Example
```
parallel echo ::: $(seq 10)
```
- See [[Seq (Linux Command)]]

```
parallel echo ::: 1 2 3 ::: A B C
```
- Return the [[Cartesian Product (Mathematics)]] of 1,2,3 and A,B,C 

``` bash
parallel --jobs 2 --verbose ./do-something.sh ::: 1 2 3
```
- Run the job with each of the inputs in parallel

```
parallel --verbose ./do-something.sh ${2} {$1} ::: A B C ::: 1 2 3
```
- By default the arguments to the sh script are in the order the appear so ${1}, ${2} .... but you can change that as shown above

### Resources
https://www.gnu.org/software/parallel/
https://zenodo.org/record/1146014 (Suggested book, read ch1, 2)
https://www.youtube.com/playlist?list=PL284C9FF2488BC6D1
https://opensource.com/article/18/5/gnu-parallel
https://youtu.be/ry49BZA-tgg?si=bheW9u8ekhmnFHiS video by [[ThePrimegen (YouTuber)]]
