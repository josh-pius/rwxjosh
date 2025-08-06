### Types
- `TYPE_FORWARD_ONLY` : Default; can only move forward.
- `TYPE_SCROLL_INSENSITIVE` : Can scroll, but not sensitive to DB changes.
- `TYPE_SCROLL_SENSITIVE` : Reflects changes made in the DB while open.

### Checking for Support
- Not all databases support all the _ResultSet_types. So, let’s check if the type is supported by using the _supportsResultSetType_ on our _DatabaseMetaData_ object:
```java
DatabaseMetaData dbmd = dbConnection.getMetaData();
boolean isSupported = dbmd.supportsResultSetType(ResultSet.TYPE_SCROLL_INSENSITIVE);
```