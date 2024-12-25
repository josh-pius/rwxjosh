### General
- Can be used to read a [[Gzip (Linux Command)]] compressed file
- This class be used to decorate another input stream

```java
try (var is = Files.newBufferedInputStream(path);
	 var gzis = new GZIPInputStream(is);) {
	... = gzis.read(...);
 }
```