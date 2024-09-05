### General
- Useful when you have data in-memory in the form of a byte array and you want to process it as an input stream
- Example
```
byte[] buffer = new byte[1024];
ByteArrayInput bais = new ByteArrayInputStream(buffer);
```