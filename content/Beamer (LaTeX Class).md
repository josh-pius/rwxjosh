### General
- See [[LaTeX (Typesetting Software)]]
- Beamer is a [[LaTeX (Typesetting Software)]] class that lets you create presentations
- I've seen this format used in academic circles
- It supports [[pdftex (CLI Utility)|pdflatex (CLI Utility)]]

### User Guide
https://in.mirrors.cicku.me/ctan/macros/latex/contrib/beamer/doc/beameruserguide.pdf
### What it looks like
![[Pasted image 20240831231952.png]]https://en.wikipedia.org/wiki/Beamer_(LaTeX)


### MIT Slides on Creating Presentation with Beamer
https://web.mit.edu/rsi/www/pdfs/beamer-tutorial.pdf


### Presentation From Markdown
- If you want to convert [[Markdown (Language)]] straight to [[PDF (File Format)]] use this command
```bash
pandoc <filename>.md -t beamer -o <filename>.pdf
```
- If you want to see the intermediate latex as well use this command
```bash
pandoc -s "Jq (CLI Utility).md" -t beamer -o jq.tex
pdflatex jq.tex
```