A retail company runs a customer management system backed by a Microsoft SQL Server database. The system is tightly integrated with applications that rely on T-SQL queries. The company wants to modernize its infrastructure by migrating to Amazon Aurora PostgreSQL, but it needs to avoid major modifications to the existing application logic.

Which combination of actions should the company take to achieve this goal with minimal application refactoring? (Select two)

Use Amazon Aurora Global Database to replicate data across regions for compatibility

Your selection is incorrect
Use AWS Glue to convert T-SQL queries to PostgreSQL-compatible SQL during the migration

Correct selection
Deploy Babelfish for Aurora PostgreSQL to enable support for T-SQL commands

Correct selection
Use AWS Schema Conversion Tool (AWS SCT) along with AWS Database Migration Service (AWS DMS) to migrate the schema and data

Configure Amazon Aurora PostgreSQL with a custom endpoint that emulates Microsoft SQL Server behavior

Overall explanation
Correct options:

Deploy Babelfish for Aurora PostgreSQL to enable support for T-SQL commands

Babelfish allows Aurora PostgreSQL to understand T-SQL (Microsoft SQL Server's query language) and SQL Server wire protocol, enabling applications to communicate with Aurora using SQL Server-style queries with minimal code changes. This is ideal for minimizing application code refactoring.

 via - https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/babelfish.html
 ![image](https://github.com/user-attachments/assets/92b71624-85c4-45e3-a3c8-51758722275f)


Use AWS Schema Conversion Tool (AWS SCT) along with AWS Database Migration Service (AWS DMS) to migrate the schema and data

The AWS Schema Conversion Tool (SCT) helps convert the SQL Server schema to PostgreSQL-compatible syntax, and AWS Database Migration Service (DMS) can move the actual data with minimal downtime. These tools are designed for database migration and are essential for schema and data transfer.

Incorrect options:

Configure Amazon Aurora PostgreSQL with a custom endpoint that emulates Microsoft SQL Server behavior - Aurora endpoints do not provide protocol-level emulation of SQL Server unless Babelfish is explicitly enabled. There is no feature to make Aurora natively emulate SQL Server behavior without Babelfish.

Use Amazon Aurora Global Database to replicate data across regions for compatibility - Aurora Global Database helps with cross-region disaster recovery and read scalability, but it does not assist with SQL Server compatibility or reduce application code changes.

Use AWS Glue to convert T-SQL queries to PostgreSQL-compatible SQL during the migration - AWS Glue is primarily used for ETL and data transformation, not for application SQL query conversion. It cannot translate T-SQL into PostgreSQL syntax.

References:

https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/babelfish.html

https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/babelfish-compatibility.html

Domain
Design High-Performing Architectures
