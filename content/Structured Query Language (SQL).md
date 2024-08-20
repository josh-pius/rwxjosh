---
aliases:
  - SQL
---

### Misnomer
- Often times people refer to [[Relational Database Management Systems (RDBMS)]] as SQL Databases, and anything outside RDBMS as No-SQL
- SQL is just a language and does not anything to do with the kind of database

## Structure of A SELECT STATEMENT

### TOP (N)
- If you have too many records
- You can restrict the query to give you only the top N records

### Group by
- Used to group records by one or more columns, or even derived columns
- Since columns are being aggregated you need to use aggregate functions like SUM, AVG, MAX
- But if you just want to view the various values that were in the fields of the aggregated columns you can just use [[String_Agg (SQL)]]


### Order By
- You can order by one or more columns or even derived colums
- By default ordering is ascending if you want descending you need to add `desc`

### Having
- Used along with group by to specify aggregate conditions

### Where
[[Where Clause (SQL)]]
- Used to filter out records based on conditions

### JOIN
- If you want to get related data from more than one table you need to use JOIN
- There are many types of JOINS
	- INNER JOIN
	- OUTER JOIN (left and right)
	- CROSS JOIN




## Types of SQL Commands

### DML
- Data Manipulation Language
- Used to Insert Update or Delete records

### DQL
- Data Query Language
- SELECT Statement

### DDL
- Data Definition Language
	- CREATE, DROP, ALTER, TRUNCATE, COMMENT, RENAME

### DCL
- Data Control Language
- GRANT REVOKE

### TCL
- Transaction Control Language
- COMMIT, ROLLBACK, SAVEPOINT, SET TRANSACTION

