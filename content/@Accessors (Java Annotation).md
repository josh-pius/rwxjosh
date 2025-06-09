### General
- A [[Lombok (Java Library)]] [[Annotation (Java)]]
- It changes how Lombok generates getters and setters:
- fluent = true:
	- Removes the get and set prefixes.
	 - Getters and setters are named directly after the field.
- chain = true:
	- Setters return this instead of void, so you can chain setter calls together.


### Warning
- If you use fluent = true, frameworks like Jackson or Hibernate might expect standard getters/setters and could break unless you configure them.
	- I think I had a problem personally with [[MyBatis (Java Library)]] because of this
- Fluent accessors are great for internal models, DTOs, or builders, but might be problematic if you expose your POJOs directly in public APIs.