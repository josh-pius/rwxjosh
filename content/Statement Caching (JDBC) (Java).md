### General
- Statement caching reuses compiled SQL execution plans for repeated queries, reducing DB load and latency. 
- Enabled at the [[DataSource (Java)]] or connection pool level (e.g., in HikariCP or Oracle UCP).