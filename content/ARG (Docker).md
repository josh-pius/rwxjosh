### General
- Lets you create a build variable. It can have a default value or you can pass a value to it when you call docker build
- Lets you parameterize a [[Dockerfile (Docker)]]
- The `ARG` instruction defines a variable that users can pass at build-time to the builder with the `docker build` command using the `--build-arg <varname>=<value>` flag.
```

FROM busybox
ARG user1
ARG buildno
# ...
```
- An `ARG` instruction can optionally include a default value:
```
FROM busybox
ARG user1=someuser
ARG buildno=1
# ...
```