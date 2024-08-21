### General
- [[het_tanis (Youtuber)]] says that we never want to be swapping on modern linux systems
- RAM  is already ~1000 times slower than processor memory, Disk would be ~1000 times more slower than RAM
- [[Kubernetes (Software)]] in fact disables swap memory
- You can use [[vmstat (Linux Command)]] to see if anything is going to swap memory


### Workaround If you Have to Assign Swap
- Some linux systems insist on having swap, one way about this is to create a RAM disk, that is allocate some memory on the RAM that you can then tell the system is the swap disk
- This way you wouldn't have the performance penalty of using the disk
- This can be done manually, is is how [[het_tanis (Youtuber)]] does it. But it can also be done using tools like zram and zswap