An IT security consultancy is working on a solution to protect data stored in Amazon S3 from any malicious activity as well as check for any vulnerabilities on Amazon EC2 instances.

As a solutions architect, which of the following solutions would you suggest to help address the given requirement?

Correct answer
Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon Inspector to check for vulnerabilities on Amazon EC2 instances

Use Amazon Inspector to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon Inspector to check for vulnerabilities on Amazon EC2 instances

Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon GuardDuty to check for vulnerabilities on Amazon EC2 instances

Your answer is incorrect
Use Amazon Inspector to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon GuardDuty to check for vulnerabilities on Amazon EC2 instances

Overall explanation
Correct option:

Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon Inspector to check for vulnerabilities on Amazon EC2 instances

Amazon GuardDuty offers threat detection that enables you to continuously monitor and protect your AWS accounts, workloads, and data stored in Amazon S3. GuardDuty analyzes continuous streams of meta-data generated from your account and network activity found in AWS CloudTrail Events, Amazon VPC Flow Logs, and DNS Logs. It also uses integrated threat intelligence such as known malicious IP addresses, anomaly detection, and machine learning to identify threats more accurately.

How Amazon GuardDuty works:  via - https://aws.amazon.com/guardduty/

Amazon Inspector security assessments help you check for unintended network accessibility of your Amazon EC2 instances and for vulnerabilities on those EC2 instances. Amazon Inspector assessments are offered to you as pre-defined rules packages mapped to common security best practices and vulnerability definitions.

Incorrect options:

Use Amazon GuardDuty to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon GuardDuty to check for vulnerabilities on Amazon EC2 instances

Use Amazon Inspector to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon Inspector to check for vulnerabilities on Amazon EC2 instances

Use Amazon Inspector to monitor any malicious activity on data stored in Amazon S3. Use security assessments provided by Amazon GuardDuty to check for vulnerabilities on Amazon EC2 instances

These three options contradict the explanation provided above, so these options are incorrect.

References:

https://aws.amazon.com/guardduty/

https://aws.amazon.com/inspector/

Domain
Design Secure Architectures


------------------
Question 54
Correct
A gaming company uses Amazon Aurora as its primary database service. The company has now deployed 5 multi-AZ read replicas to increase the read throughput and for use as failover target. The replicas have been assigned the following failover priority tiers and corresponding instance sizes are given in parentheses: tier-1 (16 terabytes), tier-1 (32 terabytes), tier-10 (16 terabytes), tier-15 (16 terabytes), tier-15 (32 terabytes).

In the event of a failover, Amazon Aurora will promote which of the following read replicas?

Tier-10 (16 terabytes)

Tier-1 (16 terabytes)

Your answer is correct
Tier-1 (32 terabytes)

Tier-15 (32 terabytes)

Overall explanation
Correct option:

Tier-1 (32 terabytes)

Amazon Aurora features a distributed, fault-tolerant, self-healing storage system that auto-scales up to 128TB per database instance. It delivers high performance and availability with up to 15 low-latency read replicas, point-in-time recovery, continuous backup to Amazon S3, and replication across three Availability Zones (AZs).

For Amazon Aurora, each Read Replica is associated with a priority tier (0-15). In the event of a failover, Amazon Aurora will promote the Read Replica that has the highest priority (the lowest numbered tier). If two or more Aurora Replicas share the same priority, then Amazon RDS promotes the replica that is largest in size. If two or more Aurora Replicas share the same priority and size, then Amazon Aurora promotes an arbitrary replica in the same promotion tier.

Therefore, for this problem statement, the Tier-1 (32 terabytes) replica will be promoted.

Incorrect options:

Tier-15 (32 terabytes)

Tier-1 (16 terabytes)

Tier-10 (16 terabytes)

Given the failover rules discussed earlier in the explanation, these three options are incorrect.

References:

https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraHighAvailability.html

Domain
Design Resilient Architectures

-------------------------
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

--------------------

A telecom company operates thousands of hardware devices like switches, routers, cables, etc. The real-time status data for these devices must be fed into a communications application for notifications. Simultaneously, another analytics application needs to read the same real-time status data and analyze all the connecting lines that may go down because of any device failures.

As an AWS Certified Solutions Architect – Associate, which of the following solutions would you suggest, so that both the applications can consume the real-time status data concurrently?

Correct answer
Amazon Kinesis Data Streams

Your answer is incorrect
Amazon Simple Notification Service (SNS)

Amazon Simple Queue Service (SQS) with Amazon Simple Notification Service (SNS)

Amazon Simple Queue Service (SQS) with Amazon Simple Email Service (Amazon SES)

Overall explanation
Correct option:

Amazon Kinesis Data Streams

