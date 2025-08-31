### General
- A special case of the [[LU Decomposition (Linear Algebra)]]
	- But `U` here is the [[Matrix Transpose (Linear Algebra)|transpose]] of the L matrix
- A numerical optimization technique widely used in [[Linear Algebra (Mathematics)]]
- It is a decomposition of a [[Hermitian Matrix (Linear Algebra)|hermitian]] [[Positive Definite Matrix (Linear Algebra)|positive definite]] matrix into the produce of a [[Lower Triangular Matrix (L)(Linear Algebra)]] and it's [[Conjugate Transpose (Linear Algebra)]]
- Efficient for numerical solutions. eg [[Monte Carlo Method (Data Science)|monte carlo]] simulations
- When it is applicable it is roughly twice as efficient as the [[LU Decomposition (Linear Algebra)]] for solving a system of linear equations
- $A=LL^{*}=U^{*}U$
	- where $L^{*}$ is the [[Matrix Transpose (Linear Algebra)|transpose]] of the matrix
- The factorization is **unique**

### Algorithm
Source: https://math.emory.edu/~lchen41/teaching/2020_Fall/Section_8-3.pdf
- If A is a positive definite matrix, the Cholesky factorization $A = U^TU$ can be obtained as follows: 
- Step 1. Carry A to an [[Upper Triangular Matrix (U)(Linear Algebra)]] $U_1$ with positive diagonal entries using row operations each of which adds a multiple of a row to a lower row. 
- Step 2. Obtain $U$ from $U_1$ by dividing each row of U1 by the square root of the diagonal entry in that row.



### Condition
- You can perform this decomposition only if it's [[Positive Definite Matrix (Linear Algebra)|positive definite]]

### Application in Portfolio Risk Management
- When you want to compute a measure of risk like [[Value At Risk (VaR)]], you often need to simulate the portfolio with various conditions (at least that my current understanding)
- In these simulations we will not get the right results if we don't factor in that financial assets are correlated, let's assume we have a correlation matrix $\Sigma$ that tells us how various asset returns are are correlated
- For the simulation say you  perform some sort of [[Monte Carlo Method (Data Science)|monte Carlo simulation]], and as part of the simulation you use some distribution to generate a [[Random Variate (Probability)]] for each asset, the trouble is this generated value is [[Independent (Probability)]], you need to find a way so that each asset correlates with the others based on the correlation matrix $\Sigma$
	- As an example assume the two independent random variables you generated for the two assets is $z=\begin{bmatrix}z_1 \\ z_2\end{bmatrix}$
- To correlate the assets you need to multiple it by some matrix $Az$
- What is that matrix? Turns out it's the [[Cholesky Decomposition (Linear Algebra)|Cholesky Matrix]]
- [[Cholesky Decomposition (Linear Algebra)]] helps here by decomposing the covariance matrix into $\Sigma=LL^T$
- If you multiple $Lz$ you generate random variables that are correlated with $\Sigma$
- To see a detailed worked out example see http://www.appliedbusinesseconomics.com/files/gvschd01.pdf 

### Computation In Python
- You can compute the Cholsky matrix in python using [[NumPy (Python Library)]]
```python
from numpy.linalg import cholesky
cov = [[1.0, 0.35, 0.55],   # covariance matrix (must be symmetric positive s       [0.35, 1.0, 0.25],
       [0.55, 0.25, 1.0]]
l = cholesky(cov)
print(l)
```
