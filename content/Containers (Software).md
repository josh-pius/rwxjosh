### General
- Are portable i.e. self-contained and always run as expected

### Container Registry
- Registry or hub of container images
- The location where we can privately or publicly store container images is known as **Container Registry
- AWS Container Registry is called ECR (Elastic Container Registry)
- [[Docker (Software)]] Container registry is called DockerHub

### Benefits of Containers Over VMs
- Since the OS is shared, each container is lightweight and small
- This allows us to run more applications on a host machine than VMs would allow


### Workspace Container
- An idea that [[Rwxrob (Youtuber)]] introduced me to
- Create a container available publically with all your favorite tools and configurations
- Anytime you're in a kubernetes cluster or another server and need to have your workspace you just need to pull and run your workspace container and you'll have all you need to start working no matter the environment or machine you're on

### Ubuntu Unminimize
- A container running [[Ubuntu (Linux Distro)]] will generally be barebones and missing things like man pages etc
- If you want to add them back use the `unminimize` command
### Related
[[Docker (Software)]]
[[AWS Elastic Container Service (ECS)]]