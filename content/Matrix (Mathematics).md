### General
- Created to help us understand [[Linear Transformation (Linear Algebra)]]
- For how that works refer to the video: https://youtu.be/kYB8IZa5AuE?si=sacxxXAI0XETWFVz

### Connection between Linear Transformation and Matrix
- For a brief explanation consider a initial 2d coordinate plane, consider a vector in that plan with coordinates x and y, we can represent this vector as $X=\begin{bmatrix}x\\y\end{bmatrix}$
- We can think of this vector as $x\hat{i}+y\hat{j}$
- Say a linear transformation is applied this means that every vector on the plane has been scaled, rotated or both. Say that the unit vector $\hat{i}$ changes coordinates to $\begin{bmatrix}3 \\-2\end{bmatrix}$
- And $\hat{j}$ changes coordinates to $\begin{bmatrix}2 \\1\end{bmatrix}$
- These four numbers are now sufficient to describe the linear transformation that took place in 2D plane
- We can package these four numbers into a matrix $\begin{bmatrix}3&2 \\ -2&1\end{bmatrix}$
- To know what happends to any other vector on the plane you just need to multiple the vector by this matrix to find it's new coordinates 


### Set of All Matrices
$\mathbb{M}$ is used to represent the [[Set (Mathematics)]] of all matrices