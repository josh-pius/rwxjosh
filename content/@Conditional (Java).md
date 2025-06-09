### General
- [[Spring (Java Framework)]] [[Annotation (Java)]]
- Indicates that a component is only eligible for registration when all specified conditions are matched.
- A condition is any state that can be determined programatically before the [[Bean (Spring)]] definition is due to be registered

### Meta-Annotation
- I've seen it most often used as a [[Meta-Annotation (Java)]] on annotations like [[@ConditionalOnBean (Java)]], [[@ConditionalOnClass (Java)]], [[@ConditionalOnMissingBean (Java)]]
- Though there are a places where it's being used directly as well