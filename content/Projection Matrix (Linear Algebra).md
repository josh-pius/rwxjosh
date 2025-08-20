### General
- The projection matrix that projects a vector $b$ through a line passing through a vector $a$ is
$$
P=\frac{aa^T}{a^Ta}
$$
- This sort of matrix has two properties
	- P is symmetric
	- It's square is itself
- Conversely any symmetric matrix with $P^2=P$ is a projection matrix

- To project a vector onto the column space of $A$ this formula can be used. 
	- $P=A(A^TA)^{-1}A^T$
	- Proof:
		- A vector projected onto the column space will have it’s error vector orthogonal to the space
		- $(b-Ax). Ax=0 \implies A^T(b-Ax)=0 \implies A^TAx=A^Tb \implies x=(A^TA)^{-1}A^Tb$
		- The projection matrix then is $Ax$
	- Given a projection matrix and a vector, we can find the two orthogonal components of that vector with respect to the column space of it’s projection
		- Component lying on it’s column space: $Px$
		- Component perpendicular to it’s column space $(I-P)x$
			- Note that $I-P$ is also a projection matrix


### Relationship with Identity Matrix
- If $A$ is invertible then the projection matrix is projecting into the whole space (say $\mathbb{R}^n$) for real matrices. This means that the projection is the vector itself. 
- If you actually factor this into the equation you see that $P=I$ the projection matrix turns into the [[Identity Matrix (Linear Algebra)]]
- The identity matrix is a [[Projection Matrix (Linear Algebra)]]
### Eigenvalues
 - Given a projection matrix for a plane (but you can generalize plane to any vector space)  any vector in the  plane when projected would give you the vector itself, which means it's an [[Eigenvector (Mathematics)]] with [[Eigenvalue (Linear Algebra)]] 1
	 - $Px=x$
 - There is also a vector perpendicular to the vector space which when multiply with the projection matrix gives you zero
 - So you can conclude that the eigenvalues of a projection matrix are 1 and zero

### Projection onto a subspace with Orthonormal Basis
$P=UU^T$


### Projection onto a subspace with Non-orthonormal Basis
$P=A(A^TA)^{-1}A^T$


### Sources
https://youtu.be/cdZnhQjJu4I?si=kVI7LVr8ZSP6gDFV