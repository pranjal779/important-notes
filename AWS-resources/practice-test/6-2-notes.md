The application maintenance team at a company has noticed that the production application is very slow when the business reports are run on the Amazon RDS database. These reports fetch a large amount of data and have complex queries with multiple joins, spanning across multiple business-critical core tables. CPU, memory, and storage metrics are around 50% of the total capacity.

Can you recommend an improved and cost-effective way of generating the business reports while keeping the production application unaffected?

Migrate from General Purpose SSD to magnetic storage to enhance IOPS

Correct answer
Create a read replica and connect the report generation tool/application to it

Your answer is incorrect
Configure the Amazon RDS instance to be Multi-AZ DB instance, and connect the report generation tool to the DB instance in a different AZ

Increase the size of Amazon RDS instance

Overall explanation
Correct option:

Create a read replica and connect the report generation tool/application to it

Amazon RDS Read Replicas provide enhanced performance and durability for Amazon RDS database (DB) instances. They make it easy to elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads. You can create one or more replicas of a given source DB Instance and serve high-volume application read traffic from multiple copies of your data, thereby increasing aggregate read throughput. Read replicas can also be promoted when needed to become standalone DB instances.

There are a variety of scenarios where deploying one or more read replicas for a given source DB instance may make sense. Common reasons for deploying a read replica include:

Scaling beyond the compute or I/O capacity of a single DB instance for read-heavy database workloads. This excess read traffic can be directed to one or more read replicas.
Serving read traffic while the source DB instance is unavailable. If your source DB Instance cannot take I/O requests (e.g. due to I/O suspension for backups or scheduled maintenance), you can direct read traffic to your read replica(s). For this use case, keep in mind that the data on the read replica may be “stale” since the source DB Instance is unavailable.
Business reporting or data warehousing scenarios; you may want business reporting queries to run against a read replica, rather than your primary, production DB Instance.
You may use a read replica for disaster recovery of the source DB instance, either in the same AWS Region or in another Region.
Comparing Read Replicas with Multi-AZ and Multi-Region Amazon RDS deployments:  via - https://aws.amazon.com/rds/features/read-replicas/
![image](https://github.com/user-attachments/assets/c99a59ea-7cbc-4d32-9fcd-881cf35f4518)


Incorrect options:

Increase the size of Amazon RDS instance - This will not help as it's mentioned that the CPU, memory, and storage are running at only 50% of the total capacity.

Migrate from General Purpose SSD to magnetic storage to enhance IOPS - This is incorrect. Amazon RDS supports magnetic storage for backward compatibility only. AWS recommends that you use General Purpose SSD or Provisioned IOPS for any storage needs.

Configure the Amazon RDS instance to be Multi-AZ DB instance, and connect the report generation tool to the DB instance in a different AZ - Amazon RDS Multi-AZ deployments provide enhanced availability and durability for RDS database (DB) instances, making them a natural fit for production database workloads. When you provision a Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ). Each AZ runs on its own physically distinct, independent infrastructure, and is engineered to be highly reliable. However, you cannot read from the standby database, making multi-AZ, an incorrect option for the given scenario.

Reference:

https://aws.amazon.com/rds/features/read-replicas/

Domain
Design High-Performing Architectures
