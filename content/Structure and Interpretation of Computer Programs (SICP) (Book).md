---
aliases:
  - SICP
---

### General
- Book by [[Gerald Jay Sussman (Professor)]], [[Harold Abelson (Professor)]], [[Julie Susseman (Professor)]]
https://web.mit.edu/6.001/6.037/sicp.pdf

###  Videos Resources to Complement the Book
https://www.youtube.com/watch?v=oA-FdE3KV88&list=PLVFrD1dmDdvdvWFK8brOVNL7bKHpE-9w0


### Solutions To SICP Problems
http://community.schemewiki.org/?sicp-solutions
https://sicp-solutions.net/


### Associated Video Lectures
https://www.youtube.com/playlist?list=PLE18841CABEA24090



### Imperative Knowledge vs Declarative Knowledge
- Imperative Knowledge - "What is true"
	- eg. Sqrt of X is the Y such that $Y^2 = X$ and $Y>=0$
- Declarative Knowledge - "How to"
	- Approximates Sqrt X
		- Make guess G
		- Improve guess by averaging G and (X/G)
		- Keep improving until the guess is good enough

### Techniques For Controlling Complexity
- All engineers try to control complexity but in computer science we're not dealing with real world things like transistors or bridges but abstract entities which behave exactly as we tell them to
1. Black-Box Abstraction
2. Conventional Interfaces


### Important Things to Look For In A Language
1. Primitives
2. Means of Combination
3. Means of Abstraction


### Iteration Through Procedure
- Example like computing square root illustrate how iteration can be accomplished with no special construct other than ordinary ability to call a procedure


### Variables
- These are just definitions I found online, the book introduces these terms in context
1. Free variable: A variable that is not bound is called free
2. Bound variable: The formal parameters of a procedure are called bound variable

### Iterative vs Recursive Process
See [[Iteration (Programming)]] and [[Recursion (Programming)]]
- In general, an iterative process is one whose state can be summarized by a fixed number of state variables, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test that specifies conditions under which the process should terminate
	-  In computing $n!$, the number of steps required grows linearly with n. Such a process is called a linear iterative process
- Don't confuse the notion of a recursive process with the notion of a recursive procedure. Both iterative and recursive process might be implemented using recursion, eg. `fact-iter` uses a recursive procedure to compute factorial iteratively
