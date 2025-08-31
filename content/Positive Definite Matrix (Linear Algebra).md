### Properties
- All [[Eigenvalue (Linear Algebra)]] must be positive
- All [[Pivot (Linear Algebra)]]'s MUST be positive
- All sub-[[Determinant (Linear Algebra)|determinant]] MUST be positive
- Matrix is [[Symmetric Matrix (Linear Algebra)]] and square
- A matrix where $x^TAx \gt 0$ for all nonzero $x$



### Other Types
- If the inequality includes 0 then it is [[Positive Semi-Definite Matrix (Linear Algebra)]]
- If the inequality is flipped  then it is Negative Definite 
- If the inequality is flipped  and includes 0 then it is Negative semi-Definite 
- If no inequality holds then the matrix is indefinite


### Understanding Positive Definite Matrices
Source: https://gregorygundersen.com/blog/2022/02/27/positive-definite/
- These are mostly thoughts not everything is spelled out this way or distilled in the article
- Positive definite matrices can be viewed as multivariate analogs to strictly positive real numbers, while positive semi-definite matrices can be viewed as multivariate analogs to nonnegative real numbers
	- Recall that [[Eigenvalue (Linear Algebra)]] tell you how a matrix gets scaled, a positive of zero eigenvalue suggests that any vector multiplied by that matrix doesn't flip it's direction
- Also recall how a matrix is [[Positive Definite Matrix (Linear Algebra)|positive definite]] when it's eigen values are all positive
- The space of all [[Positive Semi-Definite Matrix (Linear Algebra)|positive semidefinite matrices]]  form a [[Convex Cone (Linear Algebra)|cone]]

### Pivots and Intuition
Source: https://youtu.be/vF7eyJ2g3kU?si=vt2HLXeq5HpDP4MH
- [[Gilbert Strang (Mathematician)]] takes the $x^TAx$  for a matrix and leaves the components of $x$ as variables, when you multiply it you get a [[Quadratic Form (Mathematics)]]
- If you can [[Complete The Square (Mathematics)]] then you can be sure the equation is always positive which means the matrix you started with is [[Positive Definite Matrix (Linear Algebra)]]
- Strang points out something interesting here, when you complete the square the coefficients of the square terms are the [[Pivot (Linear Algebra)]], his explanation for why this happens isn't very clear but when I checked with [[ChatGPT]] it suggested it might have something to do with [[Schur Complement (Mathematics)]]


### Inverse of Positive Definite Matrix
- The [[Matrix Inversion (Linear Algebra)|Inverse (Linear Algebra)]] of a positive definite matrix is also positive definite
- It's invertible because none of the [[Eigenvalue (Linear Algebra)]]s are zero
- The eigenvalues of the inverse are $1/\lambda$ of the individual eigenvalues of the original matrix, which are also positive which means the inverse is positive definite

### Sum of Positive Definite Matrices Are Also PD
- If $A,B$ are two [[Positive Definite Matrix (Linear Algebra)]] 
- Then their sum is also positive definite
- $x^T(A+B)x=x^TAx + x^TBx$
- Since $x^TAx \gt 0$ and  $x^TBx \gt 0$ then $x^TAx + x^TBx \gt 0$