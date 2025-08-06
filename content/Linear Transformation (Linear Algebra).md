### General
- [[3Blue1Brown (Youtuber)]] argues that this concept is needed to really understand Linear Algebra
- While there are many kinds of transformations you can apply to a coordinate system, **linear** transformations limit itself to ones where the origin stays in place and lines remain line (that is don't bend) after transformation
- Linear transformation especially in 3D is important in fields like [[Robotics (Engineering)]] and Computer Graphics
- The equations $AX=b$ can be thought of as what vector X translates to b when a linear transformation $A$ is applied to it


### Connection between Linear Transformation and Matrix
- For a brief explanation consider a initial 2d coordinate plane, consider a vector in that plan with coordinates x and y, we can represent this vector as $X=\begin{bmatrix}x\\y\end{bmatrix}$
- We can think of this vector as $x\hat{i}+y\hat{j}$, the unit vectors here can be thought of as the [[Basis (Linear Algebra)]] of the 2d coordinate plane
- Say a linear transformation is applied this means that every vector on the plane has been scaled, rotated or both. Say that the unit vector $\hat{i}$ changes coordinates to $\begin{bmatrix}3 \\-2\end{bmatrix}$
- And $\hat{j}$ changes coordinates to $\begin{bmatrix}2 \\1\end{bmatrix}$
- These four numbers are now sufficient to describe the linear transformation that took place in 2D plane
- We can package these four numbers into a matrix $\begin{bmatrix}3&2 \\ -2&1\end{bmatrix}$
- To know what happened to any other vector on the plane you just need to multiple the vector by this matrix to find it's new coordinates 
### Sources
https://youtu.be/kYB8IZa5AuE?si=cgASJwX3Mw2eT9g2