### General
- In computer programming, a semipredicate problem occurs when a subroutine(i.e. function) intended to return a useful value can fail, but the signaling of failure uses an otherwise valid return value.
	- The problem is that the caller of the subroutine cannot tell what the result means in this case.

### Example
- The division operation yields a real number, but fails when the divisor is zero. If we were to write a function that performs division, we might choose to return 0 on this invalid input. 
- However, if the dividend is 0, the result is 0 too. This means there is no number we can return to uniquely signal attempted division by zero, since all real numbers are in the range of division.