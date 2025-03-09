### General
- One of the most popular [[Factor Analysis (Mathematics)||factor models]] where the returns of the market portfolio is the only factor
- The $i$-th stock return at time t is
$$
r_{i,t}-r_f=\beta_i(r_{M,t}-r_f)+ w_{i,t}
$$

- Where $r_f$ is the risk free rate, $r_{M,t}$ is the return of the market portfolio, and $w_{i,t}$ is the stock-specific white noise with zero mean and constant variance
- Taking the [[Expected Value (Probability)|Expectation (Probability)]] on both sides results in the CAPM model

$$
E[r_{i,t}] -r_f = \beta(E[r_{M,t}- r_f])
$$
- $E[r_{M,t}] -r_f$ measures the difference between the expected market return and risk-free rate, known as the market premium
- $E[r_{i,t}] -r_f$ measures the difference between the expected stock return and risk-free rate, known as the risk premium
- $\beta_i$ is given by 
	- $$
\beta_i=\frac{Cov(r_{i,t},r_{M,t})}{Var(r_{M,t})}
$$
	- It measures the sensitivity of the risk premium to the market premium
- Taking the variance on both sides gives us this relation
$$
Var[r_{i,t}] = \beta^2Var[r_{M,t}] + Var[w_{i,t}]
$$
- $\beta^2Var[r_{M,t}]$ measures the risk associated with the market and it is referred to as [[Systematic Risk (Portfolio Theory)]]
- $Var[w_{i,t}]$ is specific to each stock and is called [[Non-systematic Risk (Portfolio Theory)]]


### Sources
[[A Signal Processing Perspective on Financial Engineering (Book)]]