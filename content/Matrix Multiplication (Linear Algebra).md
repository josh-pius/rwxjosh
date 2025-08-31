### Advances in Speeding up Matrix Multiplication
https://www.youtube.com/watch?v=fDAPJ7rvcUw
- They used [[Reinforcement Learning (Machine Learning)]] learning to find a better algorithm

### Not Commutative
- Matrix multiplication follows rules similar to regular multiplication except in one regard
- It is not commutative $AE \neq EA$

### Approaches To Matrix Multiplication
Source: [[Linear Algebra and Its Applications (Book)]] p23 and https://youtu.be/FX4C-JpTFgY?si=4hTCCY5yuk9eeAiI
- There are ~~two~~ at least 5 approaches. There seem to be a lot more ways, you can see all here: https://www.youtube.com/watch?v=FX4C-JpTFgY
- Given $C=AB$
1. Inner product: The approach we're used to. The $c_{ij}$ element of $C$ is the [[Dot Product (Mathematics)]] of the $i^{th}$ row of A with the $j^{th}$ column of B
2. Combination of columns: $c_i=Ab_i$
	1. The $c^{th}$ column of $C$ is the linear combination of columns of $A$
$$
A\vec{x} = x_1 \cdot a_1 + x_2 \cdot a_2 + \cdots + x_n \cdot a_n
$$

$$
A\vec{x} = x_1 \begin{bmatrix} 1 \\ 4 \\ 7 \end{bmatrix} + x_2 \begin{bmatrix} 2 \\ 5 \\ 8 \end{bmatrix} + x_3 \begin{bmatrix} 3 \\ 6 \\ 9 \end{bmatrix}

$$
3. Combination of rows: Each row of $C$ is a linear combination of rows of $B$
	1. $c^r_i=a^r_iB$ (Note: The superscript means row, this is just notation that I'm using, not standard notation)
4. Combinations of rank one matrices formed by columns times rows
	1. $C=\sum a_i b^r_i$ (where $a_i$ are the column vectors of $A$ and $b^r_i$ are the row vectors of B, note again that the superscript notation is just something I've introduced here for ease)
5. Block multiplication
$$
\begin{bmatrix}
\begin{array}{c|c}
A_{1} & A_{2} \\ \hline
A_{3} & A_{4}
\end{array}
\end{bmatrix}
\begin{bmatrix}
\begin{array}{c|c}
B_{1} & B_{2} \\ \hline
B_{3} & B_{4}
\end{array}
\end{bmatrix}
=
\begin{bmatrix}
\begin{array}{c|c}
A1 \times B1 + A2 \times B3 & A1 \times B2 + A2 \times B4 \\ \hline
A3 \times B1 + A4 \times B3 & A3 \times B2 + A4 \times B4
\end{array}
\end{bmatrix}
$$

### Order Matters In Matrix Multiplication
- This video intuitively helped me understand that in the context of linear transformation: https://youtu.be/XkY2DOUCWMU?si=27mbyRuBiQdZmMyV
