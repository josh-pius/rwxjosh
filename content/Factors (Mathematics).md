### General
- In arithmetic factors of a number are another number that is able to divide it sans reminder


### Number of Factors
- If you know all the [[Prime Numbers (Mathematics)|primes]] of a number you can calculate how many factors it has
	- All you have to do is add one to all the exponents of the prime factor and multiple it together

eg. $60=2^2\times3^1\times5^1$ the prime factors are $(2+1)\times(1+1)\times(1+1)=12$

- Number of odd factors. 
	- This can be found with an approach similar to the one above but we'll not consider the exponent of 2
	- Utilizes [[Prime Factorization (Mathematics)]]
- Number of even factors
	- This can be found by subtracting odd factors from total number of factors


### Non-Factors of A Factorial
- eg. What are the five smallest composite numbers that are not factors of $10!$ (10 factorial)?
	- This can be challenging since most composite numbers are factors of 10!
	- What you should try to do in this case is find multiple (not with one) of all primes greater than 10
		- 11: 22,33,44,55
		- 13: 26, 39, 52
		- 17: 34, 51
		- 19: 38, 57
		- Ans: 22,33,26,34,38

### Numbers with Exactly n odd factors
- Q. How many integers less than 100, have exactly 4 odd factors
	- The trick here is to remember [[#Number of Factors]]
	- Use this knowledge to enumerate the number of combination of form $a^1b^1$ such that a and b are prime
	- Also remember to add $c^3$ is also one of the numbers with  four factos
	- Ans: 17


### Number of Factors Shared By Two Numbers
- You can find this by first calculating the [[Highest Common Factor (HCF) (Mathematics)]] of the two numbers and then using the [[#Number of Factors]] technique on the HCF