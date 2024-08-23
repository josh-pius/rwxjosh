---
aliases:
  - ISLP
---

### General
- Two versions: "With applications in R" and "With Applications in Python"
- Highly recommended by [[Python Programmer (Youtuber)]] as one of the best books on statistical learning
	- https://youtu.be/M4sHIrIX_wY?si=TWjNneItCk_LA2fo
- [[Elements of Statistical Learning (Book)]]  is the more technical book by the same authors that deal more with the math
- Site: http://www.statlearning.com/

### Metadata
2024-05-28 00:32
- Reached section 2.3.2 on Page 40
2024-06-06 10:24
- Completed chapter 1, now at exercises

2024-06-07 10:28
- Read ahead in Chapter 3
- Working on exercises in chapter 2. Doing the coding questions now
- Skipping some of the exercises as they are mostly focused on plotting and I want to progress into the math

### Reasons to Estimate f
1. [[Prediction (Statistics)]]
	1. Exact form of $f$ isn't required, you can treat it like a black box
2. [[Inference (Statistics)]]
	1. Need to know it's exact form
	2. Interested in asking questions like
		1. Which predictors are associated with the response?
		2. What is the relationship between the response and each predictor?
		3. Can the relationship between Y and each predictor be adequately summarized using a linear equation, or is the relationship more complicated?

### Why choose a  more restrictive method instead of flexibility that would fit more data?
- There are several reasons that we might prefer a more restrictive model. If we are mainly interested in inference, then restrictive models are much more interpretable. For instance, when inference is the goal, the linear model may be a good choice since it will be quite easy to understand the relationship between $Y$ and $X_1, X_2,...,X_p$.
- In contrast, very flexible approaches, such as the [[Spline Regression (Piecewise) (Statistics)|Splines]], [[Boosting (Statistics)]] can lead to such complicated estimates of f that it is difficult to understand how any individual predictor is associated with the response
- [[Lasso Regression (L1) (Statistics)]] is even more inflexible than [[Linear Regression (Statistics)]] uses an alternative ftting procedure for estimating the coefficients $β_0, β$1,..., β_p$. The new procedure is more restrictive in estimating the coefficients, and sets a number of them to exactly zero
- [[Generalized Additive Models (GAM)]] are extend the linear model allow for certain non-linear relationships. Consequently, GAMs are more flexible than [[Linear Regression (Statistics)]]. They are also somewhat less interpretable than linear regression, because the relationship between each predictor and the response is now modeled using a curve
- Non-linear methods like [[Bagging (Statistics)]], [[Boosting (Statistics)]] and [[Support Vector Machines (SVM) (Machine Learning)]] with non-linear kernels and [[Neural Networks (Machine Learning)]] ([[Deep Learning (Machine Learning)]]) are highly flexible approaches that are hard to interpret
![[Pasted image 20240527090323.png|500]]
- One might think that for [[Prediction (Statistics)]] we'd be better off with a model with high flexibility but surprisingly this is not always the case. We will often obtain more accurate predictions using a less flexible method. This phenomenon, which may seem counterintuitive at first glance, has to do with the potential for overfitting in highly flexible methods

### Semi-Supervised Learning
[[Semi-Supervised Learning (Machine Learning)]]


### Knowing Many Methods
- Why is it necessary to introduce so many different statistical learning approaches, rather than just a single best method? 
	- There is no free lunch in statistics: no one method dominates all others over all possible data sets. On a particular data set, one specifc method may work best, but some other method may work better on a similar but different data set.


### Bias Variance Trade-off
- The U-shape in the test [[Mean Squared Error (MSE)|MSE]] is due to the [[Bias-Variance Tradeoff (Data Science)]]

### Linear Regression
[[Linear Regression (Statistics)]]

### ISLP Exercises
[[ISLP Exercises]]