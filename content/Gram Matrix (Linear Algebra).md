### General
- In the context of complex numbers it is the [[Hermitian Matrix (Linear Algebra)]] of inner products you get when you multiply $A^HA$ (where H represents the [[Conjugate Transpose (Linear Algebra)]])
- For Real matrices it is the [[Symmetric Matrix (Linear Algebra)]] you get when you multiple a matrix with it's [[Matrix Transpose (Linear Algebra)]]. ie $X^TX$


### Significance of a Matrix Multiplied by it's Transpose
- When learning about [[Multi-Factor Model (Portfolio Management)]] I came across this formula $C=BFB^T + D$
	- Where C is a covariance matrix
	- B is a matrix of security sensitivities to sources of variance (factors)
	- F is the covariance matrix of factors
- Pre and post multiplying by a matrix and it's [[Matrix Transpose (Linear Algebra)]] is a common form to run into
- The essence of this multiplication is to transform the covariance matrix F from the space of factors to the space of securities
	- Pre-multiplying by B applies the sensitivities of securities to the factor covariances. This step essentially weights the factor covariances by how sensitive each security is to each factor
	- Post-multiplying by $B^T$ completes the transformation by accounting for the interactions between the sensitivities of all pairs of securities to all factors. The result is a matrix where each element represents the covariance between a pair of securities, fully accounting for their common factor exposures.
		- I still don't completely understand the post-multiplying step
- It's interesting that a matrix multiplied by it's transpose gets it's own name ie [[Gram Matrix (Linear Algebra)]]