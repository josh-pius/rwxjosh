### General
Source: [[AWS Athena]], https://www.dell.com/en-us/blog/schema-read-vs-schema-write-started/#:~:text=What%20is%20Schema%20On%20Read,be%20stored%20in%20the%20database

- Schema on read differs from schema on write because **you create the schema only when reading the data**.
- The data itself can be structured, partially structured or unstructured 
- You can define a schema for the data and when the data is read the schema is applied
- This means you can run queries on data where there is no explicit table structure defined in the data itself
- If you use the data for different purposes you can have different schemas for different use cases
- Related [[Schema-on-write (Software)]]