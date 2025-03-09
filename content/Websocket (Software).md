### General
- Built on top of [[TCP (Computer Networking)]] like [[HTTP (Computer Networking)]]
- HTTP closes the TCP socket but Websocket leaves it open

### Official Standard
- [[RFC6455 (Standard)]]
https://datatracker.ietf.org/doc/html/rfc6455


### Websockets API
https://websockets.spec.whatwg.org//

### Overhead
https://youtube.com/shorts/bbX1mYKs2PY?si=NiB4iWv9cfsmUF6i
- Has it's own concept of [[Frames (Computer Networking)]] which are bigger
- Came before [[TLS (Computer Networking)]] so it does some of the TLS does in less inefficient ways
	- Like avoiding [[Cache Poisoning (Software)]] for proxy (?)

### Metadata
2025-02-07 23:20
- Created a websocket server for the first time today
- I used [[ChatGPT]] for the code but having spend the past two days figuring out the various classes provided for it by [[Spring Websockets (Spring Module)]] I could understand what was happening 