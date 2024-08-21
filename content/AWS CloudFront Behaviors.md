### General
- Contained within [[AWS CloudFront Distribution]]
- Behavior refers to the Cache Behavior
- Think of it like a sub-configuration
- Works using pattern-match
- Behaviors sit between the [[AWS CloudFront Origin]] and [[AWS CloudFront Distribution]]

### Default Behavior
- Match All (\*) pattern
- Wildcard
- Meant to be used for low security things, not matched by other behaviors


### Specific Behaviors
- You can specify other behaviors than the default which are more specific
- These take priority
- Eg. If we have private images in a bucket we could specify a behavior `img/*` that would apply different configuration to images
	-  [[Time To Live (TTL)]], [[AWS CloudFront Origin|Origins]], Origin groups, protocol policies, restricted access are configured via behaviors

### Configuration
- All the below heading pertain to configuration you can specify at a behavior level
#### Origin or Origin Group
- You pick the origin or origin group at behavior level

#### Viewer Protocol Policy
- Can can pick any one
	- HTTP or HTTPS
	- Redirect HTTP => HTTPS
		- The option most used.
	- HTTPS Only
		- Any HTTP connection will fail

#### Allowed HTTP Methods
- Can pick any 
	- GET, HEAD
	- GET, HEAD, OPTIONS, 
	- GET HEAD, OPTIONS, PUT, POST, PATCH, DELETE

#### Field Level Encryption
- Allows you to encrypt data from the point that it enters Edge Location through CloudFront network

#### Cache Directives
- Settings pertaining to cache
	- Cache HTTP methods
	- Cache and origin request settings
	- Cache based on selected request headers

#### TTL
- Minimum [[Time To Live (TTL)|TTL]]
- Maximum [[Time To Live (TTL)|TTL]] 
- Default [[Time To Live (TTL)|TTL]]

#### Restrict Viewer Access To Behavior
- If you select this viewers must use Signed URLs or Signed cookies to access your content
- Trusted Signers
	- You can make yourself the only one who has access to the content or you can specify particular accounts that have access via signed URLs or cookies
- Important for the exam ([[Cantrill AWS Solutions Architect Associate Exam Powerup]])
- Related [[AWS CloudFront Distribution#Private Distribution]]

#### Compress Objects Automatically
- Another setting you can specify at the behavior level


### Exam Powerup
[[Cantrill AWS Solutions Architect Associate Exam Powerup]]
- As much as possible commit to memory which settings belong to distribution and which to behavior

