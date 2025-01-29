### General
- A Static Import Library provided with development tools (e.g., [[Visual Studio (IDE)]]) to facilitate linking your application with [[user32.dll (Windows Library)]].
- Used during [[Compiler (Computer Science)|compile]] time
- It contains stubs or references that direct the [[Linker (Software)]] to use the corresponding functions in user32.dll.
- Don't be misled by `.lib` this doesn't really contain the real code to be executed instead it provides a stub that gets replaced at run time with call to the real implementation in [[user32.dll (Windows Library)]]