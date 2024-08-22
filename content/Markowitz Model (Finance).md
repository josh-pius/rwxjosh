### General
- Formulated by [[Harry Markowitz]]
- Not used in practice
- [[Prof Daniel Palomar (Youtuber)]] points out [here](https://youtu.be/yyvIcdYkb9o?si=qHaeLczRP1C0HImk) how it's not a great model for two reasons
	- Because it uses [[Variance (Statistics)]] as a measure of risk which is a bad assumption
		- This is because Variance penalizes both the unwanted high losses and desired low losses (profits?)
		- The solution is to use [[Value At Risk (VaR)]] and [[Conditional Value at Risk (CVaR)]]
	- Because it is very sensitive to the parameters i.e. the mean vector $\mu$ and the covariance matrix $\Sigma$
		- Solution to this is [[Robust Optimization (Mathematics)]]