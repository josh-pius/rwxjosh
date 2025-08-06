---
aliases:
  - Summary Block (File system) (Software)
---

### General
- Used in [[Filesystem (OS Concept)]]s like [[Fast File System (FFS) (Software)]]
- Holds statistics so that block allocation policy can pick an appropriate group than has more than average number of free blocks or inodes
- This of course means that this is another structure that needs to be updated on writes