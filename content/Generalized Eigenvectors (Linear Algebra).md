### General
- A generalized eigenvector is a vector that helps us understand and work with matrices that are not [[Diagonalizability (Linear Algebra)|diagonalizable]], especially when they don’t have enough [[Linear Independence (Linear Algebra)|linearly independent]] (ordinary) [[Eigenvector (Mathematics)|eigenvectors]].
	- For a matrix A, generalized eigenvectors are used to form a basis together with the [[Eigenvector (Mathematics)|eigenvectors]] of A when the latter are not sufficient to form a basis (because the matrix is defective)
- Let  A be an  $n \times n$ matrix and  $\lambda$ an [[Eigenvalue (Linear Algebra)]] of  A.  A generalized eigenvector $\vec{v}$ satisfies: $(A - \lambda I)^{k}\vec{v}=0$ for $k \geq 1$ 
	- but $(A - \lambda I)^{k-1}\vec{v}\neq 0$


### Connection With Algebraic Multiplicity of Eigenvalues
- If $A$ is an $n \times n$ matrix and $\lambda$ is an [[Eigenvalue (Linear Algebra)]] with algebraic multiplicity $k$ (that is in the [[Characteristic Polynomial (Linear Algebra)]] that term has the power $k$) then the set of [[Generalized Eigenvectors (Linear Algebra)]] for $\lambda$ consist of nonzero elements of the [[Nullspace (Linear Algebra)]] of $(A-\lambda I)^k$
- In other words you need to take at most $k$ powers of $A- \lambda I$ to find all the generalized [[Eigenvector (Mathematics)]] for $\lambda$

### Sufficiency of Generalized Eigenvectors
- I created this title myself so it's not a real name for this concept just what I coined it based on my understanding
- The aim of [[Generalized Eigenvectors (Linear Algebra)]] it to create a linearly [[Linear Independence (Linear Algebra)|independent]] [[Basis (Linear Algebra)|basis]], the question arises are there always enough eigenvectors to do so? - Yes
- If $\lambda$ is an [[Eigenvalue (Linear Algebra)]] of A with algebraic multiplicity $k$ then $nullity((A-\lambda I)^k)=k$
	- In other words there are $k$ linearly independent [[Generalized Eigenvectors (Linear Algebra)]] for $\lambda$
- As a [[Corollary (Mathematics)]]  if $A$ is an $n \times n$ matrix, then there exists a basis for $\mathbb{R}^n$ consisting of [[Generalized Eigenvectors (Linear Algebra)]] for $A$


### Chain of Generalized Eigenvectors
Source; https://www2.math.upenn.edu/~moose/240S2013/slides7-31.pdf
- If $(A-\lambda I)^p v=0$ then that $v$ is a generalized eigenvector
- But this can be written as $(A-\lambda I)^{p-q}(A-\lambda I)^qv=0$ and $(A-\lambda I)^qv$ is also a generalized eigenvector for every value of $q=0,1,\cdots,p-1$


### Resources to Learn more
https://www.statlect.com/matrix-algebra/generalized-eigenvector

https://www2.math.upenn.edu/~moose/240S2013/slides7-31.pdf

https://math.mit.edu/~dav/generalized.pdf