---
aliases:
  - Free-Space Bitmap (Filesystem) (OS Concept)
---
### General
- I'm not sure if there's an official name for this.
- Based on [[Operating Systems Three Easy Pieces (OSTEP) (Book)]] I'm calling this idea the allocation bitmap
- But on wikipedia it's referred to a free-space bitmap (https://en.wikipedia.org/wiki/Free-space_bitmap)
- The basic idea is the same, a [[Bitmap (Software)]] used to track data blocks that are in use and that are free, at least based on OSTEP it seemed to suggest two bitmaps in the filesystem, one for [[Inode (Linux)]] and the other for data blocks 
	- In the original [[Unix FS (File System)]] a [[Free List (Data Structure)]] was used