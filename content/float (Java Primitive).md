### General
- float: The float data type is a single-precision 32-bit [[IEEE 754 (Standard)]] floating point. 
- Its range of values is beyond the scope of this discussion, but is specified in the Floating-Point Types, Formats, and Values section of the Java Language Specification. 
- As with the recommendations for byte and short, use a float (instead of double) if you need to save memory in large arrays of floating point numbers. 
- This data type should never be used for precise values, such as currency. 
- For that, you will need to use the java.math.[[BigDecimal (Java)]] class instead. [Numbers and Strings](https://docs.oracle.com/javase/tutorial/java/data/index.html) covers BigDecimal and other useful classes provided by the Java platform.
