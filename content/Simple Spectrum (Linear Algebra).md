### General
- If A is a n×n [[Matrix (Mathematics)]] for which all [[Eigenvalue (Linear Algebra)|eigenvalues]] are different, we say such a matrix has simple spectrum


### Theorem
Source: https://people.math.harvard.edu/~knill/teaching/math22b2019/handouts/lecture17.pdf
- A [[Symmetric Matrix (Linear Algebra)]] can be approximated by symmetric matrices with [[Simple Spectrum (Linear Algebra)]].
 - Proof broken down from [[ChatGPT]]
- Structure of the Proof
	- The proof uses mathematical induction on the size $n$ of the matrix.
- Step 1 — Base case
	- When  $n=1$, the result is trivial:
	- A 1×1 symmetric matrix just has one [[Eigenvalue (Linear Algebra)]], so the [[Spectrum of a Matrix (Linear Algebra)|spectrum]] is already “simple.”
- Step 2 — Inductive hypothesis
	- Assume the theorem holds for all  $n \times n$ symmetric matrices: We can approximate them by symmetric matrices with all eigenvalues distinct. 
	- We need to prove it for an  $(n+1)×(n+1)$ symmetric matrix.
- Step 3 — Setup
	- Let  A be an $(n+1)×(n+1)$ symmetric matrix. 
	- Pick an [[Eigenvalue (Linear Algebra)]]  $\lambda_1$ of $A$ 
	- Pick an [[Eigenvector (Mathematics)]]  $v_1$ ​ of  $\lambda_1$ ​ (normalize it so  $||v_1||=1$).
- Step 4 — Small perturbation
	- We add a small symmetric [[Rank-One Pertubation (Linear Algebra)]] $tv_1v_1^T$ ​to $A$: $A(t) = A + tv_1v_1^T$  ​ 
	- This keeps  $v_1$ ​ as an [[Eigenvector (Mathematics)]], but changes its [[Eigenvalue (Linear Algebra)]] from  $\lambda_1$ to $\lambda_1+t$. 
	- So now  $\lambda_1+t$ is different from $\lambda_1$ (as long as  $t \ne 0$). 
- Step 5 — Splitting the space 
	- Let  $v_2,\cdots,v_{n+1}$ ​ be an [[Orthonormal (Linear Algebra)|orthonormal]]  [[Basis (Linear Algebra)|basis]] of the [[Orthogonal Complement (Linear Algebra)]] of $v_1$ . 
	- This means the full orthonormal basis is: $\{v_1,v_2,\cdots,v_{n+1}\}$. 
	- In this basis, the matrix  $A(t)$ takes block form:  $B(t)=\begin{bmatrix}\lambda_1 + t &C  \\ 0&D\end{bmatrix}$
	- Here: 
		- $\lambda_1 +t$ is the [[Eigenvalue (Linear Algebra)]] for  $v_1$ ​ 
		- $D$ is an  $n \times n$ symmetric block representing $A$ restricted to the subspace orthogonal to  $v_1$ ​ 
		- $C$ are cross terms.
- Step 6 — Simplification
	- By carefully choosing an orthonormal basis that [[Diagonalizability (Linear Algebra)|diagonalizes]] $A$ on the [[Orthogonal Complement (Linear Algebra)]] of  $v_1$ ​ , we can arrange for  $C=0$.
	- This means the top-left [[Eigenvalue (Linear Algebra)]]  $\lambda_1+t$ is completely separated from the other part $D$.
- Step 7 — Apply induction
	- By the inductive hypothesis, we can approximate the block $D$ by a [[Symmetric Matrix (Linear Algebra)]]  $D(t)$ whose [[Eigenvalue (Linear Algebra)|eigenvalues]] are all distinct. 
	- We also make sure  $\lambda_1+t$ is different from all eigenvalues of  $D(t)$
- Step 8 — Conclusion
	- The resulting $(n+1)×(n+1)$ [[Symmetric Matrix (Linear Algebra)]] has: 
	- $\lambda_1+t$ as one eigenvalue 
	- All other $n$ [[Eigenvalue (Linear Algebra)|eigenvalues]] from  $D(t)$, distinct from each other and from  $\lambda_1+t$ 
	- Thus we’ve constructed a symmetric matrix arbitrarily close to  𝐴 A whose eigenvalues are all distinct. By induction, the result holds for all  $n$.

- I think I got the idea behind this proof but would have to see more proofs like this to really grok this kind of thinking
- Apparently this idea that given a symmetric matrix with repeated eigenvalues (i.e. not simple spectrum i.e. multiplicity >1) you can get a approximate matrix with a [[Simple Spectrum (Linear Algebra)]] is used in many fields
	- Numerical simulations
	- [[Principal Component Analysis (PCA)]]
	- Vibrations/ structural engineering
	- Quantum mechanics
	- [[Control Theory (Field of Study)]]
	- [[Finite Element Analysis (Mathematics)]]
### Sources
https://people.math.harvard.edu/~knill/teaching/math22b2019/handouts/lecture17.pdf