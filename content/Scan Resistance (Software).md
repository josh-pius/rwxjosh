### General
- In the context of caching, scan resistance refers to a cache algorithm’s ability to avoid being “polluted” or adversely affected by large sequential scans of data that are accessed only once.


### Why scan resistance matters
- **Traditional [[Least Recently Used (LRU) (Cache Replacement Policy)|LRU]] problem**: A naive Least Recently Used (LRU) cache will put new items into the cache and evict the oldest ones, even if those evicted items are frequently accessed (“hot”) compared to the new items that are just passing through.
- **Large scans**: When a large file or sequence of data is read in one pass (i.e., a scan), most of the accessed blocks might never be used again. If the caching algorithm automatically brings all these blocks into the cache, it can flush out valuable (frequently used) data, causing performance degradation.