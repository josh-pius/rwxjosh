### General
- An interface that provides a variety of methods to obtain comprehensive information about the database. 
- This information is useful for creating database tools that allow users to explore the structure of different databases. 
- It’s also helpful when we want to check whether the underlying database supports some features or not.

### Creating an Instance
```java
DatabaseMetaData databaseMetaData = connection.getMetaData();
```

### Column Metadata
- See baeldung source for more
```java
try(ResultSet columns = databaseMetaData.getColumns(null,null, "CUSTOMER_ADDRESS", null)){
  while(columns.next()) {
    String columnName = columns.getString("COLUMN_NAME");
    String columnSize = columns.getString("COLUMN_SIZE");
    String datatype = columns.getString("DATA_TYPE");
    String isNullable = columns.getString("IS_NULLABLE");
    String isAutoIncrement = columns.getString("IS_AUTOINCREMENT");
  }
}
```

```java
try(ResultSet primaryKeys = databaseMetaData.getPrimaryKeys(null, null, "CUSTOMER_ADDRESS")){ 
 while(primaryKeys.next()){ 
    String primaryKeyColumnName = primaryKeys.getString("COLUMN_NAME"); 
    String primaryKeyName = primaryKeys.getString("PK_NAME"); 
 }
}
```

```java

try(ResultSet foreignKeys = databaseMetaData.getImportedKeys(null, null, "CUSTOMER_ADDRESS")){
 while(foreignKeys.next()){
    String pkTableName = foreignKeys.getString("PKTABLE_NAME");
    String fkTableName = foreignKeys.getString("FKTABLE_NAME");
    String pkColumnName = foreignKeys.getString("PKCOLUMN_NAME");
    String fkColumnName = foreignKeys.getString("FKCOLUMN_NAME");
 }
}
```

### Database Level Metadata
```java
String productName = databaseMetaData.getDatabaseProductName();
String productVersion = databaseMetaData.getDatabaseProductVersion();
String driverName = databaseMetaData.getDriverName();
String driverVersion = databaseMetaData.getDriverVersion();
```

### Check Supported Features
```java
boolean supportsFullOuterJoins = databaseMetaData.supportsFullOuterJoins();
boolean supportsStoredProcedures = databaseMetaData.supportsStoredProcedures();
boolean supportsTransactions = databaseMetaData.supportsTransactions();
boolean supportsBatchUpdates = databaseMetaData.supportsBatchUpdates();
```

### Sources
https://www.baeldung.com/jdbc-database-metadata