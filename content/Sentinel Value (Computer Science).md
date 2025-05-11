### General
- In computer programming, a sentinel value (also referred to as a flag value, trip value, rogue value, signal value, or dummy data) is a special value in the context of an algorithm which uses its presence as a condition of termination, typically in a loop or recursive algorithm.
- The sentinel value is a form of [[In-Band Signaling|in-band]] data that makes it possible to detect the end of the data when no out-of-band data (such as an explicit size indication) is provided.
- The value should be selected in such a way that it is guaranteed to be distinct from all legal data values since otherwise, the presence of such values would prematurely signal the end of the data (the [[Semipredicate Problem (Computer Science)]]).
### Examples
Some examples of common sentinel values and their uses:

- [[NUL (ASCII Character)]] for indicating the end of a null-terminated string.
- [[Null Pointer (C Programming)]] for indicating the end of a linked list or a tree.
- A set most significant bit in a stream of equally spaced data values, for example, a set 8th bit in a stream of 7-bit ASCII characters stored in 8-bit bytes indicating a special property (like inverse video, boldface or italics) or the end of the stream.
- A negative integer for indicating the end of a sequence of non-negative integers.