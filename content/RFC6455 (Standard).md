### General
- [[RFC (Standard)]] regarding [[Websocket (Software)]]
- https://datatracker.ietf.org/doc/html/rfc6455



### Extensions
 >WebSocket clients MAY request extensions to this specification, and WebSocket servers MAY accept some or all extensions requested by the client.  A server MUST NOT respond with any extension not requested by the client.  If extension parameters are included in negotiations between the client and the server, those parameters MUST be chosen in accordance with the specification of the extension to which the parameters apply.

>A client requests extensions by including a |Sec-WebSocket-
   Extensions| [[HTTP Headers|Header]] field

- Looked this up because I found a [[Spring (Java Framework)]] class that supports it [[WebSocketExtension (Java)]]
- As per [[RFC6455 (Standard)]] the extension might be split across two headers or provided in a single header
	- When provided in the same header they are separated by comma, and use [[semicolon (Keyboard character)|;]] to specify parameters
	- When provided in different headers it's clear that they are different extensions 


### Subprotocol
> The client can request that the server use a specific subprotocol by
   including the |Sec-WebSocket-Protocol| field in its handshake.  If it
   is specified, the server needs to include the same field and one of
   the selected subprotocol values in its response for the connection to
   be established.

- There is a unit test in [[Spring Websockets (Spring Module)]] for this