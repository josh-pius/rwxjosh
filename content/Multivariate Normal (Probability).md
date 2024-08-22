### General
- The univariate normal has two parameters $\mu$ and $\sigma$. In the multivariate version, $\mu$ is a vector and $\sigma$ is replaced by a matrix $\Sigma$ 
- The [[Probability Density Function (PDF) (Probability)]] is
$$
f(x;\mu,\Sigma)=\dfrac{1}{(2\pi)^{k/2}|(\Sigma)|^{1/2}}exp \left\{-\dfrac{1}{2}(x-\mu)^T\Sigma^{-1}(x-\mu)\right\}
$$
- $|\Sigma|$ denotes the [[Determinant (Linear Algebra)]] of sigma, $\mu$ is a vector of length k and $\Sigma$ is a $k\times k$ [[Symmetric Matrix (Linear Algebra)|symmetric]] [[Positive Definite Matrix (Linear Algebra)|positive definite]] matrix


### Properties of Sigma
- Since $\Sigma$ is symmetric and [[Positive Definite Matrix (Linear Algebra)|positive definite]] it can be shown that there exists a matrix $\Sigma^{1/2}$ called the square root of $\Sigma$ with the following properties
	- $\Sigma^{1/2}$ is [[Symmetric Matrix (Linear Algebra)]]
	- $\Sigma=\Sigma^{1/2}\Sigma^{1/2}$
	- $I=\Sigma^{-1/2}\Sigma^{1/2}=\Sigma^{1/2}\Sigma^{-1/2}$
### Standard Multivariate Normal
$$
Z=\begin{bmatrix}
Z_1 \\
\vdots \\
Z_k 
\end{bmatrix}
$$
- Where $Z_1,\ldots,Z_k \sim N(0,1)$ are [[Independent (Probability)]] . The density of Z is
- $f(z)=\prod_{i=1}^kf(z_i)=\dfrac{1}{(2\pi)^{k/2}}exp \left\{-\dfrac{1}{2}\sum_{j=1}^kz_j^2\right\}=\dfrac{1}{(2\pi)^{k/2}}exp\left\{-\dfrac{1}{2}z^Tz\right\}$
- We say that $Z$ has a standard multivariate normal distribution written as $Z \sim N(0,I)$ where 0 represents a vector of k zeros and I represents the $k \times k$ identity matrix



### Transforming Between Generic and Standard Normal
- If  $Z \sim N(0, I)$  and  $X = \mu + \Sigma^{1/2} Z$  then  $X \sim N(\mu, \Sigma)$ . Conversely, if  $X \sim N(\mu, \Sigma)$ , then  $\Sigma^{-1/2} (X - \mu) \sim N(0, I)$.
- Suppose we partition a random Normal vector  $X$  as  $X = (X_a, X_b)$ . We can similarly partition $\mu = (\mu_a, \mu_b)$ and
$$
\Sigma = \begin{pmatrix}
\Sigma_{aa} & \Sigma_{ab} \\
\Sigma_{ba} & \Sigma_{bb}
\end{pmatrix}.
$$