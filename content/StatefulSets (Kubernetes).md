### General
- A StatefulSet runs a group of Pods, and maintains a sticky identity for each of those Pods. 
- This is useful for managing applications that need persistent storage or a stable, unique network identity.
- An alternative to [[Deployment (Kubernetes)]]
- StatefulSets are valuable for applications that require one or more of the following.
	- Stable, unique network identifiers.
	- Stable, persistent storage.
	- Ordered, graceful deployment and scaling.
	- Ordered, automated rolling updates.