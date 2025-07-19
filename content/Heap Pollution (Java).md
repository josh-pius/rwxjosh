### General
Source: https://youtube.com/shorts/gRFUBUAdnzk?si=_v9kUhxBAmY8LdY0
- I have no idea why they called it this, the name seems like a misnomer
	- Nothing to do with heap or even memory but actually related to type safety
- This is a problem that occurs with generics and [[Raw Type (Java)|raw types]]
- You can declare a list with type `List<Long>` but if a method accepts a raw type `List` (note: no type)
- Then inside the method you could have an operation that adds a string or any other type into the list
- My theory is that types like `List<Long>` being [[Type Erasure (Java)|erased]] at runtime is a cause for this. Since such types are not [[Reifiability (Java)|reifiable]]
