### General
- MyBatis is a different type of tool compared to [[Hibernate (JPA Framework)]]
- Hibernate connects to the DB, check that the tables are there, creates them if they're not etc
- Mybatis just runs the queries, if you have to run complex queries and not do [[Object Relational Mapping (ORM)]] stuff this is the better option


### XML Superiority
- [[MyBatis (Java Library)]] docs says that due to the limitations of [[Annotation (Java)]] and complexity of mybatis mapping
- XML is needed for advanced mappings (eg. Nested Join Mapping)

### Dynamic SQL
1. chose (when, then)
2. [[forEach (MyBatis)]]
3. if
4. trim (where, set)
### forEach
[[forEach (MyBatis)]]


### Association
[[Association (MyBatis)]]

### Collection
[[Collection (MyBatis)]]
### Custom Type Handler
[[Custom Type Handlers (MyBatis)]]


### Parameters over 2100
- When I tried to run a query against a [[MS SQL Server (Database)]] database via Mybatis and there were over 2100, the query failed 
	- The query was trying to fetch entire security reference data given security id
	- If the number of ids exceeded 2100 it failed
	- 2100 is the total number of parameters used, say we have another dynamic parameter in the query apart from the sec Id, it's count summed with the count of sec Ids together should not exceed 2100
- When I looked up the issue I say some posts saying this happens for Oracle as well
- As far as I could tell there is no way to resolve this by changing any setting in MyBatis
- What I had to resort to was splitting the list  and then make separate queries and combine the data using `ListUtil.partition(list, partitionSize)`


### Sourcecode
https://github.com/mybatis/mybatis-3
- `SqlSession` - The main interface for working with MyBatis. You can use it to execute commands, get mappers and manage transactions


### Interceptor
- It's possible to set context for every query using a built-in interceptor class ibatis provides
- this would help tell the DB what user is querying and what info barrier policies to apply


### Calling Stored Procedure From MyBatis
- Use a SELECT annotation or XML element
- Set `statementType` to "CALLABLE" since [[Stored Procedure (RDBMS)]] are meant to use [[CallableStatement (Java)]] 
- Put the following statement inside the select annotation making changes as needed (assuming you're using annotations)
```java
@Select("""
{ 
call QRI_SYS_PM.EC_TE_MARKET_ACTIVITY_PKG.S_PR_LOAD_TE_MARKET_DATA(
#{entity.instrumentTypeCdList, javaType=arrayList, jdbcType=ARRAY, jdbcTypeName=QRI_SYS_PM.STRING_ARRAY, mode=IN, typeHandler=com.fmr.qrit.data.StringArrayHandler},
#{entity.userId, jdbcType=VARCHAR, mode=IN},
#{entity.status, jdbcType=INTEGER, mode=IN},
#{entity.instrumentTypeDeltaIdList, javaType=arrayList, jdbcType=ARRAY,jdbcTypeName=QRI_SYS_PM.EC_INSTRUMENT_TYPE_CD_TAB, mode=OUT, typeHandler=com.fmr.qrit.api.data.handler.InstrumentTypeObjectArrayHandler}
)}
""")
@Options(statementType= StatementType.CALLABLE)
@ResultType(MarketActivityEntity.class)
@Result(property= "entity.instrumentTypeCdList", column = "TAB_IN_INSTRUMENT_TYPE_CD_LIST", typeHandler=StringArrayHandler.class)
@Result(property= "entity.userId", column="VC2_IN_USER_ID")
@Result(property= "entity.status", column="NUM_OUT_RETURN_CODE")
@Result(property="entity.instrumentTypeDeltaIdList", column="TAB_OUT_INSTRUMENT_TYPE_DELTA_ID", typeHandler=InstrumentTypeObjectArrayHandler.class)
void someMethod(@Param("entity") MarketActivityEntity entity)
```
- Example of type handler here: [[BaseTypeHandler (MyBatis) (Java)#Methods]]
### Index Out of Bounds Error
2024-07-09 22:46
- While I was working on a feature mybatis started throwing this error, turned out that the POJO I was using only had the [[@AllArgsConstructor (Lombok)]] and the query was returning only 2 out of those three fields
- The solution was to either add the [[@NoArgsConstructor (Lombok)]]  or remove the extra field


### Variable Substitution Types (`#{id}` vs `${id}`)
Source: [[ChatGPT]]
- In MyBatis, the key difference between using `#{id}` and `${id}` is how the parameter is inserted into the generated SQL, which directly impacts security (risk of SQL injection) and how values are bound at runtime:

1. `#{id}` (safe / parameter placeholder) 
	1. Prepared Statement Parameter: MyBatis will generate a ? placeholder in the actual SQL and bind the value of id to it safely as a parameter. 
	2. Prevents SQL Injection: Since the value is treated as data (and not as a piece of the SQL string), SQL injection risks are mitigated. 
	3. Recommended Use: For most column values, where you’re passing user input or dynamic values that could come from untrusted sources.
2. `${id}` (unsafe / string substitution) 
	1. Raw String Substitution: MyBatis will directly interpolate the value of id into the SQL. For example, if id is foo, it will literally insert foo into the query string.  
	2. Vulnerable to SQL Injection: Because the value is inserted as part of the SQL text, it can break or manipulate the SQL if not controlled. 
	3. Recommended Use: Typically reserved for situations like dynamic table or column names, or SQL keywords (e.g., ORDER BY direction) where you cannot use parameter placeholders.
- Use `#{param}` for most cases where you pass user or dynamic data.
- Use `${param}` cautiously and ideally only for cases like dynamic table names or column names (and not for user-input values).


### Metadata
2024-12-10 01:11
- Started reading the source code
