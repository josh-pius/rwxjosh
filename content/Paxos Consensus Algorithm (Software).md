### General
- Paxos is a family of protocols for solving the problem of consensus in distributed networks. 
- First submitted in 1989, the Paxos protocol is named after a fictional legislative consensus system on the island of Paxos in [[Greece (Country)]]. 
- According to Paxos’ inventor, [[Leslie Lamport (Programmer)]], the parliament had to function “even though legislators continually wandered in and out of the parliamentary Chamber.” Thus, Paxos is a metaphor for achieving agreement in unpredictable conditions.
- While PAXOS offers a robust solution for distributed consensus, its complexity can be a hurdle. 
	- Other algorithms like [[Raft Consensus Algorithm (Software)]], inspired by PAXOS, aim to achieve similar results with a simpler design.
- The [[Byzantine Generals Problem]] solves for the synchronous case, whereas paxos solves for asynchronous


### Leslie Lamport on Paxos
Source: https://youtu.be/RFkzp7WXAT4?si=iuOZkOMqOhJS7v2Y [[Leslie Lamport (Programmer)]]
- Got the idea when looking at an algorithm for fault tolerance and figuring out that they made a faulty assumption about there being a leader
- He intuited that to solve for it you needed to use real time to distinguish between a slow/faulty process
	- [[Impossibility of Distributed Consensus with One Faulty Process (Academic Paper)|FLP Result]] that proved it it was indeed impossible without real time
- Leslie started looking into how real-time would make it possible