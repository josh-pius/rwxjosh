### General
- `Optional<T>` class represents an immutable container that can hold either a single non-null reference or nothing at all

### Original Intent
Source: https://youtube.com/shorts/Dxij5GSUM40?si=SBr9FZIRHPOyreb8 by [[Java (Programming Language)]]
- When you do a reduction like `reduce((i,j) -> i+j)` we needed a way to denote that no value could be returned if the stream is empty `Optional.empty` satisfied that need
- From the comments, on the same video it it looks like Optionals are being used for other things as well



### Assigning Defaults to Nulls In One Line
```Java
Optional.ofNullable(
	someMap
	.get(id)
	.get(otherId)
).orElse(BigDecimal.ZERO);
```




### Exclude Certain Values From a Map Operation
- At work I faced an issue while working on some code. I went with a less than ideal solution until I found out that the right  way to do it is via [[Optionals (Java)]]
- The problem was to transform a list of a certain type of object to another list of another type of object. The mapping happened in the translate method and there was a possibility that I'm not able to map properly and so I needed to filter it out of the final list.
- My first approach since I wasn't proficient in streams was to return null when the translation failed due to say an exception
	- [[null (Java Keyword)]] was to act as the in-band signal to mean that the record failed to be filtered
	- Code shown below
```java
// Tranform one set of records to another
List<Score> records = csvRecords
						.stream()
						.map(e->translate(e, models, someMap))
						.filter(Objects::nonNull)
						.toList()

....
// Translate method
public Score translate(Map<String,String> csvRecord, 
					   Map<String,Long> models,
					   Map<Long,Long> regEntTrdEntMap)
{
	try{
		return Score
				.builder()
				.someFiled("abcd")
				...
				.build();	
	} catch (Exception e){ 
		log.error("Some error");
		return null; // in-band signal
	}					   
}
```
- This approach isn't clean and would especially be a problem if null was a valid value from the translate method
- Here's how I modified the code to be cleaner with optionals

```java
// Tranform one set of records to another
List<Score> records = csvRecords
						.stream()
						.map(e->translate(e, models, someMap))
						.filter(Optional::isPresent)
						.filter(Optional::get)
						.toList();

....
// Translate method
public Optional<Score> translate(Map<String,String> csvRecord, 
					   Map<String,Long> models,
					   Map<Long,Long> regEntTrdEntMap)
{
	try{
		return Optional(Score
				.builder()
				.someFiled("abcd")
				...
				.build());	
	} catch (Exception e){ 
		log.error("Some error");
		return Optional.empty();
	}					   
}
```


### Metadata
2024-11-27 02:16
[[#Exclude Certain Values From a Map Operation]]