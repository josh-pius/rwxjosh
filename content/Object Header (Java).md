### General
- The object header is a fixed-size portion of memory at the beginning of every object, before any of the fields you define. It contains:
1.	Mark Word: Stores information such as:
	-	Object’s identity hash code
	-	GC-related bits
	-	Locking/synchronization info
2.	Klass Pointer (on HotSpot JVM):
	-	Pointer to the class metadata (i.e., which class this object belongs to)
3.	Padding (if necessary):
	-	To align the object to the JVM’s [[Word (Computer Architecture)]] size (typically 8-byte [[Data Structure Alignment (Software)|Alignment]])
