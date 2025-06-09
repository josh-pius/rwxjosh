---
aliases:
  - mitmdump (CLI Utility)
  - mitmweb (Software Tool)
---

### General
- _mitmproxy_ is a free and open source interactive HTTPS proxy. It comes with three tools
	- mitmproxy - The TUI 
	- mitmdump - The CLI tool (like [[tcpdump (Linux Command)]])
	- mitmweb - Browser based tool
- Tools like [[tcpdump (Linux Command)]] can capture traffic for TCP and HTTP, but traffic for HTTPs (the most common kind in applications) cannot be captured
	- To captures this kind of traffic a tool like this can be used
- For intercepting traffic you can specify a regex, it uses python-based regex syntax
- Author: [[Aldo Cortesi (Software Engineer)]]

### mitmdump
- While [[mitmproxy (CLI Utility)]] is [[Terminal User Interface (TUI)]] based interace
- You can also use [[mitmproxy (CLI Utility)|mitmdump (CLI Utility)]] which is like [[tcpdump (Linux Command)]] 
### Installation
```
sudo apt install mitmproxy
# or
pip install mitmproxy
```


### How to Use
Source: [[ChatGPT]]
1. Run mitmproxy as an HTTPs intercepting proxy
```bash
mitmproxy --mode regular --listen-port 8081 -v
```
2. Trust mitmproxy's root certificate
	1. The root cert can be found under `~/.mitmproxy`
	- The cert looks something like `mitmproxy-ca-cert.pem`
```bash
# mitmproxy --export-cert /tmp/mitmcerts
# This command above was suggested by chatgpt but does not work
```
3. Install the cert in the [[truststore (Cryptography)]] with [[keytool (Software)]]
	1. This allows java to trust mitmproxy's cert
```bash
sudo keytool -import -trustcacerts -keystore $JAVA_HOME/lib/security/cacerts \
-storepass changeit -noprompt
-alias mitmproxy \
file /tmp/mitmcerts/mitmproxy-ca-cert.pem
```
- validate with this command [[keytool (Software)]]
```
keytool -list -cacerts -storepass changeit | grep mitm
```
4. Route Java app's traffic through mitmproxy
```bash
-Dhttp.proxyHost=localhost \ 
-Dhttp.proxyPort=8081 \ 
-Dhttps.proxyHost=localhost \ 
-Dhttps.proxyPort=8081
```
5. If you have VM args that specify the `cacert` verify that it uses the `cacert` that was just updated


### Video on Using mitmproxy to Intercept and Modify Requests
https://youtu.be/igcsLKDfssw?si=MsUoajniJKpP6z2Q 
- He shows how you can use it to intercept a request, and modify it's path parameter
	- You could modify query parameter or any other part of the request as well

### A Proper MITM Lecture
Speaker: [[Jim Cheethan (Software Developer)]]
- https://youtu.be/kQ1-0G90lQg?si=JmwQoDElIO_BSoCE
- You can use this to record and replay requests, which lets you use this as a testing tool
	- For example you could intercept a request and replace the response with some other data
- Sticky cookies and authentication
	- You can let this record an interactive login through the proxy via say 2FA, then tell the proxy to remember all then, then switch to using a tool like wget, when it does the proxy can replay all the auth data and can get it to work
- Programmable
	- It's a python library so you can add it to existing python code and get it to work

### Using mitm to see what kubectl does under the hood
https://youtu.be/30a0WrfaS2A?si=h4kdAMwGMJvNqWp5

### Metadata
2025-05-20 22:55
- Following the steps above I managed to use it to see outgoing traffic from a [[JAR (File Format)]] at work


2025-06-07 04:05
- I followed the tutorial on the official site and tried out intercepting and modifying the request