### General
- A [[Vector Norm (Mathematics)]] on a [[Real Vector Space (Linear Algebra)]] $V$ is a function $f:V \rightarrow \mathbb{R}$, that satisfies the following properties:
	- $f(x) = 0 \Leftrightarrow x=0$
	- $f(x) \geq\  0\ x\ \in V$
	- $f(x+y) \leq\ f(x) + f(y)\  x,y \in V$
	- $f(\alpha x) = |\alpha| f(x)\ \alpha \in \mathbb(R), x\in V$

### Notation
- Such a function is denoted as  $|| x ||$ . Particular norms are distinguished by subscripts, such as  $|| x ||_V$ , when referring to a norm in the space $V$

### Unit Vector
- A unit vector with respect to the norm $||.||$  is a vector $x$ satisfying $||x||=1$

### Euclidean Norm
- A common (and useful) example of a real norm is the [[Euclidean Norm (Mathematics)]] given by $||x||=(x_1^2+x_2^2+...+x_n^2)^{1/2}$ defined on $V=\mathbb{R}^n$


### Existence of Norm
 - However, that there exists vector spaces which are metric, but upon which it is not possible to define a norm. 
 - If it possible, the space is called a [[Normed Vector Space (Mathematics)]]. Given a [[Metric Space (Mathematics)|metric]] on the vector space, a necessary and sufficient condition for this space to be a [[Normed Vector Space (Mathematics)|Normed Space (Mathematics)]], is
	 - $d ( x + a , y + a ) = d ( x , y ) ∀ x , y , a ∈ V$ 
	 - $d ( α x , α y ) = | α | d ( x , y ) ∀ x , y ∈ V , α ∈ R$
 - But given a norm, a metric can always be defined by the equation  $d ( x , y ) = || x − y ||$ . Hence every [[Normed Vector Space (Mathematics)|Normed Space (Mathematics)]] is a [[Metric Space (Mathematics)]].



### Sources
https://planetmath.org/vectornorm