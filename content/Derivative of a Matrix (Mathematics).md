### General
- Disclaimer: The terminology is a bit misleading here, it's not really the derivative of the matrix but of the linear transformation associated with the matrix $Ax$
- A matrix is a linear operations, given a matrix $A=\begin{bmatrix}1&2 \\ 3&4\end{bmatrix}$ you can break it down into two equations $f_1(x)=x_1+2x_2$ and $f_2(x)=3x_1+4x_2$ 
- $\dfrac{d}{dx}Ax=\begin{bmatrix}\dfrac{df_1}{dx_1}& \dfrac{df_1}{dx_2} \\ \dfrac{df_2}{dx_1}& \dfrac{df_2}{dx_2}\end{bmatrix}$
- Based on the above matrix example, $\dfrac{d}{dx}Ax=A$
- If instead of $Ax$ you had $x^TAx$ and $A$ is symmetric then $\dfrac{d}{dx}x^TAx=2Ax$ ([[Ritvikmath (Youtuber)]] derives this in his video)
- From the above two you can see how this is analogous to derivatives with single variables $\dfrac{dx}{dx}=1$ and $\dfrac{dx^2}{dx}=2x$
- This is used in [[Lagrange Multiplier (Mathematics)]] (as can be seen [here](https://youtu.be/6oZT72-nnyI?si=ULCIvl2nRuej_NDe))


### Sources
https://youtu.be/e73033jZTCI?si=ekrkGRDi6vCtnXq- by [[Ritvikmath (Youtuber)]]