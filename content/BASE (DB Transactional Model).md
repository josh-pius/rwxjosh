See also [[ACID (DB Transactional Model)]], [[CAP Theorem (Computer Science)]]

### Acronym
- BA - Basically Available
	- Read and write operations are available as much as possible but without any consistency guarantees
- S - Soft State
	- Database doesn't enforce consistency. This is offloaded onto the developer using it. When reading, you don't have to get all the writes before it. If we want that as developers we need to check for it or specify it like with [[AWS DynamoDB]]
- E - Eventually consistent
	- If we wait long enough, reads from the system will be consistent


### Advantages
- While the [[BASE (DB Transactional Model)#Acronym]] seems to suggest a crappy DB compared to [[ACID (DB Transactional Model)]] it has it's benefits
- It's highly performant and highly scalable 

### Example
- [[AWS DynamoDB]] - Offers immediately and eventually consistent reads but application needs to be aware of that ^da36c6
	- Also offers some ACID functionalities like Transactions