---
aliases:
  - Apache Benchmark (Perf Test Software)
---
### General
- `ab` is a tool for benchmarking your Apache Hypertext Transfer Protocol (HTTP) server. It is designed to give you an impression of how your current Apache installation performs. This especially shows you how many requests per second your Apache installation is capable of serving.
- Can be useful if you want to a do a quick perf test on an endpoint

### Metadata
2024-09-20 16:05
https://stackoverflow.com/questions/1754427/jmeter-alternative
- Tested this tool out by running perf test on an endpoint 
```bash
an -n 10 -c 10 <url>
```