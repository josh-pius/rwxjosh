### General
Source:https://youtu.be/9g32v7bK3Co?si=QDzU9pIEcfgsUu9M by [[Stanford Online (Youtuber)]]
- Apparently used in [[Reinforcement Learning (Machine Learning)]]


### Definition
- States: Set of states
- $s_{start} \in\ \text{States}$ : Starting state
- Actions(s): Possible actions from state $s$
- $T(s,a,s')$ : Transition probability of $s'$ if take actions $a$ in state $s$
- $Reward(s,a,s')$: Reward for the transition $(s,a,s')$
- $\text{IsEnd}(s)$: Whether at the end of the game
- $0 \leq \gamma \leq 1$ Discount factor (default 1)
- Policy: Mapping from state to action (solution to MDP)
- MDP : Graph with states, chance nodes, transition probabilities, rewards
- Transition Probabilities: Specify the probability of ending up in state $s'$ if taken action $a$ in state $s$
- Value of a Policy: Let $V_{\pi}(s)$ be the expected utility received by following policy $\pi$ from state $s$
	- Or expected utility over random paths
- Q-Value of Policy: Let $Q_{\pi}(s,a)$ be the expected utility of taking action a from state $s$ and then following policy $\pi$
- Optimal Value $V_{opt}(s)$: The maximum value attained by a policy

### Metadata
2024-06-17 20:13
- Heard about it first [here](https://youtu.be/9g32v7bK3Co?si=QDzU9pIEcfgsUu9M)
 