http://www.paulgraham.com/icad.html

### Defining a Method
```
(DEFINE (SQUARE X) (* X X))

or 

(DEFINE SQUARE (LAMBDA (X) (* X X)))
```
- The Lambda key word here just means - Make a procedure
- The above two expressions do the same thing
	- The first is just [[Syntactical sugar]]  for the second

### Conditional Expressions
```
(DEFINE (ABS X)
 (COND ((< X 0) (- X))) // This is a conditional clause
	 ((= X 0) 0)
	 ((> X 0) (X))
```
 - This construct is also called "case analysis"
 - Each `(<p>,<e>)` here is called a clause
 - `<p>` is the predicate
```
(DEFINE (ABS X)
	(IF (< X 0)
		(- X)
		X))
```

### Why I Still Lisp Article
https://betterprogramming.pub/why-i-still-lisp-and-you-should-too-18a2ae36bd8