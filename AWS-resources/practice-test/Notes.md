Question 40
Incorrect
A file-hosting service uses Amazon Simple Storage Service (Amazon S3) under the hood to power its storage offerings. Currently all the customer files are uploaded directly under a single Amazon S3 bucket. The engineering team has started seeing scalability issues where customer file uploads have started failing during the peak access hours with more than 5000 requests per second.

Which of the following is the MOST resource efficient and cost-optimal way of addressing this issue?

Change the application architecture to create a new Amazon S3 bucket for each customer and then upload each customer's files directly under the respective buckets

Change the application architecture to create a new Amazon S3 bucket for each day's data and then upload the daily files directly under that day's bucket

Correct answer
Change the application architecture to create customer-specific custom prefixes within the single Amazon S3 bucket and then upload the daily files into those prefixed locations

Your answer is incorrect
Change the application architecture to use Amazon Elastic File System (Amazon EFS) instead of Amazon S3 for storing the customers' uploaded files

Overall explanation
Correct option:

Change the application architecture to create customer-specific custom prefixes within the single Amazon S3 bucket and then upload the daily files into those prefixed locations

Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. Your applications can easily achieve thousands of transactions per second in request performance when uploading and retrieving storage from Amazon S3. Amazon S3 automatically scales to high request rates. For example, your application can achieve at least 3,500 PUT/COPY/POST/DELETE or 5,500 GET/HEAD requests per second per prefix in a bucket.

There are no limits to the number of prefixes in a bucket. You can increase your read or write performance by parallelizing reads. For example, if you create 10 prefixes in an Amazon S3 bucket to parallelize reads, you could scale your read performance to 55,000 read requests per second. Please see this example for more clarity on prefixes: if you have a file f1 stored in an S3 object path like so s3://your_bucket_name/folder1/sub_folder_1/f1, then /folder1/sub_folder_1/ becomes the prefix for file f1.

Some data lake applications on Amazon S3 scan millions or billions of objects for queries that run over petabytes of data. These data lake applications achieve single-instance transfer rates that maximize the network interface used for their Amazon EC2 instance, which can be up to 100 Gb/s on a single instance. These applications then aggregate throughput across multiple instances to get multiple terabits per second. Therefore creating customer-specific custom prefixes within the single bucket and then uploading the daily files into those prefixed locations is the BEST solution for the given constraints.

Optimizing Amazon S3 Performance:  via - https://docs.aws.amazon.com/AmazonS3/latest/dev/optimizing-performance.html
![image](https://github.com/user-attachments/assets/63175893-38c8-4912-b548-6e4493561c7e)


Incorrect options:

Change the application architecture to create a new Amazon S3 bucket for each customer and then upload each customer's files directly under the respective buckets - Creating a new Amazon S3 bucket for each new customer is an inefficient way of handling resource availability (S3 buckets need to be globally unique) as some customers may use the service sparingly but the bucket name is locked for them forever. Moreover, this is really not required as we can use S3 prefixes to improve the performance.

Change the application architecture to create a new Amazon S3 bucket for each day's data and then upload the daily files directly under that day's bucket - Creating a new Amazon S3 bucket for each new day's data is also an inefficient way of handling resource availability (S3 buckets need to be globally unique) as some of the bucket names may not be available for daily data processing. Moreover, this is really not required as we can use S3 prefixes to improve the performance.

Change the application architecture to use Amazon Elastic File System (Amazon EFS) instead of Amazon S3 for storing the customers' uploaded files - Amazon EFS is a costlier storage option compared to Amazon S3, so it is ruled out.

Reference:

https://docs.aws.amazon.com/AmazonS3/latest/dev/optimizing-performance.html

Domain
Design High-Performing Architectures

-------------------

Question 44
Incorrect
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

 <img width="1028" alt="pt1-q47-i4" src="https://github.com/user-attachments/assets/ab260751-240e-4a6d-b45a-11692d239a85" />


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
