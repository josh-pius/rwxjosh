### General
- Savepoint allows partial rollbacks within a transaction. 
- You can create a [[Savepoint (JDBC) (Java)]] using `conn.setSavepoint("point")` and roll back to it with `conn.rollback(savepoint)` without rolling back the entire transaction. 