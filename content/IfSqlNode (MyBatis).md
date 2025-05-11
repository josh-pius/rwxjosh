### General
- The class that [[MyBatis (Java Library)]] uses to handle the `<if>` blocks in a mapper
```sql
SELECT * FROM SOME_TABLE 
WHERE FIELD=10
<if test=" someVar != null >
	AND FIELD_2 = #{someVar}
</fi>
```