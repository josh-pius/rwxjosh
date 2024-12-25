### General
- See [[Stream Ordering (Java)]]
- Encounter order is the order in which [[Stream (Java Class)]] encounters data
- Whether or not a stream has an encounter order depends on the source and the intermediate operations. 
- Certain stream sources (such as [[List (Java Interface)]] or [[Arrays (Java Class)]]) are intrinsically ordered, whereas others (such as [[HashSet (Java Class)]]) are not. 
- Some intermediate operations, such as `sorted()`, may impose an encounter order on an otherwise unordered stream, and others may render an ordered stream unordered, such as `BaseStream.unordered()`. 
- Further, some terminal operations may ignore encounter order, such as `forEach()`.