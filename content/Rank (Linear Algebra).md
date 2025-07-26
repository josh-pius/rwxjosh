### General
- The rank of a matrix is the dimension of the [[Column Space (Linear Algebra)]] (or row space, since they are equal). It represents the maximum number of linearly independent columns (or rows) in the matrix. Essentially, it tells us the number of linearly independent equations in a system.
- The rank is equal to the number of [[Pivot (Linear Algebra)|pivots]]
- In terms of [[Linear Transformation (Linear Algebra)]], when the output of a transformation is a line we say it has a rank of 1, if the output is a plane we say it has a rank of 2 and so on
	- In other words "Rank" means the number of dimensions in the output
- For a 2x2 matrix the maximum possible rank is 2, a transformation to rank 1 (line) or 0 (point) means squishing, if it remain rank 2 that means no squishing, the [[Basis (Linear Algebra)]] vectors continue to [[Span (Linear Algebra)]] the full 2 dimensions of space


### Full Rank
- A matrix is full rank when it's rank equals the number of columns 
- For a 2x2 matrix, a rank of 2 would make it full rank, for 3x3 a rank of 3 makes it full rank


### Warning Against Incorrect Usage 
- [[Linear Algebra and Its Applications (Book)]] warns against incorrect usage of this term such as "Rank of a Space"

### Relationship Between Column and Row Rank
- row rank = column rank
- In other words [[Dimension (Linear Algebra)]] of column space C(A) equals dimensions of row space


### Matrix of Rank 1
Source: [[Linear Algebra and Its Applications (Book)]]
> Finally comes the easiest case, when the rank is as small as possible (except for the zero
 matrix with rank 0). One basic theme of mathematics is, given something complicated to show how it can be broken into simple pieces. For linear algebra, the simple pieces
 are matrices of rank 1 we can write the whole matrix as the product of a column vector by a row vector $A=(column)(row)$

$$A=\begin{bmatrix}
2&1&1 \\ 
4&2&2   \\
8&4&4   \\
-2&-1&-1 \\ 
\end{bmatrix} = \begin{bmatrix} 1 \\ 2 \\4 \\ -1\end{bmatrix} \begin{bmatrix}2 &1 & 1 \end{bmatrix}
$$


