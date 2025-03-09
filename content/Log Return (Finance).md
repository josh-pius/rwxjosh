### General
- Aka continuously compounded return
- Time additive but not portfolio additive
- If log returns for a period are [[Normal Distribution (Statistics)|normally distributed ]] (true for short periods) then it is if a bunch of periods are added up the log return for the n-period log return is also normally distributed 
- This kind of return is used for financial modeling but is not used for portfolio optimization

### Conversion To Simple Return
$$
R_t=e^{r_t}-1
$$

### Return Based on Log Prices
- The log-return at time $t$ is defined as
$$
r_t\triangleq log(1+R_t) = \log{\frac{p_t}{p_{t-1}}}=y_t-y_{t-1}
$$
- Where $R_t$ is the [[Simple Return (Finance)]] and $y_t \triangleq \log{p_t}$  which is the [[Log-Price (Finance)]], log here is the natural log


### Additivity over Periods
- The function $f(x)=\log{(1+x)}$ has the first order [[Taylor Series (Mathematics)#Approximating Taylor Series of log(1+x)|taylor]] approximation $f(x)=\log{(1+x)} \approx x$
- The log return on the most recent k periods is
$$
r_t(k) = \log{(1+R_t(k))}=\log{[(1+R_t)\times\cdots \times (1+R_{r-k+1})]}
$$
$$
=\log{(1+R_t)}+\log{(1+R_{t-1})}+\cdots+ \log{1+R_{t-k+1}}
$$
$$
=r_t+r_{t-1}+\cdots+r_{t-k+1}
$$
- This here illustrates the additive property of log-returns over periods
- The returns for a given assets are additive over periods but returns are not additive over assets
### Sources
https://youtu.be/PtoUlt3V0CI?si=5JxqD6JkVx-sUKQD
[[A Signal Processing Perspective on Financial Engineering (Book)]]