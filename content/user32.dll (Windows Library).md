### General
- A [[Dynamic Link Library (DLL)]] file that contains the actual implementation of various Windows API functions related to user interface management, such as window creation, message handling, and input processing.
- Examples: [[MessageBox (Windows API)]] , `CreateWindow` , `GetMessage`
- Applications interact with this DLL to access the user-interface-related APIs provided by Windows.
- It resides in the system directory (e.g., `C:\Windows\System32`).
- Part of the Windows operating system; users don’t need to ship or deploy it with their application.
- [[user32.lib (Windows Library)]] usually included with development tools is is used to facilitate linking to this library


### How it Works
- When you call the Windows API, eg [[MessageBox (Windows API)]], your code references [[user32.lib (Windows Library)]] during compilation
- The linker uses [[user32.lib (Windows Library)]] to resolve the reference and set up necessary information in the [[Import Address Table (IAT) (Windows)]]
- At run time when your application calls [[MessageBox (Windows API)]], the system loads [[user32.dll (Windows Library)]] into memory and the IAT entry directly the call to the appropriate address in [[user32.dll (Windows Library)]]