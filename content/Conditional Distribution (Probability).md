---
aliases:
  - Conditional Mass Function (Probability)
  - Conditional Density Function (Probability)
---
### General
- The conditional probability mass function is
- $f_{X|Y}(x|y)=P(X=x|Y=y)=\dfrac{P(X=x,Y=y)}{P(Y=y)}=\dfrac{f_{X,Y}(x,y)}{f_Y(y)}$
- For the continuous case the conditional density function is
	- $f_{X|Y}(x|y)=\dfrac{f_{X|Y}(x,y)}{f_Y(y)}$
	- Then we can compute the conditional probability for a subset of X $P(X \in A | Y=y)= \int_A f_{X|Y}(x|y)dx$