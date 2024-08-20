### General
- Related to [[malloc (C Programming)]]
- Used when you've allocated space but then need to add more to the space.
- [[realloc (C Programming)]] makes a new larger region of memory, copies the old region into it and return the pointer to the new region


### Example
```c
...
v->elements = realloc(v->elements, sizeof(int) * (v->size-1));
...
```