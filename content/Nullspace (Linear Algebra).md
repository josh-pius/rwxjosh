---
aliases:
  - Kernel (Linear Algebra)
---

### General
- [[Vector Space (Linear Algebra)]] all solutions of X where the equation $AX=0$
- The null space is also called the kernel
- The null space (or kernel) of a matrix A is a fundamental concept in linear algebra. It consists of all the vectors x that, when multiplied by A, result in the zero vector.
- Dimension if matrix $A$ has dimensions $m \times n$ then the [[Nullspace (Linear Algebra)]] is a subspace of $\mathbb{R}^n$
- Has the same dimensions as the number of [[Free Variables (Linear Algebra)]] and special solutions


### What about AX=b
- Since we have coined a term for the space that contains solutions for $AX=0$ one might ask why we don't also take about the subspace for $AX=b$ where b is an arbitrary vector
- The reason we don't talk about a subspace in this case is because it's not a valid [[Vector Space (Linear Algebra)]] because it does not contain the zero vector

### Linear Transformation
- For a transformation that remains full [[Rank (Linear Algebra)]] the only vector that goes to zero is the zero vector
- However for transformations that reduce the [[Rank (Linear Algebra)]], there will be some vectors that gets squished onto zero, these vectors form the [[Nullspace (Linear Algebra)]] (see https://youtu.be/uQhTuRlWMxw?si=SveoWW0hwGmvJeXn)
### Sources
https://youtu.be/8o5Cmfpeo6g?si=G8Yh8CoghfcAOFb8 - Lecture by [[Gilbert Strang (Mathematician)]]