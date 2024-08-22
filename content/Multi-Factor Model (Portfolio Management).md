### General
- A fundamental premise for MFM is that similar assets display similar returns. Similarity is assessed based on quantifiable attributes like market information (price change, volumes), fundamental company data (industry and capitalization), or exposure to other factors (interest rate changes and liquidity)
- MFMs identify [[Orthogonality (Linear Algebra)|Orthogonal]] factors and risk sensitivity to these factors

### Types
- MFM as per [[Barra (Company)]] can be divided into three types
1. [[Macroeconomics (Economics)|Macroeconomic]] Factor Model
	1. Use observable economic variables, such as changes in [[Inflation (Economics)|inflation]] and interest rates, as measures of the pervasive shocks to security returns
2. Fundamental Factor Model
	3. Use the returns to portfolios associated with observed security attributes such as [[Dividend Yield (Finance)]], [[Book-To-Market Ratio (Finance)]], and industry membership
3. Statistical Factor Model
	1. Derive their factors from [[Factor Analysis (Statistics)]] of the [[Covariance Matrix (Statistics)]] of security returns
	

### Explanatory Power
- [[Barra Risk Model Handbook (Book)]] asserts that **Fundamental** factor models have better [[Explanatory Power (Statistics)]]


### Drawbacks of Creating Covariance Matrix From Historical Returns
- Creating a [[Covariance Matrix (Statistics)]] from historical data has drawbacks
	- For a 3000 assets, you'd need 3000 data points, with monthly or weekly estimates such a long history may not exist
	- Estimation error: Two assets may show spurious correlation during a period

### Covariance Matrix From Common Factors
- Instead of using data from a large period we can construct our [[Covariance Matrix (Statistics)]], we can start with a set of different sources of variance and compute the sensitivity of each security to those sources
- We often pick those sources of co-movement in security returns based on our intuition


### Understanding the Formula
[[Gram Matrix (Linear Algebra)#Significance of a Matrix Multiplied by it's Transpose]]

### Exposures
- These are the sensitives of securities to a factors


### Factor Returns
- These are the pure measures of the factor's actual performance net of any other effect
- These are not observable and must be estimated
- [[Cross-Sectional Regression (Statistics)]] is used to estimate them using the exposures of various assets.
- This confused me at first, until I got some explanation from [[ChatGPT]], what I understand now is that we first find the exposures using some other means like time series regression with proxies for these factors, eg. using the returns of the SP500 minus the risk-free rate at a point in time for representing market factor, and then using those exposures we then compute factor returns

### Factor Covariance Is Better
- As already stated earlier computing the factor covariance matrix is better than computing the asset covariance matrix. 
- The factor covariance matrix has fewer variances and covariances to compute than asset covariance matrix

### Factor Exposure
- The factor exposure of a security to a particular factor can be interpreted as the number of standard deviations the security is from the market-cap weighted average of all the securities (According to the MSCI FaCS Methodology Document)
- These value can be thought of as how many stad

### Estimation Universe
- [[Barra (Company)]] uses historical returns to create it's models
- Each month the estimation universe, a set of representative assets in each local market, is used to attribute asset returns to common factors and to a specific or residual return
- Factor returns are estimated via regression
- Time series of [[#Factor Returns]] are used to generate factor variances and covariances in the covariance matrix


### Risk Calculation
- The [[Covariance Matrix (Statistics)]] is used with the portfolio weight to compute the portfolio's risk (i.e. variance)
- Variance of return is the definition of risk
	- $Risk=Var(r)$
	- $Risk=Var(Xf+u)$
	- $Cov(Xf,Xf)=XCov(f,f)X^T=XFX^T$
	- Overall portfolio risk $\sigma_{p}=\sqrt{h_p(XFX^T + \Delta)h_p^T}$
- Where $h_p$ is a vector of portfolio weights

### Summary Of Chapter 1 of Barra Handbook
- [[Barra Risk Model Handbook (Book)]]
- The first chapter shows us how we can use fundamental multifactor models to more easily analyze a portfolios risk.
- Computing the covariance matrix is a key step in portfolio risk calculation
- The traditionally way to compute the covariance matrix for a portfolio of many securities requires and long range of historical data which a portfolio might not have.
	- Another advantage is that it prevents spurious relationships (overfitting)
- Multi-factor models help us overcomes this limitation by providing us another way to compute the covariance matrix, namely by using factor correlation matrix and getting the exposures of securities to these factors
- Barra models only deal with fundamental factors models because the results are more intuitive (?)

### Computing Risk
- Risk Models Provide you the following
	- Factor Covariance: The covariance between factors (eg. GROWTH, YIELD, MOMENTUM). The factors can be statistical or market based as well. If there are n factors the matrix is $n\times n$
	- Factor Exposure: The exposure of securities to the factors. If there are m securities and n factors the matrix is $m \times n$
	- Specific Covariance/Specific Return/Idiosyncratic Matrix: The matrix that has the specific term for the securities. If there are m securities the matrix is $m \times m$
- Assume $h_p,h_b, h_a$ are portfolio benchmark and active weights respectively
	- $h_p$ for example could be {AAPL=0.5, TSLA=0.5}
- To compute total risk the formula is $\sigma_{p}=\sqrt{h_p(XFX^T + \Delta)h_p^T}$
	- Risk due to just factors is $\sigma_{p}=\sqrt{h_p(XFX^T)h_p^T}$
	- Risk due to just specific matrix $\sigma_{p}=\sqrt{h_p(\Delta)h_p^T}$
- Now that you have this you can repeat the same for benchmark and active risk
	- After you do this for total active risk if you take the sqrt you get the [[Tracking Error (Portfolio Management)]]
- If you want to compute contribution to factor risk by each security you can take the weight vector and make it a diagonal matrix. Compute the formula as usually and sum up along the rows to see the  what the risk contribution of each security is like
- For seeing contribution of each factor compute $h_pX$ and  turn it into a diagonal matrix
	- Use the diagonal matrix in the calculation for pre and post multiplication
	- What you end up with is the factor by factor matrix, if you sum up the row against a factor you get that factors contribution to the total risk
	- The Marginal contribution to MCTE is basically what the factor contributes to the tracking error
### Questions
1. Do these have any relationship with Alpha model?

### Sources
[[Barra Risk Model Handbook (Book)]]