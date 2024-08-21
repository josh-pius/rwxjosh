```
Alter Table <tableName> add UPDATE_TIMESTAMP DATETIME NULL;

use <schema>
GO
CREATE TRIGGER dbo.trgAfterUpdate ON dbo.<tableName>
AFTER INSERT,UPDATE
AS
	UPDATE f set UPDATE_TIMESTAMP=GETDATE()
	FROM 
	<schema>..<TableName>
	INNER JOIN inserted
	AS i
	ON f.<primary_key> = i.<primary_key>
```