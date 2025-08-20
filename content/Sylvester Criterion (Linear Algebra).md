### General
- A matrix is [[Positive Definite Matrix (Linear Algebra)]] if and only if it's [[Leading Principal Minor (Linear Algebra)|leading principal minors]] are positive

### Theorem (Sylvester’s criterion)
- Let $A$ be an $n \times n$ symmetric matrix. Then:
	- $A \succ 0$ if and only if   $\Delta_1 > 0, \; \Delta_2 > 0, \; \ldots, \; \Delta_n > 0.$
	- $A \prec 0$ if and only if   $(-1)^1 \Delta_1 > 0, \; (-1)^2 \Delta_2 > 0, \; \ldots, \; (-1)^n \Delta_n > 0.$
	- $A$ is **indefinite** if the first $\Delta_k$ that breaks both patterns has the wrong sign.
	- Sylvester’s criterion is **inconclusive** (i.e., $A$ can be positive semidefinite, negative semidefinite, or indefinite) if the first $\Delta_k$ that breaks both patterns is $0$.

### Lecture Notes
- https://misha.fish/archive/docs/484-spring-2019/ch1lec5.pdf
- The first page of these notes do a good job explaining the criterion