### General
- https://stephens999.github.io/fiveMinuteStats/inverse_transform_sampling.html
### Generating Numbers Based on Distribution Using  a Uniform Distribution (Discrete)
- When I asked [[ChatGPT]] to give me a program for a [[Markov Chains (Mathematics)]] it used this method to determine the transition
- I was curious how it works and discovered it's based on a technique called [[Inverse Transform Sampling (Mathematics)]], in the discrete case especially, it's easy to implement as shown below
```java
   // Simulate one step
    public void nextStep() {
        double r = rand.nextDouble();
        double cumulative = 0.0;

        for (int i = 0; i < transitionMatrix[currentState].length; i++) {
            cumulative += transitionMatrix[currentState][i];
            if (r <= cumulative) {
                currentState = i;
                break;
            }
        }
    }
```