Amazon Kinesis Data Streams enables real-time processing of streaming big data. It provides ordering of records, as well as the ability to read and/or replay records in the same order to multiple Amazon Kinesis Applications. The Amazon Kinesis Client Library (KCL) delivers all records for a given partition key to the same record processor, making it easier to build multiple applications reading from the same Amazon Kinesis data stream (for example, to perform counting, aggregation, and filtering).

AWS recommends Amazon Kinesis Data Streams for use cases with requirements that are similar to the following:

Routing related records to the same record processor (as in streaming MapReduce). For example, counting and aggregation are simpler when all records for a given key are routed to the same record processor.
Ordering of records. For example, you want to transfer log data from the application host to the processing/archival host while maintaining the order of log statements.
Ability for multiple applications to consume the same stream concurrently. For example, you have one application that updates a real-time dashboard and another that archives data to Amazon Redshift. You want both applications to consume data from the same stream concurrently and independently.
Ability to consume records in the same order a few hours later. For example, you have a billing application and an audit application that runs a few hours behind the billing application. Because Amazon Kinesis Data Streams stores data for up to 365 days, you can run the audit application up to 365 days behind the billing application.
Incorrect options:

Amazon Simple Notification Service (SNS) - Amazon Simple Notification Service (SNS) is a highly available, durable, secure, fully managed pub/sub messaging service that enables you to decouple microservices, distributed systems, and serverless applications. Amazon SNS provides topics for high-throughput, push-based, many-to-many messaging. Amazon SNS is a notification service and cannot be used for real-time processing of data.

Amazon Simple Queue Service (SQS) with Amazon Simple Notification Service (SNS) - Amazon Simple Queue Service (Amazon SQS) offers a reliable, highly scalable hosted queue for storing messages as they travel between computers. Amazon SQS lets you easily move data between distributed application components and helps you build applications in which messages are processed independently (with message-level ack/fail semantics), such as automated workflows. Since multiple applications need to consume the same data stream concurrently, Kinesis is a better choice when compared to the combination of SQS with SNS.

Amazon Simple Queue Service (SQS) with Amazon Simple Email Service (Amazon SES) - As discussed above, Amazon Kinesis is a better option for this use case in comparison to Amazon SQS. Also, Amazon SES does not fit this use-case. Hence, this option is an incorrect answer.

Reference:

https://aws.amazon.com/kinesis/data-streams/faqs/

Domain
Design High-Performing Architectures

-------------

A geological research agency maintains the seismological data for the last 100 years. The data has a velocity of 1GB per minute. You would like to store the data with only the most relevant attributes to build a predictive model for earthquakes.

What AWS services would you use to build the most cost-effective solution with the LEAST amount of infrastructure maintenance?

Ingest the data in Amazon Kinesis Data Streams and use an intermediary AWS Lambda function to filter and transform the incoming stream before the output is dumped on Amazon S3

Your answer is incorrect
Ingest the data in Amazon Kinesis Data Analytics and use SQL queries to filter and transform the data before writing to Amazon S3

Correct answer
Ingest the data in Amazon Kinesis Data Firehose and use an intermediary AWS Lambda function to filter and transform the incoming stream before the output is dumped on Amazon S3

Ingest the data in a Spark Streaming Cluster on Amazon EMR and use Spark Streaming transformations before writing to Amazon S3

Overall explanation
Correct option:

Ingest the data in Amazon Kinesis Data Firehose and use an intermediary AWS Lambda function to filter and transform the incoming stream before the output is dumped on Amazon S3

Amazon Kinesis Data Firehose is the easiest way to load streaming data into data stores and analytics tools. It can capture, transform, and load streaming data into Amazon S3, Amazon Redshift, Amazon OpenSearch Service, and Splunk, enabling near real-time analytics with existing business intelligence tools and dashboards you’re already using today. It is a fully managed service that automatically scales to match the throughput of your data and requires no ongoing administration. It can also batch, compress, and encrypt the data before loading it, minimizing the amount of storage used at the destination and increasing security.

