### General
- By [[Larry Wasserman (Author)]]
- Interestingly he has another book called [[All of Nonparametric Statistics (Book)]]

### Solutions
- Has solutions to some problems
https://www.stat.cmu.edu/~larry/=stat325.02/
- This seems to have a lot more solutions
- https://github.com/sajad13901/Statistics_Wasserman/blob/main/2%20Random%20Variables%20.pdf
### Expectation and Variance of Important Random Variables
| [[Probability Distribution (Probability)\|Distribution]] | [[Arithmetic Mean (Statistics)\|Mean]] | [[Variance (Statistics)\|Variance]]                       |
| -------------------------------------------------------- | -------------------------------------- | --------------------------------------------------------- |
| Point mass at a                                          | a                                      | 0                                                         |
| [[Bernoulli Distribution (Statistics)]]                  | p                                      | p(1-p)                                                    |
| [[Binomial Distribution (Statistics)]]                   | np                                     | np(1-p)                                                   |
| [[Geometric Distribution (Statistics)]]                  | 1/p                                    | $(1-p)/p^2$                                               |
| [[Poisson Distribution (Statistics)]]                    | $\lambda$                              | $\lambda$                                                 |
| [[Uniform Distribution (Statistics)]]                    | (a+b)/2                                | $(b-a)^2/12$                                              |
| [[Normal Distribution (Statistics)]]                     | $\mu$                                  | $\sigma^2$                                                |
| [[Exponential Distribution (Statistics)]]                | $\beta$                                | $\beta^2$                                                 |
| [[Gamma Distribution (Statistics)]]                      | $\alpha\beta$                          | $\alpha\beta^2$                                           |
| [[Beta Distribution (Statistics)]]                       | $\dfrac{\alpha}{(\alpha+\beta)}$       | $\dfrac{\alpha\beta}{((\alpha+\beta)^2(\alpha+\beta+1))}$ |
| [[T Distribution (Statistics)]]                          | 0 (if $\nu \gt 1$)                     | $\nu/(\nu-2)$ if $\nu \gt 2$                              |
| [[Chi Squared Distribution (Statistics)]]                | p                                      | 2p                                                        |
| [[Multinomial Distribution (Probability)]]               | np                                     | see below                                                 |
| [[Multivariate Normal (Probability)]]                    | $\mu$                                  | $\Sigma$                                                  |

- For [[Multinomial Distribution (Probability)]] mean is
$$\mu=\begin{pmatrix}\mu_1 \\ \vdots \\ \mu_k\end{pmatrix}=\begin{pmatrix}E(X_1) \\ \vdots \\ E(X_k)\end{pmatrix}$$
- The variance-covariance matrix $\Sigma$ is defined to be
$$V(X)=
\begin{bmatrix}V(X_1) & Cov(X_1,X_2) & \cdots & Cov(X_1,X_k) \\
Cov(X_2,X_1)  &  V(X_2)  &  \cdots  &  Cov(X_2,X_k) \\
\vdots & \hspace{1cm}\vdots & \hspace{1cm}\vdots & \hspace{1cm}\vdots & \hspace{1cm} \\
Cov(X_k,X_1) & Cov(X_k,X_2) & \cdots & V(X_k) \\
\end{bmatrix}$$

- For [[Multinomial Distribution (Probability)]]. If $X\sim \text{Multinomial}(n,p)$ then $E(X)=np=n(p_1,\ldots,p_k)$ 
$$V(X)=
\begin{bmatrix}np_1(1-p_1) & -np_1p_2 & \cdots & Cov(X_1,X_k) \\
-np_2p_1  &  np_2(1-p_2)  &  \cdots  & -np_2p_k \\
\vdots & \hspace{1cm}\vdots & \hspace{1cm}\vdots & \hspace{1cm}\vdots & \hspace{1cm} \\
-np_kp_1& -np_kp_2 & \cdots & np_k(1-p_k) \\
\end{bmatrix}$$

### Metadata
2024-05-19 00:13
- Stopped at pg 23, probability density function