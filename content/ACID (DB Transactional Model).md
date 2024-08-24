See also [[BASE (DB Transactional Model)]], [[CAP Theorem (Computer Science)]]

### General
- Focuses on consistency and partition tolerance from the [[CAP Theorem (Computer Science)]]

### Acronym
Source: [[Cantrill AWS Solutions Architect Associate]]
- A - Atomic
	- All or no component of a transaction succeeds or fails
- C - Consistent
	- Transactions move the database from one valid state to another. Nothing in between is allowed
- I - Isolated
	- If multiple transactions occur at once they don't interfere with each other. Each executes as if  it's the only one
	- It ensures that concurrently executed transactions leave the DB in the same state if they had been executed sequentially
- D - Durable
	- Once committed, transactions are durable, even in case of system failure. Stored on non-volatile memory, resilient to power outages and crashes

### Example
- [[AWS RDS]] - Limits scaling
- Financial institutions often use it because it implements a very rigid form of


