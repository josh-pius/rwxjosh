---
aliases:
  - Directory Brute-Forcing (Cybersecurity)
---
### General
- Directory Brute Forcing is a web reconnaissance technique used to discover hidden or unlinked directories and files on a web server by systematically attempting various paths.
- Common tools used for this include
	- [[gobuster (CLI Utility)]]
	- [[Dirb (Software Tool)]]
	- [[Dirbuster (Software Tool)]]

### How it works
- The tool takes a [[wordlist (Cybersecurity)]] of potential directory or file names (e.g., admin, login, backup.zip).
- It appends each entry to the base URL (e.g., http://example.com/admin).
- It checks the HTTP response codes (like 200 OK, 403 Forbidden, 404 Not Found) to identify valid paths

### Ethical Note
- Directory brute forcing is considered unauthorized access if performed on systems you don’t own or have permission to test. Only use it in:
	- Penetration testing engagements
	- Bug bounty programs
	- Your own infrastructure

### Metadata
2025-05-22 21:49
- Came across this in [[Hack The Box (Site)]]


### Sources
[[Hack The Box (Site)]]
[[ChatGPT]]