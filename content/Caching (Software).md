### General
- This note is a generic note about caching
	- The caching might be low level like with [[CPU Cache (Computer Hardware)]]
	- Or high level like [[AWS ElastiCache]] used to cache frequently retrieved application data

### Notion of Locality
- The effectiveness of caching is based on the notion of locality, of which there are two kinds
	- Temporal Locality
	- Spatial Locality
- **Temporal Locality**: Refers to the principle that if a particular data item (such as a variable or instruction) has been accessed recently, it is likely to be accessed again in the near future. This is often observed in loops, where the same set of instructions or data is repeatedly accessed over a short period of time.
- **Spatial Locality**: Refers to the principle that if a particular data item is accessed, other data items with nearby addresses are likely to be accessed soon. This often occurs because programs frequently process data structures like arrays or objects that are stored sequentially in memory.
- Examples in Practice
	- CPU Cache:
		- Temporal Locality: When a function is called multiple times, its instructions are likely to remain in the cache for quick access.
		- Spatial Locality: When one array element is accessed, neighboring elements are also loaded into the cache, improving performance for operations on arrays.
	- Web Caching:
		- Temporal Locality: Frequently accessed web pages or resources are cached in a browser or proxy server, reducing the need to fetch them repeatedly from a remote server.
		- Spatial Locality: When a webpage is loaded, associated resources like images and scripts from the same site are cached, anticipating that they may be needed soon.