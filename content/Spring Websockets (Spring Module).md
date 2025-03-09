### Important Interfaces
1. [[WebSocketHandler (Java)]]
	1. Methods:
		- afterConnectionEstablished(): Invoked after the WebSocket connection is established.
		- handleMessage(): Called when a message is received.
		- handleTransportError(): Handles transport-level errors.
		- afterConnectionClosed(): Invoked after the connection is closed.
		- supportsPartialMessages(): Indicates whether partial messages are supported.
2. [[TextWebSocketHandler (Java)]] and [[BinaryWebSocketHander (Java)]]
	- Convenience base classes for handling text and binary message
	- Extending these classes helps avoid directly implementing [[WebSocketHandler (Java)]]
3. [[WebSocketSession (Java)]]
	- Represents an active WebSocket session
	- `sendMessage(WebSocketMessage<?>)`: Sends messages to the client.
	- getId(): Returns the unique session ID.
	- getAttributes(): Returns session attributes.
4. [[WebSocketMessage (Java)]]
	1. Represents a WebSocket message.
5. [[HandshakeHandler (Java)]]
	1. Manages the websocket handshake process
6. [[HandshakeInterceptor (Java)]]
	- Intercepts WebSocket handshake requests before and after handshake processing.
	- Common use cases include authentication and request logging.
7. [[WebSocketConfigurer (Java)]]
	- Used to configure WebSocket endpoints in a Spring application.
8. [[WebSocketHandlerRegistry (Java)]]
	- Helps in mapping WebSocket handlers to specific URLs.
9. [[StompSessionHandler (Java)]]
	- Handles STOMP (Simple Text-Oriented Messaging Protocol) sessions.
10. [[StompFrameHandler (Java)]]
	- Processes incoming STOMP frames and handles messages.
11. [[SimpMessageSendingOperations (Java)]]
	- Abstraction for sending messages to WebSocket clients.
12. [[SimpMessagingTemplate (Java)]]
	- Concrete implementation for sending messages over WebSockets.
13. [[MessageBroker (Java)]]
	- Used to configure a message broker for routing messages between clients.
	1. [[SimpMessageBrokerConfigurer (Java)]]
14. [[ChannelInterceptor (Java)]]
	- Intercepts messages on WebSocket channels for logging, security, or other custom processing.

### How it Works
- You need to add a handler for the path to your [[WebSocketHandlerRegistry (Java)]] this can be done via [[WebSocketConfigurer (Java)]]
- The handler class which implments [[AbstractWebSocketHandler (Java)]] has a handleMessage endpoint that determines what it does with received messages
- This handler is added to a particular path in the Server (say Tomcat)
- For the client, a [[StandardWebSocketClient (Java)]] has a execute method which can be provided another handler and the URL it needs to connect to 
	- The session can then use `sendMessage(..)` to send a message to the server

### Special Handling For Jetty
- There are a lot of classes and tests specifically around how [[Jetty (Java)]] works with websockets



### Metadata
2025-02-12 01:58
- managed to implement a simple websocket client and server 