Amazon Kinesis Data Firehose Overview  via - https://aws.amazon.com/kinesis/data-firehose/
![image](https://github.com/user-attachments/assets/e728ae1b-4451-4f5d-896c-a74944dfc00c)

The correct option is to ingest the data in Amazon Kinesis Data Firehose and use a AWS Lambda function to filter and transform the incoming data before the output is dumped on Amazon S3. This way you only need to store a sliced version of the data with only the relevant data attributes required for your model. Also it should be noted that this solution is entirely serverless and requires no infrastructure maintenance.

Amazon Kinesis Data Firehose to Amazon S3:  via - https://docs.aws.amazon.com/firehose/latest/dev/what-is-this-service.html
![image](https://github.com/user-attachments/assets/206b78e9-df37-451a-9e65-346ca6ed586f)


Incorrect options:

Ingest the data in Amazon Kinesis Data Analytics and use SQL queries to filter and transform the data before writing to Amazon S3 - Amazon Kinesis Data Analytics is the easiest way to analyze streaming data in real-time. Kinesis Data Analytics enables you to easily and quickly build queries and sophisticated streaming applications in three simple steps: setup your streaming data sources, write your queries or streaming applications, and set up your destination for processed data. Kinesis Data Analytics cannot directly ingest data from the source as it ingests data either from Kinesis Data Streams or Kinesis Data Firehose, so this option is ruled out.

Ingest the data in Amazon Kinesis Data Streams and use an intermediary AWS Lambda function to filter and transform the incoming stream before the output is dumped on Amazon S3 - Amazon Kinesis Data Streams (KDS) is a massively scalable, highly durable data ingestion and processing service optimized for streaming data. Amazon Kinesis Data Streams is integrated with a number of AWS services, including Amazon Kinesis Data Firehose for near real-time transformation.

Kinesis Data Streams cannot directly write the output to Amazon S3. Unlike Amazon Kinesis Data Firehose, KDS does not offer a ready-made integration via an intermediary AWS Lambda function to reliably dump data into Amazon S3. You will need to do a lot of custom coding to get the AWS Lambda function to process the incoming stream and then store the transformed output to Amazon S3 with the constraint that the buffer is maintained reliably and no transformed data is lost. So this option is incorrect.

Ingest the data in a Spark Streaming Cluster on Amazon EMR and use Spark Streaming transformations before writing to Amazon S3 - Amazon EMR is the industry-leading cloud big data platform for processing vast amounts of data using open source tools such as Apache Spark, Apache Hive, Apache HBase, Apache Flink, Apache Hudi, and Presto. Amazon EMR uses Hadoop, an open-source framework, to distribute your data and processing across a resizable cluster of Amazon EC2 instances. Using an EMR cluster would imply managing the underlying infrastructure so it’s ruled out because the correct solution for the given use-case should require the least amount of infrastructure maintenance.

Reference:

https://aws.amazon.com/kinesis/data-firehose/

Domain
Design Cost-Optimized Architectures

---------------

A video analytics organization has been acquired by a leading media company. The analytics organization has 10 independent applications with an on-premises data footprint of about 70 Terabytes for each application. The CTO of the media company has set a timeline of two weeks to carry out the data migration from on-premises data center to AWS Cloud and establish connectivity.

Which of the following are the MOST cost-effective options for completing the data transfer and establishing connectivity? (Select two)

Correct selection
Setup AWS Site-to-Site VPN to establish on-going connectivity between the on-premises data center and AWS Cloud

Setup AWS Direct Connect to establish connectivity between the on-premises data center and AWS Cloud

Your selection is incorrect
Order 70 AWS Snowball Edge Storage Optimized devices to complete the one-time data transfer

Order 1 AWS Snowmobile to complete the one-time data transfer

Your selection is correct
Order 10 AWS Snowball Edge Storage Optimized devices to complete the one-time data transfer

Overall explanation
Correct options:

Order 10 AWS Snowball Edge Storage Optimized devices to complete the one-time data transfer

AWS Snowball Edge Storage Optimized is the optimal choice if you need to securely and quickly transfer dozens of terabytes to petabytes of data to AWS. It provides up to 80 Terabytes of usable HDD storage, 40 vCPUs, 1 TB of SATA SSD storage, and up to 40 Gigabytes network connectivity to address large scale data transfer and pre-processing use cases.

As each Snowball Edge Storage Optimized device can handle 80 Terabytes of data, you can order 10 such devices to take care of the data transfer for all applications.

Exam Alert:

The original Snowball devices were transitioned out of service and Snowball Edge Storage Optimized are now the primary devices used for data transfer. You may see the Snowball device on the exam, just remember that the original Snowball device had 80 Terabytes of storage space.

Setup AWS Site-to-Site VPN to establish on-going connectivity between the on-premises data center and AWS Cloud

AWS Site-to-Site VPN enables you to securely connect your on-premises network or branch office site to your Amazon Virtual Private Cloud (Amazon VPC). You can securely extend your data center or branch office network to the cloud with an AWS Site-to-Site VPN connection. A VPC VPN Connection utilizes IPSec to establish encrypted network connectivity between your intranet and Amazon VPC over the Internet. VPN Connections can be configured in minutes and are a good solution if you have an immediate need, have low to modest bandwidth requirements, and can tolerate the inherent variability in Internet-based connectivity.

Therefore this option is the right fit for the given use-case as the connectivity can be easily established within the given timeframe.

Incorrect options:

Order 1 AWS Snowmobile to complete the one-time data transfer - Each AWS Snowmobile has a total capacity of up to 100 petabytes. To migrate large datasets of 10 petabytes or more in a single location, you should use AWS Snowmobile. For datasets less than 10 petabytes or distributed in multiple locations, you should use Snowball. So AWS Snowmobile is not the right fit for this use-case.

Setup AWS Direct Connect to establish connectivity between the on-premises data center and AWS Cloud - AWS Direct Connect lets you establish a dedicated network connection between your network and one of the AWS Direct Connect locations. Using industry-standard 802.1q VLANs, this dedicated connection can be partitioned into multiple virtual interfaces. AWS Direct Connect does not involve the Internet; instead, it uses dedicated, private network connections between your intranet and Amazon VPC. Direct Connect involves significant monetary investment and takes at least a month to set up, therefore it's not the correct fit for this use-case.

Order 70 AWS Snowball Edge Storage Optimized devices to complete the one-time data transfer - As the data-transfer can be completed with just 10 AWS Snowball Edge Storage Optimized devices, there is no need to order 70 devices.

References:

https://aws.amazon.com/snowball/faqs/

https://aws.amazon.com/vpn/

https://aws.amazon.com/snowmobile/faqs/

https://aws.amazon.com/directconnect/

Domain
Design Cost-Optimized Architectures

-----------------
A company runs a data processing workflow that takes about 60 minutes to complete. The workflow can withstand disruptions and it can be started and stopped multiple times.

Which is the most cost-effective solution to build a solution for the workflow?

Correct answer
Use Amazon EC2 spot instances to run the workflow processes

Your answer is incorrect
Use Amazon EC2 on-demand instances to run the workflow processes

Use Amazon EC2 reserved instances to run the workflow processes

Use AWS Lambda function to run the workflow processes

Overall explanation
Correct option:

Use Amazon EC2 spot instances to run the workflow processes

Amazon EC2 instance types:  via - https://aws.amazon.com/ec2/pricing/
![image](https://github.com/user-attachments/assets/74c67add-a63e-42dc-8dcd-8e7835511248)


Amazon EC2 Spot instances allow you to request spare Amazon EC2 computing capacity for up to 90% off the On-Demand price.

Spot instances are recommended for:

Applications that have flexible start and end times Applications that are feasible only at very low compute prices Users with urgent computing needs for large amounts of additional capacity

For the given use case, spot instances offer the most cost-effective solution as the workflow can withstand disruptions and can be started and stopped multiple times.

For example, considering a process that runs for an hour and needs about 1024 MB of memory, spot instance pricing for a t2.micro instance (having 1024 MB of RAM) is $0.0035 per hour.

Spot instance pricing:  via - https://aws.amazon.com/ec2/spot/pricing/
![image](https://github.com/user-attachments/assets/5e0348b2-c210-4f6d-953e-e47e0c37240c)


Contrast this with the pricing of a Lambda function (having 1024 MB of allocated memory), which comes out to $0.0000000167 per 1ms or $0.06 per hour ($0.0000000167 * 1000 * 60 * 60 per hour).

AWS Lambda function pricing:  via - https://aws.amazon.com/lambda/pricing/
![image](https://github.com/user-attachments/assets/2f32874b-d4d9-4107-9967-169b4ad17b74)


Thus, a spot instance turns out to be about 20 times cost effective than a Lambda function to meet the requirements of the given use case.

Incorrect options:

Use AWS Lambda function to run the workflow processes - As mentioned in the explanation above, a Lambda function turns out to be 20 times more expensive than a spot instance to meet the workflow requirements of the given use case, so this option is incorrect. You should also note that the maximum execution time of a Lambda function is 15 minutes, so the workflow process would be disrupted for sure. On the other hand, it is certainly possible that the workflow process can be completed in a single run on the spot instance (the average frequency of stop instance interruption across all Regions and instance types is <10%).

Use Amazon EC2 on-demand instances to run the workflow processes

Use Amazon EC2 reserved instances to run the workflow processes

You should note that both on-demand and reserved instances are more expensive than spot instances. In addition, reserved instances have a term of 1 year or 3 years, so they are not suited for the given workflow. Therefore, both these options are incorrect.

References:

https://aws.amazon.com/ec2/pricing/

https://aws.amazon.com/ec2/spot/pricing/

https://aws.amazon.com/lambda/pricing/

https://aws.amazon.com/ec2/spot/instance-advisor/

Domain
Design Cost-Optimized Architectures
