### General
- The **tr** command is a UNIX command-line utility for translating or deleting characters. It supports a range of transformations including uppercase to lowercase, squeezing repeating characters, deleting specific characters, and basic find and replace. It can be used with UNIX pipes to support more complex translation. **tr stands for translate.**


### Syntax
```
tr [OPTION] SET1 [SET2]
```



### Examples
- Replace space with tab
```
tr [:space:] "\t"
```

- Delete specific character. In the case below delete `W`
```
 tr -d W
```

- To remove all the digits from the string, you can use
```
tr -d [:digit:]
```


### Swap Two All Instances of Two Characters In A String
- How would I go from this $4*5/2*3$ to $4/5*2/3$?

```
tr "*/" "/*"
```


### Metadata
2024-04-17 01:35
- Used this command quiet extensively for [[Over the Wire (CTF Site)]] Krypton