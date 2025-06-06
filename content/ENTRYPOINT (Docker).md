### General
- If you run a container like `docker container run <some-image>`
	- The container stops immediately unless it has an ENTRYPOINT or a CMD or am argument provided after the image name like `docker container run <some-image> <some-command>`

### Exec form vs Shell form
- [[shell form (Software)]]
```
ENTRYPOINT script.py
```
- [[exec form (Software)]]
```
ENTRYPOINT ["echo", "hello"]
```
- If your entry point has an [[exec form (Software)]] ,any args you pass when you try creating a new container gets added at the end of the ENTRYPOINT command


### Example
```
FROM alphine
ENTRYPOINT ["echo", "hello"]

docker container run img echo world
```
- The example in this case returns `hello echo world`
	- Because CMD's argument be
