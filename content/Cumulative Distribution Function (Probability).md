---
aliases:
  - CDF (Probability)
---

### General
- The cumulative distribution function or CDF is the function $F_X:\mathbb{R} \rightarrow [0,1]$ defined by $F_X(x)=P(X<=x)$
- The [[Cumulative Distribution Function (Probability)|CDF (Probability)]] effectively contains all the information about the random variable
- For example for a random variable that represents the number of heads when a fair coin is tossed twice, the CDF is
$$
F_X(x) =
\begin{cases}
0 &  x<0\\
\frac{1}{4}  & 0\leq x \lt 1\\
\frac{3}{4}  & 1\leq x \lt 2\\
1  & x\geq 2 
\end{cases}
$$
- Theorem: If X has a CDF F and Y has a CDF G. If $F(x)=G(x)$ for all x, then $P(X \in A) = P(Y \in A)$ for all A
	- Basically if the CDFs are equal the random variables are equal
 - A function $F$ mapping real line to $[0,1]$ is a CDF for some probability P if and only if $F$ satisfies the following conditions
	 - F is non-decreasing
	 - F is normalized $\lim_{x\to\infty} F(x)=1$
	 - F is right-[[Continuity (Calculus)|continuous]] 