---
aliases:
  - Similar Matrix (Linear Algebra)
---

### General
 - Two  $n \times n$ matrices  $A$ and  $B$ are similar if there exists an invertible  $n \times n$ matrix  M such that  $A = MBM^{−1}$ 
 - Similar matrices have the same [[Eigenvalue (Linear Algebra)|eigenvalues]] and same number of eigenvectors
	 - All the similar matrices for the same eigenvalues thus forms a family of matrices
 - [[Eigenvector (Mathematics)]]s need not be same for similar matrices
 - [[Diagonalizability (Linear Algebra)]] deals with a special case of similarity where the matrix that's similar is a nice diagonal matrix with eigenvalues along it's diagonal

### Proof that Similar Matrices Have the Same Eigenvalues
- $A,B$ are similar which means $B=M^{-1}AM$
- If $Ax=\lambda x$, then you can rewrite that as $AMM^{-1}x=\lambda x$
- You can pre-multiply both sides by $M^{-1}$ to get $M^{-1}AMM^{-1}x=\lambda M^{-1}x$
- Which is equal to $BM^{-1}x=\lambda M^{-1} x$, say  $M^{-1}x=y$, then you get $By=\lambda y$ which means even $B$ has the same eigenvalues
	- Note the [[Eigenvector (Mathematics)]] changed from $x$ to $M^{-1}x$

### Connection With Jordan Form
- All matrices with distinct eigenvalues can can be [[Diagonalizability (Linear Algebra)|diagonalized]] and you can show [[Similarity (Linear Algebra)]] with other matrices with the same eigenvalues
- But if they have repeated eigenvalues there are two possibilities
	- The matrix can be diagonalized in which case it's **similar** to every other matrix which has the same eigenvalues and can be diagonalized and they form a family
	- The other possibility is that the matrix is similar to a [[Jordan Normal Form (Linear Algebra)|Jordan Matrix]] a much bigger family of matrices
- This brings us to a conclusion, every square matrix A is similar to a [[Jordan Normal Form (Linear Algebra)|Jordan Matrix]] $J$ which is [[Block Diagonal Matrix (Linear Algebra)]] composed of [[Jordan block (Linear Algebra)|jordan blocks]]
	- The Jordan form is the “simplest representative” of the similarity class of a matrix. If two matrices are similar, they must have the same Jordan form. Conversely, if two matrices have the same Jordan form, they are similar.
	- The number of [[Jordan block (Linear Algebra)|jordan blocks]] equal number of [[Eigenvector (Mathematics)|eigenvectors]] (we get one eigenvector per block)
- [[Diagonalizability (Linear Algebra)|Diagonalization]] is a special case of the where every [[Jordan block (Linear Algebra)]] is of size 1, when a matrix isn't diagonizable, the Jordan form shows exactly how far it is from being diagonal (the off-diagonal 1's represent [[Generalized Eigenvectors (Linear Algebra)]])


### Sources
https://youtu.be/TSdXJw83kyA?si=7xfTqTCo2sLea3Fp